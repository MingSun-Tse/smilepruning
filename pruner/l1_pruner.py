import torch
import torch.nn as nn
import copy
import time
import numpy as np
from utils import _weights_init, _weights_init_orthogonal, orthogonalize_weights
from .meta_pruner import MetaPruner


# refer to: A Signal Propagation Perspective for Pruning Neural Networks at Initialization (ICLR 2020).
# https://github.com/namhoonlee/spp-public
def approximate_isometry_optimize(model, mask, lr, n_iter, wg='weight'):
    def optimize(w):
        '''Approximate Isometry for sparse weights by iterative optimization
        '''
        flattened = w.view(w.size(0), -1) # [n_filter, -1]
        identity = torch.eye(w.size(0)).cuda() # identity matrix
        w_ = torch.autograd.Variable(flattened, requires_grad=True)
        optim = torch.optim.Adam([w_], lr)
        for i in range(n_iter):
            loss = nn.MSELoss()(torch.matmul(w_, w_.t()), identity)
            optim.zero_grad()
            loss.backward()
            optim.step()
            if not isinstance(mask, type(None)):
                w_ = torch.mul(w_, mask[name]) # not update the pruned params
            w_ = torch.autograd.Variable(w_, requires_grad=True)
            optim = torch.optim.Adam([w_], lr)
            if i % 10 == 0:
                print('[%d/%d] approximate_isometry_optimize for layer "%s", loss %.6f' % (i, n_iter, name, loss.item()))
        return w_.view(m.weight.shape)
    
    for name, m in model.named_modules():
        if isinstance(m, (nn.Conv2d, nn.Linear)):
            w_ = optimize(m.weight)
            m.weight.data.copy_(w_)
            print('Finished approximate_isometry_optimize for layer "%s"' % name)

def exact_isometry_based_on_existing_weights(model):
    for name, m in model.named_modules():
        if isinstance(m, (nn.Conv2d, nn.Linear)):
            w_ = orthogonalize_weights(m.weight)
            m.weight.data.copy_(w_)
            print('Finished exact_isometry for layer "%s"' % name)

class Pruner(MetaPruner):
    def __init__(self, model, args, logger, runner):
        super(Pruner, self).__init__(model, args, logger, runner)

    def prune(self):
        self._get_kept_wg_L1()
        self._prune_and_build_new_model()
        mask = self.mask if self.args.wg == 'weight' else None

        if self.args.reinit:
            if self.args.reinit == 'default':
                self.model.apply(_weights_init) # completely reinit weights via 'kaiming_normal'
                self.logprint("==> Reinit model: default ('kaiming_normal' for Conv/FC; 0 mean, 1 std for BN)")

            elif self.args.reinit == 'orth':
                self.model.apply(_weights_init_orthogonal) # completely reinit weights via 'orthogonal_'
                self.logprint("==> Reinit model: exact_isometry ('orthogonal_' for Conv/FC; 0 mean, 1 std for BN)")

            elif self.args.reinit == 'exact_isometry':
                exact_isometry_based_on_existing_weights(self.model) # othogonalize weights based on existing weights
                self.logprint("==> Reinit model: exact_isometry (othogonalize Conv/FC weights based on existing weights)")

            elif self.args.reinit == 'approximate_isometry':
                approximate_isometry_optimize(self.model, mask=mask, lr=self.args.lr_AI, n_iter=10000) # 10000 refers to the paper above; lr in the paper is 0.1, but not converged here
                self.logprint("==> Reinit model: approximate_isometry")
            
            else:
                raise NotImplementedError
            
        return self.model
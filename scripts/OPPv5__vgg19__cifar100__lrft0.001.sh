python main.py --method OPP -a vgg19 --lr_ft 0:0.001,80:0.0001 --epochs 120 --dataset cifar100 --wd 0.0005 --batch_size 256 --project OPPv5__vgg19__cifar100__pr0.9__lrft0.001__lwopp1000 --stage_pr 1-15:0.9 --directly_ft_weights Exp*/*-/weights/checkpoint.pth
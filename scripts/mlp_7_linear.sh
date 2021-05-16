# lrft 0.01, 90 epochs
CUDA_VISIBLE_DEVICES=1 nohup python main.py --arch mlp_7_linear --activation linear --dataset mnist --method L1 --base_model_path Experiments/*SERVER138-20210120-221449/weights/checkpoint_best.pth --batch_size 100 --lr_ft 0:0.01,30:0.001,60:0.0001 --epochs 90 --stage_pr [0-5:0.8,6:0] --project L1__mlp_7_linear__mnist__wgfilter__pr0.8__lrft0.01__epoch90 > /dev/null &

# lrft 0.01, 90 epochs + reinit_EI
CUDA_VISIBLE_DEVICES=1 nohup python main.py --arch mlp_7_linear --activation linear --dataset mnist --method L1 --base_model_path Experiments/*SERVER138-20210120-221449/weights/checkpoint_best.pth --batch_size 100 --reinit exact_isometry_based_on_existing --lr_ft 0:0.01,30:0.001,60:0.0001 --epochs 90 --stage_pr [0-5:0.8,6:0] --project L1__mlp_7_linear__mnist__wgfilter__pr0.8__lrft0.01__epoch90__reinit__EI > /dev/null &

# lrft 0.01, 900 epochs
# CUDA_VISIBLE_DEVICES=1 nohup python main.py --arch mlp_7_linear --activation linear --dataset mnist --method L1 --base_model_path Experiments/*SERVER138-20210120-221449/weights/checkpoint_best.pth --batch_size 100 --lr_ft 0:0.01,300:0.001,600:0.0001 --epochs 900 --stage_pr [0-5:0.8,6:0] --project L1__mlp_7_linear__mnist__wgfilter__pr0.8__lrft0.01__epoch900 > /dev/null &

# lrft 0.01, 900 epochs + reinit_EI
# CUDA_VISIBLE_DEVICES=1 nohup python main.py --arch mlp_7_linear --activation linear --dataset mnist --method L1 --base_model_path Experiments/*SERVER138-20210120-221449/weights/checkpoint_best.pth --batch_size 100 --reinit exact_isometry_based_on_existing --lr_ft 0:0.01,300:0.001,600:0.0001 --epochs 900 --stage_pr [0-5:0.8,6:0] --project L1__mlp_7_linear__mnist__wgfilter__pr0.8__lrft0.01__epoch900__reinit__EI > /dev/null &


# lrft 0.001, 90 epochs
# CUDA_VISIBLE_DEVICES=1 nohup python main.py --arch mlp_7_linear --activation linear --dataset mnist --method L1 --base_model_path Experiments/*SERVER138-20210120-221449/weights/checkpoint_best.pth --batch_size 100 --lr_ft 0:0.001,45:0.0001 --epochs 90 --stage_pr [0-5:0.8,6:0] --project L1__mlp_7_linear__mnist__wgfilter__pr0.8__lrft0.001__epoch90 > /dev/null &

# lrft 0.001, 90 epochs + reinit_EI
# CUDA_VISIBLE_DEVICES=1 nohup python main.py --arch mlp_7_linear --activation linear --dataset mnist --method L1 --base_model_path Experiments/*SERVER138-20210120-221449/weights/checkpoint_best.pth --batch_size 100 --reinit exact_isometry_based_on_existing --lr_ft 0:0.001,45:0.0001 --epochs 90 --stage_pr [0-5:0.8,6:0] --project L1__mlp_7_linear__mnist__wgfilter__pr0.8__lrft0.001__epoch90__reinit__EI > /dev/null &

# lrft 0.001, 900 epochs
# CUDA_VISIBLE_DEVICES=1 nohup python main.py --arch mlp_7_linear --activation linear --dataset mnist --method L1 --base_model_path Experiments/*SERVER138-20210120-221449/weights/checkpoint_best.pth --batch_size 100 --lr_ft 0:0.001,450:0.0001 --epochs 900 --stage_pr [0-5:0.8,6:0] --project L1__mlp_7_linear__mnist__wgfilter__pr0.8__lrft0.001__epoch900 > /dev/null &

# lrft 0.001, 900 epochs + reinit_EI
# CUDA_VISIBLE_DEVICES=1 nohup python main.py --arch mlp_7_linear --activation linear --dataset mnist --method L1 --base_model_path Experiments/*SERVER138-20210120-221449/weights/checkpoint_best.pth --batch_size 100 --reinit exact_isometry_based_on_existing --lr_ft 0:0.001,450:0.0001 --epochs 900 --stage_pr [0-5:0.8,6:0] --project L1__mlp_7_linear__mnist__wgfilter__pr0.8__lrft0.001__epoch900__reinit__EI > /dev/null &



CUDA_VISIBLE_DEVICES=4,5,6,7 python main.py -a resnet34 --pretrained --method L1 --dataset imagenet --stage_pr [0,0.5,0.5,0.5,0.5,0] --lr_ft 0:0.1,45:0.01,90:0.001,135:0.0001,158:0.00001 --epochs 180 --project Scratch__resnet34__imagenet__pr0.5_Epochs180__PthReset -j 16 --reinit pth_reset --screen
python main.py --method L1 -a resnet56 --dataset cifar10 --lr_ft 0:0.01,60:0.001,90:0.0001 --epochs 120 --base_model_path Experiments/teacher-resnet56-cifar10-wd0.0005-imagenetmean-bs128_SERVER138-20201209-110515/weights/checkpoint_best.pth --wd 0.0005 --batch_size 128 --stage_pr [0,0.3,0.3,0.3,0] --project L1__resnet56__cifar10__pr0.3__lrft0.01__Reinit_AI --reinit approximate_isometry

python main.py --method L1 -a resnet56 --dataset cifar10 --lr_ft 0:0.01,60:0.001,90:0.0001 --epochs 120 --base_model_path Experiments/teacher-resnet56-cifar10-wd0.0005-imagenetmean-bs128_SERVER138-20201209-110515/weights/checkpoint_best.pth --wd 0.0005 --batch_size 128 --stage_pr [0,0.5,0.5,0.5,0] --project L1__resnet56__cifar10__pr0.5__lrft0.01__Reinit_AI --reinit approximate_isometry

python main.py --method L1 -a resnet56 --dataset cifar10 --lr_ft 0:0.01,60:0.001,90:0.0001 --epochs 120 --base_model_path Experiments/teacher-resnet56-cifar10-wd0.0005-imagenetmean-bs128_SERVER138-20201209-110515/weights/checkpoint_best.pth --wd 0.0005 --batch_size 128 --stage_pr [0,0.7,0.7,0.7,0] --project L1__resnet56__cifar10__pr0.7__lrft0.01__Reinit_AI --reinit approximate_isometry

python main.py --method L1 -a resnet56 --dataset cifar10 --lr_ft 0:0.01,60:0.001,90:0.0001 --epochs 120 --base_model_path Experiments/teacher-resnet56-cifar10-wd0.0005-imagenetmean-bs128_SERVER138-20201209-110515/weights/checkpoint_best.pth --wd 0.0005 --batch_size 128 --stage_pr [0,0.9,0.9,0.9,0] --project L1__resnet56__cifar10__pr0.9__lrft0.01__Reinit_AI --reinit approximate_isometry

python main.py --method L1 -a resnet56 --dataset cifar10 --lr_ft 0:0.01,60:0.001,90:0.0001 --epochs 120 --base_model_path Experiments/teacher-resnet56-cifar10-wd0.0005-imagenetmean-bs128_SERVER138-20201209-110515/weights/checkpoint_best.pth --wd 0.0005 --batch_size 128 --stage_pr [0,0.95,0.95,0.95,0] --project L1__resnet56__cifar10__pr0.95__lrft0.01__Reinit_AI --reinit approximate_isometry
This repository documents the full installation and configuration process to run the **MEGA** model for object detection and tracking, using **PyTorch 1.2**, **CUDA 10.0**, and **Python 3.7**.

---

## Requirements

- Python 3.7
- Conda or Miniconda
- CUDA ≥ 9.2 (tested with 12.2)
- NVIDIA GPU

---

## Step by step installation

conda create --name MEGA -y python=3.7
source activate MEGA

conda install ipython pip
pip install ninja yacs cython matplotlib tqdm opencv-python scipy

# follow PyTorch installation in https://pytorch.org/get-started/locally/
# we give the instructions for CUDA 10.0

conda install pytorch=1.2.0 torchvision=0.4.0 cudatoolkit=10.0 -c pytorch

export INSTALL_DIR=$PWD

# install pycocotools
cd $INSTALL_DIR
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
python setup.py build_ext install

# install cityscapesScripts
cd $INSTALL_DIR
git clone https://github.com/mcordts/cityscapesScripts.git
cd cityscapesScripts/
python setup.py build_ext install

# install apex
cd $INSTALL_DIR
git clone https://github.com/NVIDIA/apex.git
cd apex
python setup.py build_ext install

# install PyTorch Detection
cd $INSTALL_DIR
git clone https://github.com/Scalsol/mega.pytorch.git
cd mega.pytorch

# the following will install the lib with
# symbolic links, so that you can modify
# the files if you want and won't need to
# re-build it
python setup.py build develop

pip install 'pillow<7.0.0'

unset INSTALL_DIR


## Execute the demo

python demo/demo.py base configs/vid_R_101_C4_1x.yaml R_101.pth --suffix ".JPEG" --visualize-path image_folder --output-folder visualization_base


python demo/demo.py mega configs/MEGA/vid_R_101_C4_MEGA_1x.yaml MEGA_R_101.pth --suffix ".JPEG" --visualize-path image_folder --output-folder visualization_mega

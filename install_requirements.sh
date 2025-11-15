

# Create enviroment
echo "Activating Conda enviroment..."
source activate MEGA

# Python packages
echo "Installing base Python packages..."
conda install ipython pip
pip install ninja yacs cython matplotlib tqdm opencv-python scipy

conda install pytorch=1.2.0 torchvision=0.4.0 cudatoolkit=10.0 -c pytorch

export INSTALL_DIR=$PWD

# install pycocotools
echo "Installing COCO API..."
cd cocoapi/PythonAPI
python setup.py build_ext install

# install cityscapesScripts
echo "Installing Cityscapes Scripts..."
cd $INSTALL_DIR
cd cityscapesScripts/
python setup.py build_ext install

# install apex
echo "Installing APEX..."   
cd $INSTALL_DIR
cd apex
python setup.py build_ext install

# install PyTorch Detection
echo "Installing mega.pytorch..."
cd $INSTALL_DIR
cd mega.pytorch
python setup.py build develop


# Pillow
pip install 'pillow<7.0.0'

unset INSTALL_DIR


echo -e "\n\e[32mInstallation completed successfully\e[0m"

This repository documents the full installation and configuration process to run the **MEGA** model for object detection and tracking, using **PyTorch 1.2**, **CUDA 10.0**, and **Python 3.7**.

---

## Requirements

- Python 3.7
- Conda or Miniconda
- CUDA ≥ 9.2 (tested with 12.2)
- NVIDIA GPU

---
## Installation

First the conda enviroment needs to be created and activated by running the following commands:

    conda create --name MEGA -y python=3.7
    source activate MEGA


Next, it is necesssary to install some packages to be able to run de code. To do so, run the `install_requirements.sh` script.
To do this, first its neccesary to give permission to run this script:

    chmod +x install_requirements.sh

Finally, run the script like

    ./install_requirements.sh



## Executing the demo

First, we need to download the models we will be using. In this case the *single-frame baseline* and *MEGA* models from backbone ResNet-101. You can find this models in the following link: https://github.com/Scalsol/mega.pytorch.
This models should be in the mega.pytorch folder.


When the installation is completed and the models downloadeed, go to the mega.pytorch folder

    cd mega.pytorch/

And the code can be runned with the base model with the following command

    python demo/demo.py base configs/vid_R_101_C4_1x.yaml R_101.pth --suffix ".JPEG" --visualize-path image_folder --output-folder visualization_base

This will create a folder named `visualization_base` inside the mega.pytorch folder with the output of running the model on the images in `image_folder`. An image_folder with a sequence of images is allready provided. But it is possible to change it with other images if desired. Take into account the image names must follow the correct names.

To use the MEGA model you just need to:

    python demo/demo.py mega configs/MEGA/vid_R_101_C4_MEGA_1x.yaml MEGA_R_101.pth --suffix ".JPEG" --visualize-path image_folder --output-folder visualization_mega

And the output will be saved in the folder `visualization_mega` inside mega.pytorch, same as before.


You can run any model you want by downloading it and following the command structure:

    python demo/demo.py ${METHOD} ${CONFIG_FILE} ${CHECKPOINT_FILE} [--visualize-path ${IMAGE-FOLDER}] [--suffix ${IMAGE_SUFFIX}][--output-folder ${FOLDER}] [--output-video]


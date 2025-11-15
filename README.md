This repository documents the full installation and configuration process to run the **baseline** and the **MEGA** models for object detection and tracking, using **PyTorch 1.2**, **CUDA 10.0**, and **Python 3.7**.

---

## Requirements

- Python 3.7
- Conda or Miniconda
- CUDA ≥ 9.2 (tested with CUDA 12.2)
- NVIDIA GPU

---

## Installation

The first step is to create and activate the Conda environment where all dependencies will be installed. You can do this by running:

    conda create --name MEGA -y python=3.7
    source activate MEGA


Once the environment is active, all required packages and compiled components can be installed automatically using the provided script `install_requirements.sh`.
Before running the script, you must grant execution permission:

    chmod +x install_requirements.sh

Then run it:

    ./install_requirements.sh

This will complete the full installation and leave the environment ready to execute the model.


## Downloading the Models

To run the demo, you must download the pretrained weights. We use two models:
* The **single-frame baseline model** 
* The **MEGA model**

Both with ResNet-101 backbone.

These models can be downloaded from the official MEGA repository (Download link in the Main Results section in the README):

https://github.com/Scalsol/mega.pytorch

After downloading the files `R_101.pth` and `MEGA_R_101.pth`, place them inside the `mega.pytorch` directory.


## Running the DEMO

Once the installation is complete and the pretrained models are located in the correct folder, navigate into the `mega.pytorch` directory:

    cd mega.pytorch/

### Running the baseline model

The following command runs the **single-frame baseline model** on a folder of input images:

    python demo/demo.py base configs/vid_R_101_C4_1x.yaml R_101.pth --suffix ".JPEG" --visualize-path image_folder --output-folder visualization_base

This will create a directory named `visualization_base` inside `mega.pytorch`, containing the model output for each processed frame. 

A sample `image_folder` is already provided with this repository, but you may replace it with another sequence if desired. Make sure the image filenames follow the correct order and format expected by the script.

### Running the MEGA model

To run the **MEGA model** instead, use the following command:

    python demo/demo.py mega configs/MEGA/vid_R_101_C4_MEGA_1x.yaml MEGA_R_101.pth --suffix ".JPEG" --visualize-path image_folder --output-folder visualization_mega

The output visualizations will be stored in the folder `visualization_mega`.

### Running other models

MEGA supports other methods and configurations. You can run any model by following the command structure below:

    python demo/demo.py ${METHOD} ${CONFIG_FILE} ${CHECKPOINT_FILE} [--visualize-path ${IMAGE-FOLDER}] [--suffix ${IMAGE_SUFFIX}][--output-folder ${FOLDER}] [--output-video]


conda create -n nanoowl python=3.10
conda activate nanoowl

git clone https://github.com/galaxy-iot/nanoowl.git

# install torch and torchvision
conda install pytorch torchvision pytorch-cuda=12.1 -c pytorch -c nvidia

# install tensorrt
pip install /usr/src/tensorrt/python/tensorrt-8.6.1-cp310-none-linux_x86_64.whl
#pip install /usr/src/tensorrt/python/tensorrt_dispatch-10.0.1-cp38-none-linux_x86_64.whl
#pip install /usr/src/tensorrt/python/tensorrt_lean-10.0.1-cp38-none-linux_x86_64.whl

# install transformer
conda install transformers

# install torch2trt
git clone https://github.com/NVIDIA-AI-IOT/torch2trt -b v0.5.0
cd torch2trt
python setup.py install

# install onnx
pip install onnx
mkdir -p data && python -m nanoowl.build_image_encoder_engine data/owl_image_encoder_patch32.engine

python setup.py install --user

# install opencv
pip install opencv-python opencv-python-headless

# install matplotlib
pip install matplotlib==3.7.3

pip install pillow

python owl_predict.py --prompt="[an owl, a glove]" --threshold=0.1 --image_encoder_engine=../data/owl_image_encoder_patch32.engine
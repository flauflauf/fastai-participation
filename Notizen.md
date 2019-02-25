# Arithmetic precision
Neural networks can in many cases be used and even trained using low-precision arithmetic, e.g. 16 bit

Different graphic cards are better for different arithmetic (floating point?) precision (8bit, 32bit, 64bit).

## Details
Taken from https://devblogs.nvidia.com/mixed-precision-programming-cuda-8/.

_Many technical and HPC applications require high precision computation with 32-bit (single float, or FP32) or 64-bit (double float, or FP64) floating point, and there are even GPU-accelerated applications that rely on even higher precision (128- or 256-bit floating point!). But there are many applications for which much lower precision arithmetic suffices. For example, researchers in the rapidly growing field of deep learning have found that deep neural network architectures have a natural resilience to errors due to the backpropagation algorithm used in training them, and some have argued that 16-bit floating point (half precision, or FP16) is sufficient for training neural networks._

_Storing FP16 (half precision) data compared to higher precision FP32 or FP64 reduces memory usage of the neural network, allowing training and deployment of larger networks, and FP16 data transfers take less time than FP32 or FP64 transfers. Moreover, for many networks deep learning inference can be performed using 8-bit integer computations without significant impact on accuracy._

_..._

_The new NVIDIA Tesla P100, powered by the GP100 GPU, can perform FP16 arithmetic at twice the throughput of FP32. The GP102 (Tesla P40 and NVIDIA Titan X), GP104 (Tesla P4), and GP106 GPUs all support instructions that can perform integer dot products on 2- and4-element 8-bit vectors, with accumulation into a 32-bit integer. These instructions are valuable for implementing high-efficiency deep learning inference, as well as other applications such as radio astronomy._
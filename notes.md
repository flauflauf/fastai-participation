# Deep Learning Course take-aways

- Trying out the exercises is always better than delving into the concepts
- You can achieve almost state-of-the-art results on pretty much any image or text task by using a pretained model like ResNet34 and using transfer learning to the new task. You only need a couple hundred data points for this task. See https://arxiv.org/pdf/1801.06146.pdf.
- You need a fast GPU to do deep learning, but not more than that. Renting a preemtible server with a fast GPU on Google Cloud costs about 0.40$ an hour. If you stop the server outside your working hours (which you should!), that's only about 16$ for an entire work week. Since Google gives you a 300$ credit when you sign up, you can do deep learning for about four months for free.
- Learning on the transfer data set is best done in two stages:
  1. Freeze the pretrained model and only train added layers using a large discriminative learning rate (e.g. `[None,~1e-3,None]`).
  2. Unfreeze the model and train again using a range of smaller learning rates, e.g. \[1e-6,1e-4\], with one-cycle-fitting
- Deep learning, especially CNN, (only) works well on image input. But it is often possible to transform your data into images. Examples:
  - For bot detection: Draw an image of the mouse cursor trajectory. Use that as the data.
  - For cancer detection: Draw an image embedding of your DNA information. See https://towardsdatascience.com/the-mystery-of-the-origin-cancer-type-classification-using-fast-ai-libray-212eaf8d3f4e
- Cyclical Learning Rates (CLR) work much better than traditional methods (constant, linearly or exponentially decreasing, decrease after plateau). Also, the optimal learning rate (range) can be approximated well by testing each LR with a single run, instead of performing an extensive grid search. See https://mlconf.com/interview-with-leslie-n-smith-phd-senior-research-scientist-at-the-us-naval-research-laboratory-by-reshama-shaikh-program-committee-member/ and https://arxiv.org/pdf/1803.09820.pdf

# Arithmetic precision
Neural networks can in many cases be used and even trained using low-precision arithmetic, e.g. 16 bit

Different graphic cards are better for different arithmetic (floating point?) precision (8bit, 32bit, 64bit).

## Details
Taken from https://devblogs.nvidia.com/mixed-precision-programming-cuda-8/.

_Many technical and HPC applications require high precision computation with 32-bit (single float, or FP32) or 64-bit (double float, or FP64) floating point, and there are even GPU-accelerated applications that rely on even higher precision (128- or 256-bit floating point!). But there are many applications for which much lower precision arithmetic suffices. For example, researchers in the rapidly growing field of deep learning have found that deep neural network architectures have a natural resilience to errors due to the backpropagation algorithm used in training them, and some have argued that 16-bit floating point (half precision, or FP16) is sufficient for training neural networks._

_Storing FP16 (half precision) data compared to higher precision FP32 or FP64 reduces memory usage of the neural network, allowing training and deployment of larger networks, and FP16 data transfers take less time than FP32 or FP64 transfers. Moreover, for many networks deep learning inference can be performed using 8-bit integer computations without significant impact on accuracy._

_..._

_The new NVIDIA Tesla P100, powered by the GP100 GPU, can perform FP16 arithmetic at twice the throughput of FP32. The GP102 (Tesla P40 and NVIDIA Titan X), GP104 (Tesla P4), and GP106 GPUs all support instructions that can perform integer dot products on 2- and4-element 8-bit vectors, with accumulation into a 32-bit integer. These instructions are valuable for implementing high-efficiency deep learning inference, as well as other applications such as radio astronomy._

# Tasks

- Get insights into the layers like in https://arxiv.org/pdf/1311.2901.pdf. Possible candidate models: lesson-1 (pets), horse-vs-zebra

# Own observations

## Batch size
Even though a maximal batch size leads to global optima for convex (!) problems, a lower batch size generally yields higher accuracy for neural networks

- https://medium.com/mini-distill/effect-of-batch-size-on-training-dynamics-21c14f7a716e
- https://twitter.com/ylecun/status/989610208497360896?lang=en
- https://forums.fast.ai/t/difference-in-batchsize-and-effect-on-training/52341/2 (careful: some stuff seems wrognly generalized from convex problems)

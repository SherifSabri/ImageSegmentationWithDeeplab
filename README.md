# Image Segmentation With Deeplab
Image Segmentation using Deeplab v3+

## Summary
<p>Experiminting with Quantization of Tensorflow Models on various datasets with the DeepLab v3 Decoder architecture and MobileNet v2 Encoder architectureusing using a variety of techniques including 
<ul>
  <li>Quantization aware training </li>
  <li>Quantization aware training with delay </li>
  <li><a href="https://github.com/SherifSabri/ImageSegmentationWithDeeplab/blob/master/CS256_GroupE_PostQuantization.ipynb">Post training Quantization</a></li>
  <li> <a href="https://github.com/SherifSabri/ImageSegmentationWithDeeplab/blob/master/CS256_GroupE_inference_deeplab.ipynb">Quantized Inference/Evalulation </a></li>
</ul>
</p>

## DeepLab: Deep Labelling for Semantic Image Segmentation
@inproceedings{deeplabv3plus2018,
  title={Encoder-Decoder with Atrous Separable Convolution for Semantic Image Segmentation},
  author={Liang-Chieh Chen and Yukun Zhu and George Papandreou and Florian Schroff and Hartwig Adam},
  booktitle={ECCV},
  year={2018}
}

## Installation
pip install all the following required packages.

## Requirement
<ul>
  <li>TensorFlow 1.15</li>
  <li>Jupyter Notebook</li>
  <li>Python 3.6</li>
  <li>Numpy</li>
  <li>Pillow</li>
  <li>matplotlib</li>
  <li>conda</li>
</ul>
<p>Note: For a ready to use envirenment, a deeplearning ami on an EC2 instance would come with all the required packages needed to run this repo immediatly. </p>

## Usage on Colab
![quantize.png](https://raw.github.com/SherifSabri/ImageSegmentationWithDeeplab/master/quantize.png){: width="300" } 
![inference.png](https://raw.github.com/SherifSabri/ImageSegmentationWithDeeplab/master/inference.png){: width="300" }

## Usage on AWS
<ul>
  <li>clone the repo</li>
  <li>navigate to ImageSegmentationWithDeeplab (command: cd ImageSegmentationWithDeeplab)</li>  
  <li>run the command "jupyter notebook"</li>  
  <li>use the provided url (default: localhost:8888)</li>
  <li>open the "inference_deeplab.ipynb" notebook</li>
  <li>From drop down list Cell > Run All </li>
</ul>

## Results
[![segmentation-results.png](https://i.postimg.cc/7PgkjyBQ/segmentation-results.png)](https://postimg.cc/c6428PGQ)

### About:

<p>This page (code, report and presentation) is the group "E" submission for Final project for CS256: Selected Topics in Artificial Intelligence, Section 2. Leb by Instructor: Mashhour Solh, Ph.D.
</br>
The group members are:
<ul>
  <li>Sherif Elsaid</li>
  <li>Inhee Park</li>
  <li>Sagar Shahi</li>
  <li>Sriram Priyatham Siram</li>
  <li>Anand Vishwakarma</li>
</ul>
The code maybe used for educational and commercial use under no warranties. 
</br>For questions on this project and code please reach out to: 
</br>"contact@sherifsabri.dev"

### Credits
<p>This project was conducted with free credits provided by AWS educate team.</p>

# Image Segmentation With Deeplab
Image Segmentation using Deeplab v3 for CS256 Group E

## Summary
<p>Experiminting with Quantization of Tensorflow Models on various datasets with the DeepLab v3 Decoder architecture and MobileNet v2 Encoder architectureusing using a variety of techniques including 
<ul>
  <li>Quantization aware training </li>
  <li>Quantization aware training with delay </li>
  <li>Post training Quantization </li>
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
  <li>matplotlib</li>
  <li>conda</li>
</ul>
<p>Note: For a ready to use envirenment, a deeplearning ami on an EC2 instance would come with all the required packages needed to run this repo immediatly. </p>
## Usage
<ul>
  <li>clone the repo</li>
  <li>navigate to ImageSegmentationWithDeeplab (command: cd ImageSegmentationWithDeeplab)</li>  
  <li>run the command "jupyter notebook"</li>  
  <li>use the provided url (default: localhost:8888)</li>
  <li>open the "inference_deeplab.ipynb" notebook</li>
  <li>From drop down list Cell > Run All </li>
</ul>

### Group Members
<ul>
<li>Sherif Elsaid</li>
<li>Inhee Park</li>
<li>Sagar Shahi</li>
<li>Sriram Priyatham Siram</li>
<li>Anand Vishwakarma</li>
</ul>

### Credits
<p>Thanks for Amazon AWS for providing us with free educational vouchers,<br>
and thanks for Prof. Mashhour Solh for supervising this project.</p>

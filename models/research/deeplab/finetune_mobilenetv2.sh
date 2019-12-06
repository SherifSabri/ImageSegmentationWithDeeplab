# Exit immediately if a command exits with a non-zero status.
set -e

# Move one-level up to tensorflow/models/research directory.
cd ..

# Update PYTHONPATH.
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

# Set up the working environment.
CURRENT_DIR=$(pwd)
WORK_DIR="${CURRENT_DIR}/deeplab"

#####################################################
#####################################################
#####################################################
#for NUM_ITERATIONS in 1 10 100 1000 10000
for NUM_ITERATIONS in 1
do
python ${WORK_DIR}/train.py \
  --train_split="trainval" \
  --model_variant="mobilenet_v2" \
  --output_stride=16 \
  --train_crop_size="513,513" \
  --train_batch_size=4 \
  --training_number_of_steps=${NUM_ITERATIONS} \
  --fine_tune_batch_norm=true \
  --tf_initial_checkpoint="$WORK_DIR/datasets/pascal_voc_seg/init_models/deeplabv3_mnv2_pascal_train_aug/model.ckpt-30000" \
  --train_logdir="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}" \
  --dataset_dir="$WORK_DIR/datasets/pascal_voc_seg/tfrecord"
 #--logtostderr \


echo "Evalulation on FT-"$NUM_ITERATIONS

# Run evaluation. This performs eval over the full val split (1449 images) and
# will take a while.
# Using the provided checkpoint, one should expect mIOU=75.34%.
python ${WORK_DIR}/eval.py \
  --eval_split="val" \
  --model_variant="mobilenet_v2" \
  --eval_crop_size="513,513" \
  --checkpoint_dir="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}" \
  --eval_logdir="$WORK_DIR/postQ/Evals" \
  --dataset_dir="$WORK_DIR/datasets/pascal_voc_seg/tfrecord"
  --max_number_of_evaluations=1
  #--logtostderr \

echo "Freezing the Weight to .pb file for FT-"$NUM_ITERATIONS
python ${WORK_DIR}/export_model.py \
  --checkpoint_path="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}/model.ckpt-${NUM_ITERATIONS}" \
  --export_path="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}/frozen_inference_graph.pb" \
  --model_variant="mobilenet_v2" \
  --num_classes=21 \
  --crop_size=513 \
  --crop_size=513 \
  --inference_scales=1.0
  #--logtostderr \
done
#####################################################
#####################################################
#####################################################

#####################################################
#####################################################
#####################################################
#for NUM_ITERATIONS in "NO" 1 10 100 1000 10000
for NUM_ITERATIONS in 1
do
tflite_convert \
  --graph_def_file="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}/frozen_inference_graph.pb" \
  --output_file="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}/postQuant_FT${NUM_ITERATIONS}_FLOAT.tflite" \
  --post_training_quantize \
  --inference_type=FLOAT \
  --output_format=TFLITE \
  --input_shape=1,513,513,3 \
  --input_arrays="MobilenetV2/MobilenetV2/input" \
  --mean_values=128 \
  --std_dev_values=127 \
  --change_concat_input_ranges=true \
  --output_arrays="ArgMax"

tflite_convert \
  --graph_def_file="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}/frozen_inference_graph.pb" \
  --output_file="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}/postQuant_FT${NUM_ITERATIONS}_FLOAT_minmax.tflite" \
  --post_training_quantize \
  --inference_type=FLOAT \
  --output_format=TFLITE \
  --input_shape=1,513,513,3 \
  --input_arrays="MobilenetV2/MobilenetV2/input" \
  --mean_values=128 \
  --std_dev_values=127 \
  --default_ranges_min=0 \
  --default_ranges_max=6 \
  --change_concat_input_ranges=true \
  --output_arrays="ArgMax"

tflite_convert \
  --graph_def_file="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}/frozen_inference_graph.pb" \
  --output_file="$WORK_DIR/postQ/FT-${NUM_ITERATIONS}/postQuant_FT${NUM_ITERATIONS}_float16_minmax.tflite" \
  --quantize_to_float16 \
  --inference_type=FLOAT \
  --output_format=TFLITE \
  --input_shape=1,513,513,3 \
  --input_arrays="MobilenetV2/MobilenetV2/input" \
  --mean_values=128 \
  --std_dev_values=127 \
  --default_ranges_min=0 \
  --default_ranges_max=6 \
  --change_concat_input_ranges=true \
  --output_arrays="ArgMax"
  #--post_training_quantize \

done
exit


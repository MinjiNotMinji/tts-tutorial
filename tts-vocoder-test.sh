#!/bin/bash

text="Many animals of even complex structure which live parasitically within others are wholly devoid of an alimentary cavity."

tts_models=(
    "tts_models/en/ljspeech/tacotron2-DDC"
    "tts_models/en/ljspeech/tacotron2-DDC_ph"
    "tts_models/en/ljspeech/glow-tts"
    "tts_models/en/ljspeech/speedy-speech"
    "tts_models/en/ljspeech/tacotron2-DCA"
    "tts_models/en/ljspeech/vits"
    "tts_models/en/ljspeech/vits--neon"
    "tts_models/en/ljspeech/fast_pitch"
    "tts_models/en/ljspeech/overflow"
    "tts_models/en/ljspeech/neural_hmm"
)

vocoder_models=(
    "vocoder_models/en/ljspeech/hifigan_v2"
    "vocoder_models/en/ljspeech/multiband-melgan"
    "vocoder_models/en/ljspeech/univnet"
)

for model_name in "${tts_models[@]}"
do
    for vocoder_name in "${vocoder_models[@]}"
    do
        tts --text "${text}" --model_name "${model_name}" --vocoder_name "${vocoder_name}" --out_path "/content/drive/MyDrive/recipes/ljspeech/test/${model_name//\//-}-${vocoder_name//\//-}.wav"
    done
done
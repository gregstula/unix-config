#!/bin/sh
sudo nvidia-smi -pm 1
sudo nvidia-smi --lock-gpu-clocks=800,3150

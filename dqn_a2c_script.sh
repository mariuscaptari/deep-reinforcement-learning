#!/bin/bash

cd rl-baselines3-zoo/

# 5 runs for each experiment
for i in {1..5}
do
    python train.py --algo a2c --env PongNoFrameskip-v4 --tensorboard-log /tmp/stable-baselines/ --eval-episodes 10 --eval-freq 50000 -n 10000000
    python train.py --algo a2c --env BreakoutNoFrameskip-v4 --tensorboard-log /tmp/stable-baselines/ --eval-episodes 10 --eval-freq 50000 -n 10000000
    python train.py --algo dqn --env PongNoFrameskip-v4 --tensorboard-log /tmp/stable-baselines/ --eval-episodes 10 --eval-freq 50000 -n 10000000
    python train.py --algo dqn --env BreakoutNoFrameskip-v4 --tensorboard-log /tmp/stable-baselines/ --eval-episodes 10 --eval-freq 50000 -n 10000000
done

# Plot the results and save them
python rl_zoo3/plots/all_plots.py -a dqn a2c --env PongNoFrameskip-v4  -max 10000000 -f logs/ --print-n-trials
python rl_zoo3/plots/all_plots.py -a dqn a2c --env BreakoutNoFrameskip-v4  -max 10000000 -f logs/ --print-n-trials
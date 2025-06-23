#!/bin/bash

# ================================================================
# Author: Anand Mathew
# ================================================================

# === Generate Dislocated CoAl Layer ===
atomsk --create CsCl 2.876 Co Al orient [001] [1-10] [110] coaldis.cfg \
-dup 82 82 32 \
-orient [001] [1-10] [110] [100] [010] [001] \
-disloc loop 0.31*box 0.65*box 0.22*box Y 41 2.876 0 0 0.33 \
-orient [110] [001] [1-10] [0-11] [011] [100] \
-disloc loop 0.43*box 0.67*box 0.26*box Z 62 0 2.876 0 0.33 \
-orient [0-11] [011] [100] [011] [100] [0-11] \
-disloc loop 0.33*box 0.44*box 0.75*box Y 28 -1.659 -1.659 1.659 0.33 \
-orient [001] [1-10] [110] [010] [001] [100] \
-disloc loop 0.38*box 0.3*box 0.21*box Z 73 0 0 2.876 0.33 \
-orient [100] [010] [001] [1-10] [110] [001] \
-disloc loop 0.7*box 0.4*box 0.2*box X 18 0 1.659 1.659 0.33 \
-orient [0-11] [011] [100] [1-11] [121] [-101] \
-disloc loop 0.32*box 0.68*box 0.43*box Y 19 0 -2.876 0 0.33 \
-orient [110] [001] [1-10] [100] [010] [001] \
-disloc loop 0.6*box 0.4*box 0.25*box Z 53 0 0 -2.876 0.33 partial \
-orient [011] [100] [0-11] [010] [001] [100] \
-disloc loop 0.35*box 0.7*box 0.72*box X 39 -1.659 1.659 1.659 0.33 \
-orient [001] [1-10] [110] [010] [001] [100] \
-disloc loop 0.57*box 0.38*box 0.68*box Y 46 0 0 2.876 0.33 partial \
-orient [1-10] [110] [001] [110] [001] [1-10] \
-disloc loop 0.45*box 0.34*box 0.45*box Z 59 0 0 -2.876 0.33 partial \
-orient [011] [100] [0-11] [010] [001] [100] \
-disloc loop 0.47*box 0.59*box 0.49*box X 45 -1.659 -1.659 1.659 0.33 partial \
-orient [100] [010] [001] [011] [100] [0-11] \
-disloc loop 0.36*box 0.61*box 0.29*box Z 29 0 2.876 0 0.33 \
-orient [011] [100] [0-11] [010] [001] [100] \
-disloc loop 0.48*box 0.52*box 0.47*box X 35 2.033 2.033 0 0.33 \
-orient [0-11] [011] [100] [001] [1-10] [110] \
-disloc loop 0.52*box 0.49*box 0.53*box Y 22 -2.876 0 0 0.33 \
-orient [1-10] [110] [001] [110] [001] [1-10] \
-disloc loop 0.5*box 0.5*box 0.5*box X 31 -1.659 1.659 -1.659 0.33 partial \
-orient [1-11] [121] [-101] [110] [001] [1-10] \
-disloc loop 0.48*box 0.5*box 0.52*box Y 48 0 0 -2.876 0.33 \
-orient [100] [010] [001] [011] [100] [0-11] \
-disloc loop 0.53*box 0.48*box 0.52*box Y 26 0 2.033 2.033 0.33 \
-orient [011] [100] [0-11] [010] [001] [100] \
-disloc loop 0.49*box 0.53*box 0.5*box Z 36 1.659 1.659 -1.659 0.33 \
-alignx

# === Generate CoAl layer without dislocations ===
atomsk --create CsCl 2.876 Co Al orient [001] [1-10] [110] coal.cfg -dup 82 140 9 \
-alignx

# === Merge alternating 3 CoAl with dis and 2 CoAl without dis layers in the z-direction ===
atomsk --merge z 5 coaldis.cfg coal.cfg coaldis.cfg coal.cfg coaldis.cfg final_structure.cfg

# === Cut into cylindrical sample ===
atomsk final_structure.cfg \
       -select out cylinder Z 0.5*box 0.5*box 117 \
       -remove-atom select \
       cylindrical_sample.cfg

# === Export for LAMMPS ===
atomsk cylindrical_sample.cfg lammps

echo "✅ Cylindrical CoAl sample with dislocation loops successfully generated and exported for LAMMPS."
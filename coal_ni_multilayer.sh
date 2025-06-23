#!/bin/bash

# ================================================================
# Author: Anand Mathew
# ================================================================

# === Generate CoAl layer ===
atomsk --create CsCl 2.876 Co Al orient [001] [1-10] [110] coal.cfg -dup 82 82 32

# === Generate FCC Ni layer ===
atomsk --create fcc 3.52 Ni orient [-1-12] [1-10] [111] ni.cfg -dup 82 140 6

# === Merge alternating 3 CoAl and 2 Ni layers in the z-direction ===
atomsk --merge z 5 coal.cfg ni.cfg coal.cfg ni.cfg coal.cfg final_structure.cfg

# === Cut a cylindrical region from the merged structure ===
atomsk final_structure.cfg \
  -select out cylinder Z 0.5*box 0.5*box 117 \
  -remove-atom select \
  cylindrical_sample.cfg

# === Export the cylindrical structure for LAMMPS ===
atomsk cylindrical_sample.cfg lammps

echo "✅ Cylindrical CoAl/Ni sample generated and exported for LAMMPS."

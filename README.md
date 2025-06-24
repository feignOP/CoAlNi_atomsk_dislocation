# CoAl / Ni Multilayer Structure and Dislocation Generator

This repository contains two shell scripts to generate multilayer structures of CoAl and Ni using [Atomsk](https://atomsk.univ-lille.fr/), with dislocation loops. The output files are suitable for visualization or atomistic simulations using LAMMPS.

---

## 📁 Scripts Overview

### 1. `coal_multilayer_dislcoation.sh`

Generates a **single-material CoAl multilayer** structure with **random dislocation loops**.

- 🧱 Structure: CsCl (CoAl)
- 🔁 Layers: Repeated CoAl blocks
- 🧭 Orientations: CoAl `[001] [1-10] [110]` with varied loop orientations
- ➰ Dislocations: Random loops with a mix of <111>, <100>, and few <110> Burgers vectors


---

### 2. `coal_ni_multilayer_dislcoation.sh`

Builds a **CoAl/Ni multilayer** with **dislocation loops** inserted at multiple interfaces.

- 🧱 Structure: Alternating CoAl (CsCl) and Ni (FCC) layers
- 🔁 Multilayered stack with dislocations
- 🧭 Orientations: CoAl `[001] [1-10] [110]` with varied loop orientations and Ni `[-1-12] [1-10] [111]` 
- ➰ Dislocations: Random loops with a mix of <111>, <100>, and few <110> Burgers vectorsin CoAl and randon dislciations in Ni


---

## ▶️ How to Run

```bash
bash coal_multilayer_dislcoation.sh
bash coal_ni_multilayer.sh
bash coal_ni_multilayer_dislcoation.sh

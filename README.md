# 32-bit Hierarchical Carry Lookahead Adder

## 📌 Project Overview
This project implements a 32-bit full adder using a hierarchical Carry Lookahead Adder (CLA) architecture. It is constructed from eight 4-bit full-adder blocks to optimize carry propagation delay.

## 🛠️ Tools & Technologies
*   **Language:** VHDL
*   **Simulator:** NVC
*   **Waveform Viewer:** GTKWave

## ⚙️ Architecture
The 32-bit adder uses the Look-Ahead logic at two levels (4-bit blocks and 32-bit top level) to calculate intermediate carries in parallel, significantly reducing the time it takes for the carry to propagate from the LSB to the MSB.

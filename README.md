# 32-bit Hierarchical Carry Lookahead Adder

## 📌 Project Overview
This project implements a 32-bit full adder using a hierarchical Carry Lookahead Adder (CLA) architecture. It is constructed from eight 4-bit full-adder blocks to optimize carry propagation delay.

## 🛠️ Tools & Technologies
*   **Language:** VHDL
*   **Simulator:** NVC
*   **Waveform Viewer:** GTKWave

## ⚙️ Architecture
The 32-bit adder uses the Look-Ahead logic at two levels (4-bit blocks and 32-bit top level) to calculate intermediate carries in parallel, significantly reducing the time it takes for the carry to propagate from the LSB to the MSB.
<img width="949" height="261" alt="image" src="https://github.com/user-attachments/assets/cd667b56-1560-4237-8bde-02c6d6a57f14" />

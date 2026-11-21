# F215 Verilog lab practice set 2 (lab-practice-3)

Folders:
- task1  Part A: write btn_enc.v, lift_ctrl.v, floor_ctrl.v (tb.v only checks names)
- task2  Part B1: complete tb.v (self-checking testbench for fare_card)
- task3  Part B2: find the two bugs in fare_card.v, fill in answers.md

Run a task with Icarus Verilog (from inside the task folder):

    iverilog -g2012 -o sim *.v && vvp sim

To view waves, add  +vcd=wave.vcd  to the vvp command and open wave.vcd in GTKWave.

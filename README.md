# AES-128 Verilog Simulation

This repository contains Verilog files for simulating AES-128 encryption using **Icarus Verilog** and **GTKWave**.

## Prerequisites

Ensure you have the following tools installed:

### **Install Icarus Verilog** (iverilog)

#### **Ubuntu / Debian**
```sh
sudo apt update
sudo apt install -y iverilog
```

#### **MacOS** (via Homebrew)
```sh
brew install icarus-verilog
```

#### **Windows**
1. Download Icarus Verilog from: [http://bleyer.org/icarus/](http://bleyer.org/icarus/)
2. Install and add it to your system PATH.

### **Install GTKWave** (for waveform visualization)

#### **Ubuntu / Debian**
```sh
sudo apt install -y gtkwave
```

#### **MacOS** (via Homebrew)
```sh
brew install gtkwave
```

#### **Windows**
1. Download GTKWave from: [http://gtkwave.sourceforge.net/](http://gtkwave.sourceforge.net/)
2. Install and add it to your system PATH.

---

## **Running the Simulation**

### **Step 1: Compile the Verilog files**

Run the following command in the directory containing `aes.v` and `tb_aes.v`:
```sh
iverilog -g2005-sv -o aes_tb.out aes.v tb_aes.v
```

### **Step 2: Run the simulation**
```sh
vvp aes_tb.out
```
This will produce a waveform dump file (`simulation.vcd`).

### **Step 3: View the Waveform in GTKWave**
```sh
gtkwave simulation.vcd
```

You can now inspect the AES encryption signals in GTKWave.

---

## **Troubleshooting**

1. **Command not found errors?**
   - Ensure `iverilog`, `vvp`, and `gtkwave` are installed and in your system's PATH.

2. **No waveform output?**
   - Ensure `simulation.vcd` is generated after running `vvp aes_tb.out`.

3. **Compilation errors?**
   - Verify that `aes.v` and `tb_aes.v` are correctly placed in the same directory.

For further debugging, refer to the official documentation:
- [Icarus Verilog](https://steveicarus.github.io/iverilog/)
- [GTKWave](http://gtkwave.sourceforge.net/)

Happy coding! 🚀



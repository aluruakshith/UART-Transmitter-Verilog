# 📡 UART Transmitter | Verilog HDL

> **A synthesizable UART (Universal Asynchronous Receiver/Transmitter) Transmitter designed in Verilog HDL, demonstrating RTL design, functional verification, and serial data communication.**

---

## 🚀 Overview

This project implements a **UART Transmitter** in Verilog HDL capable of transmitting 8-bit parallel data serially according to the UART protocol.

The design was developed as part of my Front-End VLSI learning journey and demonstrates RTL design, modular design methodology, and functional verification using simulation.

---

## ✨ Key Features

* 📤 8-bit Serial Data Transmission
* ⏱️ Configurable Baud Rate Generator
* 🎯 Start Bit Generation
* 📦 8 Data Bit Transmission
* 🛑 Stop Bit Generation
* 🔄 Busy Status Indication
* ⚙️ FSM-Based Control Logic
* 🧩 Fully Synthesizable RTL

---

## 🏛️ Design Flow

```text
Specification
      │
      ▼
RTL Design (Verilog HDL)
      │
      ▼
Functional Simulation
(Icarus Verilog)
      │
      ▼
Waveform Verification
(GTKWave)
```

---

## 📁 Project Structure

```text
UART-Transmitter-Verilog/
│
├── rtl/
│   ├── baud_gen.v
│   ├── uart_tx.v
│   └── uart_top.v
│
├── tb/
│   └── uart_top_tb.v
│
├── waveform/
│   └── uart_tx_waveform.png
│
└── README.md
```

---

## 🛠️ Tools & Technologies

| Tool             | Purpose                 |
| ---------------- | ----------------------- |
| Verilog HDL      | RTL Design              |
| Icarus Verilog   | Functional Simulation   |
| GTKWave          | Waveform Analysis       |
| Ubuntu 24.04 LTS | Development Environment |
| Git & GitHub     | Version Control         |

---

## ⚙️ Module Description

### Baud Rate Generator

* Generates baud tick pulses for UART communication.

### UART Transmitter

* Converts parallel data into serial data.
* Generates Start, Data, and Stop bits.
* Indicates transmitter busy status.

### UART Top Module

* Integrates the baud rate generator and UART transmitter.

---

## 📌 Functional Verification

The design has been verified for:

* ✅ Idle State
* ✅ Start Bit Transmission
* ✅ 8-bit Data Transmission
* ✅ Stop Bit Transmission
* ✅ Busy Signal Operation
* ✅ Multiple Data Transfers
* ✅ Reset Functionality

---

## 📸 Simulation Result

> <img width="1653" height="590" alt="uart_tx_waveform" src="https://github.com/user-attachments/assets/b5a2b827-2ac4-4204-8f31-d6b1ec12d17f" />


```text
waveform/uart_tx_waveform.png
```

---

## 📚 UART Frame Format

```text
Idle | Start | D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | Stop
  1      0      LSB -----------------------------> MSB     1
```

---

## 🎯 Learning Outcomes

This project strengthened my understanding of:

* UART Communication Protocol
* Register Transfer Level (RTL) Design
* Finite State Machines (FSM)
* Sequential Logic
* Baud Rate Generation
* Testbench Development
* Functional Verification
* Digital System Design

---

## 🚧 Future Enhancements

* UART Receiver
* UART Transceiver (TX + RX)
* Configurable Data Width
* Parity Bit Support
* FIFO Buffer Integration
* Hardware Implementation on FPGA

---

## 👨‍💻 Author

**Aluru Akshith**

Electronics & Communication Engineering (ECE)

**Aspiring RTL Design & VLSI Engineer**

---

⭐ *If you found this project interesting, consider giving it a star!*


# 💰 Fixed Deposit (FD) Calculator

A clean, modern, and user-friendly cross-platform application built with **Flutter** to calculate interest returns and maturity values on Fixed Deposits.

---

## ✨ Features

- 💵 **Deposit Amount Input**: Input your principal investment amount.
- 📈 **Interest Rate Calculation**: Specify the annual interest percentage.
- ⏱️ **Flexible Tenure**: Input time period in years.
- 📊 **Instant Calculations**: View interest earned and total maturity value in real-time.
- 🎨 **Modern UI**: Features a sleek, responsive layout styled with custom Google Fonts (`Roboto Mono`).

---

## 🛠️ Tech Stack & Packages

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **Typography**: [`google_fonts`](https://pub.dev/packages/google_fonts)
- **Icons**: [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons)

---

## 🚀 Getting Started

### Prerequisites

Before starting, ensure you have set up your environment:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Connected device, emulator, or web browser

### Installation & Execution

1. **Clone the repository**:
   ```bash
   git clone https://github.com/vijayasree450/FD-Calculator.git
   cd fdcalculator
   ```

2. **Fetch dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   flutter run
   ```

---

## 🧮 Calculation Formula

The calculator uses the standard Simple Interest formula:

$$\text{Interest} = \frac{\text{Principal} \times \text{Rate} \times \text{Time}}{100}$$

$$\text{Total Maturity Amount} = \text{Principal} + \text{Interest}$$

---

## 📁 Project Structure

```text
fdcalculator/
├── assets/
│   └── 1.png                # App launcher icon
├── lib/
│   └── main.dart            # Core application logic & UI widgets
├── pubspec.yaml             # Project dependencies and configuration
└── README.md                # Project documentation
```

# 🧾 TATA GST Billing App - Flutter

A robust, high-performance GST Billing App built with Flutter for **TATA Retail Solutions**. Designed to eliminate manual tax calculation errors, streamline invoice generation, and ensure full compliance with Indian GST regulations. This app helps retail cashiers generate quick, accurate, and itemized bills while maintaining a searchable transaction and product history.

## 🚀 Features

- 🔢 **Automatic GST Calculation** (5%, 12%, 18%, 28%)
  - Breaks down into **CGST** and **SGST** as per Indian regulations.
- 🧾 **Invoice Generator**
  - Instant, itemized bills with tax details.
- 📦 **Product Management**
  - Add, update, and search products easily.
- 📚 **Transaction History**
  - Stores invoices securely for future reference and insights.
- ⚡ **High Performance**
  - Optimized for smooth billing during peak hours.
- 🧑‍💼 **User-Friendly UI**
  - Simple, intuitive design for cashiers and store staff.

---


---

## 🛠️ Tech Stack

- **Flutter** – Cross-platform UI toolkit
- **Provider / Riverpod** – State Management
- **SQLite / Hive** – Local data persistence
- **Intl Package** – Currency and date formatting
- **Flutter PDF / Printing** *(optional)* – Invoice export

---

## ⚙️ GST Calculation Logic

For a product with GST rate `R` and base price `P`:

##structure of folder

```bash
lib/
├── models/ # Data models (Product, Invoice)
├── screens/ # UI screens
├── widgets/ # Reusable UI components
├── providers/ # State management (Provider/Riverpod)
├── services/ # Business logic and storage services
└── utils/ # Helpers and constants
```

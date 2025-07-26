# 🧠 Software Foundations Solutions

This repository contains my personal solutions to the exercises from the **Software Foundations** series, a set of textbooks on formal reasoning, functional programming, and proof engineering using the Coq proof assistant.

## 📚 About the Book Series

The [Software Foundations](https://softwarefoundations.cis.upenn.edu/) series, developed by Benjamin C. Pierce and others, consists of the following volumes:

1. **Logical Foundations** (Vol. 1)
2. **Programming Language Foundations** (Vol. 2)
3. **Verified Functional Algorithms** (Vol. 3)
4. *(Optional)* Additional volumes such as *QuickChick*, *Separation Logic Foundations*, etc.

All exercises are written in **Coq**, a proof assistant for functional programming and formal verification.

## 📁 Repository Structure

```bash
.
├── Vol_1_LF/    # Volume 1: Logical Foundations
├── Vol_2_PLF/   # Volume 2: Programming Language Foundations (not written)
├── Vol_3_VFA/   # Volume 3: Verified Functional Algorithms (not written)
├── _CoqProject  # Set module to use other files
├── .gitignore   # ignore compiled files
└── README.md    # This file
```

Each directory corresponds to one volume in the series and contains `.v` files (Coq source files) with my completed solutions.

## 🏃‍♂️ Running the Test Files

1. **Add the module mapping to `_CoqProject`**

   ```text
   -Q "Vol_1_LF" LF
   ```

   The repository contains several volumes, so an absolute path is used instead of a relative one.

2. **Compile the chapter files required at chapter what you want to test**

   ```bash
   coqc -Q "Vol_1_LF" LF Vol_1_LF/Basics.v
   ```

3. **Compile any additional chapter files required by the test**

   ```bash
   coqc -Q "Vol_1_LF" LF Vol_1_LF/Induction.v
   ```

4. **Compile the corresponding test file**

   ```bash
   coqc -Q "Vol_1_LF" LF Vol_1_LF/InductionTest.v
   ```

   > Replace `Vol_1_LF` / `Basics` / `Induction` / `InductionTest` with the chapter you are currently working on.

## ⚙️ Requirements

- [Coq](https://coq.inria.fr/) (Version 8.17+ recommended)
- [CoqIDE](https://coq.inria.fr/coqide/) or [VS Code + VsCoq](https://github.com/coq-community/vscoq) for editing

## ✅ Disclaimer

> This repository is intended for **personal learning** and documentation.  
> Please avoid copying solutions for assignments or coursework if you're a student. Try solving them on your own first — it's worth it!

## 📌 License

Unless otherwise stated, original content in this repository is provided under the [MIT License](LICENSE).

---

Happy Coquing! 🧮
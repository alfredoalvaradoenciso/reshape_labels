# Reshape Save Labels - Stata Program

## Overview

This Stata program reshapes long-format data into wide format while preserving the value labels of the specified variables. The value labels of the variable(s) specified in the `j` argument are used as variable names in the wide format, making the output more readable and informative.

### Key Features:

* Handles multiple identifier variables (`i`).
* Supports multiple `j` variables to reshape by.
* Allows reshaping of multiple variables (`v`).
* Retains value labels as new variable names.
* Automatically handles cases where labels do not exist.

---

## Installation

Simply copy and paste the code from the script into your Stata environment, or save the script as a `.do` file and run it using:

```stata
do reshape_save_labels.do
```

---

## Syntax

```stata
reshape_save_labels, i(varlist) j(varlist) v(varlist)
```

### Arguments

* `i(varlist)`: A list of variables that uniquely identify the wide data (e.g., ID variables).
* `j(varlist)`: One or more variables with labels that will be preserved as variable names.
* `v(varlist)`: One or more variables to be reshaped to wide format.

---

## Example Usage

Suppose you have a long-format dataset with the following structure:

| var1 | var2 | j1 | j2 | v1 | v2 |
| ---- | ---- | -- | -- | -- | -- |
| 1    | A    | 10 | X  | 5  | 8  |
| 1    | A    | 20 | Y  | 3  | 7  |

To convert this data from long to wide, run the program as follows:

```stata
reshape_save_labels, i(var1 var2) j(j1 j2) v(v1 v2)
```

### Output

The output will be wide-format data with variables named according to the labels of `j1` and `j2`.

---

## Tips

* Make sure the `j` variables have labels, as the program will use them as the names of the new wide variables.
* If a label does not exist, the variable's value will be used as the name instead.

## License

This program is released under the MIT License. You are free to use, modify, and distribute it.

## Contributions

Feel free to open issues or contribute to this repository. Any improvements or bug fixes are welcome.

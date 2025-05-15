# Reshape Save Labels - Stata Program

## Overview

This Stata program reshapes long-format data into wide format while preserving the value labels of a specified variable. The value labels of the variable specified in the `j` argument are used as variable names in the wide format, making the output more readable and informative.

### Key Features:

* Handles multiple identifier variables (`i`).
* Supports one `j` variable to reshape by.
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
reshape_save_labels, i(varlist) j(varname) v(varlist)
```

### Arguments

* `i(varlist)`: A list of variables that uniquely identify wide data (e.g., ID variables).
* `j(varname)`: A single variable with labels to be preserved as variable names.
* `v(varlist)`: One or more variables to be reshaped to wide format.

---

## Example Usage

Suppose you have a long-format dataset with the following structure:

| var1 | var2 | j  | v1 | v2 |
| ---- | ---- | -- | -- | -- |
| 1    | A    | 1 | 5  | 8  |
| 1    | A    | 2 | 3  | 7  |

Assume that the variable `j` has the following value labels:

* `1`: "Height"
* `2`: "Weight"

To convert this data from long to wide, run the program as follows:

```stata
reshape_save_labels, i(var1 var2) j(j) v(v1 v2)
```

### Output

The output will be wide-format data with variables named according to the labels of `j`.

#### Example Output:

| var1 | var2 | v11 | v12 | v21 | v22 |
| ---- | ---- | ---------- | ---------- | ---------- | ---------- |
| 1    | A    | 5          | 3          | 8          | 7          |


In this example, the variable names incorporate the value labels "Height" and "Weight" from `j`, making the wide-format data more descriptive.

| var1 | var2 | Height | Weight | Height | Weight |
| ---- | ---- | ---------- | ---------- | ---------- | ---------- |
| 1    | A    | 5          | 3          | 8          | 7          |

---

## Tips

* Make sure the `j` variable has labels, as the program will use them as the names of the new wide variables.
* If a label does not exist, the variable's value will be used as the name instead.

## License

This program is released under the MIT License. You are free to use, modify, and distribute it.

## Contributions

Feel free to open issues or contribute to this repository. Any improvements or bug fixes are welcome.

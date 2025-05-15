cap program drop reshape_save_labels
program define reshape_save_labels
    syntax varlist(min=3), i(string) j(string) v(string)

    * Step 1: Keep only the necessary variables
    keep `i' `j' `v'
    
    * Step 2: Loop through each j-variable to get levels and labels
    foreach jvar of varlist `j' {
        levelsof `jvar', local(col_levels_`jvar')
        foreach val of local col_levels_`jvar' {
            local l`jvar'_`val' : label `jvar' `val'
            if "`l`jvar'_`val''" == "" local l`jvar'_`val' "`val'"
        }
    }
    
    * Step 3: Reshape wide for each v-variable
    reshape wide `v', i(`i') j(`j')

    * Step 4: Assign labels to the new wide variables
    foreach vvar of varlist `v' {
        foreach jvar of varlist `j' {
            local col_levels : list col_levels_`jvar'
            foreach lev of local col_levels {
                label variable `vvar'`lev' "`l`jvar'_`lev''"
            }
        }
    }
end

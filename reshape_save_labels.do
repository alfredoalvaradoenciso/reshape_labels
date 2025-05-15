cap program drop reshape_save_labels
program define reshape_save_labels
    syntax, i(string) j(varname) v(varlist)

    * Step 1: Keep only the necessary variables
    keep `i' `j' `v'

    * Step 2: Get levels and labels from the j-variable
    levelsof `j', local(col_levels)
    foreach val of local col_levels {
        local l`val' : label `j' `val'
        if "`l`val''" == "" local l`val' "`val'"
    }

    * Step 3: Reshape wide for the specified v-variables
    reshape wide `v', i(`i') j(`j')

    * Step 4: Assign labels to the new wide variables
    foreach vvar in `v' {
        foreach lev of local col_levels {
            label variable `vvar'`lev' "`l`lev''"
        }
    }
end

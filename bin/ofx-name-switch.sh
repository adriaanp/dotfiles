#!/bin/bash
sed '
    /NAME\>4835/ {
        N
        /NAME\>4835.*\n\<MEMO/ {
            s/\<NAME\>4835.*\n\<MEMO\>/<MEMO>4835\
<NAME>/g
        }
    }
' $1 > conv-$1
#!/bin/bash

# item codes copied from https://docs.google.com/spreadsheets/d/1J8WdrubKgo8A9hPY-hbQLq4eVrb3n3lZAgiI2J7ncAU/edit#gid=984581625

outputfilename=items.lua

genlist(){
    inputfilename=$1
    variable_name=$2
    echo -e "${variable_name}=\n[["  >> ${outputfilename}
    while read line; do
        line=$(echo ${line} | tr -d '\r\n')
        echo ${line}
        echo -e "\t\t\t\t<Property value=\"NMSString0x10.xml\">" >> ${outputfilename}
        echo -e "\t\t\t\t\t<Property name=\"Value\" value=\"${line}\" />" >> ${outputfilename}
        echo -e "\t\t\t\t</Property>" >> ${outputfilename}

    done < ${inputfilename}
    echo -e "]]" >> ${outputfilename}
}


echo "" > ${outputfilename}
genlist weaptechspecialist.txt WEAPTECHSPECIALIST
genlist suittechspecialist.txt SUITTECHSPECIALIST
genlist shiptechspecialist.txt SHIPTECHSPECIALIST
genlist vehicletechspecialist.txt VEHICLETECHSPECIALIST
genlist techshop.txt TECHSHOP
genlist substancelist.txt SUBSTANCES
genlist productlist.txt PRODUCTS

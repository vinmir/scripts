#!/bin/bash

# Programa que renomeia múltiplos arquivos (troque a extensão na linha 15) por ordem de modificação com base em um documento de texto externo. 
# Por exemplo, se a primeira linha for "Doc 01", o doc mais antigo da pasta é renomeado para Doc 01.
# Manual de uso:
# 1. Crie um documento de texto chamado 'Nomes.txt' que contém os novos nomes
# 2. Insira todos os documentos a serem renomeados na mesma pasta. Devem estar em ordem de modificação.
# 3. Execute o script.

mapfile -t arr_nomes < Nomes.txt;
idx=0;

find . -maxdepth 1 -type f -print0 | xargs -0 ls -tr | while read file
do
    if [[ ${file##*.} != "pdf" ]]; then
        echo "Pulando $file; extensão incorreta."
        continue
    fi
    
    echo "Renomeando $file";
    mv "$file" "${arr_nomes[$idx]}.pdf"
    idx=$((idx+1));
    
    
done


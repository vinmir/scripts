#! /bin/bash
cd "$(dirname "$0")"
cd txt
# Converte cada txt para .pdf: Libreoffice
libreoffice7.3 --convert-to pdf *.txt --infilter="Text (encoded):UTF8,,Free Mono,"

# Converte cada txt para .pdf: enscript
    # enscript não suporta UTF-8, então cada arqivo de texto precisaria ser convertido para ISO-8859-1
# for item in *.txt; do
#     enscript --word-wrap "$item" -p "${item%.txt}.ps"
#     ps2pdf "${item%.txt}.ps" "${item%.txt}.pdf"
#     rm "${item%.txt}.ps"
# done

# Une todos os pdfs
pdftk *.pdf cat output ../BBVW2-Redux-Manual.pdf

# Rotina para bookmarks:
currpage=1
> ../contents.txt # Cria arquivo vazio
for item in *.pdf; do
    replaced=${item/-/ } # Troca hífen por espaço
    name=${replaced%.pdf} # Remove sufixo
    echo "$name: $currpage" >> ../contents.txt # Imprime linha atual e nome do capítulo
    currpage=$((currpage+$(qpdf --show-npages "$item"))) # Atualiza a página atual
done

# Remove pdfs inúteis
rm *.pdf


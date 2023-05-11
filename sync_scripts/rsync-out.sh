#!/bin/bash
echo "rsync: Computador -> HDD"
#echo "--delete foi desativado. Nunca mais acione esta opção."
echo "Arquivos do HDD serão excluídos. Prosseguir? [s/n]"
read resposta
if [ "$resposta" != "s" ]; then
	echo "Parando."
	exit 1
fi
echo "Tem absoluta certeza? HDD será excluído! [s/n]"
read resposta
if [ "$resposta" != "s" ]; then
	echo "Parando."
	exit 1
fi
echo -e "\n\n\n"


# Livros
source="/home/vinicius/Vinicius/Livros Universitários"
dest="/media/vinicius/HDD 500GB/Vinicius-Backup/Livros/Livros Universitários"
echo -e "\nEnviando $source. Proceder? Lembre-se: os arquivos serão DELETADOS! [s/n]"
read resposta
if [ "$resposta" == "s" ]; then
    rsync -Pavh --delete "$source/" "$dest/"
fi

# USP
source="/home/vinicius/Vinicius/USP"
dest="/media/vinicius/HDD 500GB/Vinicius-Backup/USP"
echo -e "\nEnviando $source. Proceder? [s/n]"
read resposta
if [ "$resposta" == "s" ]; then
    rsync -Pavh --delete "$source/" "$dest/"
fi

# Concursos
source="/home/vinicius/Vinicius/Concursos"
dest="/media/vinicius/HDD 500GB/Vinicius-Backup/Concursos"
echo -e "\nEnviando $source. Proceder? [s/n]"
read resposta
if [ "$resposta" == "s" ]; then
    rsync -Pavh "$source/" "$dest/"
fi

# Sync
source="/home/vinicius/Vinicius/Sync"
dest="/media/vinicius/HDD 500GB/Vinicius-Backup/Sync"
echo -e "\nEnviando $source. Proceder? [s/n]"
read resposta
if [ "$resposta" == "s" ]; then
    rsync -Pavh "$source/" "$dest/"
fi

# Log das updates
echo "PC->HDD:" $(date '+%Y-M%m-D%d %H:%M:%S') >> "/media/vinicius/HDD 500GB/Vinicius-Backup/Sync/log_sync.txt"

echo -e "\n\n\nFim."

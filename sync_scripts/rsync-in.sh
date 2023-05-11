#!/bin/bash
echo "rsync: HDD -> Computador"
#echo "--delete foi desativado. Nunca mais acione esta opção."
echo "Arquivos do COMPUTADOR serão excluídos. Prosseguir? [s/n]"
read resposta
if [ "$resposta" != "s" ]; then
	echo "Parando."
	exit 1
fi
echo "Tem absoluta certeza? COMPUTADOR será excluído! [s/n]"
read resposta
if [ "$resposta" != "s" ]; then
	echo "Parando."
	exit 1
fi
echo -e "\n\n\n"


# Livros
source="/media/vinicius/HDD 500GB/Vinicius-Backup/Livros/Livros Universitários"
dest="/home/vinicius/Vinicius/Livros Universitários"
echo -e "\nEnviando $source. Proceder? [s/n]"
read resposta
if [ "$resposta" == "s" ]; then
    rsync -Pavh --delete "$source/" "$dest/"
fi

# USP
source="/media/vinicius/HDD 500GB/Vinicius-Backup/USP"
dest="/home/vinicius/Vinicius/USP"
echo -e "\nEnviando $source. Proceder? [s/n]"
read resposta
if [ "$resposta" == "s" ]; then
    rsync -Pavh --delete "$source/" "$dest/"
fi

# Concursos
source="/media/vinicius/HDD 500GB/Vinicius-Backup/Concursos"
dest="/home/vinicius/Vinicius/Concursos"
echo -e "\nEnviando $source. Proceder? [s/n]"
read resposta
if [ "$resposta" == "s" ]; then
    rsync -Pavh "$source/" "$dest/"
fi

# Sync
source="/media/vinicius/HDD 500GB/Vinicius-Backup/Sync"
dest="/home/vinicius/Vinicius/Sync"
echo -e "\nEnviando $source. Proceder? [s/n]"
read resposta
if [ "$resposta" == "s" ]; then
    rsync -Pavh "$source/" "$dest/"
fi

# Log das updates
echo "HDD->PC:" $(date '+%Y-M%m-D%d %H:%M:%S') >> "/home/vinicius/Vinicius/Sync/log_sync.txt"

echo -e "\n\n\nFim."


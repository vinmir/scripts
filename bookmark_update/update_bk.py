# Pouco documentado, não estou com paciência para explicar o que cada coisa faz
# https://www.pdflabs.com/blog/export-and-import-pdf-bookmarks/
# Em essência, a partir do primeiro bookmark do capítulo 1, todos os bookmarks estão
# atrsados em uma pg. Este

with open("old_bookmarks","r") as file:
    txt = file.readlines()


for i in range(len(txt)):
    line = txt[i]
    if line.startswith("BookmarkPageNumber:"):
        _,n=line.split()
        n=int(n)
        m=n+1
        line=line.replace(str(n),str(m))
        txt[i] = line

with open("final_bookmarks.txt","w") as file:
    file.writelines(txt)

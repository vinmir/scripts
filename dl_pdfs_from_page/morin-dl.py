import bs4 as bs, requests as req, shutil, os, re

def find_links(url):
	response = req.get(url,stream=True)
	response.raise_for_status
	soup = bs.BeautifulSoup(response.content,features="lxml")
	links = map(str,[link.get('href') for link in soup.find_all("a")])
	links = [link for link in links if link.startswith("https://scholar.harvard.edu/files/david-morin/files")]
	# with open(os.path.dirname(os.path.abspath(__file__))+'/TestText/bsLinks.txt','w') as file:
	# 	file.write("\n".join(links))
	return links


def dl_files(links):

	#checkpath:
	if os.path.isdir(path):
		print('ok')
	else:
		print('not ok')
		os.mkdir(path)
		print('ok')

	for pos,link in enumerate(links):
		ch = pos+1
		resp = req.get(link, stream=True)
		resp.raise_for_status()
		fname = re.search(r".*/files/(.*)\b$",link)[1]
		fname="ch{}-{}".format(ch,fname)
		fullpath = "{}/{}".format(path,fname)

		with open(fullpath,'wb') as file:
			shutil.copyfileobj(resp.raw, file)



url = r"https://scholar.harvard.edu/david-morin/waves"
# os.path.abspath(x): fornece o path absoluto de x
# os.path.dirname(x): fornece o path absoluto da pasta que contém x
path = os.path.dirname(os.path.abspath(__file__))+r"/PDFs" 
links = find_links(url)
dl_files(links)
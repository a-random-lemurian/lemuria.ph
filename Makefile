DESTDIR=public
BASEURL=https://lemuria.ph

.PHONY: build
build:
	hugo build --logLevel debug --baseURL $(BASEURL) -d $(DESTDIR)

.PHONY: deploy
deploy: public
	rsync --delete -rvz ./$(DESTDIR)/ lemuria@vps1:/home/lemuria/www/ph/lemuria/_root
# THE SLASH IS IMPORTANT!

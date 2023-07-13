
.PHONY: remoteInitBoard
remoteInitBoard:
	$(MAKE) -C $@ 

.PHONY: remoteInitPC
remoteInitPC:
	$(MAKE) -C $@

.PHONY: clean

clean:
	$(MAKE) clean -C remoteInitBoard
	$(MAKE) clean -C remoteInitPC
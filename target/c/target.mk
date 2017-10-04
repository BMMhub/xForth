$(TDIR)/params.fth: params
	./$< > $@

params: $(TDIR)/params.c
	$(CC) $< -o $@

test-image: image
	touch $@

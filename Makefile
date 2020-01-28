CARTO = carto

mmls = $(shell find -maxdepth 1 -type f -name "*.mml")
xmls = $(mmls:.mml=.xml)
deps = $(xmls:.xml=.d)

all: $(xmls)

-include $(deps)

%.xml: %.mml
	$(CARTO) $^ > $@

%.d: %.mml ./util/get_mml_dependencies.py
	./util/get_mml_dependencies.py $< > $@

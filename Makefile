note-path:=$(CURDIR)/notes

build:
	docker build -t u110/jupyter-with-jp-font:latest .

run:
	docker run --rm \
		-p 8888:8888 \
		-v $(note-path):/home/jovyan/work \
		u110/jupyter-with-jp-font

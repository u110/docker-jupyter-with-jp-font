note-path:=$(CURDIR)/notes

build:
	docker build -t u110/jupyter-with-jp-font:latest .

run:
	docker run --rm \
		-p 8888:8888 \
		-v $(note-path):/home/jovyan/work \
		u110/jupyter-with-jp-font

run-without-token:
	docker run --rm \
		-p 8888:8888 \
		-v $(note-path):/home/jovyan/work \
		u110/jupyter-with-jp-font \
			jupyter notebook \
				--ip=0.0.0.0 \
				--no-browser \
				--allow-root \
				--port=8888 \
				--NotebookApp.token=''

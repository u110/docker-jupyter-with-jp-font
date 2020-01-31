.PHONY: build run run-without-token pdf-from-container

container-name:=mynote-container
target-note:=sample_report
note-path:=$(CURDIR)/notes

build:
	docker build -t u110/jupyter-with-jp-font:latest .

run:
	docker run --rm \
		-p 8888:8888 \
		-v $(note-path):/home/jovyan/work \
		--name $(container-name) \
		u110/jupyter-with-jp-font

run-without-token:
	docker run --rm \
		-p 8888:8888 \
		-v $(note-path):/home/jovyan/work \
		--name $(container-name) \
		u110/jupyter-with-jp-font \
			jupyter notebook \
				--ip=0.0.0.0 \
				--no-browser \
				--allow-root \
				--port=8888 \
				--NotebookApp.token=''

pdf-from-container:
	docker exec -it $(container-name) \
		jupyter nbconvert work/$(target-note).ipynb --to pdf --output-dir work/outputs


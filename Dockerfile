FROM jupyter/datascience-notebook

USER root

RUN apt-get update && apt-get install -y vim texlive-lang-japanese texlive-xetex pandoc fontconfig

COPY resources/latex/base.tplx /opt/conda/lib/python3.7/site-packages/nbconvert/templates/latex/base.tplx
COPY resources/latex/texmf.d/jupyter.cnf /etc/texmf/texmf.d/jupyter.cnf
RUN update-texmf

USER jovyan

RUN echo "font.family : IPAexGothic" >> /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/matplotlibrc && \
    rm -r ./.cache

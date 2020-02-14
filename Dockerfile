FROM jupyter/datascience-notebook

USER root

RUN apt-get update \
  && apt-get install -y vim \
                        texlive-lang-japanese \
                        texlive-xetex \
                        pandoc \
                        fontconfig

COPY resources/latex/base.tplx /opt/conda/lib/python3.7/site-packages/nbconvert/templates/latex/base.tplx
COPY resources/latex/texmf.d/jupyter.cnf /etc/texmf/texmf.d/jupyter.cnf
RUN update-texmf

USER jovyan
COPY resources/ipython_kernel_config.py .
RUN ipython profile create
RUN cat ipython_kernel_config.py >> /home/jovyan/.ipython/profile_default/ipython_kernel_config.py

RUN echo "font.family : IPAexGothic" >> /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/matplotlibrc && \
    rm -r ./.cache

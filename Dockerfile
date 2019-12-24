FROM jupyter/datascience-notebook

USER root

RUN apt-get update && apt-get install -y vim texlive-lang-japanese texlive-xetex pandoc fontconfig

USER jovyan

RUN curl -L  "https://ipafont.ipa.go.jp/IPAexfont/ipaexg00401.zip" > font.zip && \
    unzip font.zip && \
    cp ipaexg00401/ipaexg.ttf /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/fonts/ttf/ipaexg.ttf && \
    echo "font.family : IPAexGothic" >>  /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/matplotlibrc && \
    rm -r ./.cache

COPY resources/latex/base.tplx /opt/conda/lib/python3.7/site-packages/nbconvert/templates/latex/base.tplx


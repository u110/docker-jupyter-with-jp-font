FROM jupyter/datascience-notebook

RUN curl -L  "https://ipafont.ipa.go.jp/IPAexfont/ipaexg00401.zip" > font.zip && \
    unzip font.zip && \
    cp ipaexg00401/ipaexg.ttf /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/fonts/ttf/ipaexg.ttf && \
    echo "font.family : IPAexGothic" >>  /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/matplotlibrc && \
    rm -r ./.cache

FROM debian

RUN apt-get update \
  && apt-get install -y curl gcc make sox

RUN cd /usr/src \
  && curl http://www.fftw.org/fftw-3.3.6-pl2.tar.gz | tar -zxf - \
  && cd fftw-3.3.6-pl2 \
  && ./configure \
  && make \
  && make install

RUN cd /usr/src \
  && mkdir rscw \
  && cd rscw \
  && curl http://wwwhome.ewi.utwente.nl/~ptdeboer/ham/rscw/rscw-0.1c.tgz | tar -zxf - \
  && make rscw && mv rscw /usr/bin \
  && make noisycw && mv noisycw /usr/bin

ENTRYPOINT ["/bin/bash"]

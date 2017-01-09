# TabPy-docker

See [https://hub.docker.com/r/emhemh/tabpy/](https://hub.docker.com/r/emhemh/tabpy/)

![](https://github.com/erichannell/TabPy-docker/blob/master/TabPy_gif.gif?raw=true)

To run (on port 9004):
`docker run -ti --rm -p 9004:9004 emhemh/tabpy:latest`

This image will ping Github each time it runs, and if able to will pull down the latest version of [Tableau Python Server](https://github.com/tableau/TabPy) (`TabPy`).

Contains:
- numpy (1.11.2)
- pandas (0.19.1)
- scikit-learn (0.17.1)
- scipy (0.18.1)
- textblob (0.11.1)
- nltk (3.2.1)
- vaderSentiment (0.5)
- geopy (1.11.0)
- requests (2.12.4)
- reverse_geocoder (1.5.1)

=========================================================================

This image was build with `continuumio/miniconda` as the base. Then `TabPy` was cloned (`git clone https://github.com/tableau/TabPy.git`) and installed (`/bin/bash -c "source setup.sh"`). The python libraries were pip installed after running `source activate Tableau-Python-Server`.

I also added a startup script that will always try to pull the latest version of TabPy from Github when the image is run. After that it will automatically start `TabPy` by running `/bin/bash /opt/conda/envs/Tableau-Python-Server/lib/python2.7/site-packages/tabpy_server/startup.sh`
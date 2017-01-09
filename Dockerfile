from continuumio/miniconda:latest

# hack to solve the error with running "source activate"
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# hack to stop the setup script from running the server on install
# cat setup.sh | grep -v 'bash "$STARTUPPATH/startup.sh" $PORT' > install.sh
# basically I just remove the startup line and rename the new file to install.sh

RUN git clone https://github.com/tableau/TabPy.git && \
	cd TabPy && \
	cat setup.sh | grep -v 'bash "$STARTUPPATH/startup.sh" $PORT' > install.sh && \
	/bin/bash -c "source install.sh"

RUN source activate Tableau-Python-Server && \
	pip install --upgrade pip && \
	pip install numpy pandas scikit-learn==0.17.1 scipy textblob nltk vaderSentiment && \
	pip install reverse_geocoder geopy && \
	python -m textblob.download_corpora lite && \
	python -m nltk.downloader vader_lexicon
	
#RUN source activate Tableau-Python-Server && 

#RUN source activate Tableau-Python-Server && \
#	python -m textblob.download_corpora lite && \
#	python -m nltk.downloader vader_lexicon

ADD start.sh /start.sh

ENTRYPOINT bin/bash start.sh
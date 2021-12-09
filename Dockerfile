# Dockerfile for Giant Pumpkin Weight Prediction
# author: Mahsa Sarafrazi, Rowan Sivanandam, Shiva Jena, and Vanessa Yuen
# date: 2021-12-08


# Use rocker/tidyverse as the Base Image
FROM rocker/tidyverse

# Install R
RUN apt-get update
#RUN apt-get install r-base r-base-dev -y

# Install R Packages
#RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('knitr')"

# Install the Anaconda distribution of Python
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy && \
    /opt/conda/bin/conda update -n base -c defaults conda

# Install Python Packages
RUN /opt/conda/bin/conda install -y -c anaconda \
    docopt=0.6.* \
    altair=4.1.* 

# Install pandoc
RUN /opt/conda/bin/conda install -y -c conda-forge pandoc altair_saver

# Put Anaconda Python in PATH
ENV PATH="/opt/conda/bin:${PATH}"

CMD ["/bin/bash"]
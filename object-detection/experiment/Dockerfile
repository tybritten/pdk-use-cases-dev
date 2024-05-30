FROM determinedai/pytorch-ngc:079eb6d

# Install dependencies
RUN pip install torchvision pycocotools sahi torchsummary python_pachyderm

COPY downloader.sh /usr/local/bin/downloader.sh

RUN chmod +x /usr/local/bin/downloader.sh
RUN /usr/local/bin/downloader.sh

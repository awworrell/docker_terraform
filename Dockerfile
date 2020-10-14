FROM amazonlinux:latest


RUN yum install -y unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

#install AWS CLI
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip

#Install Terraform and it's depdencies
RUN curl -O https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip && \
    unzip terraform_0.12.28_linux_amd64.zip -d /usr/bin/ && \
    rm terraform_0.12.28_linux_amd64.zip

#Install Alks and it's dependicies

#Cleanup
RUN yum clean all

#switch to the user and cleanup files it has.
LABEL version=1.0

CMD []
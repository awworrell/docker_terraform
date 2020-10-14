#select the operating system you want to install from
FROM amazonlinux:latest 

#install unzip so that I can unzip zip files then clean up any remaining cache to make the image smaller
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

#include any labels
LABEL version=1.0
#cmd can be empty because I'm not starting any particular commands. If this was a jenkins node for example, start the jenkins node. If it were an application then start the application
#the difference between cmd and entrypoint is that the starting commands can be overridden with cmd.
CMD []
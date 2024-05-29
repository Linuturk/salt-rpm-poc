FROM centos:7

# Install a previous version to setup the conditions to reproduce the issue
RUN curl https://repo.saltproject.io/salt/py3/redhat/7/x86_64/minor/3005.1-1.repo > /etc/yum.repos.d/saltstack.repo
RUN yum update -y
RUN yum list salt-minion --showduplicates
RUN yum install -y salt-minion-3005.1-1.el7

# Attempt to upgrade to the 3006 version
RUN yum clean all
RUN curl https://repo.saltproject.io/salt/py3/redhat/7/x86_64/minor/3006.5.repo > /etc/yum.repos.d/saltstack.repo
RUN yum list salt-minion --showduplicates
RUN yum install -y salt-minion-3006.5-0

CMD [ "/bin/bash" ]
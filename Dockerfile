FROM centos:6.4
MAINTAINER Yuya Yabe <yuyabee@gmail.com>

ADD nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y install nginx

VOLUME ["/nginx-templates", "/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf
ADD index.html /var/www/index.html

EXPOSE 80

CMD ["service", "nginx", "start"]

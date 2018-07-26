FROM openjdk:7
MAINTAINER Andre Pereira andrespp@gmail.com

# Set Environment Variables
ENV BIS_VERSION=5.3 BIS_BUILD=5.3.0.0-213

# Download BI Server
RUN wget --progress=dot:giga \
	https://downloads.sourceforge.net/project/pentaho/Business%20Intelligence%20Server/${BIS_VERSION}/biserver-ce-${BIS_BUILD}.zip \
	&& unzip -q *.zip \
	&& rm -f *.zip \
	&& rm /biserver-ce/promptuser.sh

VOLUME /biserver-ce/tomcat/webapps

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]

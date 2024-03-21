FROM ros:humble as stage1

SHELL ["/bin/bash", "-c"]

# Update to latest version
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Rome"
RUN apt-get update
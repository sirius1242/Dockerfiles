from python:slim-bullseye

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list ; sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list; mkdir /mcdr
RUN apt-get update ; apt-get install -y --no-install-recommends openjdk-17-jre ; rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir mcdreforged parse hjson psutil requests prompt-toolkit -i https://pypi.tuna.tsinghua.edu.cn/simple
ENV PATH=/usr/local/openjdk-17/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WORKDIR "/mcdr"
CMD ["python3", "-m", "mcdreforged"]

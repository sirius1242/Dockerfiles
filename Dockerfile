from python:slim-bullseye

CMD ["bash"]
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list ; sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list
RUN apt-get update ; apt-get install -y --no-install-recommends python3-venv python3-pip openjdk-17-jre ; rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir mcdreforged parse hjson psutil requests prompt-toolkit -i https://pypi.tuna.tsinghua.edu.cn/simple
CMD ["cd /mcdr && python3 -m mcdreforged"]

# https://github.com/Kaggle/docker-python/releases
FROM gcr.io/kaggle-gpu-images/python:v145

# ruff がnotebook上で設定できないのでblackとisortを入れる
RUN python3 -m pip install --upgrade pip \
    &&  pip install --no-cache-dir \
    black isort \ 
    jupyterlab_code_formatter 

RUN pip install --no-cache-dir \
    hydra-core 

EXPOSE 8888
WORKDIR /notebooks

CMD ["/bin/bash", "-c", "jupyter lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True"]

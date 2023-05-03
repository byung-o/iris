FROM nvcr.io/nvidia/pytorch:22.11-py3

#change these for user/group on a server. This should work as default for local system
ARG user_id
ARG group_id
# set your username and group name. Most likely the same but leaving separate in case
ARG user_name
ARG group_name

RUN if [  -z $user_id ];then \
    >&2 echo  "\n****************Warning!!!!*************\n"; \
    >&2 echo "user id seems empty!" ;\
    fi

RUN if [  -z $user_name ];then \
    >&2 echo  "\n****************Warning!!!!*************\n"; \
    >&2 echo "user name seems empty!" ;\
    fi

RUN if [  -z $group_id ];then \
    >&2 echo  "\n****************Warning!!!!*************\n"; \
    >&2 echo "group id seems empty!" ;\
    fi

RUN if [  -z $group_name ];then \
    >&2 echo  "\n****************Warning!!!!*************\n"; \
    >&2 echo "group name seems empty!" ;\
    fi

RUN groupadd --gid ${group_id} ${group_name} && \
    useradd -l -s /bin/bash -d /home/${user_name} -m -u ${user_id} -g ${group_id} ${user_name}

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3.8 python3-pip python3-opencv

COPY --chown=${user_id}:${group_id} . /workspaces
WORKDIR /workspaces

RUN pip install --upgrade pip &&\
    pip install tensorboard &&\
    pip install -e .
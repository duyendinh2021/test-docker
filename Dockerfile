FROM debian

RUN echo "Hello World!"

USER root
#ID user
ARG UID
ENV UID=${UID}
#ID group
ARG GID
ENV GID=${GID}
# tên user
ARG UNAME
ENV UNAME=${UNAME}
# tên group
ARG GNAME
ENV GNAME=${GNAME}

# password user
ARG USER_PASSWORD="dev@dev"

# Đổi mật khẩu tài khoản root
ARG ROOT_PASSWORD="dev@root"
RUN echo "root:${ROOT_PASSWORD}" | chpasswd


# Tạo user và group
RUN groupadd -g ${GID} ${GNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${UNAME} && \
    echo "${UNAME}:${USER_PASSWORD}" | chpasswd && \
    usermod -aG sudo ${UNAME}

# chuyển sang user mới tạo
USER ${UNAME}
# WORKDIR /home/${UNAME}
# # thư mục làm việc
# VOLUME ["/home/${UNAME}/Sources/test-docker/data:/home/${UNAME}/data"]

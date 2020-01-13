FROM node:12

LABEL version="0.0.1"
LABEL repository="https://github.com/heliuphy/hexo-docker-action"
LABEL homepage="https://github.com/heliuphy/hexo-docker-action"
LABEL maintainer="heliuphy <heliuphy@gmail.com>"

LABEL com.github.actions.name="GitHub Action for hexo"
LABEL com.github.actions.description="Wraps the hexo CLI to enable common hexo commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"

RUN apt-get update && \
    apt-get install -y git-core

RUN npm install -g hexo hexo-deployer-ftpsync

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
# base image
FROM pelias/baseimage

# change working dir
ENV WORKDIR /code/pelias/pip-service
WORKDIR ${WORKDIR}

# copy package.json first to prevent npm install being rerun when only code changes
COPY ./package.json ${WORKDIR}
RUN npm install

# copy code from local checkout
ADD . ${WORKDIR}

# run tests
RUN npm test

USER pelias

# start the pip service using the directory the data was downloaded to
CMD ["./bin/start"]

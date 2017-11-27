FROM node:boron

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY install.sh run.sh tmp/secret.json ./

ENV BABAJKA_SECRET="/usr/src/app/secret.json"

# We don't need --only=production option here: devDependencies are required
# in order to build the app
RUN bash install.sh
# A workaround to copy static files. Must be performed with postinstall script.
RUN cd babajka-frontend && bash copy-static.sh && cd ..

EXPOSE 3000
CMD [ "bash", "run.sh" ]

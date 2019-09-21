# `Dockerfile` link

 - `latest` [(docker/aws-cli)](https://github.com/mbtamuli/playground/blob/master/docker/aws-cli/Dockerfile)

# How to use this image
Tools installed are `aws-cli` and `eb-cli`

 - ## Start from scratch
   If you are using the aws-cli for the first time, just run
   `docker run -rm -it --name aws-cli mbtamuli/aws-cli`

   *Autocompletion is enabled.*

   You can copy the '/root/.aws' directory for later use, which contains the config and credentials using,
   `docker cp gloomy_swirles:/root/temp ./`

 - ## Use existing credentials
   If you already have a folder containing config and credentials in this format,

   ```
   config

   [default]
   output = json
   region = us-east-1

   credentials

   [default]
   aws_access_key_id = YOURACCESSKEYIDHERE
   aws_secret_access_key = YOURSECRETACCESSKEYHERE
   ```

   just mount the folder into the container like so,
   `docker run --rm -it --name aws-cli -v $PWD/aws:/root/.aws mbtamuli/aws-cli bash`

   You can also use `zsh`. Oh-My-Zsh is already installed.

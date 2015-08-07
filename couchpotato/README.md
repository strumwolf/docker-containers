Dockerfile for Couch Potato
---------------------------

Dockerfile uses `mount.sh` to mount a remote volume. I have not included the file but you can easily create the file yourself.
Contents of the file should be as follows:
```bash
#! /bin/bash
mount -t cifs //xxx.xxx.xxx.xxx/<shared folder> /tv -o username=<user>,password=<pass>
```

Mount type does not need to be `cifs` but whatever `FS` type you are using.
`-o username=<user>,password=<pass>` only use if needed. If no password don't include `password=<pass>`.
`<user>` and `<pass>` are the user and password needed to log into the system.

Once the mount.sh is created build the docker image:

`docker build -t couchpotato-server --rm=true --no-cache=true .'

After image build run the container with:

`docker run -d --cap-add=SYS_ADMIN --name="couchpotato" -v /path/to/config:/config -v /path/to/downloads:/download -p 5050:5050 couchpotato-server`

`--cap-add=SYS_ADMIN` is required so that the remote volume can be mounted.
You do not need to include the path to where Couch Potato manages the files because we set that when we mount the remote volume.

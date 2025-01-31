# RPi Set up scripts

## Instructions
In Raspberry Pi, create directory `~/aq/setup-scripts` if does not exist

```shell
mkdir -p ~/aq/setup-scripts
```

navigate to the directory
```shell
cd ~/aq/setup-scripts
```

and clone this repository in it
```shell
git clone git@github.com:IdealAQ/aq-rpi-setup-scripts.git .
```

This will pull scripts from this repository to the file

## Scripts

### [set-variables.sh](./set-variables.sh)
Checks if the variables required to set up FRP remote access are set.
If some variables are not set, it prompts their values.

Request the veriable values from the admin if their values are not known.

| variable              | description                      | default | note           |
|-----------------------|----------------------------------|---------|----------------|
| AQ_DEVICE_ID          | Device identifier                |         | must be unique |
| AQ_FRP_SERVER_ADDRESS | FRP server address               |         | kept secret    |
| AQ_FRP_SERVER_PORT    | FRP server port                  | 7000    |                |
| AQ_FRP_DEVICE_PORT    | FRP device port                  |         | usually 60XX   |
| AQ_USER               | User to run FRP service          | aq      |                |
| AQ_GROUP              | Group of user to run FRP service | aq      |                |


> **Note:** to update already set variable, you must manually remove the variable
> by editing ~/.bashrc file, rebooting `sudo reboot` and rerunning the script.

### [frp-setup.sh](./frp-setup.sh)
> **Note:** SSH must be enabled in Raspberry Pi Configuration Interfaces

Downloads, installs and configures frps.service which enables remote access via ssh.
Installation process follows instructions in [fracpete/rpi-remote-access](https://github.com/fracpete/rpi-remote-access) GitHub repository.

Use the following command to execute:
```shell
. ./frp-setup.sh
```
**The dot "." at the beginning of the command is important!!!**
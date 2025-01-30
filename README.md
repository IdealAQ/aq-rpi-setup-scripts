# RPi Set up scripts

## Instructions
In Raspberry Pi, create directory <TODO:> 

```shell
# TODO
```

and clone this repository in it
```shell
git clone git@github.com:IdealAQ/aq-rpi-setup-scripts.git .
```

This will pull scripts in this repository to the file

## Scripts

### set-variables.sh
Checks if the variables required to set up FRP remote access are set.
If some variables are not set, it prompts their values.

| variable              | description        |
|-----------------------|--------------------|
| AQ_DEVICE_ID          | Device identifier  |
| AQ_FRP_SERVER_ADDRESS | FRP server address |
| AQ_FRP_SERVER_PORT    | FRP server port    |
| AQ_FRP_DEVICE_PORT    | FRP device port    |

> to update already set variable, you must manually remove the line with the variable
> by editing ~/.bashrc file and rerunning the script.
# CVAT scripts
cvat-init.sh is used by Terraform during virtual machine provisioning.

add superuser with
```
sudo -u cvatadmin docker compose exec cvat_server python3 manage.py createsuperuser
```
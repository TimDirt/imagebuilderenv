A very rough terraform module for creating RHEL lab environments on libvirt.

Mainly for use creating a lab environment on your local machine, quickly and easily. It's in
a messy state with no doco yet so good luck.


1. Add yourself to the lib virt group
2. download the qcow2 image, put the image in /var/lib/libvirt/images
3. set your private key ssh-keygen
4. Make the network unique if this environment isn't the only one running on this machine.
5. terraform init
6. terraform apply


sudo dnf upgrade
sudo dnf install osbuild-composer composer-cli
sudo systemctl enable --now osbuild-composer.socket
sudo dnf install bash-completion

source /etc/bash_completion.d/composer-cli
sudo systemctl restart osbuild-composer
sudo usermod -a -G weldr student
newgrp weldr

composer-cli blueprints push base-image.toml
composer-cli blueprints list
composer-cli blueprints show BLUEPRINT-NAME
composer-cli compose types
composer-cli blueprints depsolve BLUEPRINT-NAME

composer-cli compose start BLUEPRINT-NAME qcow2
composer-cli compose status
composer-cli compose image 5851d9e9-074a-4cf0-b1c7-afbc2673a838
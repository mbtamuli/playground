# Bootstrapper

Ansible playbook to setup my personal server

## Steps

**Note:** Setup the dependencies using
```bash
cd ../test
# Setup apt-cacher-ng
docker build -t apt-cacher-ng apt-cacher

# Run the image mounting the volume to store the packages
docker run \
    --detach \
    --publish 3142:3142 \
    --name apt-cacher-ng \
    --volume $PWD/apt-cacher-ng-cache:/var/cache/apt-cacher-ng \
    apt-cacher-ng

# Setup the vagrant host
vagrant up
```

```bash
# Create virtual environment
python -m venv ~/workspace/.venv/ansible
# Source virtual environment
source ~/workspace/.venv/ansible/bin/activate
# Install ansible
pip install ansible ansible-lint

# Test connection to remote and local machine
ansible all -m ping -i inventory
# Test connection to just the vagrant machine
ansible all -m ping -i inventory -l local

# Lint playbook
ansible-lint server.yml

# Run the playbook only on the vagrant target
ansible-playbook -i inventory -l local server.yml
```

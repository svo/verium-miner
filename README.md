# Verium Miner

The purpose of this project is to provide mechanisms for developing, testing and deploying Verium miners.

__Donations:__ if you find this project helpful I suggest donating to the creator of [cpuminer-opt](https://github.com/JayDDee/cpuminer-opt) via __BitCoin__ address `12tdvfF7KmAsihBXQXynT6E6th2c2pByTT?label=donations`. Donations to myself also appreciated at __VeriCoin__ address: `VUMA6hSTtrEbUcMLNccaSc2S5uwauUyfdU`.


__NOTES:__ this project uses git submodules so you will want to clone recursively to have all expected behaviours.

```
git clone --recursive git@github.com:svo/verium-miner.git
```

## Setup

Requirements:
- Vagrant (tested with version: 1.9.3)
- VirtualBox (tested with version: 5.1.18 r114002)
- Ansible (tested with version: 2.1.1.0)

Setup environment by using the following: `vagrant up`

## Development

```
vagrant ssh
cd /vagrant
```

## Testing

```
vagrant ssh
cd /vagrant
./pre-commit.sh
```

Jenkins builds on commits and is available at: http://vagrant-verium-miner-ci.local:8080/

## Build EC2 Instance

```
vagrant ssh
aws configure
cd /vagrant/terraform
terraform apply
```

## Provisioning

### Provision Instance

```
vagrant ssh
cd /vagrant
./provision.sh <path-to-private-key> <ip-for-instance>
```

### Provision Instance/s By IP/DNS

Create an `ansible_hosts` file with the IP/DNS for the Virtual Machine/s then:

```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key <path-to-private-key> -u <username> -i ansible_hosts ansible/playbook.yml
```

## Running Miner

```
./cpuminer-opt/cpuminer -a scrypt:1048576 -o stratum+tcp://eu.poolinat0r.com:4443 -u Weblogin.WorkerName -p WorkerPassword
```

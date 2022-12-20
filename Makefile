phony: all download

# TODO: Add a default job, where we can
# substitute the playbook and hosts as variables

download:
	ansible-galaxy install -r requirements.yml --force

haproxy:
	ansible-playbook -i inventories/hosts.yml playbooks/haproxy.yml -K

common: export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
common:
	ansible-playbook -i inventories/hosts.yml playbooks/common.yml  -K

configure-iptables:
	 ansible-playbook -i inventories/hosts.yml playbooks/configure-iptables.yml -K

network:
	 ansible-playbook -i inventories/hosts.yml playbooks/network.yml -K

kubernetes:
	 ansible-playbook -i inventories/hosts.yml playbooks/kubernetes.yml -K


INVENTORY = inventory/hosts.ini
PLAYBOOK = playbooks/site.yml


deploy:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK)

.PHONY: deploy
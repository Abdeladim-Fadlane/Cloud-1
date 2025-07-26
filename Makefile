
INVENTORY = inventory/hosts.ini
PLAYBOOK = playbook.yml


deploy:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK)

.PHONY: deploy
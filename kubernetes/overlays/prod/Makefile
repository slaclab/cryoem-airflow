CNPG_VERSION ?= 1.16
SECRET_PATH=secret/cryoem/cryoem-daq--prod

get-vault-secrets:
	mkdir -p etc/.secrets
	
	# db
	vault kv get --field=root-password -format=json $(SECRET_PATH)/postgres | sed -e 's/\"//g' > etc/.secrets/root-password
	vault kv get --field=primary-username -format=json $(SECRET_PATH)/postgres | sed -e 's/\"//g' > etc/.secrets/primary-username
	vault kv get --field=primary-password -format=json $(SECRET_PATH)/postgres | sed -e 's/\"//g' > etc/.secrets/primary-password
	vault kv get --field=username -format=json $(SECRET_PATH)/postgres | sed -e 's/\"//g' > etc/.secrets/username
	vault kv get --field=password -format=json $(SECRET_PATH)/postgres | sed -e 's/\"//g' > etc/.secrets/password
	# redis
	vault kv get --field=redis-password -format=json $(SECRET_PATH)/redis | sed -e 's/\"//g' > etc/.secrets/redis-password
	# airflow
	vault kv get --field=fernet-key -format=json $(SECRET_PATH)/airflow | sed -e 's/\"//g' > etc/.secrets/fernet-key
	vault kv get --field=secret-key -format=json $(SECRET_PATH)/airflow | sed -e 's/\"//g' > etc/.secrets/secret-key
	vault kv get --field=admin-password -format=json $(SECRET_PATH)/airflow | sed -e 's/\"//g' > etc/.secrets/airflow-admin-password
	# daq-admin
	vault kv get --field=username -format=json $(SECRET_PATH)/daq-admin | sed -e 's/\"//g' > etc/.secrets/daq-admin-username
	vault kv get --field=password -format=json $(SECRET_PATH)/daq-admin | sed -e 's/\"//g' > etc/.secrets/daq-admin-password
	
clean-secrets:
	rm -rf etc/.secrets/

cnpg-operator:
	curl -L https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-$(CNPG_VERSION)/releases/cnpg-$(CNPG_VERSION).0.yaml > cnpg-operator.yaml
	kubectl apply -f cnpg-operator.yaml

apply: 
	kubectl apply -k .

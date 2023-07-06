# Contabo for service and container management

This Repository contains services that were used on development projects. Commonly, Docker is used for addresing service and container management. Files that can be found are config files, docker-compose files, shell scripts and authorization services.

Linux VMI are used for work, as the files indicate:
- Cluster of 3 nodes (dev-main)
- Cluster of 2 nodes (dev-assistant)

Examples and code snippets are free for use. 

# Contents
### DEV CLUSTER ###

In Dev Cluster it is possible to find configuration for various kind of services like:
Traefik, Portainer, Graylog and Fluent plugin, Elastic, MongoDB, Nginx.


- MSS Directory contains NGINX related files like config, Shell script and docker compose. 

- Portainer Directory contains various setup examples and versions of Portainer service.

- azuredevops Cirectory contains setup of GoDaddy Updater for Azure DevOps registry.

- dev Directory contains separate application services that were used as centralised logging. You can find setup for Graylog, MongoDB and ElasticSearch services.

- mssql Directory is a database used for separate application on Server. It contains SQL and YAML files dedicated for their separate purposes.

- registry Directory is used for records related purposes. It contains Authorization passwords and secrets (of course this is removed for security reasons). 

- traefik Directory contains configuration and setup for Traefik load balancer. It is used for trafficking and adjusting other Docker services.


### ASSISTANT CLUSTER ###
Primarly used as an assistant for DEV cluster that is explained above.
It contains folders for Traefik, HELM chart, Portainer and Whoami image.

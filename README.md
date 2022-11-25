# Canasta-DockerSwarm

# Pull down the repo
git clone https://github.com/gitmapd/Canasta-DockerSwarm.git
# If you aren't already in swarm mode, run this:
docker swarm init
# Create an external network for Traefik
docker network create -d overlay --scope swarm traefik-network
# Create an internal network for the wiki
docker network create -d overlay --scope swarm internal
# Start the stack
docker stack deploy -c docker-compose-"service".yml "container_name"

# LetsEncrypt

LetsEncrypt may be used with this stack to request and automatically renew DNS certificates.
If your provider supports _FILE environment variable names these should be used (in combination with Docker secrets) rather than dumping environment variables in your Docker stack file.
The following steps must be followed to enable LetsEncrypt (using the example of my provider, namecheap):


## Identify your LEGO DNS provider


Note the code; and any "Credential" environment variables required to configure this provider; for my example:


code: namecheap

NAMECHEAP_API_KEY_FILE: My Namecheap DNS API Key

NAMECHEAP_API_USER_FILE: My NameCheap username



(If _FILE variables supported) Create Docker secrets for your variables, e.g.:

printf "username" | docker secret create traefik-namecheap-creds-name -
printf "your-api-key" | docker secret create traefik-namecheap-creds-api -

# Canasta-DockerSwarm

# Pull down the repo
git clone [https://github.com/gitmapd/Canasta-DockerSwarm.git]
# If you aren't already in swarm mode, run this:
docker swarm init
# Create an external network for Traefik
docker network create -d overlay --scope swarm traefik-network
# Create an internal network for the wiki
docker network create -d overlay --scope swarm internal

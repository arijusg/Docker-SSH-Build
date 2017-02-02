#Get script's' directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Download Habitus
wget -nc -O ${DIR}/lib/habitus https://github.com/cloud66/habitus/releases/download/v0.4.7/habitus_linux_amd64
sudo chmod +x ${DIR}/lib/habitus

#Get local IP
MYIP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"

#Build
 ${DIR}/lib/habitus --use-tls=false \
--force-rm \
--force-rmi \
--f ${DIR}/build.yml \
--host=unix:///var/run/docker.sock \
--binding=${MYIP} \
--build host=${MYIP}

# Use for debugging
#--no-cleanup 

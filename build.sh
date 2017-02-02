#Download Habitus
wget -nc -O habitus https://github.com/cloud66/habitus/releases/download/v0.4.7/habitus_linux_amd64
sudo chmod +x habitus

#Get local IP
MYIP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"

#Build
 ./habitus --use-tls=false \
--force-rm \
--force-rmi \
--host=unix:///var/run/docker.sock \
--binding=${MYIP} \
--build host=${MYIP}

# Use for debugging
#--no-cleanup 

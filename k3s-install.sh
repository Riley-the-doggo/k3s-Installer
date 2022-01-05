#!/usr/bin/env
echo "K3S Installer"
echo "  1)Install Master"
echo "  2)Install Worker"
echo "  3)Stop k3s"
read n
case $n in
  1) echo "Installing Master..."
echo "To Use k3s Use [kubectl]"
curl -sfl https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s;;
  2) echo "Please Enter your Master Server IP..."
read SERVER
echo "Enter k3s Token (Run [cat /var/lib/rancher/k3s/server/node-token] on your master server to get your Token)"
read TOKEN
echo "Enter Port (Defualt Port Is 6443)"
read PORT
echo "Enter Worker name"
read NAME
curl -sfL https://get.k3s.io | K3S_URL=https://${SERVER}:${PORT} K3S_TOKEN=${TOKEN} K3S_NODE_NAME=${NAME}  sh -;;
3)bash /usr/local/bin/k3s-killall.sh ;;
  *) echo "invalid option";;
esac

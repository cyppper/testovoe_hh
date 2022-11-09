apt -qq update
apt -qq install python3 python3-pip python3-dev -y
export DEBIAN_FRONTEND=noninteractive
pip3 install --upgrade pip
pip3 install -r requirements.txt
mkdir /etc/service/app
mv * /etc/service/app
touch /etc/service/app/run && chmod +x /etc/service/app/run
echo "#!/bin/sh" > /etc/service/app/run
echo "exec gunicorn main:app -b 0.0.0.0:8000" >> /etc/service/app/run
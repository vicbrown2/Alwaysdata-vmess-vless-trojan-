#!/bin/bash

rm -f web config.json
wget -N https://raw.githubusercontent.com/vicbrown2/Alwaysdata-vmess-vless-trojan-/main/web
chmod +x ./web

if [[ -z $id ]]; then
    id="c43a85e7-e4fe-4746-b3af-0b5de841a118"
fi

cat <<EOF > ~/config.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": 8000,
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password": "c43a85e7-e4fe-4746-b3af-0b5de841a118"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

./web -config=config.json

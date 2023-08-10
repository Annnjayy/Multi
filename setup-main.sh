#!/bin/bash
clear
### Color
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'

### System Information   
MYIP=$(wget -qO- ipinfo.io/ip)
REPO="https://ssh-cgp.pages.dev/"
idc="https://gitlab.com/Annnjayy/bahan/-/raw/main/"
start=$(date +%s)
secs_to_human() {
    echo "Installation time : $((${1} / 3600)) hours $(((${1} / 60) % 60)) minute's $((${1} % 60)) seconds"
}
### Status
function print_ok() {
    echo -e "${OK} ${BLUE} $1 ${FONT}"
    sleep 2
}
# funcional
function print_install() {
    clear
	echo -e "${Green} ┌──────────────────────────────────────────┐ ${FONT}"
    echo -e "${YELLOW} # Memasang $1 "
	echo -e "${Green} └──────────────────────────────────────────┘ ${FONT}"
    sleep 2
    clear
}

function print_success() {
    clear
	echo -e "${Green} ┌──────────────────────────────────────────┐ ${FONT}"
    echo -e "${YELLOW} # $1 berhasil dipasang"
	echo -e "${Green} └──────────────────────────────────────────┘ ${FONT}"
    sleep 2
    clear
}

function print_error() {
    echo -e "${ERROR} ${REDBG} $1 ${FONT}"
}

### Cek root
function is_root() {
    if [[ 0 == "$UID" ]]; then
        print_ok "Root user Start installation process"
    else
        print_error "The current user is not the root user, please switch to the root user and run the script again"
    fi

}

### Setup
MakhlukVpn() {
sudo apt install curl -y
sudo apt install wget -y
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$(curl -sS https://raw.githubusercontent.com/Annnjayy/Multi/Auth/name | grep $MYIP | awk '{print $1}')
valid=$(curl -sS https://raw.githubusercontent.com/Annnjayy/Multi/Auth/name | grep $MYIP | awk '{print $4}')
Name=$(curl -sS https://raw.githubusercontent.com/Annnjayy/Multi/Auth/name | grep $MYIP | awk '{print $3}')
Versi=$(curl -sS https://raw.githubusercontent.com/Annnjayy/Multi/Auth/name | grep $MYIP | awk '{print $5}')

    echo "Loading..."
    sleep 2
    if [ $MYIP = $IZIN ]; then
    echo -e "[ ${green}INFO${NC} ] Permission Accepted..."
    else
    echo "                                                              "
        echo -e "$Lyellow                ⚡ PREMIUM SPEED SCRIPT ⚡"$NC
        echo -e "$green┌──────────────────────────────────────────┐ "$NC
        echo -e "$Lyellow                  Autoscript By Makhlukvpn"$NC
        echo -e "$Lyellow                    CONTACT TELEGRAM"$NC
        echo -e "$Lyellow               https://t.me/Makhlukvpn"$NC
        echo -e "$green└──────────────────────────────────────────┘"$NC
        exit 0
    fi
########## SETUP FROM HERE ##########
          # ORIGINAL SCRIPT #
#####################################
    echo "INSTALLING SCRIPT..."

cat >/root/.user.ini <<-END
#!/bin/bash
vps  Author  Exp  Versi IpVps
### $Name $valid $Versi $MYIP

ScriptAutoInstaller By MakhlukVpn
END
####
}

### Change Environment System
function first_setup(){
    timedatectl set-timezone Asia/Jakarta
    wget -O /etc/banner ${REPO}config/banner >/dev/null 2>&1
    chmod +x /etc/banner
    wget -O /etc/ssh/sshd_config ${REPO}config/sshd_config >/dev/null 2>&1
    chmod 644 /etc/ssh/sshd_config
    echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
    echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
    
}

### Update and remove packages
function base_package() {
    sudo apt autoremove git man-db apache2 ufw exim4 firewalld snapd* -y;
    clear
    print_install "Memasang paket yang dibutuhkan"
    sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
    sysctl -w net.ipv6.conf.default.disable_ipv6=1  >/dev/null 2>&1
    sudo apt install software-properties-common -y
    sudo apt install python squid nginx haproxy pwgen openssl netcat bash-completion ntpdate -y
    sudo apt install xz-utils apt-transport-https dnsutils socat chrony -y
    sudo apt install git tar lsof ruby zip unzip p7zip-full python3-pip vnstat libc6  gnupg gnupg2 gnupg1 -y
    sudo apt install iptables iptables-persistent netfilter-persistent -y 
    sudo apt install net-tools bc jq openvpn easy-rsa python3-certbot-nginx p7zip-full tuned fail2ban -y
    sudo apt install libopentracing-c-wrapper0 libopentracing1 linux-tools-common util-linux -y
    apt-get clean all
    sudo apt-get autoremove -y
    apt-get install lolcat -y
    gem install lolcat
    dpkg --configure -a
    apt --fix-broken install
    apt-get install --fix-missing
    print_ok "Berhasil memasang paket yang dibutuhkan"
}

### Buat direktori xray
function dir_xray() {
    echo -e "Membuat direktori xray"
    mkdir -p /etc/{xray,slowdns,websocket,vmess,vless,trojan,shadowsocks}
    mkdir -p /tmp/{menu,core}
    mkdir -p /root/.config/{udp,rclone}
    mkdir -p /var/log/xray/
    mkdir -p /var/www/html/
    touch /var/log/xray/{access.log,error.log}
    chmod +x /var/log/xray
    chmod 777 /var/log/xray/*.log
    touch /root/install.log
    touch /etc/vmess/.vmess.db
    touch /etc/vless/.vless.db
    touch /etc/trojan/.trojan.db
    touch /etc/ssh/.ssh.db
    touch /etc/shadowsocks/.shadowsocks.db
    clear
}

### Tambah domain
function add_domain() {
    echo "`cat /etc/banner`" | lolcat
    echo -e "${red}    ♦️${NC} ${green} CUSTOM SETUP DOMAIN VPS     ${NC}"
    echo -e "${red}┌──────────────────────────────────────────┐\033[0m${NC}"
    echo "1. Gunakan Domain Dari Script"
    echo "2. Gunakan Domain Sendiri"
    echo -e "${red}└──────────────────────────────────────────┘\033[0m${NC}"
    read -rp "Choose Your Domain Installation : " dom 

    if test $dom -eq 1; then
    clear
    curl "${idc}DOMAIN" | bash | tee /root/install.log
    print_success "Domain Script"
    elif test $dom -eq 2; then
    read -rp "Enter Your Domain : " domen 
    echo $domen > /etc/xray/domain
    else 
    echo "Not Found Argument"
    exit 1
    fi
    print_success "Domain Sendiri"
    clear
}

### Pasang SSL
function pasang_ssl() {
    print_install "SSL Certificate"
    domain=$(cat /etc/xray/domain)
    STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
    rm -rf /root/.acme.sh
    mkdir /root/.acme.sh
    systemctl stop $STOPWEBSERVER
    systemctl stop nginx
    sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
    curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
    chmod +x /root/.acme.sh/acme.sh
    /root/.acme.sh/acme.sh --upgrade --auto-upgrade
    /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
    /root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
    ~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
    chmod +x /etc/xray/xray.key
    chmod +x /etc/xray/xray.crt
    print_success "SSL Certificate"
}

### Install Xray
function install_xray(){
    print_install "Websocket"
    wget -O /usr/sbin/drws.py "${REPO}xray/drws.py" >/dev/null 2>&1
    wget -O /usr/sbin/opws.py "${REPO}xray/opws.py" >/dev/null 2>&1
    wget -O /usr/sbin/ovws.py "${REPO}xray/ovws.py" >/dev/null 2>&1
    wget -O /usr/sbin/stws.py "${REPO}xray/stws.py" >/dev/null 2>&1
    wget -O /etc/systemd/system/ws@.service "${REPO}xray/ws@.service" >/dev/null 2>&1 
    # > Set Permission
    chmod +x /usr/sbin/*.py
    chmod 644 /etc/systemd/system/ws@.service
    print_success "Websocket"
    print_install "Xray Core Latest"
    echo tidak ada data apapun >/etc/xray/link
    curl -s ipinfo.io/city >> /etc/xray/city
    curl -s ipinfo.io/org | cut -d " " -f 2-10 >> /etc/xray/isp
    xray_latest="$(curl -s https://api.github.com/repos/dharak36/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
    xraycore_link="https://github.com/dharak36/Xray-core/releases/download/v$xray_latest/xray.linux.64bit"
    curl -sL "$xraycore_link" -o xray
    mv xray /usr/sbin/xray
    chmod +x /usr/sbin/xray
    print_success "Xray Core"
    print_install " Xray Config Terbaru"
    cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/haproxy.pem
    chmod +x /etc/haproxy/haproxy.pem
    wget -O /etc/xray/config.json "${REPO}xray/config.json" >/dev/null 2>&1 
    
    # > IpServer
    curl "${idc}IPSERVER" | bash | tee /root/install.log

    # > Create Service
    rm -rf /etc/systemd/system/xray.service.d
    rm -rf /etc/systemd/system/xray@.service.d
    rm -rf /etc/systemd/system/xray@.service
    wget -O /etc/systemd/system/xray.service "${REPO}xray/xray.service" >/dev/null 2>&1
    wget -O /etc/systemd/system/runX.service "${REPO}xray/runX.service" >/dev/null 2>&1 
    wget -O /etc/systemd/system/iptables.service "${REPO}xray/iptables.service" >/dev/null 2>&1 
    print_success "Xray Config"
}

### Pasang OpenVPN
function install_ovpn(){
    print_install "OpenVPN"
    curl "${idc}OPENVPN" | bash | tee /root/install.log
    wget -O /etc/pam.d/common-password "${REPO}openvpn/common-password" >/dev/null 2>&1
    chmod +x /etc/pam.d/common-password
    print_success "OpenVPN"
}

### Pasang SlowDNS
function install_slowdns(){
    print_install "SlowDNS"
    curl "${idc}NSDOMAIN" | bash | tee /root/install.log
    print_success "SlowDNS"
}

### Pasang Custom
function install_custom() {
    # > BadVPN
    print_install "BadVPN"
    curl "${idc}UDPGW" | bash | tee /root/install.log
    print_success "BadVPN"
    
    # > UdpVpn
    print_install "Udp-Custom"
    curl "${idc}UDP-CUSTOM" | bash | tee /root/install.log
    print_success "Udp-Custom"
 }
### Pasang Rclone
function install_rclone() {
    print_install "Rclone"
    apt install rclone
    curl https://rclone.org/install.sh | bash >/dev/null 2>&1
    wget -O /root/.config/rclone/rclone.conf "$(REPO)bin/rclone.conf" >/dev/null 2>&1
    printf "q\n" | rclone config
    print_success "Rclone"
}

### Ambil Konfig
function download_config(){
    print_install "Tools"
    wget -O /etc/haproxy/haproxy.cfg "${REPO}config/update/haproxy.cfg" >/dev/null 2>&1
    wget -O /etc/nginx/conf.d/drop.conf "${REPO}config/update/drop.conf" >/dev/null 2>&1
    wget -O /etc/nginx/nginx.conf "${REPO}config/nginx.conf" >/dev/null 2>&1
    wget -q -O /etc/squid/squid.conf "${REPO}config/squid.conf" >/dev/null 2>&1
    mkdir -p /var/log/squid/cache/
    chmod 777 /var/log/squid/cache/
    echo "* - nofile 65535" >> /etc/security/limits.conf
    mkdir -p /etc/sysconfig/
    echo "ulimit -n 65535" >> /etc/sysconfig/squid

    # > Add Dropbear
    apt install dropbear -y
    wget -q -O /etc/default/dropbear "${REPO}config/dropbear" >/dev/null 2>&1
    chmod 644 /etc/default/dropbear
    wget -q -O /etc/banner "${REPO}config/banner" >/dev/null 2>&1
    
    # > Add Wondershaper
    sudo apt install wondershaper
    git clone  https://github.com/magnific0/wondershaper.git
    cd wondershaper
    git pull 
    sudo make install
    cd
    rm -rf wondershaper
    echo > /home/limit
    
    # > Add menu, thanks to Bhoikfost Yahya <3
    wget -O /tmp/menu/menu.zip "${idc}hapwspy.zip" >/dev/null 2>&1
    cd /tmp/menu && 7z e -password-out menu.zip >/dev/null 2>&1
    rm menu.zip && chmod +x * && cd
    mv /tmp/menu/* /usr/sbin/
    
    # > Add Web
    wget -O /var/www/html/web.zip "${idc}web.zip" >/dev/null 2>&1
    unzip /var/www/html/web.zip /var/www/html/
    rm /var/www/html/web.zip

    cat >/root/.profile <<EOF
# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi
fi
mesg n || true
menu
EOF
chmod 644 /root/.profile
    ## > clear exp setiap jam
    cat >/etc/cron.d/xp_all <<EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* */1 * * * root /usr/sbin/xp
EOF
    ## > clear log setiap ½jam
    cat >/etc/cron.d/clear_log <<EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/30 * * * * root /usr/sbin/clearlog
EOF   
    ## > reboot setiap jam 12 malam
    cat >/etc/cron.d/daily_reboot <<EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /sbin/reboot
EOF

    echo "*/1 * * * * root echo -n > /var/log/nginx/access.log" >/etc/cron.d/log.nginx
    echo "*/1 * * * * root echo -n > /var/log/xray/access.log" >/etc/cron.d/log.xray
    service cron restart
    cat >/home/daily_reboot <<EOF
5
EOF

    wget -O /etc/systemd/system/rc-local.service "${REPO}xray/rc-local.service" >/dev/null 2>&1 

    echo "/bin/false" >>/etc/shells
    echo "/usr/sbin/nologin" >>/etc/shells
    cat >/etc/rc.local <<EOF
#!/bin/sh -e
# rc.local
# By default this script does nothing.
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
systemctl restart netfilter-persistent
exit 0
EOF
    chmod +x /etc/rc.local
    print_success "Tools"
}

### Tambahan
function tambahan(){

    print_install "SpeedTest"
    wget -O /usr/sbin/speedtest "${REPO}bin/speedtest" >/dev/null 2>&1
    chmod +x /usr/sbin/speedtest
    print_success "SpeedTest"

    # > pasang gotop
    print_install "Gotop"
    gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
    gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
    curl -sL "$gotop_link" -o /tmp/gotop.deb
    dpkg -i /tmp/gotop.deb >/dev/null 2>&1
    print_success "Gotop COre"

    # > Pasang Limit
    curl "${idc}LIMIT" | bash | tee /root/install.log
    print_success "Limit Config"

    # > Pasang BBR Plus
    curl "${idc}BBR" | bash | tee /root/install.log
    print_success "BBR Plus"

    # > Buat swap sebesar 1G
    dd if=/dev/zero of=/swapfile bs=1024 count=1048576
    mkswap /swapfile
    chown root:root /swapfile
    chmod 0600 /swapfile >/dev/null 2>&1
    swapon /swapfile >/dev/null 2>&1
    sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab
    print_success "Swap + 1GB"

    # > Singkronisasi jam
    chronyc sourcestats -v
    chronyc tracking -v

    # > Tuned Device
    tuned-adm profile network-latency
    
print_ok "Selesai pemasangan modul tambahan"
}

function enable_services(){
    print_install "All Service"
    systemctl daemon-reload
    systemctl start netfilter-persistent
    systemctl enable --now nginx
    systemctl enable --now chronyd
    systemctl enable --now xray
    systemctl enable --now runX
    systemctl enable --now rc-local
    systemctl enable --now dropbear
    systemctl enable --now openvpn
    systemctl enable --now cron
    systemctl enable --now haproxy
    systemctl enable --now netfilter-persistent
    systemctl enable --now iptables.service
    systemctl enable --now squid
    systemctl enable --now ws@drws
    systemctl enable --now ws@opws
    systemctl enable --now ws@ovws
    systemctl enable --now ws@stws
    systemctl enable --now client
    systemctl enable --now server
    systemctl enable --now custom
    systemctl enable --now fail2ban  
    cp /lib/systemd/system/haproxy.service /etc/systemd/system/
    cp /lib/systemd/system/nginx.service /etc/systemd/system/
    sleep 1
    systemctl enable --now haproxy.service
    systemctl enable --now nginx.service

    # Ganti Banner
    wget -O /etc/issue.net "${REPO}/issue.net" >/dev/null 2>&1
    print_success "All Service"
}

## finish
function finish(){
TIMES="10"
NAMES=$(curl -sS https://raw.githubusercontent.com/Annnjayy/Multi/Auth/name | grep $MYIP | awk '{print $3}')
EXPSC=$(curl -sS https://raw.githubusercontent.com/Annnjayy/Multi/Auth/name | grep $MYIP | awk '{print $4}')
CHATID="1906388998"
LOCAL_DATE="/usr/bin/"
MYIP=$(wget -qO- ipinfo.io/ip)
ISP=$(wget -qO- ipinfo.io/org)
CITY=$(curl -s ipinfo.io/city)
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
OSL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
KEY="6023255035:AAHADCHIcBc0Xzu-isQggu1x7v9ddSQOqm0"
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
TEXT="
<code>────────────────────</code>
<b>⚠️AUTOSCRIPT PREMIUM⚠️</b>
<code>────────────────────</code>
<code>Owner   : </code><code>$NAMES</code>
<code>Ip vps  : </code><code>$MYIP</code>
<code>Domain  : </code><code>$domain</code>
<code>Date    : </code><code>$TIME</code>
<code>Ram     : </code><code>$RAMMS MB</code>
<code>System  : </code><code>$OSL</code>
<code>Country : </code><code>$CITY</code>
<code>Isp     : </code><code>$ISP</code>
<code>Exp Sc  : </code><code>$EXPSC</code>
<code>────────────────────</code>
<i>Automatic Notification from</i>
<i>@MakhlukVpnTunnel</i>
<code>────────────────────</code>
"
    curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
    mv /etc/openvpn/OvenVPN.zip /var/www/html/
    sed -i "s/xxx/${domain}/g" /var/www/html/index.html
    sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/drop.conf
    sed -i "s/xxxx/${MYIP}/g" /etc/squid/squid.conf
    sed -i "s/xxx/${domain}/g" /etc/squid/squid.conf
    sed -i "s/xxx/${NAMES}/g" /usr/sbin/*.py
    echo ${NAMES} >/root/.config/respond
    mkdir -p /run/xray
    chown www-data.www-data /var/log/xray
    chown www-data.www-data /run/xray

# > pasang bot xolpanel
apt install python3 python3-pip git
wget ${idc}panel.zip >/dev/null 2>&1
unzip panel.zip
mv /root/xolpanel/shell /etc/bot/
chmod 755 /etc/bot/shell/*
rm panel.zip
cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=Simple XolPanel - @XolPanel
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel
Restart=always

[Install]
WantedBy=multi-user.target
END
    
    # > Bersihkan History
    alias bash2="bash --init-file <(echo '. ~/.bashrc; unset HISTFILE')"
    clear
    echo -e "\033[1;93m ┌──────────────────────────────────────────┐\033[0m"
    echo -e "\033[1;93m │            \033[36mPORT SERVICE INFO\033[0m             |\033[0m"
    echo -e "\033[1;93m └──────────────────────────────────────────┘\033[0m"
    echo -e "\033[0;33m┌─────────────────────────────────────────────┐"
    echo -e "\033[0;33m│       >>> Service & Port                    │"
    echo -e "\033[0;33m│   - Open SSH                : 22            │"
    echo -e "\033[0;33m│   - Dropbear                : 109, 143      │"
    echo -e "\033[0;33m│   - Nginx Webserver         : 443, 80, 81   │"
    echo -e "\033[0;33m│   - Haproxy Loadbalancer    : 443, 80       │"
    echo -e "\033[0;33m│   - SSH Udp-Custom          : 54-65535      │"
    echo -e "\033[0;33m│   - SSH Websocket SSL       : 443           │"
    echo -e "\033[0;33m│   - SSH Websocket           : 80, 8880      │"
    echo -e "\033[0;33m│   - OpenVPN SSL             : 443           │"
    echo -e "\033[0;33m│   - OpenVPN Websocket SSL   : 443           │"
    echo -e "\033[0;33m│   - OpenVPN TCP             : 1194          │"
    echo -e "\033[0;33m│   - OpenVPN UDP             : 2200          │"
    echo -e "\033[0;33m│   - DNS Server              : 443, 53,      │"
    echo -e "\033[0;33m│   - DNS Client              : 443, 88       │"
    echo -e "\033[0;33m│   - XRAY DNS (SLOWDNS)      : 443, 53       │"
    echo -e "\033[0;33m│   - XRAY Vmess TLS          : 443           │"
    echo -e "\033[0;33m│   - XRAY Vmess gRPC         : 443           │"
    echo -e "\033[0;33m│   - XRAY Vmess None TLS     : 80            │"
    echo -e "\033[0;33m│   - XRAY Vless TLS          : 443           │"
    echo -e "\033[0;33m│   - XRAY Vless gRPC         : 443           │"
    echo -e "\033[0;33m│   - XRAY Vless None TLS     : 80            │"
    echo -e "\033[0;33m│   - Trojan gRPC             : 443           │"
    echo -e "\033[0;33m│   - Trojan WS               : 443           │"
    echo -e "\033[0;33m│   - Shadowsocks WS          : 443           │"
    echo -e "\033[0;33m│   - BadVPN 1                : 7100          │"
    echo -e "\033[0;33m│   - BadVPN 2                : 7200          │"
    echo -e "\033[0;33m│   - BadVPN 3                : 7300          │"
    echo -e "\033[0;33m│   - Proxy Squid             : 3128          │"
    echo -e "\033[0;33m└─────────────────────────────────────────────┘"
    echo -e "\033[0;33m┌─────────────────────────────────────────────┐"
    echo -e "\033[0;33m│        >>> Contact & Info                   │"
    echo -e "\033[0;33m│   - My Telegram       : t.me/MakhlukVpn     │"
    echo -e "\033[0;33m│   - Dev / Main        : MakhlukVpnTunnel    │"
    echo -e "\033[0;33m└─────────────────────────────────────────────┘"
    echo ""

    secs_to_human "$(($(date +%s) - ${start}))"
    echo ""
    echo ""
    echo -e "         ${YELLOW} Processing Reboot Your Vps${FONT} 5 second .... "
    sleep 5
    rm /root/setup-main >/dev/null 2>&1
    rm /tmp/*.sh >/dev/null 2>&1
    rm /root/*.sh >/dev/null 2>&1
    reboot
}
 #install All
function install_all() {
    dir_xray
    add_domain
    pasang_ssl 
    install_xray
    install_ovpn
    install_slowdns
    install_custom
    install_rclone
    download_config
    enable_services
    tambahan
}
MakhlukVpn
first_setup
base_package
install_all
finish
#rm ~/.bash_history

# Evil-Twin-Attack
为了实现比较真实的攻击，会配置apache的重写规则，当检测到3XX时，会自动重定向到我们的钓鱼界面，配置文件主要是
/etc/apache2/sites-enabled/000-default.conf和.htaccess，路径根据实际情况设置

# 启动方式
./start.sh
sudo dnsmasq -C dnsmasq.conf -d
sudo hostapd hostapdAP.conf
web服务-DHCP&DNS-AP

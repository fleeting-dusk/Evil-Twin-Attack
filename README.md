# Evil-Twin-Attack
为了实现比较真实的攻击，会配置apache的重写规则，当检测到3XX时，会自动重定向到我们的钓鱼界面，配置文件主要是
/etc/apache2/sites-enabled/000-default.conf和.htaccess，路径根据实际情况设置

# 启动方式
sudo airmon-ng check kill,停止可能干扰监控模式的进程。<br>
sudo airmon-ng start wlan0,将 wlan0 切换到监控模式。请注意终端输出，它会告知您新的监控接口名称（例如 wlan0mon）。<br>
sudo airo
./start.sh<br>
sudo dnsmasq -C dnsmasq.conf -d<br>
sudo hostapd hostapdAP.conf<br>
web服务-DHCP&DNS-AP<br>

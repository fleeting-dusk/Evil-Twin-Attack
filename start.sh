#!/bin/bash
# Evil Twin Environment Startup Script
# Author: Gemini

# --- Configuration Variables (Adjust as needed) ---
WLAN_INTERFACE="wlan0"
DNSMASQ_CONF="/path/to/your/dnsmasq.conf"  # <<<<<<< 必填：请修改为您的实际路径！
AP_CONF="hostapdAP.conf"
GATEWAY_IP="192.168.1.1"
NETMASK="255.255.255.0"
# --------------------------------------------------

echo "--- 1. 清理环境和停止冲突服务 ---"
sudo systemctl stop NetworkManager hostapd dnsmasq apache2

echo "--- 2. 设置 ${WLAN_INTERFACE} 静态 IP ---"
sudo ifconfig ${WLAN_INTERFACE} ${GATEWAY_IP} netmask ${NETMASK} up

echo "--- 3. 配置防火墙 (IPtables) 规则 ---"
# 清除旧规则
sudo iptables --flush
sudo iptables --table nat --flush
# 允许 HTTP/80 流量到达本地服务器
sudo iptables -A INPUT -i ${WLAN_INTERFACE} -p tcp --dport 80 -j ACCEPT
# 允许 DNS/53 流量到达本地服务器
sudo iptables -A INPUT -i ${WLAN_INTERFACE} -p udp --dport 53 -j ACCEPT
# 允许 FORWARD 策略
sudo iptables -P FORWARD ACCEPT

echo "--- 4. 启动核心服务 ---"
# 启动 Apache (Web 服务器)
echo "   -> 启动 Apache..."
sudo systemctl start apache2

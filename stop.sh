#!/bin/bash
WLAN_INTERFACE="wlan0"

echo "--- 1. 停止所有 Evil Twin 服务 ---"
# 杀死 dnsmasq 进程
sudo killall dnsmasq 2>/dev/null
# 停止 Apache Web 服务器
sudo systemctl stop apache2
# 启动 hostapd 的终端中请按 Ctrl+C 手动关闭

echo "--- 2. 清理 IPtables 防火墙规则 ---"
sudo iptables --flush
sudo iptables --table nat --flush

echo "--- 3. 恢复网络接口和 NetworkManager ---"
# 清除 wlan0 上的 IP 地址
sudo ip addr flush dev ${WLAN_INTERFACE}
# 启动 NetworkManager 恢复正常上网
sudo systemctl start NetworkManager

echo "--- 关闭完成。系统已恢复正常网络状态。---"

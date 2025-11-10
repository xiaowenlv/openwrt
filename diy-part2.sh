#!/bin/bash
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 1. 修改默认IP地址为 192.168.99.3 (这个方法是标准的，保留)
sed -i 's/192.168.1.1/192.168.99.3/g' package/base-files/files/bin/config_generate

# 2. 清除默认密码 (更安全的方式)
#    查找包含 "root:" 的行，并将后面的密码哈希部分替换为空
sed -i 's/root:[^:]*/root:/' package/base-files/files/etc/shadow

# 3. 更改网络接口配置 (更安全的方式)
#    只修改 device 选项，不破坏文件结构
echo "Modifying network config..."
# 将 LAN 口的 device 修改为 eth1
sed -i "/config interface 'lan'/,/option proto 'static'/{s/option device '[^']*'/option device 'eth1'/}" package/base-files/files/etc/config/network
# 将 WAN 口的 device 修改为 eth0
sed -i "/config interface 'wan'/,/option proto 'dhcp'/{s/option device '[^']*'/option device 'eth0'/}" package/base-files/files/etc/config/network
# 将 WAN6 口的 device 修改为 eth0
sed -i "/config interface 'wan6'/,/option proto 'dhcpv6'/{s/option device '[^']*'/option device 'eth0'/}" package/base-files/files/etc/config/network

echo "LAN IP set to 192.168.99.3, password cleared, eth0(WAN)/eth1(LAN) configured."

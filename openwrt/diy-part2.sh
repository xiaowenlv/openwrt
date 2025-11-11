#!/bin/bash
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# --- 只保留最稳定、最必要的操作 ---

# 1. 修改默认IP地址为 192.168.99.3
sed -i 's/192.168.1.1/192.168.99.3/g' package/base-files/files/bin/config_generate

# 2. 清除默认密码
sed -i 's/root:[^:]*/root:/' package/base-files/files/etc/shadow
echo "Simplified DIY script executed. LAN IP set to 192.168.99.3, password cleared."
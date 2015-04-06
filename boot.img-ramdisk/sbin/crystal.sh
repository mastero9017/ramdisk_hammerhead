#!/system/bin/sh
# sleep 25

sed -i 's/dalvik.vm.image-dex2oat-filter.*/dalvik.vm.image-dex2oat-filter=everything/g' /system/build.prop
sed -i 's/dalvik.vm.dex2oat-filter=.*/dalvik.vm.dex2oat-filter=everything/g' /system/build.prop

# Color Control
#  Red Positive                = /sys/module/dsi_panel/kgamma_rp
echo "0 12 19 30 39 48 56 72 82 104 118 127 119 116 115 106 84 78 66 60 44 35 20" > /sys/module/dsi_panel/kgamma_rp
#  Red Negative                = /sys/module/dsi_panel/kgamma_rn
echo "0 12 19 30 39 48 56 72 82 104 118 131 120 116 114 107 100 78 66 60 44 35 20" > /sys/module/dsi_panel/kgamma_rn
#  Green Positive              = /sys/module/dsi_panel/kgamma_gp
echo "0 12 20 31 40 55 62 76 89 109 123 132 115 113 111 103 78 75 67 58 49 39 21" > /sys/module/dsi_panel/kgamma_gp
#  Green Negative              = /sys/module/dsi_panel/kgamma_gn
echo "0 12 20 31 40 55 62 79 84 109 123 134 116 112 112 104 101 76 67 58 49 39 21" > /sys/module/dsi_panel/kgamma_gn
#  Blue Positive               = /sys/module/dsi_panel/kgamma_bp
echo "0 12 19 30 39 48 56 72 83 105 119 130 119 115 116 106 88 80 71 62 52 42 25" > /sys/module/dsi_panel/kgamma_bp
#  Blue Negative               = /sys/module/dsi_panel/kgamma_bn
echo "0 12 19 30 39 48 56 72 83 105 121 130 118 115 114 108 100 80 66 60 48 38 22" > /sys/module/dsi_panel/kgamma_bn
#  White Point                 = /sys/module/dsi_panel/kgamma_w
echo "32" > /sys/module/dsi_panel/kgamma_w

# FSYNC I/O
echo "N" > /sys/module/sync/parameters/fsync_enabled

# LCD
echo 1 > /sys/module/lm3630_bl/parameters/backlight_dimmer
echo 6 > /sys/module/lm3630_bl/parameters/min_brightness

# Disable Logging
echo 0 > /sys/block/mmcblk0/queue/iostats
echo 0 > /sys/module/logger/parameters/enabled
echo 0 > /sys/kernel/debug/kgsl/kgsl-3d0/log_level_cmd
echo 0 > /sys/kernel/debug/kgsl/kgsl-3d0/log_level_ctxt
echo 0 > /sys/kernel/debug/kgsl/kgsl-3d0/log_level_drv
echo 0 > /sys/kernel/debug/kgsl/kgsl-3d0/log_level_mem
echo 0 > /sys/kernel/debug/kgsl/kgsl-3d0/log_level_pwr

# Multicore battery saving
echo 1 > /sys/devices/system/cpu/sched_mc_power_savings

# Hardware
echo 72 > /sys/module/msm_thermal/parameters/temp_threshold
echo 60 > /sys/class/timed_output/vibrator/amp
echo 0 > /sys/kernel/fast_charge/force_fast_charge
echo lp > /proc/sys/net/ipv4/tcp_congestion_control

# Memory
echo 0 > /proc/sys/vm/swappiness
echo 1 > /proc/sys/vm/laptop_mode
echo 0 > /sys/kernel/mm/ksm/run

# fstrim
fstrim -v /data
fstrim -v /cache
fstrim -v /system


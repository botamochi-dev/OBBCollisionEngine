##team leave
#team leave @e[type=block_display,tag=BDhover]

#Glowing解除
data merge entity @e[type=block_display,tag=BDhover,limit=1] {Glowing:0b,glow_color_override:16777215}

tag @e[type=block_display,tag=BDhover] remove BDhover

#オフハンドのアイテムを戻す
item replace entity @p weapon.offhand from block 1 4 12 container.0


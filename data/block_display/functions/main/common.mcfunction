#10ブロック以内のblock display を発光
#execute as @p at @s as @e[type=minecraft:block_display,distance=..10,tag=!BDmenu,tag=!Rotation_axis] run data merge entity @s {Glowing:true}
#execute as @p at @s as @e[type=minecraft:block_display,distance=10..,tag=!BDmenu,tag=!Rotation_axis] run data merge entity @s {Glowing:false}

#視線先のBlock display に対してfunction実行
#2体選択してしまう場合があるので改善する
execute unless entity @e[type=block_display,tag=BDhover] unless entity @e[type=block_display,tag=BDselect] as @p at @s as @e[type=minecraft:block_display,tag=!Rotation_axis,distance=..10] at @s rotated as @p positioned ^ ^ ^10 facing entity @p eyes positioned ^ ^ ^10 positioned ~ ~ ~ run execute if entity @s[type=minecraft:block_display,distance=..0.4] as @s[type=minecraft:block_display,distance=..0.4] run function block_display:menu/hover

#視線先にBlock displayがいない場合function実行
execute if entity @e[type=block_display,tag=BDhover] unless entity @e[type=block_display,tag=BDselect] as @p at @s as @e[type=minecraft:block_display,tag=BDhover,distance=..10] at @s rotated as @p positioned ^ ^ ^10 facing entity @p eyes positioned ^ ^ ^10 positioned ~ ~ ~ run execute unless entity @s[type=minecraft:block_display,tag=BDhover,distance=..0.4] run function block_display:menu/nothover

#向き保存用ArmorStandをPlayerにTP
execute if entity @e[type=armor_stand,tag=BDmenu_point] at @p run tp @e[type=armor_stand,tag=BDmenu_point] ~ ~ ~

#BDmenuを向き保存用ArmorStandに対して相対TP
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-0.5 ^2 run tp @e[tag=BDmenu_bright] ^1.5 ^1 ^
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-0.5 ^2 run tp @e[tag=BDmenu_angle] ^1.5 ^2 ^
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-0.5 ^2 run tp @e[tag=BDmenu_scale] ^1.5 ^3 ^
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-0.5 ^2 run tp @e[tag=BDmenu_pos] ^ ^3 ^
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-0.5 ^2 run tp @e[tag=BDmenu_delete] ^-1.5 ^3 ^
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-0.5 ^2 run tp @e[tag=BDmenu_copy] ^-1.5 ^2 ^

#視線先のBDmenuに対してfunction実行
execute unless entity @e[tag=BDmenuhover] unless entity @e[type=block_display,tag=BDmenuselect] as @p at @s as @e[tag=!BDmenu_point,tag=!Rotation_axis,tag=!BDselect,tag=BDmenu,distance=..10] at @s rotated as @p positioned ^ ^ ^10 facing entity @p eyes positioned ^ ^ ^10 positioned ~ ~ ~ run execute if entity @s[tag=!BDmenu_point,tag=!Rotation_axis,tag=!BDselect,tag=BDmenu,distance=..0.25] as @s[tag=!BDmenu_point,tag=!Rotation_axis,tag=!BDselect,tag=BDmenu,distance=..0.25] run function block_display:menu/menu_hover
#視線先にBDmenuがいない場合にfunction実行
execute if entity @e[tag=BDmenuhover] unless entity @e[type=block_display,tag=BDmenuselect] as @p at @s as @e[tag=!BDmenu_point,tag=!Rotation_axis,tag=!BDselect,tag=BDmenu,tag=BDmenuhover,distance=..10] at @s rotated as @p positioned ^ ^ ^10 facing entity @p eyes positioned ^ ^ ^10 positioned ~ ~ ~ run execute unless entity @s[tag=!BDmenu_point,tag=!Rotation_axis,tag=!BDselect,tag=BDmenu,tag=BDmenuhover,distance=..0.25] run function block_display:menu/menu_nothover

#BDmenu_scale
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run tp @e[tag=BDmenu_scale_X] ~1.5 ~1.5 ~
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run tp @e[tag=BDmenu_scale_Y] ~ ~3 ~
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run tp @e[tag=BDmenu_scale_Z] ~ ~1.5 ~1.5
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-1 ^2 run tp @e[tag=BDmenu_scale_backup] ^-1.5 ^2.25 ^
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-1 ^2 run tp @e[tag=BDmenu_scale_reset] ^-1.5 ^1.5 ^

#BDmenu_angle
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run tp @e[tag=BDmenu_angle_X] ~1.5 ~1.5 ~
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run tp @e[tag=BDmenu_angle_Y] ~ ~3 ~
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run tp @e[tag=BDmenu_angle_Z] ~ ~1.5 ~1.5
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-1 ^2 run tp @e[tag=BDmenu_angle_backup] ^-1.5 ^2.25 ^
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-1 ^2 run tp @e[tag=BDmenu_angle_reset] ^-1.5 ^1.5 ^

#BDmenu_scale パーティクル表示
#execute if entity @e[tag=BDmenu_scale_X] as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run particle minecraft:dust 0 1 0 1 ~ ~3 ~ 0 0.8 0 0 5
#execute if entity @e[tag=BDmenu_scale_X] as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run particle minecraft:dust 1 0 0 1 ~2 ~1.45 ~ 0.8 0 0 0 5
#execute if entity @e[tag=BDmenu_scale_X] as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run particle minecraft:dust 0 0 1 1 ~ ~1.45 ~2 0 0 0.8 0 5

#Rotation 計算(tagがあるとき常時実行)
execute if entity @p[tag=Rotation_cal] run function block_display:main/rotation



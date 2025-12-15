#回転操作をキャンセルしたときにその時のクォータニオンを保存
execute if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run execute store result storage minecraft:block_display quaternion_tmp[0] float 0.00001 run data get entity @e[tag=BDselect,limit=1] transformation.left_rotation[0] 100000
execute if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run execute store result storage minecraft:block_display quaternion_tmp[1] float 0.00001 run data get entity @e[tag=BDselect,limit=1] transformation.left_rotation[1] 100000
execute if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run execute store result storage minecraft:block_display quaternion_tmp[2] float 0.00001 run data get entity @e[tag=BDselect,limit=1] transformation.left_rotation[2] 100000
execute if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run execute store result storage minecraft:block_display quaternion_tmp[3] float 0.00001 run data get entity @e[tag=BDselect,limit=1] transformation.left_rotation[3] 100000


#Glowing 解除
data merge entity @e[tag=BDmenuselect,limit=1] {Glowing:0b,glow_color_override:16777215}
tag @e[tag=BDmenuselect] remove BDmenuselect


#効果音
execute as @p at @s run playsound minecraft:entity.armor_stand.break master @a ~ ~ ~ 1 2
execute as @p at @s run playsound minecraft:entity.armor_stand.break master @a ~ ~ ~ 1 2
execute as @p at @s run playsound minecraft:entity.armor_stand.break master @a ~ ~ ~ 1 2


#PlayerからRotation_cal 削
tag @p remove Rotation_cal

#リセット
scoreboard players set BD_Rotation_diff number 0

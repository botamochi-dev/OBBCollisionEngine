#効果音
execute as @p at @s run playsound block.note_block.pling master @p ~ ~ ~ 1 2
#tag付与
execute if entity @e[tag=BDmenuhover,tag=X-Axis_Direction] run tag @e[tag=Rotation_axis_x] add BDmenuselect
execute if entity @e[tag=BDmenuhover,tag=Y-Axis_Direction] run tag @e[tag=Rotation_axis_y] add BDmenuselect
execute if entity @e[tag=BDmenuhover,tag=Z-Axis_Direction] run tag @e[tag=Rotation_axis_z] add BDmenuselect
#Glowing
data merge entity @e[tag=BDmenuselect,limit=1] {Glowing:1b,glow_color_override:167759367}
#Bdmenuhoverタグ削除
tag @e[tag=BDmenuhover] remove BDmenuhover

#BDselectのtransformation.left_rotationをstorageに保存
execute if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run execute store result storage minecraft:block_display quaternion_tmp[0] float 0.00001 run data get entity @e[tag=BDselect,limit=1] transformation.left_rotation[0] 100000
execute if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run execute store result storage minecraft:block_display quaternion_tmp[1] float 0.00001 run data get entity @e[tag=BDselect,limit=1] transformation.left_rotation[1] 100000
execute if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run execute store result storage minecraft:block_display quaternion_tmp[2] float 0.00001 run data get entity @e[tag=BDselect,limit=1] transformation.left_rotation[2] 100000
execute if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run execute store result storage minecraft:block_display quaternion_tmp[3] float 0.00001 run data get entity @e[tag=BDselect,limit=1] transformation.left_rotation[3] 100000
#translation保存
data modify storage minecraft:block_display translation_tmp set from entity @e[tag=BDselect,limit=1] transformation.translation
data modify storage minecraft:block_display translation_tmp append value 0.0f
#基準Rotation記録 (10倍)
execute store result score BD_Rotation_base number run data get entity @p Rotation[1] 5
scoreboard players operation BD_Rotation_base_copy number = BD_Rotation_base number

#PlayerにRotation_cal タグを付与
tag @p add Rotation_cal

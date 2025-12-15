#リセット
scoreboard players set @e[tag=BDselect,limit=1] Angle_X 0
scoreboard players set @e[tag=BDselect,limit=1] Angle_Y 0
scoreboard players set @e[tag=BDselect,limit=1] Angle_Z 0
#同期
execute if entity @e[tag=BDmenuselect,tag=Rotation_axis_x] run scoreboard players operation @e[tag=BDselect,limit=1] Angle_X = BD_Rotation_diff number
execute if entity @e[tag=BDmenuselect,tag=Rotation_axis_y] run scoreboard players operation @e[tag=BDselect,limit=1] Angle_Y = BD_Rotation_diff number
execute if entity @e[tag=BDmenuselect,tag=Rotation_axis_z] run scoreboard players operation @e[tag=BDselect,limit=1] Angle_Z = BD_Rotation_diff number

execute store result storage minecraft:block_display XYZ_angle[0] double 1 run scoreboard players get @e[tag=BDselect,limit=1] Angle_X
execute store result storage minecraft:block_display XYZ_angle[1] double 1 run scoreboard players get @e[tag=BDselect,limit=1] Angle_Y
execute store result storage minecraft:block_display XYZ_angle[2] double 1 run scoreboard players get @e[tag=BDselect,limit=1] Angle_Z
#クォータニオン合成
function block_display:angle/angle_to_quaternion

#translation
function block_display:angle/translation_copy2
#座標軸表示
execute as @e[tag=BDselect] at @s run function block_display:main/axis_pos_cal

# 角度計算 (負荷が高いため2回に1回だけ実行)
scoreboard players add #2tick number 1
execute if score #2tick number >= 2 number run data modify storage calc: in set from storage minecraft:block_display axis_quaternion
execute if score #2tick number >= 2 number run function calc:main/quaternion_to_angle
execute if score #2tick number >= 2 number run scoreboard players set #2tick number 0
#タイトル表示
title @a times 0 200 0
title @a title {"text":""}
#title @a subtitle {"score":{"name":"BD_Rotation_diff","objective":"number"}}

#角度表示
title @p actionbar ["X:",{"bold":true,"color":"red","nbt":"Angle[0]","storage":"calc:"},",Y:",{"bold":true,"color":"green","nbt":"Angle[1]","storage":"calc:"},",Z:",{"bold":true,"color":"blue","nbt":"Angle[2]","storage":"calc:"}]

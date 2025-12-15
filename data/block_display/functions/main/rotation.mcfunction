
#Rotation 取得
execute store result score BD_Rotation_now number run data get entity @p Rotation[1] 5
#Rotation 差を計算
scoreboard players operation BD_Rotation_base_copy number = BD_Rotation_base number
scoreboard players operation BD_Rotation_base_copy number -= BD_Rotation_now number
#差を記録して、前回と等しくない場合には音を鳴らす
execute unless score BD_Rotation_diff number = BD_Rotation_base_copy number run execute as @p at @s run playsound block.dispenser.dispense master @p ~ ~ ~ 1 2


#差を記録して、前回と等しくない場合かつ、BDmenuのscaleを開いている状態でかつ、BDmenuselectが存在するときscale_operarion実行
execute unless score BD_Rotation_diff number = BD_Rotation_base_copy number if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_scale_reset] run function block_display:main/scale_operation

#差を記録して、前回と等しくない場合かつ、BDmenuのangleを開いている状態でかつ、BDmenuselectが存在するときangle_operarion実行

execute unless score BD_Rotation_diff number = BD_Rotation_base_copy number if entity @e[tag=BDmenuselect] if entity @e[tag=BDmenu_angle_reset] run function block_display:main/angle_operation


scoreboard players operation BD_Rotation_diff number = BD_Rotation_base_copy number

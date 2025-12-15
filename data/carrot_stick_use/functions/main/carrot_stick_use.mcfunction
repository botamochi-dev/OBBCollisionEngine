#block display 用 視線先にblock displayがいた状態でニンジン棒を右クリックしたときに実行
execute if entity @e[type=block_display,tag=BDhover] run function block_display:menu/select
#BDを選択した状態で空中をクリックしたら解除
execute if score @p carrot_stick_use >= 1 number unless entity @e[tag=BDmenuhover] unless entity @e[tag=BDmenuselect] if entity @e[type=block_display,tag=BDselect] run function block_display:menu/cancel
#回転や座標の操作中に右クリックを押した場合、操作を解除 TODO
execute if score @p carrot_stick_use >= 1 number unless entity @e[tag=BDmenuhover] if entity @e[tag=BDmenuselect] if entity @e[type=block_display,tag=BDselect] run function block_display:menu/operation_cancel
#BDmenu_delete
execute if entity @e[tag=BDmenuhover,tag=BDmenu_delete] run function block_display:menu/delete
#BDmenu_scale
execute if entity @e[tag=BDmenuhover,tag=BDmenu_scale] run function block_display:scale/scale
execute if entity @e[tag=BDmenuhover,tag=BDmenu_scale_X] run function block_display:scale/scale_select_x
execute if entity @e[tag=BDmenuhover,tag=BDmenu_scale_Y] run function block_display:scale/scale_select_y
execute if entity @e[tag=BDmenuhover,tag=BDmenu_scale_Z] run function block_display:scale/scale_select_z
execute if entity @e[tag=BDmenuhover,tag=BDmenu_scale_backup] run function block_display:menu/backup
execute if entity @e[tag=BDmenuhover,tag=BDmenu_scale_reset] run function block_display:menu/reset
#BDmenu_angle
execute if entity @e[tag=BDmenuhover,tag=BDmenu_angle] run function block_display:angle/select
execute if entity @e[tag=BDmenuhover,tag=Axis_Direction] run function block_display:angle/angle_select

# ペイント
execute if entity @p[nbt={SelectedItem:{id:"minecraft:black_dye"}}] run function paint:main/common
execute if entity @p[nbt={SelectedItem:{id:"minecraft:red_dye"}}] run function paint:main/common
execute if entity @p[nbt={SelectedItem:{id:"minecraft:yellow_dye"}}] run function paint:main/common
execute if entity @p[nbt={SelectedItem:{id:"minecraft:blue_dye"}}] run function paint:main/common


#リセット
scoreboard players set @a carrot_stick_use 0

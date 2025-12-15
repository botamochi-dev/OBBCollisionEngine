#scaleの大きさの基準を1とするためBD_Rotation_base_copy　にプラス100
scoreboard players add BD_Rotation_base_copy number 100
#BD_Rotation_base_copy の値をBDselectに代入
execute if entity @e[tag=BDmenuselect,tag=BDmenu_scale_X] as @e[tag=BDselect] at @s store result entity @s transformation.scale[0] float 0.01 run scoreboard players get BD_Rotation_base_copy number
execute if entity @e[tag=BDmenuselect,tag=BDmenu_scale_Y] as @e[tag=BDselect] at @s store result entity @s transformation.scale[1] float 0.01 run scoreboard players get BD_Rotation_base_copy number
execute if entity @e[tag=BDmenuselect,tag=BDmenu_scale_Z] as @e[tag=BDselect] at @s store result entity @s transformation.scale[2] float 0.01 run scoreboard players get BD_Rotation_base_copy number
#scaleに応じてtranslationの値を調整 scale * (-1/2)
execute if entity @e[tag=BDmenuselect,tag=BDmenu_scale_X] as @e[tag=BDselect] at @s store result entity @s transformation.translation[0] float -0.005 run scoreboard players get BD_Rotation_base_copy number
execute if entity @e[tag=BDmenuselect,tag=BDmenu_scale_Y] as @e[tag=BDselect] at @s store result entity @s transformation.translation[1] float -0.005 run scoreboard players get BD_Rotation_base_copy number
execute if entity @e[tag=BDmenuselect,tag=BDmenu_scale_Z] as @e[tag=BDselect] at @s store result entity @s transformation.translation[2] float -0.005 run scoreboard players get BD_Rotation_base_copy number
#scaleの値をstorageに保存(title表示用)
data modify storage block_display scale set from entity @e[tag=BDselect,limit=1] transformation.scale
#タイトル表示
title @a times 0 2 0
title @a title {"text":""}
title @a subtitle [{"text":"X:"},{"nbt":"scale[0]","storage":"block_display"},{"text":"Y:"},{"nbt":"scale[1]","storage":"block_display"},{"text":"Z:"},{"nbt":"scale[2]","storage":"block_display"}]
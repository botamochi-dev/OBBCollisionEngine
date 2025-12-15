#Glowing 解除
data merge entity @e[type=block_display,tag=BDselect,limit=1] {Glowing:0b,glow_color_override:16777215}
kill @e[tag=BDmenu]
team leave @e[tag=BDselect]
tag @e[tag=BDselect] remove BDselect

#オフハンドのアイテムを戻す
item replace entity @p weapon.offhand from block 1 4 12 container.0

#効果音
execute as @p at @s run playsound minecraft:entity.armor_stand.break master @a ~ ~ ~ 1 2
execute as @p at @s run playsound minecraft:entity.armor_stand.break master @a ~ ~ ~ 1 2
execute as @p at @s run playsound minecraft:entity.armor_stand.break master @a ~ ~ ~ 1 2

#PlayerからRotation_cal 削除
tag @p remove Rotation_cal

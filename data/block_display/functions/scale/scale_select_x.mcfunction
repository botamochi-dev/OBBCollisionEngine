#効果音
execute as @p at @s run playsound block.note_block.pling master @p ~ ~ ~ 1 2
#Glowing
data merge entity @e[tag=BDmenuhover,limit=1] {Glowing:1b,glow_color_override:167759367}
#tag付与
tag @e[tag=BDmenuhover] add BDmenuselect
#Bdmenuhoverタグ削除
tag @e[tag=BDmenuhover] remove BDmenuhover
#PLayerにRotation_cal タグを付与
tag @p add Rotation_cal
#基準Rotation記録 (100倍)
execute store result score BD_Rotation_base number run data get entity @p Rotation[1] 10
scoreboard players operation BD_Rotation_base_copy number = BD_Rotation_base number
#効果音
execute as @p at @s run playsound block.note_block.pling master @p ~ ~ ~ 1 2
##チーム加入
#team join block_display_select @e[type=block_display,tag=BDhover]
#Glowing付与
data merge entity @e[type=block_display,tag=BDhover,limit=1] {Glowing:1b,glow_color_override:167759367}
#tag付与
tag @e[type=block_display,tag=BDhover] add BDselect
#Bdhoverタグ削除
tag @e[type=block_display,tag=BDhover] remove BDhover
#向き保存用ArmorStand召喚
execute as @p at @s run summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["BDmenu","BDmenu_point"]}
#playerの向きと同期
execute as @e[type=armor_stand,tag=BDmenu_point] at @s rotated as @p run tp @s ~ ~ ~ ~ ~
#向きの高さを水平にする
execute as @e[type=armor_stand,tag=BDmenu_point] at @s run tp @s ~ ~ ~ ~ 0
#編集画面表示
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-0.5 ^2 run function block_display:menu/summon

#BDselectのPos取得 XYZ軸選択に使用
data modify storage minecraft:block_display Pos set from entity @e[tag=BDselect,limit=1] Pos

#人参棒リセット
scoreboard players set @a carrot_stick_use 0


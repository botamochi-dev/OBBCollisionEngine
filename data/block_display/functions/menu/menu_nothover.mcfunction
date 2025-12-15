#Glowing解除
data merge entity @e[tag=BDmenuhover,limit=1] {Glowing:0b,glow_color_override:16777215}
execute as @e[tag=Rotation_axis] at @s run data merge entity @s {Glowing:0b,glow_color_override:16777215}
##team leave
#team leave @e[tag=BDmenuhover]

tag @e[tag=BDmenuhover] remove BDmenuhover

#テキスト削除
kill @e[type=text_display,tag=BDmenu_text]


#Glowing付与
data merge entity @s[tag=!Axis_Direction] {Glowing:1b,glow_color_override:44799}
execute if entity @s[tag=X-Axis_Direction] run data merge entity @e[tag=Rotation_axis_x,limit=1] {Glowing:1b,glow_color_override:44799}
execute if entity @s[tag=Y-Axis_Direction] run data merge entity @e[tag=Rotation_axis_y,limit=1] {Glowing:1b,glow_color_override:44799}
execute if entity @s[tag=Z-Axis_Direction] run data merge entity @e[tag=Rotation_axis_z,limit=1] {Glowing:1b,glow_color_override:44799}

##視線先のblock displayを青色に発光
#team join block_display_glow @s

#バグか不明だがblock display はteamで指定できないのでtagも
tag @s add BDmenuhover
#効果音
execute unless entity @s[tag=Axis_Direction] run execute as @p at @s run playsound entity.firework_rocket.shoot master @p ~ ~ ~ 1 2

#テキスト表示
#初期画面
execute as @s[tag=BDmenu_bright] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"明るさ"}'}
execute as @s[tag=BDmenu_angle] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"角度"}'}
execute as @s[tag=BDmenu_scale] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"大きさ"}'}
execute as @s[tag=BDmenu_pos] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"座標"}'}
execute as @s[tag=BDmenu_delete] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"閉じる"}'}
execute as @s[tag=BDmenu_copy] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"コピー&ペースト"}'}
#scale
execute as @s[tag=BDmenu_scale_X] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"X軸"}'}
execute as @s[tag=BDmenu_scale_Y] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"Y軸"}'}
execute as @s[tag=BDmenu_scale_Z] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"Z軸"}'}
execute as @s[tag=BDmenu_scale_backup] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"元に戻す"}'}
execute as @s[tag=BDmenu_scale_reset] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"初期化"}'}
#angle
execute as @s[tag=BDmenu_angle_X] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"X軸"}'}
execute as @s[tag=BDmenu_angle_Y] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"Y軸"}'}
execute as @s[tag=BDmenu_angle_Z] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"Z軸"}'}
execute as @s[tag=BDmenu_angle_backup] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"元に戻す"}'}
execute as @s[tag=BDmenu_angle_reset] at @s run summon text_display ~ ~0.4 ~ {Tags:["BDmenu","BDmenu_text"],billboard:"vertical",background:0,text:'{"bold":true,"color":"yellow","text":"初期化"}'}


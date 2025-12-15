#* Block Display のクォータニオンからXYZ座標軸の方向を計算し配置する

#kill
kill @e[tag=Rotation_axis]
kill @e[tag=Axis_Direction]

# 回転軸を表示
execute as @s at @s run summon minecraft:block_display ~ ~ ~ {width:10f,height:10f,Tags:["BDmenu","Rotation_axis","Rotation_axis_x"],block_state:{Name:"minecraft:red_wool"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [0f,0f,0f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [3f, 0.03f, 0.03f]}}
execute as @s at @s run summon minecraft:block_display ~ ~ ~ {width:10f,height:10f,Tags:["BDmenu","Rotation_axis","Rotation_axis_y"],block_state:{Name:"minecraft:lime_wool"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [0f,0f,0f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [0.03f, 3f, 0.03f]}}
execute as @s at @s run summon minecraft:block_display ~ ~ ~ {width:10f,height:10f,Tags:["BDmenu","Rotation_axis","Rotation_axis_z"],block_state:{Name:"minecraft:blue_wool"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [0f,0f,0f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [0.03f, 0.03f, 3f]}}


#座標軸選択のためのEntityをBDselectのXYZ軸に召喚
#X軸
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","X-Axis_Direction","Axis_Direction","X-Axis_Direction_1"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","X-Axis_Direction","Axis_Direction","X-Axis_Direction_2"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","X-Axis_Direction","Axis_Direction","X-Axis_Direction_3"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","X-Axis_Direction","Axis_Direction","X-Axis_Direction_4"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","X-Axis_Direction","Axis_Direction","X-Axis_Direction_5"]}
#Y軸
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Y-Axis_Direction","Axis_Direction","Y-Axis_Direction_1"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Y-Axis_Direction","Axis_Direction","Y-Axis_Direction_2"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Y-Axis_Direction","Axis_Direction","Y-Axis_Direction_3"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Y-Axis_Direction","Axis_Direction","Y-Axis_Direction_4"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Y-Axis_Direction","Axis_Direction","Y-Axis_Direction_5"]}
#Z軸
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Z-Axis_Direction","Axis_Direction","Z-Axis_Direction_1"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Z-Axis_Direction","Axis_Direction","Z-Axis_Direction_2"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Z-Axis_Direction","Axis_Direction","Z-Axis_Direction_3"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Z-Axis_Direction","Axis_Direction","Z-Axis_Direction_4"]}
execute as @s at @s run summon block_display ~ ~ ~ {Tags:["BDmenu","Z-Axis_Direction","Axis_Direction","Z-Axis_Direction_5"]}

#座標軸選択のためのEntityの座標を計算して配置
function block_display:main/axis_pos_cal


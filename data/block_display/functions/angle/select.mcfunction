#削除
kill @e[type=!armor_stand,tag=BDmenu]
#効果音
execute as @p at @s run playsound block.note_block.pling master @p ~ ~ ~ 1 2
#編集画面表示
#execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run summon minecraft:block_display ~1.5 ~1.5 ~ {brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_angle_X"],block_state:{Name:"minecraft:red_wool"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [-0.2f, -0.2f, -0.2f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [0.4f, 0.4f, 0.4f]}}
#execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run summon minecraft:block_display ~ ~3 ~ {brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_angle_Y"],block_state:{Name:"minecraft:lime_wool"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [-0.2f, -0.2f, -0.2f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [0.4f, 0.4f, 0.4f]}}
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-1 ^2 run summon item_display ^-1.5 ^3 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_delete"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:barrier",Count:1b}}
#execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^2 ^-1 ^2 run summon minecraft:block_display ~ ~1.5 ~1.5 {brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_angle_Z"],block_state:{Name:"minecraft:blue_wool"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [-0.2f, -0.2f, -0.2f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [0.4f, 0.4f, 0.4f]}}
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-1 ^2 run summon item_display ^-1.5 ^2.25 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_angle_backup"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:clock",Count:1b}}
execute as @e[type=armor_stand,tag=BDmenu_point] at @s positioned ^ ^-1 ^2 run summon item_display ^-1.5 ^1.5 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_angle_reset"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:tnt",Count:1b}}

#BDselectのtransformationをstorageに保存
data modify storage block_display_copy transformation set from entity @e[tag=BDselect,limit=1] transformation

#座標軸表示
execute as @e[tag=BDselect] at @s run function block_display:main/axis
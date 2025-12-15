##メニュー選択画面表示


#summon minecraft:block_display ~ ~1 ~ {Tags:["test"],block_state:{Name:"minecraft:glowstone"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [-0.2f, -0.2f, -0.2f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [0.4f, 0.4f, 0.01f]}}
#明るさ
summon item_display ^1.5 ^1 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_bright"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:light",Count:1b}}
#角度
summon item_display ^1.5 ^2 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_angle"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:comparator",Count:1b}}
#スケール block display はitem display よりもz軸に+0.2ずらす
summon minecraft:block_display ^1.5 ^3 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_scale"],block_state:{Name:"minecraft:glass"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [-0.2f, -0.2f, -0.2f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [0.4f, 0.4f, 0.01f]}}
#座標
summon minecraft:block_display ^ ^3 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_pos"],block_state:{Name:"minecraft:magenta_glazed_terracotta"},transformation: {left_rotation: {angle:0,axis:[0,0,0]}, translation: [-0.2f, -0.2f, -0.2f], right_rotation: {angle:0,axis:[0,0,0]}, scale: [0.4f, 0.4f, 0.01f]}}
#削除
summon item_display ^-1.5 ^3 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_delete"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:barrier",Count:1b}}
#コピー&貼り付け
summon item_display ^-1.5 ^2 ^ {billboard:"vertical",brightness:{sky:15,block:15},Tags:["BDmenu","BDmenu_copy"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:book",Count:1b}}
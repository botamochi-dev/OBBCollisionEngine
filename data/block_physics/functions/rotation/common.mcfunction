#* ブロックを殴った時にその殴った場所に応じて適切に回転させる
#* tag=slime　付きのEntityを攻撃した時に実行



#*配列初期設定
data modify storage block_physics: rotation_vector set value [0.0f,0.0f,0.0f]
data modify storage block_physics: rotation_quaternion set value [0.0f,0.0f,0.0f,1.0f]
data modify storage block_physics: rotation_quaternion_base set value [0.0f,0.0f,0.0f,1.0f]
data modify storage block_physics: rotation_conj_quaternion set value [0.0f,0.0f,0.0f,1.0f]
data modify storage block_physics: rotation_Pos set value [0.0d,0.0d,0.0d]
data modify storage block_physics: block_quaternion set value [0.0f,0.0f,0.0f,1.0f]
data modify storage block_physics: conj_quaternion set value [0.0f,0.0f,0.0f,1.0f]
data modify storage block_physics: conj_rotation_quaternion set value [0.0f,0.0f,0.0f,1.0f]

#* display設置
execute as @e[tag=test] at @s run function block_physics:rotation/display_set

#* 殴った面の特定
function block_physics:rotation/display_search

#* ブロックを殴ったら回転を実行
execute if entity @e[tag=rotation_display_click] run function block_physics:rotation/main

#* 範囲外の場合
execute unless entity @e[tag=rotation_display_click] run function block_physics:rotation/miss

#* ディスプレイkill
kill @e[tag=rotation_display]

#* advancement解除
advancement revoke @a only block_physics:hurt_block

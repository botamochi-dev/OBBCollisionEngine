# z座標に0を追加する
data modify storage display: local_pos append value 0.0f
#* ディスプレイkill
kill @e[tag=rotation_display]
#* 殴った座標とブロックの表面の法線ベクトルの外積を計算し、回転ベクトルを求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: local_pos
data modify storage calc: in.y set from storage display: vector_zd_reverse
function calc:main/cross_product
data modify storage block_physics: rotation_vector set from storage calc: out
#* 回転ベクトルをクォータニオンに変換
data modify storage calc: in set value {}
data modify storage calc: in set from storage block_physics: rotation_vector
function calc:main/vector_to_quaternion
data modify storage block_physics: rotation_quaternion_base set from storage calc: out

#* 時間経過とともに回転速度が遅くなるようにブロックを回転
data modify storage block_physics: rotation_quaternion set from storage block_physics: rotation_quaternion_base
tag @e[tag=test,limit=1] add physics_rotating

tellraw @p "clicked"

#* advancement解除
advancement revoke @a only block_physics:hurt_block
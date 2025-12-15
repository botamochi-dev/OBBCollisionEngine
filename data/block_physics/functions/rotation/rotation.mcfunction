##* クォータニオンを代入
data modify storage minecraft:block_display quaternion_mul_2 set from entity @s transformation.left_rotation
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: rotation_quaternion
function block_display:angle/quaternion_mul
data modify entity @s transformation.left_rotation set from storage minecraft:block_display quaternion_mul_out
data merge entity @s {start_interpolation:0}



# * translationを修正する
execute store result storage block_physics: rotation_conj_quaternion[0] float -0.0000001 run data get storage minecraft:block_display quaternion_mul_out[0] 10000000
execute store result storage block_physics: rotation_conj_quaternion[1] float -0.0000001 run data get storage minecraft:block_display quaternion_mul_out[1] 10000000
execute store result storage block_physics: rotation_conj_quaternion[2] float -0.0000001 run data get storage minecraft:block_display quaternion_mul_out[2] 10000000
execute store result storage block_physics: rotation_conj_quaternion[3] float 0.0000001 run data get storage minecraft:block_display quaternion_mul_out[3] 10000000

data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set value [-0.5f,-0.5f,-0.5f,0.0f]

function block_display:angle/quaternion_mul

data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: rotation_conj_quaternion
#quaternion合成関数で合成
function block_display:angle/quaternion_mul

#計算結果を適用
data modify entity @s transformation.translation[0] set from storage minecraft:block_display quaternion_mul_out[0]
data modify entity @s transformation.translation[1] set from storage minecraft:block_display quaternion_mul_out[1]
data modify entity @s transformation.translation[2] set from storage minecraft:block_display quaternion_mul_out[2]





#* 回転減衰
#* 回転ベクトルに0.95を乗算して、再度回転ベクトルをクォータニオンに変換
execute store result storage block_physics: rotation_vector[0] float 0.000095 run data get storage block_physics: rotation_vector[0] 10000
execute store result storage block_physics: rotation_vector[1] float 0.000095 run data get storage block_physics: rotation_vector[1] 10000
execute store result storage block_physics: rotation_vector[2] float 0.000095 run data get storage block_physics: rotation_vector[2] 10000
data modify storage calc: in set value {}
data modify storage calc: in set from storage block_physics: rotation_vector
function calc:main/vector_to_quaternion
data modify storage block_physics: rotation_quaternion set from storage calc: out

##* 閾値を下回った場合、回転を停止
data modify storage math: in set from storage block_physics: rotation_vector
function #math:length
execute store result score $physics_rotation_norm number run data get storage math: out 10000
execute if score $physics_rotation_norm number < 100 number run tag @s remove physics_rotating


#* 正規化
data modify storage math: in set from storage block_physics: rotation_quaternion
function #math:length
data modify storage math: in set value {}
data modify storage math: in.x set from storage block_physics: rotation_quaternion[0]
data modify storage math: in.y set from storage math: out
function #math:float
data modify storage block_physics: rotation_quaternion[0] set from storage math: out.div
data modify storage math: in.x set from storage block_physics: rotation_quaternion[1]
function #math:float
data modify storage block_physics: rotation_quaternion[1] set from storage math: out.div
data modify storage math: in.x set from storage block_physics: rotation_quaternion[2]
function #math:float
data modify storage block_physics: rotation_quaternion[2] set from storage math: out.div
data modify storage math: in.x set from storage block_physics: rotation_quaternion[3]
function #math:float
data modify storage block_physics: rotation_quaternion[3] set from storage math: out.div

##* 経過時間を1進める
scoreboard players add $slerp_elapsed_time number 1

##* 補間係数tを求める
data modify storage math: in set value {}
execute store result storage math: in.x float 1 run scoreboard players get $slerp_elapsed_time number
execute store result storage math: in.y float 1 run scoreboard players get $slerp_total_time number
function #math:float
#* tを保存
data modify storage calc: slerp_time set from storage math: out.div
#* 1-tを計算して保存
data modify storage math: in.x set value 1.0f
data modify storage math: in.y set from storage calc: slerp_time
function #math:float
data modify storage calc: slerp_1-time set from storage math: out.sub
#デバッグ用
#tellraw @p [{"bold":true,"nbt":"slerp_time","storage":"calc:"}]

##* (1-t)θ , tθ を計算
#(1-t)θ
execute store result storage math: in.x float 0.001 run data get storage calc: slerp_1-time 1000000
data modify storage math: in.y set from storage calc: slerp_arcCos
function #math:float
execute store result storage calc: slerp_(1-time)*arcCos float 0.0000001 run data get storage math: out.mul 10000
#tθ
execute store result storage math: in.x float 0.001 run data get storage calc: slerp_time 1000000
data modify storage math: in.y set from storage calc: slerp_arcCos
function #math:float
execute store result storage calc: slerp_time*arcCos float 0.0000001 run data get storage math: out.mul 10000
##* 補間を計算
#* sin(1-t)θ
data modify storage calc: in set from storage calc: slerp_(1-time)*arcCos
function calc:main/sin
data modify storage calc: slerp_sin((1-time)*arcCos) set from storage calc: out
#* sin(tθ)
data modify storage calc: in set from storage calc: slerp_time*arcCos
function calc:main/sin
data modify storage calc: slerp_sin(time*arcCos) set from storage calc: out
#* sinθ
data modify storage calc: in set from storage calc: slerp_arcCos
function calc:main/sin
data modify storage calc: slerp_sin(arcCos) set from storage calc: out
#* sin(1-t)θ / sinθ
data modify storage math: in.x set from storage calc: slerp_sin((1-time)*arcCos)
data modify storage math: in.y set from storage calc: slerp_sin(arcCos)
function #math:float
data modify storage calc: slerp_k0 set value [0f,0f,0f,1f]
data modify storage calc: slerp_k0[3] set from storage math: out.div
#* sin(tθ)/sinθ
data modify storage math: in.x set from storage calc: slerp_sin(time*arcCos)
data modify storage math: in.y set from storage calc: slerp_sin(arcCos)
function #math:float
data modify storage calc: slerp_k1 set value [0f,0f,0f,1f]
data modify storage calc: slerp_k1[3] set from storage math: out.div
#* k0 * A
data modify storage minecraft:block_display quaternion_mul_1 set from storage calc: slerp_k0
data modify storage minecraft:block_display quaternion_mul_2 set from storage calc: quaternion_slerp_A
function block_display:angle/quaternion_mul
data modify storage calc: slerp_k0*A set from storage minecraft:block_display quaternion_mul_out
#* k1 * B
data modify storage minecraft:block_display quaternion_mul_1 set from storage calc: slerp_k1
data modify storage minecraft:block_display quaternion_mul_2 set from storage calc: quaternion_slerp_B
function block_display:angle/quaternion_mul
data modify storage calc: slerp_k1*B set from storage minecraft:block_display quaternion_mul_out
#* k0 * A + k1 * B
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: slerp_k0*A
data modify storage calc: in.y set from storage calc: slerp_k1*B
function calc:main/quaternion_add
#* 結果を渡す
data modify entity @e[tag=test,limit=1] transformation.left_rotation set from storage calc: out
#デバッグ用
tellraw @p {"bold":true,"nbt":"out","storage":"calc:"}


##* translationを修正する
data modify storage calc: conj_quaternion set value [0.0f,0.0f,0.0f,1.0f]
execute store result storage calc: conj_quaternion[0] float -0.0000001 run data get storage calc: out[0] 10000000
execute store result storage calc: conj_quaternion[1] float -0.0000001 run data get storage calc: out[1] 10000000
execute store result storage calc: conj_quaternion[2] float -0.0000001 run data get storage calc: out[2] 10000000
execute store result storage calc: conj_quaternion[3] float 0.0000001 run data get storage calc: out[3] 10000000

data modify storage minecraft:block_display quaternion_mul_1 set from storage calc: out
data modify storage minecraft:block_display quaternion_mul_2 set value [-0.5f,-0.5f,-0.5f,0.0f]

function block_display:angle/quaternion_mul

data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage calc: conj_quaternion
#quaternion合成関数で合成
function block_display:angle/quaternion_mul

#execute if entity @e[tag=BDmenuselect,tag=BDmenu_angle_X] run execute store result storage minecraft:block_display quaternion_mul_out[1] float -0.0000001 run data get storage minecraft:block_display quaternion_mul_out[0] 10000000
#execute if entity @e[tag=BDmenuselect,tag=BDmenu_angle_X] run execute store result storage minecraft:block_display quaternion_mul_out[2] float -0.0000001 run data get storage minecraft:block_display quaternion_mul_out[0] 10000000


#計算結果を適用
data modify entity @e[tag=test,limit=1] transformation.translation[0] set from storage minecraft:block_display quaternion_mul_out[0]
data modify entity @e[tag=test,limit=1] transformation.translation[1] set from storage minecraft:block_display quaternion_mul_out[1]
data modify entity @e[tag=test,limit=1] transformation.translation[2] set from storage minecraft:block_display quaternion_mul_out[2]

data merge entity @e[tag=test,limit=1] {start_interpolation:0}





##* 時間に達したら常時実行をオフ
execute if score $slerp_elapsed_time number >= $slerp_total_time number run scoreboard players set $quaternion_slerp_tick number 0
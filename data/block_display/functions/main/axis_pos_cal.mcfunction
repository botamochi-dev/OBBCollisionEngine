###* 座標軸と選択Entityのクォータニオン、座標を計算

## *座標軸をブロックディスプレイと同期
data modify storage minecraft:block_display axis_quaternion set from entity @s transformation.left_rotation
data modify entity @e[tag=Rotation_axis_x,limit=1] transformation.left_rotation set from storage minecraft:block_display axis_quaternion
data modify entity @e[tag=Rotation_axis_y,limit=1] transformation.left_rotation set from storage minecraft:block_display axis_quaternion
data modify entity @e[tag=Rotation_axis_z,limit=1] transformation.left_rotation set from storage minecraft:block_display axis_quaternion

##* 座標軸選択のためのEntityを移動
#! BDselectのPosはブロックディスプレイ選択時に取得済み
#* クォータニオン取得
data modify storage minecraft:block_display quaternion_now set from entity @e[tag=BDselect,limit=1] transformation.left_rotation
#* 共役クォータニオン計算
execute store result storage minecraft:block_display conj_quaternion[0] float -0.0000001 run data get storage minecraft:block_display quaternion_now[0] 10000000
execute store result storage minecraft:block_display conj_quaternion[1] float -0.0000001 run data get storage minecraft:block_display quaternion_now[1] 10000000
execute store result storage minecraft:block_display conj_quaternion[2] float -0.0000001 run data get storage minecraft:block_display quaternion_now[2] 10000000
execute store result storage minecraft:block_display conj_quaternion[3] float 0.0000001 run data get storage minecraft:block_display quaternion_now[3] 10000000

#* X軸
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0.5f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=X-Axis_Direction_1,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=X-Axis_Direction_1,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=X-Axis_Direction_1,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [1f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=X-Axis_Direction_2,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=X-Axis_Direction_2,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=X-Axis_Direction_2,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 3
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [1.5f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=X-Axis_Direction_3,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=X-Axis_Direction_3,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=X-Axis_Direction_3,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 4
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [2f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=X-Axis_Direction_4,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=X-Axis_Direction_4,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=X-Axis_Direction_4,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 5
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [2.5f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=X-Axis_Direction_5,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=X-Axis_Direction_5,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=X-Axis_Direction_5,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* Y軸
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0.5f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Y-Axis_Direction_1,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Y-Axis_Direction_1,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Y-Axis_Direction_1,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,1f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Y-Axis_Direction_2,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Y-Axis_Direction_2,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Y-Axis_Direction_2,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 3
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,1.5f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Y-Axis_Direction_3,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Y-Axis_Direction_3,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Y-Axis_Direction_3,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 4
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,2f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Y-Axis_Direction_4,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Y-Axis_Direction_4,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Y-Axis_Direction_4,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 5
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,2.5f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Y-Axis_Direction_5,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Y-Axis_Direction_5,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Y-Axis_Direction_5,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* Z軸方向保存用Entityの座標計算
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,0.5f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Z-Axis_Direction_1,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Z-Axis_Direction_1,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Z-Axis_Direction_1,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,1f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Z-Axis_Direction_2,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Z-Axis_Direction_2,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Z-Axis_Direction_2,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 3
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,1.5f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Z-Axis_Direction_3,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Z-Axis_Direction_3,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Z-Axis_Direction_3,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 4
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,2f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Z-Axis_Direction_4,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Z-Axis_Direction_4,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Z-Axis_Direction_4,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 5
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_now
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,2.5f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage minecraft:block_display Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage minecraft:block_display Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage minecraft:block_display Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
execute store result entity @e[tag=Z-Axis_Direction_5,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=Z-Axis_Direction_5,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=Z-Axis_Direction_5,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
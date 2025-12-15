##* ブロックのクォータニオンに応じてディスプレイを設置

#* ブロックのPos取得
data modify storage block_physics: rotation_Pos set from entity @s Pos
#* クォータニオン取得
data modify storage block_physics: block_quaternion set from entity @s transformation.left_rotation
#* 共役クォータニオン計算
execute store result storage block_physics: conj_quaternion[0] float -0.0000001 run data get storage block_physics: block_quaternion[0] 10000000
execute store result storage block_physics: conj_quaternion[1] float -0.0000001 run data get storage block_physics: block_quaternion[1] 10000000
execute store result storage block_physics: conj_quaternion[2] float -0.0000001 run data get storage block_physics: block_quaternion[2] 10000000
execute store result storage block_physics: conj_quaternion[3] float 0.0000001 run data get storage block_physics: block_quaternion[3] 10000000

#* +X軸
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0.5f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_+x","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_+x,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_+x,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_+x,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [1f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_+x_sub","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_+x_sub,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_+x_sub,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_+x_sub,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* rotation_+x をx軸方向に向かせる
execute as @e[tag=rotation_+x] at @s facing entity @e[tag=rotation_+x_sub,limit=1] feet run tp ~ ~ ~ 

#* -X軸
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [-0.5f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_-x","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_-x,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_-x,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_-x,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [-1f,0f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_-x_sub","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_-x_sub,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_-x_sub,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_-x_sub,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* rotation_+x をx軸方向に向かせる
execute as @e[tag=rotation_-x] at @s facing entity @e[tag=rotation_-x_sub,limit=1] feet run tp ~ ~ ~ 
#* +Y軸
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0.5f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_+y","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_+y,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_+y,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_+y,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,1f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_+y_sub","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_+y_sub,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_+y_sub,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_+y_sub,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* rotation_+x をx軸方向に向かせる
execute as @e[tag=rotation_+y] at @s facing entity @e[tag=rotation_+y_sub,limit=1] feet run tp ~ ~ ~ 

#* -Y軸
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,-0.5f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_-y","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_-y,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_-y,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_-y,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,-1f,0f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_-y_sub","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_-y_sub,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_-y_sub,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_-y_sub,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* rotation_+x をx軸方向に向かせる
execute as @e[tag=rotation_-y] at @s facing entity @e[tag=rotation_-y_sub,limit=1] feet run tp ~ ~ ~ 

#* +Z軸
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,0.5f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_+z","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_+z,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_+z,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_+z,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,1f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_+z_sub","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_+z_sub,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_+z_sub,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_+z_sub,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* rotation_+x をx軸方向に向かせる
execute as @e[tag=rotation_+z] at @s facing entity @e[tag=rotation_+z_sub,limit=1] feet run tp ~ ~ ~ 

#* -Z軸
#* 1
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,-0.5f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_-z","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_-z,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_-z,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_-z,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* 2
#translation計算
data modify storage minecraft:block_display quaternion_mul_1 set from storage block_physics: block_quaternion
data modify storage minecraft:block_display quaternion_mul_2 set value [0f,0f,-1f,0.0f]
function block_display:angle/quaternion_mul
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage block_physics: conj_quaternion
function block_display:angle/quaternion_mul
#Pos + quaternion_mul_out
execute store result score $x1 number run data get storage block_physics: rotation_Pos[0] 10000
execute store result score $x2 number run data get storage minecraft:block_display quaternion_mul_out[0] 10000
scoreboard players operation $x1 number += $x2 number
execute store result score $y1 number run data get storage block_physics: rotation_Pos[1] 10000
execute store result score $y2 number run data get storage minecraft:block_display quaternion_mul_out[1] 10000
scoreboard players operation $y1 number += $y2 number
execute store result score $z1 number run data get storage block_physics: rotation_Pos[2] 10000
execute store result score $z2 number run data get storage minecraft:block_display quaternion_mul_out[2] 10000
scoreboard players operation $z1 number += $z2 number
#計算結果を適用
summon armor_stand ~ ~ ~ {Tags:["rotation_-z_sub","rotation_display"],NoGravity:1b,Silent:1b,Marker:1b,Invisible:1b}
execute store result entity @e[tag=rotation_-z_sub,limit=1] Pos[0] double 0.0001 run scoreboard players get $x1 number
execute store result entity @e[tag=rotation_-z_sub,limit=1] Pos[1] double 0.0001 run scoreboard players get $y1 number
execute store result entity @e[tag=rotation_-z_sub,limit=1] Pos[2] double 0.0001 run scoreboard players get $z1 number
#* rotation_+x をx軸方向に向かせる
execute as @e[tag=rotation_-z] at @s facing entity @e[tag=rotation_-z_sub,limit=1] feet run tp ~ ~ ~ 

#* サブEntityをkill
kill @e[tag=rotation_+x_sub]
kill @e[tag=rotation_-x_sub]
kill @e[tag=rotation_+y_sub]
kill @e[tag=rotation_-y_sub]
kill @e[tag=rotation_+z_sub]
kill @e[tag=rotation_-z_sub]
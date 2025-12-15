###* ディスプレイ面上のプレイヤーの視線の位置を計算

##* 必要な情報を取得
# ディスプレイの座標を取得
data modify storage display: rd set from entity @s Pos
# プレイヤーの目の座標を取得
execute as @p at @s anchored eyes run summon minecraft:area_effect_cloud ^ ^ ^ {Tags:["rp"]}
data modify storage display: rp set from entity @e[tag=rp,limit=1] Pos
# プレイヤーの視線ベクトル(単位ベクトル)を取得
execute as @p at @s anchored eyes positioned ^ ^ ^1 run summon minecraft:area_effect_cloud ^ ^ ^ {Tags:["vector_p"]}
data modify storage display: vector_p set from entity @e[tag=vector_p,limit=1] Pos
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_p
data modify storage calc: in.y set from storage display: rp
function calc:main/vector_sub
data modify storage display: vector_p set value {}
data modify storage display: vector_p set from storage calc: out
# ディスプレイ面上の座標系におけるx軸方向の単位ベクトル 
execute as @s at @s positioned ^1 ^ ^ run summon minecraft:area_effect_cloud ^ ^ ^ {Tags:["vector_xd"]}
data modify storage display: vector_xd set from entity @e[tag=vector_xd,limit=1] Pos
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_xd
data modify storage calc: in.y set from storage display: rd
function calc:main/vector_sub
data modify storage display: vector_xd set value {}
data modify storage display: vector_xd set from storage calc: out
tellraw @p ["xd",{"nbt":"vector_xd","storage":"display:"}]
# ディスプレイ面上の座標系におけるy軸方向の単位ベクトル 
execute as @s at @s positioned ^ ^1 ^ run summon minecraft:area_effect_cloud ^ ^ ^ {Tags:["vector_yd"]}
data modify storage display: vector_yd set from entity @e[tag=vector_yd,limit=1] Pos
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_yd
data modify storage calc: in.y set from storage display: rd
function calc:main/vector_sub
data modify storage display: vector_yd set value {}
data modify storage display: vector_yd set from storage calc: out
tellraw @p ["yd",{"nbt":"vector_yd","storage":"display:"}]
# ディスプレイ面上の座標系におけるz軸方向の単位ベクトル 
execute as @s at @s positioned ^ ^ ^1 run summon minecraft:area_effect_cloud ^ ^ ^ {Tags:["vector_zd"]}
data modify storage display: vector_zd set from entity @e[tag=vector_zd,limit=1] Pos
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_zd
data modify storage calc: in.y set from storage display: rd
function calc:main/vector_sub
data modify storage display: vector_zd set value {}
data modify storage display: vector_zd set from storage calc: out
tellraw @p ["zd",{"nbt":"vector_zd","storage":"display:"}]
# ディスプレイ面上の座標系におけるz軸方向の単位ベクトルを反転させる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_zd
data modify storage calc: in.y set value -1.0f
function calc:main/vector_mul
data modify storage display: vector_zd_reverse set value [0.0f,0.0f,0.0f,0.0f]
data modify storage display: vector_zd_reverse set from storage calc: out
#* ディスプレイからプレイヤーの目までのベクトル a を計算する
# a = rp - rd
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: rp
data modify storage calc: in.y set from storage display: rd
function calc:main/vector_sub
data modify storage display: vector_a set from storage calc: out
##* プレイヤーの目からディスプレイ面上の視点までの距離 k を求める
#*  ディスプレイ法線ベクトル zd とベクトル a の内積を計算
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_zd
data modify storage calc: in.y set from storage display: vector_a
function calc:main/dot_product
data modify storage display: dot_a_zd set from storage calc: out
#* ディスプレイ法線ベクトル zd とプレイヤーの視線ベクトル vector_p の内積を計算
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_zd
data modify storage calc: in.y set from storage display: vector_p
function calc:main/dot_product
data modify storage display: dot_p_zd set from storage calc: out
#* 距離 k を計算
data modify storage math: in set value {}
execute store result storage math: in.x float 1 run data get storage display: dot_a_zd 10000
execute store result storage math: in.y float 1 run data get storage display: dot_p_zd 10000
function #math:float
data modify storage display: k set from storage math: out.div
##* プレイヤーの目からディスプレイ面上の視点までのベクトル kp を計算
data modify storage display: vector_kp set value [0.0f,0.0f,0.0f]
execute store result score $k number run data get storage display: k -10000
execute store result score $x1 number run data get storage display: vector_p[0] 10000
scoreboard players operation $x1 number *= $k number
execute store result score $y1 number run data get storage display: vector_p[1] 10000
scoreboard players operation $y1 number *= $k number
execute store result score $z1 number run data get storage display: vector_p[2] 10000
scoreboard players operation $z1 number *= $k number
execute store result storage display: vector_kp[0] float 0.00000001 run scoreboard players get $x1 number
execute store result storage display: vector_kp[1] float 0.00000001 run scoreboard players get $y1 number
execute store result storage display: vector_kp[2] float 0.00000001 run scoreboard players get $z1 number
##* kp + a でディスプレイの原点から視点までのベクトル b を計算
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_kp
data modify storage calc: in.y set from storage display: vector_a
function calc:main/vector_add
data modify storage display: vector_b set from storage calc: out
##* b をディスプレイ面上の座標系に投影してローカル座標x' , y' を求める
data modify storage display: local_pos set value [0.0f,0.0f]
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_xd
data modify storage calc: in.y set from storage display: vector_b
function calc:main/dot_product
data modify storage display: local_pos[0] set from storage calc: out
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_yd
data modify storage calc: in.y set from storage display: vector_b
function calc:main/dot_product
data modify storage display: local_pos[1] set from storage calc: out
##* ワールド座標に変換
#* x'・xd
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_xd
data modify storage calc: in.y set from storage display: local_pos[0]
function calc:main/vector_mul
data modify storage display: x'_xd set from storage calc: out
#* y'・yd
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: vector_yd
data modify storage calc: in.y set from storage display: local_pos[1]
function calc:main/vector_mul
data modify storage display: y'_yd set from storage calc: out
#* x'・xd + y'・yd
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: x'_xd
data modify storage calc: in.y set from storage display: y'_yd
function calc:main/vector_add
data modify storage display: world_vector set from storage calc: out
#* rd + (x'・xd + y'・yd)
data modify storage display: world_pos set value [0.0f,0.0f,0.0f]
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: rd
data modify storage calc: in.y set from storage display: world_vector
function calc:main/vector_add
data modify storage display: world_pos set from storage calc: out
#* ワールド座標をdouble型に変換

#* particle
kill @e[tag=display_particle]
execute as @s at @s run summon area_effect_cloud ^ ^ ^ {Tags:[display_particle],NoGravity:1b}
execute store result entity @e[tag=display_particle,limit=1] Pos[0] double 0.0001 run data get storage display: world_pos[0] 10000
execute store result entity @e[tag=display_particle,limit=1] Pos[1] double 0.0001 run data get storage display: world_pos[1] 10000
execute store result entity @e[tag=display_particle,limit=1] Pos[2] double 0.0001 run data get storage display: world_pos[2] 10000
execute as @e[tag=display_particle] at @s run particle dust 1 0.973 0.565 0.1 ^ ^ ^ 0 0 0 0 1
execute as @e[tag=display_particle] at @s run particle heart ^ ^ ^ 0 0 0 0 1

#*kill 
kill @e[tag=rp]
kill @e[tag=vector_p]
kill @e[tag=vector_xd]
kill @e[tag=vector_yd]
kill @e[tag=vector_zd]

#*デバッグ用
tellraw @p ["local_pos",{"nbt":"local_pos","storage":"display:"}]
tellraw @p "local_pos取得!"

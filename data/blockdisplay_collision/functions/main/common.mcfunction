###* ブロックディスプレイとブロックの衝突判定

##* ブロックディスプレイ
#* storage呼び出し
function #oh_my_dat:please

##* リセット処理
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].display2block_vector

#* 情報取得
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Pos set from entity @s Pos
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Quaternion set from entity @s transformation.left_rotation
#data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Size set value [0.5f,0.5f,0.5f]

#* 法線軸を求める
# X軸
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Quaternion
data modify storage calc: in.y set value [0.5f,0f,0f,0f]
function calc:main/quaternion_rotation
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x set from storage calc: out
# Y軸
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Quaternion
data modify storage calc: in.y set value [0f,0.5f,0f,0f]
function calc:main/quaternion_rotation
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y set from storage calc: out
# Z軸
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Quaternion
data modify storage calc: in.y set value [0f,0f,0.5f,0f]
function calc:main/quaternion_rotation
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z set from storage calc: out

#* 外積軸を求める
#Ax_Bx
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set value [0.5f,0f,0f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bx set from storage calc: out
#Ax_By
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set value [0f,0.5f,0f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_By set from storage calc: out
#Ax_Bz
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set value [0f,0f,0.5f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bz set from storage calc: out
#Ay_Bx
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set value [0.5f,0f,0f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bx set from storage calc: out
#Ay_By
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set value [0f,0.5f,0f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_By set from storage calc: out
#Ay_Bz
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set value [0f,0f,0.5f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bz set from storage calc: out
#Az_Bx
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set value [0.5f,0f,0f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bx set from storage calc: out
#Az_By
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set value [0f,0.5f,0f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_By set from storage calc: out
#Az_Bz
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set value [0f,0f,0.5f]
function calc:main/cross_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bz set from storage calc: out

#* 投影中心と半径を求める
#投影中心 → ブロックディスプレイの座標を0,0,0とするので常に0
#
#投影半径 ( r = 0.5|Ax・L| + 0.5|Ay・L| + 0.5|Az・L| )
##* 周囲のブロック
#空気以外のブロックが存在していたらその座標をstorageに保存
execute unless block ~-1 ~-1 ~-1 air positioned ~-1 ~-1 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~-1 ~-1 ~0 air positioned ~-1 ~-1 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~-1 ~-1 ~1 air positioned ~-1 ~-1 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~-1 ~-0 ~-1 air positioned ~-1 ~0 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~-1 ~-0 ~0 air positioned ~-1 ~0 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~-1 ~-0 ~1 air positioned ~-1 ~0 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~-1 ~1 ~-1 air positioned ~-1 ~1 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~-1 ~1 ~0 air positioned ~-1 ~1 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~-1 ~1 ~1 air positioned ~-1 ~1 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}

execute unless block ~0 ~-1 ~-1 air positioned ~0 ~-1 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~0 ~-1 ~0 air positioned ~0 ~-1 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~0 ~-1 ~1 air positioned ~0 ~-1 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~0 ~-0 ~-1 air positioned ~0 ~0 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~0 ~-0 ~0 air positioned ~0 ~0 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~0 ~-0 ~1 air positioned ~0 ~0 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~0 ~1 ~-1 air positioned ~0 ~1 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~0 ~1 ~0 air positioned ~0 ~1 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~0 ~1 ~1 air positioned ~0 ~1 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}

execute unless block ~1 ~-1 ~-1 air positioned ~1 ~-1 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~1 ~-1 ~0 air positioned ~1 ~-1 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~1 ~-1 ~1 air positioned ~1 ~-1 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~1 ~-0 ~-1 air positioned ~1 ~0 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~1 ~-0 ~0 air positioned ~1 ~0 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~1 ~-0 ~1 air positioned ~1 ~0 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~1 ~1 ~-1 air positioned ~1 ~1 ~-1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~1 ~1 ~0 air positioned ~1 ~1 ~0 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}
execute unless block ~1 ~1 ~1 air positioned ~1 ~1 ~1 align xyz run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Tags:["blockdisplay_collision_marker"]}

execute as @e[tag=blockdisplay_collision_marker] at @s run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks append from entity @s Pos


#* ディスプレイからブロックへのベクトルを計算
function blockdisplay_collision:main/display2block_vector

##* 投影


#周囲にブロックがある場合にのみ判定を行う

function blockdisplay_collision:main/new_radius_a

function blockdisplay_collision:main/new_radius_b
#* Length
# display2block_vector を temp にコピー
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].display2block_vector
# display2block_vector に要素がある場合にのみLengthを計算
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].display2block_vector[0] run function blockdisplay_collision:main/length
#リセット
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp

#* 判定
function blockdisplay_collision:main/judge

#execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks run function blockdisplay_collision:main/testing

# マーカー用Entity削除
kill @e[tag=blockdisplay_collision_marker]
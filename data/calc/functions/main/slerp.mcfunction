##* 球面線形補間 (SLERP, Spherical Linear Interpolation)
#* クォータニオンAとBの内積を計算
#* 内積が負の場合には、Bを符号反転した上でもう一度内積を計算
#* 内積のarcCosを計算
#* 補間を計算 
#* Q(t) = ( sin(1-t)θ / sinθ ) * A + ( sin(tθ)/sinθ ) * B

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z,w]
#* /data modify storage calc: in.y set value [x,y,z,w] で二つのクォータニオンを入力
#* /data modify storage calc: in.z set value z で時間を設定
#* /function calc:main/slerp を実行して計算
#* /data get storage calc: out を実行して結果を取得

##* 入力した値をストレージに保存
data modify storage calc: quaternion_slerp_A set from storage calc: in.x
data modify storage calc: quaternion_slerp_B set from storage calc: in.y
execute store result score $slerp_total_time number run data get storage calc: in.z

##* クォータニオンAとBの内積を計算
function calc:main/dot_product

#* 内積が負の場合には、Bを符号反転した上でもう一度内積を計算
execute if score $x1 number < 0 number run function calc:main/dot_product_invert

##* 内積のarcCosを計算
data modify storage calc: in set from storage calc: out
function calc:main/arccos
#* 内積を保存
data modify storage calc: slerp_arcCos set from storage calc: out

#* 経過時間を0に設定
scoreboard players set $slerp_elapsed_time number 0

#* slerp_tick を常時実行
scoreboard players set $quaternion_slerp_tick number 1

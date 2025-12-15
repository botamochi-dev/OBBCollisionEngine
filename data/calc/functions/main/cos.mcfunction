#* cos(x)を求める関数
#* 入力されたラジアンを度数に変換
#* 度数 - 90° した値をEntityのRotation[0]に代入
#* Entity を ^ ^ ^1 へテレポート
#* EntityのPos[0](X座標を取得)

#* 使い方～　
#* /data modify storage calc: in set value x を実行してfloat型で数値をセット xはラジアン
#* /function calc:main/cos を実行して計算
#* /data get storage calc: out を実行して結果を取得


#* 入力されたラジアンを度数に変換
function calc:main/to_degree

#* 度数 - 90° した値をEntityのRotation[0]に代入
data modify storage math: in set value {}
data modify storage math: in.x set from storage calc: out
data modify storage math: in.y set value -90.0f
function #math:float
execute positioned 0 0 0 run summon minecraft:armor_stand ~-0.5 ~ ~-0.5 {Tags:["cos"]}
data modify entity @e[tag=cos,limit=1] Rotation[0] set from storage math: out.add

#* Entity を ^ ^ ^1 へテレポート
execute as @e[tag=cos] at @s run tp ^ ^ ^1

#* EntityのPos[2](Z座標を取得)
execute store result storage calc: out float 0.000001 run data get entity @e[tag=cos,limit=1] Pos[0] 1000000

#* Entity Kill
kill @e[tag=cos]
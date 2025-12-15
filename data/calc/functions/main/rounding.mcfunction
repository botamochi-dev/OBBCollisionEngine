#* 数値を四捨五入する関数

#* 使い方～　
#* /data modify storage calc: in set value x を実行して数値をfloat型でセット
#* /function calc:main/rounding を実行して計算
#* /data get storage calc: out を実行して結果を取得

data modify storage calc: out set value {}

execute store result storage calc: Rounding_1 float 1 run data get storage calc: in 10
execute store result storage calc: Rounding_2 int 10 run data get storage calc: in 1
execute store result score $Rounding_1 number run data get storage calc: Rounding_1
execute store result score $Rounding_2 number run data get storage calc: Rounding_2
scoreboard players operation $Rounding_1 number -= $Rounding_2 number
execute if score $Rounding_1 number >= 5 number run scoreboard players operation $Rounding_2 number += 10 number
execute store result storage calc: out float 0.1 run scoreboard players get $Rounding_2 number
#* x の階乗(x!)を求める関数

#* 使い方～　
#* /data modify storage calc: in set value x を実行して数値をセット
#* /function calc:main/factorial を実行して計算
#* /data get storage calc: out を実行して結果を取得

execute store result score $factorial number run data get storage calc: in
scoreboard players operation $factorial_tmp number = $factorial number

execute if score $factorial number > 1 number run function calc:main/factorial_loop

execute store result storage calc: out float 1 run scoreboard players get $factorial number
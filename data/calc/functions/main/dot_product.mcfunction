#* クォータニオンAとBの内積を求める関数

#! 注意
#! この関数を実行する前に data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z,w]
#* /data modify storage calc: in.y set value [x,y,z,w] で二つのクォータニオンを入力
#* /function calc:main/dot_product を実行して計算
#* /data get storage calc: out を実行して結果を取得

#* リセット
data modify storage calc: out set value {}

#* x1 * x2
execute store result score $x1 number run data get storage calc: in.x[0] 10000
execute store result score $x2 number run data get storage calc: in.y[0] 10000
scoreboard players operation $x1 number *= $x2 number
#* y1 * y2
execute store result score $y1 number run data get storage calc: in.x[1] 10000
execute store result score $y2 number run data get storage calc: in.y[1] 10000
scoreboard players operation $y1 number *= $y2 number
#* z1 * z2
execute store result score $z1 number run data get storage calc: in.x[2] 10000
execute store result score $z2 number run data get storage calc: in.y[2] 10000
scoreboard players operation $z1 number *= $z2 number
#* w1 * w2
execute store result score $w1 number run data get storage calc: in.x[3] 10000
execute store result score $w2 number run data get storage calc: in.y[3] 10000
scoreboard players operation $w1 number *= $w2 number

#* (x1 * x2) + (y1 * y2) + (z1 * z2) + (w1 * w2)
scoreboard players operation $x1 number += $y1 number
scoreboard players operation $x1 number += $z1 number
scoreboard players operation $x1 number += $w1 number

#* 結果を渡す
execute store result storage calc: out float 0.00000001 run scoreboard players get $x1 number

#* リセット
#data modify storage calc: in set value {}
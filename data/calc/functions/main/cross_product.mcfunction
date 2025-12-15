#* ベクトルAとBの外積を求める関数

#! 注意
#! この関数を実行する前に data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z]
#* /data modify storage calc: in.y set value [x,y,z] で二つのベクトルを入力
#* /function calc:main/cross_product を実行して計算
#* /data get storage calc: out を実行して結果を取得

#* 配列設定
data modify storage calc: out set value [0f,0f,0f]

#* 入力を変数に渡す
execute store result score $x1 number run data get storage calc: in.x[0] 10000
execute store result score $x2 number run data get storage calc: in.y[0] 10000
execute store result score $y1 number run data get storage calc: in.x[1] 10000
execute store result score $y2 number run data get storage calc: in.y[1] 10000
execute store result score $z1 number run data get storage calc: in.x[2] 10000
execute store result score $z2 number run data get storage calc: in.y[2] 10000
#* y1 * z2
scoreboard players operation $y1*z2 number = $y1 number
scoreboard players operation $y1*z2 number *= $z2 number
#* z1 * y2
scoreboard players operation $z1*y2 number = $z1 number
scoreboard players operation $z1*y2 number *= $y2 number
#* z1 * x2
scoreboard players operation $z1*x2 number = $z1 number
scoreboard players operation $z1*x2 number *= $x2 number
#* x1 * z2
scoreboard players operation $x1*z2 number = $x1 number
scoreboard players operation $x1*z2 number *= $z2 number
#* x1 * y2
scoreboard players operation $x1*y2 number = $x1 number
scoreboard players operation $x1*y2 number *= $y2 number
#* y1 * x2
scoreboard players operation $y1*x2 number = $y1 number
scoreboard players operation $y1*x2 number *= $x2 number

#* (y1 * z2) - (z1 * y2)
scoreboard players operation $y1*z2 number -= $z1*y2 number
#* (z1 * x2) - (x1 * z2)
scoreboard players operation $z1*x2 number -= $x1*z2 number
#* (x1 * y2) - (y1 * x2)
scoreboard players operation $x1*y2 number -= $y1*x2 number

#* 結果を渡す
execute store result storage calc: out[0] float 0.00000001 run scoreboard players get $y1*z2 number
execute store result storage calc: out[1] float 0.00000001 run scoreboard players get $z1*x2 number
execute store result storage calc: out[2] float 0.00000001 run scoreboard players get $x1*y2 number
#* リセット
#data modify storage calc: in set value {}
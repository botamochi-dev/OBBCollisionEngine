#* ベクトルA+Bを求める関数 (-10 ~ 10 くらいまでの数値に対応)

#! 注意
#! この関数を実行する前に data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z,w]
#* /data modify storage calc: in.y set value [x,y,z,w] で二つのクォータニオンを入力
#* /function calc:main/vector_add を実行して計算
#* /data get storage calc: out を実行して結果を取得


#* リセット
data modify storage calc: out set value [0f,0f,0f,0f]

#* x1 + x2
execute store result score $x1 number run data get storage calc: in.x[0] 100000000
execute store result score $x2 number run data get storage calc: in.y[0] 100000000
scoreboard players operation $x1 number += $x2 number
#* y1 + y2
execute store result score $y1 number run data get storage calc: in.x[1] 100000000
execute store result score $y2 number run data get storage calc: in.y[1] 100000000
scoreboard players operation $y1 number += $y2 number
#* z1 + z2
execute store result score $z1 number run data get storage calc: in.x[2] 100000000
execute store result score $z2 number run data get storage calc: in.y[2] 100000000
scoreboard players operation $z1 number += $z2 number
#* w1 + w2
execute store result score $w1 number run data get storage calc: in.x[3] 100000000
execute store result score $w2 number run data get storage calc: in.y[3] 100000000
scoreboard players operation $w1 number += $w2 number

#* 結果を渡す
execute store result storage calc: out[0] float 0.00000001 run scoreboard players get $x1 number
execute store result storage calc: out[1] float 0.00000001 run scoreboard players get $y1 number
execute store result storage calc: out[2] float 0.00000001 run scoreboard players get $z1 number
execute store result storage calc: out[3] float 0.00000001 run scoreboard players get $w1 number


#* リセット
#data modify storage calc: in set value {}
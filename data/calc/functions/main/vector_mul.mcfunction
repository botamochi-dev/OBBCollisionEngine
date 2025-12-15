#* ベクトルAをk倍したベクトルk*Aを求める関数

#! 注意
#! この関数を実行する前に data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z,w]
#* /data modify storage calc: in.y set value k で二つのクォータニオンを入力
#* /function calc:main/vector_mul を実行して計算
#* /data get storage calc: out を実行して結果を取得


#* リセット
data modify storage calc: out set value [0f,0f,0f,0f]

#* x1 * k
execute store result score $x1 number run data get storage calc: in.x[0] 10000
execute store result score $k number run data get storage calc: in.y 10000
scoreboard players operation $x1 number *= $k number
#* y1 * k
execute store result score $y1 number run data get storage calc: in.x[1] 10000
scoreboard players operation $y1 number *= $k number
#* z1 * k
execute store result score $z1 number run data get storage calc: in.x[2] 10000
scoreboard players operation $z1 number *= $k number
#* w1 * k
execute store result score $w1 number run data get storage calc: in.x[3] 10000
scoreboard players operation $w1 number *= $k number

#* 結果を渡す
execute store result storage calc: out[0] float 0.00000001 run scoreboard players get $x1 number
execute store result storage calc: out[1] float 0.00000001 run scoreboard players get $y1 number
execute store result storage calc: out[2] float 0.00000001 run scoreboard players get $z1 number
execute store result storage calc: out[3] float 0.00000001 run scoreboard players get $w1 number



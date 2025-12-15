#* 値A+Bを求める関数 (-10 ~ 10 くらいまでの数値に対応)

#! 注意
#! この関数を実行する前に data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in.x set value x
#* /data modify storage calc: in.y set value y で二つの値を入力
#* /function calc:main/value_add を実行して計算
#* /data get storage calc: out を実行して結果を取得


#* リセット
data modify storage calc: out set value {}

#* x1 + x2
execute store result score $x1 number run data get storage calc: in.x 100000000
execute store result score $x2 number run data get storage calc: in.y 100000000
scoreboard players operation $x1 number += $x2 number


#* 結果を渡す
execute store result storage calc: out float 0.00000001 run scoreboard players get $x1 number


#* リセット
#data modify storage calc: in set value {}
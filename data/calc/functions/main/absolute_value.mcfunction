#* 絶対値を求める関数


#* ~使い方~
#* /data modify storage calc: in set value x を実行して数値をfloat型でセット
#* /function calc:main/absolute_value を実行して計算
#* /data get storage calc: out を実行して結果を取得

#calc : out リセット
data modify storage calc: out set value {}

# 入力
execute store result score $calc_absolute number run data get storage calc: in 1

#判定
#正の場合には入力をそのまま出力
execute if score $calc_absolute number >= 0 number run data modify storage calc: out set from storage calc: in

#負の場合には入力を負にして出力
#リセット
execute if score $calc_absolute number < 0 number run data modify storage math: in set value {}
#calc in を math : in.x にセット
execute if score $calc_absolute number < 0 number run data modify storage math: in.x set from storage calc: in
#一応、yもセット
execute if score $calc_absolute number < 0 number run data modify storage math: in.y set value 0.0f
#float実行
execute if score $calc_absolute number < 0 number run function #math:float
#計算結果をcalc: outにセット
execute if score $calc_absolute number < 0 number run data modify storage calc: out set from storage math: out.neg


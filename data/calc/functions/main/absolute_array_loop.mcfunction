# 入力
execute store result score $calc_absolute number run data get storage calc: temp[0] 1

#判定
#正の場合には入力をそのまま出力
execute if score $calc_absolute number >= 0 number run data modify storage calc: out append from storage calc: temp[0]

#負の場合には入力を負にして出力
#リセット
execute if score $calc_absolute number < 0 number run data modify storage math: in set value {}
#calc in を math : in.x にセット
execute if score $calc_absolute number < 0 number run data modify storage math: in.x set from storage calc: temp[0]
#一応、yもセット
execute if score $calc_absolute number < 0 number run data modify storage math: in.y set value 0.0f
#float実行
execute if score $calc_absolute number < 0 number run function #math:float
#計算結果をcalc: outにセット
execute if score $calc_absolute number < 0 number run data modify storage calc: out append from storage math: out.neg

# temp の先頭要素を削除
data remove storage calc: temp[0]

#まだ要素がある場合に繰り返し
execute if data storage calc: temp[0] run function calc:main/absolute_array_loop
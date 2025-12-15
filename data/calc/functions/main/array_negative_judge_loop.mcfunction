# 入力
execute store result score $calc_absolute number run data get storage calc: temp[0] 1

#判定
#正の場合には1を出力
execute if score $calc_absolute number >= 0 number run scoreboard players operation $array_negative_judge number *= 1 number
#負の場合には0を出力
execute if score $calc_absolute number < 0 number run scoreboard players operation $array_negative_judge number *= 0 number

# temp の先頭要素を削除
data remove storage calc: temp[0]

#まだ要素がある場合に繰り返し
execute if data storage calc: temp[0] run function calc:main/array_negative_judge_loop
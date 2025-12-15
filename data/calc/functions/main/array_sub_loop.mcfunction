#* 入力
#* x1 + x2
execute store result score $x1 number run data get storage calc: temp1[0] 100000000
execute store result score $x2 number run data get storage calc: temp2[0] 100000000
scoreboard players operation $x1 number -= $x2 number


#* 結果を渡す
execute store result storage calc: temp3 float 0.00000001 run scoreboard players get $x1 number
data modify storage calc: out append from storage calc: temp3



# temp の先頭要素を削除
data remove storage calc: temp1[0]
data remove storage calc: temp2[0]

#まだ要素がある場合に繰り返し
execute if data storage calc: temp1[0] run function calc:main/array_sub_loop
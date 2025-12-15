#* 配列に絶対値が含まれるか判定する関数


#* ~使い方~
#* /data modify storage calc: in set value [x,y,z] を実行して数値をfloat型でセット
#* /function calc:main/array_absolute_judge を実行して計算
#* /data get storage calc: out を実行して結果を取得

#calc : out リセット
data modify storage calc: out set value []

# 初期値をセット
scoreboard players set $array_negative_judge number 1

# calc を temp にコピー
data modify storage calc: temp set from storage calc: in

# temp に要素がある場合にのみ判定を実行
execute if data storage calc: temp[0] run function calc:main/array_negative_judge_loop

#* リセット
data remove storage calc: temp

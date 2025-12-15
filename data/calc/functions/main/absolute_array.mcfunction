#* 配列を絶対値化する関数


#* ~使い方~
#* /data modify storage calc: in set value [x,y,z] を実行して数値をfloat型でセット
#* /function calc:main/absolute_array を実行して計算
#* /data get storage calc: out を実行して結果を取得

#calc : out リセット
data modify storage calc: out set value []

# calc を temp にコピー
data modify storage calc: temp set from storage calc: in

# temp に要素がある場合にのみ判定を実行
execute if data storage calc: temp[0] run function calc:main/absolute_array_loop

#* リセット
data remove storage calc: temp

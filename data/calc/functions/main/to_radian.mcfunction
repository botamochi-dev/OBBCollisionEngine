#* 度数法から弧度法へ数値を変換する関数
#* radians = degree * (π/180)
#*         = degree * 0.0174532925199444

#* 使い方～　
#* /data modify storage calc: in set value x を実行して数値をfloat型でセット
#* /function calc:main/to_radian を実行して計算
#* /data get storage calc: out を実行して結果をfloat型で出力

#リセット
data modify storage math: in set value {}

data modify storage math: in.y set value 0.0174532925199444f
data modify storage math: in.x set from storage calc: in

function #math:float

data modify storage calc: out set from storage math: out.mul


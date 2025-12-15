#* 弧度法から度数法へ数値を変換する関数
#* degrees = radians * (180/π)
#*         = radians * 57.295779

#* 使い方～　
#* /data modify storage calc: in set value x を実行して数値をfloat型でセット
#* /function calc:main/to_degree を実行して計算
#* /data get storage calc: out を実行して結果をfloat型で出力

#リセット
data modify storage math: in set value {}

data modify storage math: in.x set value 57.295779f
data modify storage math: in.y set from storage calc: in

function #math:float

data modify storage calc: out set from storage math: out.mul
#execute store result storage calc: out double 0.1 run data get storage math: out.mul 10


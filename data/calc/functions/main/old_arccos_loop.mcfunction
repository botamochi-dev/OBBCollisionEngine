#* yk を弧度法から度数法に変換
data modify storage calc: in set from storage calc: arcCos
function calc:main/to_degree
#四捨五入する
data modify storage calc: in set from storage calc: out
function calc:main/rounding
execute store result storage calc: degrees double 1 run data get storage calc: out 1
# calc: in に元の値を渡す
data modify storage calc: in set from storage calc: x
#* cos(yk),sin(yk)を求める
data modify storage math: in set from storage calc: degrees
function #math:sin
execute store result storage calc: sin_yk float 0.000001 run data get storage math: out 1000000
data modify storage math: in set from storage calc: degrees
function #math:cos
execute store result storage calc: cos_yk float 0.000001 run data get storage math: out 1000000
#* cos(yk) - x 
#リセット
data modify storage math: in set value {}
data modify storage math: in.x set from storage calc: cos_yk
data modify storage math: in.y set from storage calc: -x
function #math:float
data modify storage calc: cos_yk-x set from storage math: out.add
#* cos(yk) - x / sin(yk)
data modify storage math: in set value {}
data modify storage math: in.x set from storage calc: cos_yk-x
data modify storage math: in.y set from storage calc: sin_yk
function #math:float
data modify storage calc: cos_yk-x/sin(yk) set from storage math: out.div
#* yk + ( cos(yk) - x / sin(yk) )
data modify storage math: in set value {}
data modify storage math: in.x set from storage calc: arcCos
data modify storage math: in.y set from storage calc: cos_yk-x/sin(yk)
function #math:float
data modify storage calc: arcCos set from storage math: out.add
#! AiMathでsin,cosを求める際に整数値でしか入力できずそれにより誤差が生じる

#* ニュートン法を用いたarcCosの導出
#* yk+1 = yk - ((cos(yk)-x)/(sin(yk))) を反復計算して求める。
#* 初期値y0 = π/2(1.570796326795) とする。

#* 使い方～　
#* /data modify storage calc: in set value x を実行して数値をfloat型でセット
#* /function calc:main/arccos_loop を複数回実行して計算
#* /data get storage calc: out を実行して結果を取得

#* calc: in を -1倍してから -x に保存
#リセット
data modify storage calc: x set from storage calc: in
data modify storage math: in set value {}
data modify storage math: in.x set from storage calc: in
data modify storage math: in.y set value 0
function #math:float
data modify storage calc: -x set from storage math: out.neg
#* y0に初期値を設定
data modify storage calc: arcCos set value 1.570796326795f

#* 反復計算してarcCosを計算
function calc:main/old_arccos_loop


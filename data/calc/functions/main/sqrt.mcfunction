#* ニュートン法を用いた平方根(sqrt_root)の導出
#* xk+1 = xk - (xk + N/xk)/2 を反復計算して求める。
#* 初期値x0 = N/2 とする。

#* 使い方～　
#* /data modify storage calc: in set value x を実行して数値をfloat型でセット
#* /function calc:main/sqrt を回実行して計算
#* /data get storage calc: out を実行して結果を取得

#* x0に初期値 N/2 を設定
data modify storage math: in set value {}
data modify storage math: in.x set from storage calc: in
data modify storage math: in.y set value 2.0f
function #math:float
data modify storage calc: sqrt_x set from storage math: out.div

#* 反復計算してarcCosを計算
function calc:main/sqrt_loop

#* 結果をoutに渡す
data modify storage calc: out set from storage calc: sqrt_x
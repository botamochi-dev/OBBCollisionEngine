#* テイラー展開を用いてsin(x)を求める関数

#* 使い方～　
#* /data modify storage calc: in set value x を実行してfloat型で数値をセット xはラジアン
#* /function calc:main/sin を実行して計算
#* /data get storage calc: out を実行して結果を取得

#* 初期化
scoreboard players set $sin_term number 0
data modify storage calc: out set value 0.0f
data modify storage calc: sin_total set value 0.0f
data modify storage math: in set value {}
#* calc: in を sin_xにコピー
data modify storage calc: sin_x set from storage calc: in
#* ループ
function calc:main/old_sin_loop
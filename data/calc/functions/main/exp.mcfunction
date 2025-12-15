#* xのn乗(x^n)を求める関数

#* ～使い方～　
#* /data modify storage calc: in set value x を実行して基数をセット
#* /data modify storage calc: exp_index set value n を実行して指数をセット
#* /function calc:main/exp を実行して計算
#* /data get storage calc: out を実行して結果を取得

#初期値設定
data modify storage math: in set value {}
execute store result storage math: in.x float 0.0001 run data get storage calc: in 1000000
data modify storage math: in.y set from storage calc: in

#n>1の時ループ
execute store result score $exp_index number run data get storage calc: exp_index
execute if score $exp_index number <= 1 number run data modify storage calc: out set from storage calc: in
execute if score $exp_index number > 1 number run function calc:main/exp_loop



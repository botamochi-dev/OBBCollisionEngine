##* 2つのベクトル間の角度を求める関数

#! 注意
#! この関数を実行する前に data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z]
#* /data modify storage calc: in.y set value [x,y,z] で二つのベクトルを入力
#* /function calc:main/angle_between_vectors を実行して計算
#* /data get storage calc: out を実行して結果を取得


#* リセット
data modify storage calc: out set value 0.0f

#* 入力を一時保存
data modify storage calc: in_temp1 set from storage calc: in.x
data modify storage calc: in_temp2 set from storage calc: in.y
#* 内積(ドット積)を計算
function calc:main/dot_product
data modify storage calc: angle_between_vectors_dot set from storage calc: out
#* 各ベクトルの大きさ(ノルム)を計算
data modify storage math: in set value {}
data modify storage math: in set from storage calc: in.x
function #math:length
data modify storage calc: angle_between_vectors_norm1 set from storage math: out
data modify storage math: in set from storage calc: in.y
function #math:length
data modify storage calc: angle_between_vectors_norm2 set from storage math: out
#* |A| * |B|
data modify storage math: in set value {}
execute store result storage math: in.x float 0.001 run data get storage calc: angle_between_vectors_norm1 10000
#data modify storage math: in.x set from storage calc: angle_between_vectors_norm1
data modify storage math: in.y set from storage calc: angle_between_vectors_norm2
function #math:float
execute store result storage calc: angle_between_vectors_norm_mul float 0.00001 run data get storage math: out.mul 10000
#data modify storage calc: angle_between_vectors_norm_mul set from storage math: out.mul
#* A・B / |A| * |B|
data modify storage math: in set value {}
data modify storage math: in.x set from storage calc: angle_between_vectors_dot
data modify storage math: in.y set from storage calc: angle_between_vectors_norm_mul
function #math:float
data modify storage calc: angle_between_vectors_cos set from storage math: out.div
#* cosθを角度に変換
data modify storage calc: in set value {}
data modify storage calc: in set from storage calc: angle_between_vectors_cos
function calc:main/arccos
data modify storage calc: in set value {}
data modify storage calc: in set from storage calc: out
function calc:main/to_degree
#*入力を戻す
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: in_temp1
data modify storage calc: in.y set from storage calc: in_temp2

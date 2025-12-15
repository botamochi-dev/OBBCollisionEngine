#* ベクトルをクォータニオンに変換する関数

#! 注意
#! この関数を実行する前に data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in set value [x,y,z]
#* /function calc:main/vector_to_quaternion を実行して計算
#* /data get storage calc: out を実行して結果を取得

#* 配列初期設定
data modify storage calc: out set value [0f,0f,0f,0f]
data modify storage calc: in_temp set value [0.0f,0.0f,0.0f]
data modify storage block_physics: rotation_angle set value [0.0f]
data modify storage block_physics: rotation_axis set value [0.0f,0.0f,0.0f]
data modify storage block_physics: rotation_angle/2 set value [0.0f]

#* 入力を保存
data modify storage calc: in_temp set from storage calc: in

#* 回転ベクトルを角度と軸に分解
#角度
data modify storage math: in set from storage calc: in
function #math:length
data modify storage block_physics: rotation_angle set from storage math: out
#軸
data modify storage math: in set value {}
data modify storage math: in.x set from storage calc: in[0]
data modify storage math: in.y set from storage block_physics: rotation_angle
function #math:float
data modify storage block_physics: rotation_axis[0] set from storage math: out.div
data modify storage math: in.x set from storage calc: in[1]
function #math:float
data modify storage block_physics: rotation_axis[1] set from storage math: out.div
data modify storage math: in.x set from storage calc: in[2]
function #math:float
data modify storage block_physics: rotation_axis[2] set from storage math: out.div

##* クォータニオンの計算
#* Θ/2を求める
data modify storage math: in.x set from storage block_physics: rotation_angle
data modify storage math: in.y set value 2.0f
function #math:float
data modify storage block_physics: rotation_angle/2 set from storage math: out.div
#* cosΘ/2 を計算
data modify storage calc: in set from storage block_physics: rotation_angle/2
function calc:main/cos
data modify storage block_physics: rotation_cosΘ/2 set from storage calc: out
#* sinΘ/2 を計算
data modify storage calc: in set from storage block_physics: rotation_angle/2
function calc:main/sin
data modify storage block_physics: rotation_sinΘ/2 set from storage calc: out
#* x,y,zを計算
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage block_physics: rotation_axis
data modify storage calc: in.y set from storage block_physics: rotation_sinΘ/2
function calc:main/vector_mul
#* w を代入
data modify storage calc: out[3] set from storage block_physics: rotation_cosΘ/2
#* 入力を戻す
data modify storage calc: in set from storage calc: in_temp
# * ベクトルをクォータニオンによって回転させる関数 (new_vector = quaternion * vector * conjugate_quaternion)
# ! 形式は[x,y,z,w]
#! 注意
#! この関数を実行する前に /data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z,w] でクォータニオンを入力
#* /data modify storage calc: in.y set value [x,y,z,0f] でベクトルを入力
#* /function calc:main/quaternion_rotation を実行して計算
#* /data get storage calc: out を実行して結果を取得

# * リセット
data modify storage calc: out set value [0f,0f,0f,1f]

#* 共役クォータニオンを計算
data modify storage calc: conj set value [0f,0f,0f,1f]
execute store result storage calc: conj[0] float -0.0000001 run data get storage calc: in.x[0] 10000000
execute store result storage calc: conj[1] float -0.0000001 run data get storage calc: in.x[1] 10000000
execute store result storage calc: conj[2] float -0.0000001 run data get storage calc: in.x[2] 10000000
execute store result storage calc: conj[3] float 0.0000001 run data get storage calc: in.x[3] 10000000

#* quaternion * vector
#既にcalc: in.x にクォータニオン、calc: in.y にベクトルが入っているためそのまま合成
function calc:main/quaternion_mul
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set from storage calc: conj
function calc:main/quaternion_mul
#4つ目の要素は不要なので削除
data remove storage calc: out[3]

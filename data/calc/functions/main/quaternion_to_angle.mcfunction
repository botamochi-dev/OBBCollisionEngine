# * クォータニオンを角度に変換する関数 
# ! 形式は[x,y,z,w]
#! 注意
#! この関数を実行する前に /data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x に数値を渡すことができないため

# * angle = [x,y,z]([roll,pitch,yaw])
# *       = [arcTan2(2(w*x + y*z),1 - 2(x^2 + y^2)),
# *          arcSin(2(w*y - z*x)),
# *          arcTan2(2(w*z + x*y),1 - 2(y^2 + z^2))]


#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z,w]
#* /data modify storage calc: in.y set value [x,y,z,w] で二つのクォータニオンを入力
#* /function calc:main/quaternion_to_angle を実行して計算
#* /data get storage calc: out を実行して結果を取得

# * リセット
data modify storage calc: out set value {}
data modify storage calc: out set value [0f,0f,0f]

#* 配列初期設定
data modify storage calc: Angle set value [0f,0f,0f]

#* 入力
execute store result score $x1 number run data get storage calc: in[0] 10000
execute store result score $y1 number run data get storage calc: in[1] 10000
execute store result score $z1 number run data get storage calc: in[2] 10000
execute store result score $w1 number run data get storage calc: in[3] 10000

#* w*x
scoreboard players operation $w1*x1 number = $w1 number
scoreboard players operation $w1*x1 number *= $x1 number
#* w*y
scoreboard players operation $w1*y1 number = $w1 number
scoreboard players operation $w1*y1 number *= $y1 number
#* w*z
scoreboard players operation $w1*z1 number = $w1 number
scoreboard players operation $w1*z1 number *= $z1 number
#* y*z
scoreboard players operation $y1*z1 number = $y1 number
scoreboard players operation $y1*z1 number *= $z1 number
#* z*x
scoreboard players operation $z1*x1 number = $z1 number
scoreboard players operation $z1*x1 number *= $x1 number
#* x*y
scoreboard players operation $x1*y1 number = $x1 number
scoreboard players operation $x1*y1 number *= $y1 number
#* x*x
scoreboard players operation $x1*x1 number = $x1 number
scoreboard players operation $x1*x1 number *= $x1 number
#* y*y
scoreboard players operation $y1*y1 number = $y1 number
scoreboard players operation $y1*y1 number *= $y1 number
#* z*z
scoreboard players operation $z1*z1 number = $z1 number
scoreboard players operation $z1*z1 number *= $z1 number

##* X
#* 2(w*x + y*z)
scoreboard players operation $w1*x1 number += $y1*z1 number
scoreboard players operation $w1*x1 number *= 2 number
#* 1 - 2(x^2 + y^2)
scoreboard players set 1-2(x^2+y^2) number 100000000
scoreboard players operation $x1*x1 number += $y1*y1 number
scoreboard players operation $x1*x1 number *= 2 number
scoreboard players operation 1-2(x^2+y^2) number -= $x1*x1 number
#* arcTan2(2(w*x + y*z),1 - 2(x^2 + y^2))
# atan2を求める
data modify storage calc: in set value [0.0f,0.0f]
execute store result storage calc: in[0] float 0.00000001 run scoreboard players get $w1*x1 number
execute store result storage calc: in[1] float 0.00000001 run scoreboard players get 1-2(x^2+y^2) number
function calc:main/arctan2
# 角度に変換
data modify storage calc: in set from storage calc: out
function calc:main/to_degree
# 一時的に保存
data modify storage calc: Angle[0] set from storage calc: out

##* Y
#* 2(w*y - z*x)
scoreboard players operation $w1*y1 number -= $z1*x1 number
scoreboard players operation $w1*y1 number *= 2 number
#* arcSin(2(w*y - z*x))
# arcSinを求める
execute store result storage calc: in float 0.00000001 run scoreboard players get $w1*y1 number
function calc:main/arcsin
# 角度に変換
data modify storage calc: in set from storage calc: out
function calc:main/to_degree
# 一時的に保存
data modify storage calc: Angle[1] set from storage calc: out

##* Z
#* 2(w*z + x*y)
scoreboard players operation $w1*z1 number += $x1*y1 number
scoreboard players operation $w1*z1 number *= 2 number
#* 1 - 2(y^2 + z^2)
scoreboard players set 1-2(y^2+z^2) number 100000000
scoreboard players operation $y1*y1 number += $z1*z1 number
scoreboard players operation $y1*y1 number *= 2 number
scoreboard players operation 1-2(y^2+z^2) number -= $y1*y1 number
#* arcTan2(2(w*z + x*y),1 - 2(y^2 + z^2))
# atan2を求める
data modify storage calc: in set value [0.0f,0.0f]
execute store result storage calc: in[0] float 0.00000001 run scoreboard players get $w1*z1 number
execute store result storage calc: in[1] float 0.00000001 run scoreboard players get 1-2(y^2+z^2) number
function calc:main/arctan2
# 角度に変換
data modify storage calc: in set from storage calc: out
function calc:main/to_degree
# 一時的に保存
data modify storage calc: Angle[2] set from storage calc: out

#* 四捨五入
execute store result storage calc: Angle[0] float 1 run data get storage calc: Angle[0]
execute store result storage calc: Angle[1] float 1 run data get storage calc: Angle[1]
execute store result storage calc: Angle[2] float 1 run data get storage calc: Angle[2]
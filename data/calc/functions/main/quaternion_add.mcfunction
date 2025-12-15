# * クォータニオンを合成する関数 (quaternion_add_1 * quaternion_add_2)
# ! 形式は[x,y,z,w]
#! 注意
#! この関数を実行する前に /data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

# * quaternion_add_out = quaternion_add_1 + quaternion_add_2
# *                    = [x1,y1,z1,w1]+[x2,y2,z2,w2]
# *                    =[x1 + x2 ,   
# *                      y1 + y2 ,   
# *                      z1 + z2 ,
# *                      w1 + w2 ]

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z,w]
#* /data modify storage calc: in.y set value [x,y,z,w] で二つのクォータニオンを入力
#* /function calc:main/quaternion_add を実行して計算
#* /data get storage calc: out を実行して結果を取得

# * リセット
data modify storage calc: out set value {}
data modify storage calc: out set value [0f,0f,0f,1f]

# * X 
# * x1 + x2
execute store result score $x1 number run data get storage calc: in.x[0] 1000000
execute store result score $x2 number run data get storage calc: in.y[0] 1000000

scoreboard players operation $x1 number += $x2 number
execute store result storage calc: out[0] float 0.000001 run scoreboard players get $x1 number

# * Y 
# * y1 + y2
execute store result score $y1 number run data get storage calc: in.x[1] 1000000
execute store result score $y2 number run data get storage calc: in.y[1] 1000000

scoreboard players operation $y1 number += $y2 number
execute store result storage calc: out[1] float 0.000001 run scoreboard players get $y1 number

# * Z 
# * z1 + z2
execute store result score $z1 number run data get storage calc: in.x[2] 1000000
execute store result score $z2 number run data get storage calc: in.y[2] 1000000

scoreboard players operation $z1 number += $z2 number
execute store result storage calc: out[2] float 0.000001 run scoreboard players get $z1 number

# * W 
# * w1 + w2
execute store result score $w1 number run data get storage calc: in.x[3] 1000000
execute store result score $w2 number run data get storage calc: in.y[3] 1000000

scoreboard players operation $w1 number += $w2 number
execute store result storage calc: out[3] float 0.000001 run scoreboard players get $w1 number

# * クォータニオンを合成する関数 (in.x * in.y)
# ! 形式は[x,y,z,w]
#! 注意
#! この関数を実行する前に /data modify storage calc: in set value {} を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

# * out = in.x * in.y
# *                    = [x1,y1,z1,w1]*[x2,y2,z2,w2]
# *                    =[w1*x2 + x1*w2 + y1*z2 - z1*y2 ,   
# *                      w1*y2 - x1*z2 + y1*w2 + z1*x2 ,   
# *                      w1*z2 + x1*y2 - y1*x2 + z1*w2 ,
# *                      w1*w2 - x1*x2 - y1*y2 - z1*z2 ]


# * リセット
data modify storage calc: out set value [0f,0f,0f,1f]

# * X 
# * w1*x2
execute store result score $w1 number run data get storage calc: in.x[3] 10000
execute store result score $x2 number run data get storage calc: in.y[0] 10000

scoreboard players operation $w1 number *= $x2 number
# * x1*w2
execute store result score $x1 number run data get storage calc: in.x[0] 10000
execute store result score $w2 number run data get storage calc: in.y[3] 10000

scoreboard players operation $x1 number *= $w2 number
# * y1*z2
execute store result score $y1 number run data get storage calc: in.x[1] 10000
execute store result score $z2 number run data get storage calc: in.y[2] 10000
scoreboard players operation $y1 number *= $z2 number

# * - z1*y2
execute store result score $z1 number run data get storage calc: in.x[2] -10000
execute store result score $y2 number run data get storage calc: in.y[1] 10000
scoreboard players operation $z1 number *= $y2 number

# * 合計
scoreboard players operation $w1 number += $x1 number
scoreboard players operation $y1 number += $z1 number
scoreboard players operation $w1 number += $y1 number
execute store result storage calc: out[0] float 0.00000001 run scoreboard players get $w1 number

# * Y 
# * w1*y2
execute store result score $w1 number run data get storage calc: in.x[3] 10000
execute store result score $y2 number run data get storage calc: in.y[1] 10000

scoreboard players operation $w1 number *= $y2 number
# * - x1*z2
execute store result score $x1 number run data get storage calc: in.x[0] -10000
execute store result score $z2 number run data get storage calc: in.y[2] 10000

scoreboard players operation $x1 number *= $z2 number
# * y1*w2
execute store result score $y1 number run data get storage calc: in.x[1] 10000
execute store result score $w2 number run data get storage calc: in.y[3] 10000
scoreboard players operation $y1 number *= $w2 number

# * z1*x2
execute store result score $z1 number run data get storage calc: in.x[2] 10000
execute store result score $x2 number run data get storage calc: in.y[0] 10000
scoreboard players operation $z1 number *= $x2 number

# * 合計
scoreboard players operation $w1 number += $x1 number
scoreboard players operation $y1 number += $z1 number
scoreboard players operation $w1 number += $y1 number
execute store result storage calc: out[1] float 0.00000001 run scoreboard players get $w1 number

# * Z 
# * w1*z2
execute store result score $w1 number run data get storage calc: in.x[3] 10000
execute store result score $z2 number run data get storage calc: in.y[2] 10000

scoreboard players operation $w1 number *= $z2 number
# * x1*y2
execute store result score $x1 number run data get storage calc: in.x[0] 10000
execute store result score $y2 number run data get storage calc: in.y[1] 10000

scoreboard players operation $x1 number *= $y2 number
# * - y1*x2
execute store result score $y1 number run data get storage calc: in.x[1] -10000
execute store result score $x2 number run data get storage calc: in.y[0] 10000
scoreboard players operation $y1 number *= $x2 number

# * z1*w2
execute store result score $z1 number run data get storage calc: in.x[2] 10000
execute store result score $w2 number run data get storage calc: in.y[3] 10000
scoreboard players operation $z1 number *= $w2 number

# * 合計
scoreboard players operation $w1 number += $x1 number
scoreboard players operation $y1 number += $z1 number
scoreboard players operation $w1 number += $y1 number
execute store result storage calc: out[2] float 0.00000001 run scoreboard players get $w1 number

# * W 
# * w1*w2
execute store result score $w1 number run data get storage calc: in.x[3] 10000
execute store result score $z2 number run data get storage calc: in.y[3] 10000

scoreboard players operation $w1 number *= $z2 number
# * - x1*x2
execute store result score $x1 number run data get storage calc: in.x[0] -10000
execute store result score $y2 number run data get storage calc: in.y[0] 10000

scoreboard players operation $x1 number *= $y2 number
# * - y1*y2
execute store result score $y1 number run data get storage calc: in.x[1] -10000
execute store result score $x2 number run data get storage calc: in.y[1] 10000
scoreboard players operation $y1 number *= $x2 number

# * - z1*z2
execute store result score $z1 number run data get storage calc: in.x[2] -10000
execute store result score $w2 number run data get storage calc: in.y[2] 10000
scoreboard players operation $z1 number *= $w2 number

# * 合計
scoreboard players operation $w1 number += $x1 number
scoreboard players operation $y1 number += $z1 number
scoreboard players operation $w1 number += $y1 number
execute store result storage calc: out[3] float 0.00000001 run scoreboard players get $w1 number
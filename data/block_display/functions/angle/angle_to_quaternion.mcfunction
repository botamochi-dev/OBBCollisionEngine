### * XYZ角度から四元数形式へ変換する
############################################   未使用   ######################################################################
###角度からラジアンへの変換
## X 軸
##値を代入
#data modify storage math: in.x set value 1.74532925199433f
#execute store result storage math: in.y float 0.01 run data get storage minecraft:block_display XYZ_angle[0]
##AiMathによる計算
#function #math:float
##計算結果をストレージへ記録
#data modify storage minecraft:block_display radian[0] set from storage math: out.mul
#
## Y 軸
##値を代入
#data modify storage math: in.x set value 1.74532925199433f
#execute store result storage math: in.y float 0.01 run data get storage minecraft:block_display XYZ_angle[1]
##AiMathによる計算
#function #math:float
##計算結果をストレージへ記録
#data modify storage minecraft:block_display radian[1] set from storage math: out.mul
#
## Z 軸
##値を代入
#data modify storage math: in.x set value 1.74532925199433f
#execute store result storage math: in.y float 0.01 run data get storage minecraft:block_display XYZ_angle[2]
##AiMathによる計算
#function #math:float
##計算結果をストレージへ記録
#data modify storage minecraft:block_display radian[2] set from storage math: out.mul
#
###求めたラジアンを2で割り、価をストレージへ記録
## X 軸
#data modify storage math: in.x set from storage minecraft:block_display radian[0]
#data modify storage math: in.y set value 2.0f
#function #math:float
#data modify storage minecraft:block_display radian_div[0] set from storage math: out.div
#
## Y 軸
#data modify storage math: in.x set from storage minecraft:block_display radian[1]
#data modify storage math: in.y set value 2.0f
#function #math:float
#data modify storage minecraft:block_display radian_div[1] set from storage math: out.div
#
## Z 軸
#data modify storage math: in.x set from storage minecraft:block_display radian[2]
#data modify storage math: in.y set value 2.0f
#function #math:float
#data modify storage minecraft:block_display radian_div[2] set from storage math: out.div

###############################################################################################################################

## * 各軸の回転に対応するクォータニオンを求める

#リセット
data modify storage minecraft:block_display quaternion_X set value [0f,0f,0f,1f]
data modify storage minecraft:block_display quaternion_Y set value [0f,0f,0f,1f]
data modify storage minecraft:block_display quaternion_Z set value [0f,0f,0f,1f]

#X軸
execute store result storage math: in double 0.5 run data get storage minecraft:block_display XYZ_angle[0]
function #math:sin
execute store result storage minecraft:block_display quaternion_X[0] float 0.000001 run data get storage math: out 1000000
function #math:cos
execute store result storage minecraft:block_display quaternion_X[3] float 0.000001 run data get storage math: out 1000000

#Y軸
execute store result storage math: in double 0.5 run data get storage minecraft:block_display XYZ_angle[1]
function #math:sin
execute store result storage minecraft:block_display quaternion_Y[1] float 0.000001 run data get storage math: out 1000000
function #math:cos
execute store result storage minecraft:block_display quaternion_Y[3] float 0.000001 run data get storage math: out 1000000

#Z軸
execute store result storage math: in double 0.5 run data get storage minecraft:block_display XYZ_angle[2]
function #math:sin
execute store result storage minecraft:block_display quaternion_Z[2] float 0.000001 run data get storage math: out 1000000
function #math:cos
execute store result storage minecraft:block_display quaternion_Z[3] float 0.000001 run data get storage math: out 1000000

#リセット
data modify storage math: in set value {}

## * クォータニオンの合成
execute if entity @e[tag=BDmenuselect,tag=Rotation_axis_x] run data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display quaternion_X
execute if entity @e[tag=BDmenuselect,tag=Rotation_axis_y] run data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display quaternion_Y
execute if entity @e[tag=BDmenuselect,tag=Rotation_axis_z] run data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display quaternion_Z
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_tmp

# quaternion合成関数で合成
function block_display:angle/quaternion_mul

#計算結果を適用
data modify entity @e[tag=BDselect,limit=1] transformation.left_rotation set from storage minecraft:block_display quaternion_mul_out


#translation用にquaternionを保存
data modify storage minecraft:block_display quaternion_combined set from storage minecraft:block_display quaternion_mul_out
###XYZ角度から四元数形式へ変換する
############################################   未使用   ######################################################################
##角度からラジアンへの変換
# X 軸
#値を代入
data modify storage math: in.x set value 1.74532925199433f
execute store result storage math: in.y float 0.01 run data get storage minecraft:block_display XYZ_angle[0]
#AiMathによる計算
function #math:float
#計算結果をストレージへ記録
data modify storage minecraft:block_display radian[0] set from storage math: out.mul

# Y 軸
#値を代入
data modify storage math: in.x set value 1.74532925199433f
execute store result storage math: in.y float 0.01 run data get storage minecraft:block_display XYZ_angle[1]
#AiMathによる計算
function #math:float
#計算結果をストレージへ記録
data modify storage minecraft:block_display radian[1] set from storage math: out.mul

# Z 軸
#値を代入
data modify storage math: in.x set value 1.74532925199433f
execute store result storage math: in.y float 0.01 run data get storage minecraft:block_display XYZ_angle[2]
#AiMathによる計算
function #math:float
#計算結果をストレージへ記録
data modify storage minecraft:block_display radian[2] set from storage math: out.mul

##求めたラジアンを2で割り、価をストレージへ記録
# X 軸
data modify storage math: in.x set from storage minecraft:block_display radian[0]
data modify storage math: in.y set value 2.0f
function #math:float
data modify storage minecraft:block_display radian_div[0] set from storage math: out.div

# Y 軸
data modify storage math: in.x set from storage minecraft:block_display radian[1]
data modify storage math: in.y set value 2.0f
function #math:float
data modify storage minecraft:block_display radian_div[1] set from storage math: out.div

# Z 軸
data modify storage math: in.x set from storage minecraft:block_display radian[2]
data modify storage math: in.y set value 2.0f
function #math:float
data modify storage minecraft:block_display radian_div[2] set from storage math: out.div

###############################################################################################################################

#初期化
data modify storage minecraft:block_display quaternion_X set value [0f,0f,0f,0f]
data modify storage minecraft:block_display quaternion_Y set value [0f,0f,0f,0f]
data modify storage minecraft:block_display quaternion_Z set value [0f,0f,0f,0f]
data modify storage minecraft:block_display quaternion_ZY set value [0f,0f,0f,0f]
data modify storage minecraft:block_display quaternion set value [0f,0f,0f,0f]



##各軸の回転に対応するクォータニオンを求める
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

##クォータニオンの合成
#まずQzとQyを合成
# w
#AiMath の計算が失敗するため10倍して代入
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_Z[3] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_Y[3]
function #math:float
#クォータニオンZY に代入
execute store result storage minecraft:block_display quaternion_ZY[3] float 0.0000001 run data get storage math: out.mul 1000000
# x
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_Z[2] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_Y[1]
function #math:float
execute store result storage minecraft:block_display quaternion_ZY[0] float 0.0000001 run data get storage math: out.mul 1000000
# y
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_Z[3] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_Y[1]
function #math:float
execute store result storage minecraft:block_display quaternion_ZY[1] float 0.0000001 run data get storage math: out.mul 1000000
# z
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_Z[2] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_Y[3]
function #math:float
execute store result storage minecraft:block_display quaternion_ZY[2] float 0.0000001 run data get storage math: out.mul 1000000

#次にQzyとQxを合成
#AiMathで乗算したのち storage minecraft:block_display cal に保存し、後に加算
# [x,y,z,w] の形式で quaternion に保存
# w 1
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_ZY[3] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_X[3]
function #math:float
#cal に代入
execute store result storage minecraft:block_display cal[0] float 0.0000001 run data get storage math: out.mul 1000000
# w 2
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_ZY[0] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_X[0]
function #math:float
#cal に代入
execute store result storage minecraft:block_display cal[1] float -0.0000001 run data get storage math: out.mul 1000000
#cal で計算
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display cal[0] 10000000
execute store result storage math: in.y float 0.000001 run data get storage minecraft:block_display cal[1] 10000000
function #math:float
execute store result storage minecraft:block_display quaternion[3] float 0.0000001 run data get storage math: out.add 1000000

# x 1
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_ZY[0] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_X[3]
function #math:float
#cal に代入
execute store result storage minecraft:block_display cal[0] float 0.0000001 run data get storage math: out.mul 1000000
# x 2
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_ZY[3] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_X[0]
function #math:float
#cal に代入
execute store result storage minecraft:block_display cal[1] float 0.0000001 run data get storage math: out.mul 1000000
#cal で計算
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display cal[0] 10000000
execute store result storage math: in.y float 0.000001 run data get storage minecraft:block_display cal[1] 10000000
function #math:float
execute store result storage minecraft:block_display quaternion[0] float 0.0000001 run data get storage math: out.add 1000000

# y 1
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_ZY[1] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_X[3]
function #math:float
#cal に代入
execute store result storage minecraft:block_display cal[0] float 0.0000001 run data get storage math: out.mul 1000000
# y 2
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_ZY[2] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_X[0]
function #math:float
#cal に代入
execute store result storage minecraft:block_display cal[1] float -0.0000001 run data get storage math: out.mul 1000000
#cal で計算
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display cal[0] 10000000
execute store result storage math: in.y float 0.000001 run data get storage minecraft:block_display cal[1] 10000000
function #math:float
execute store result storage minecraft:block_display quaternion[1] float 0.0000001 run data get storage math: out.add 1000000

# z 1
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_ZY[2] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_X[3]
function #math:float
#cal に代入
execute store result storage minecraft:block_display cal[0] float 0.0000001 run data get storage math: out.mul 1000000
# z 2
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display quaternion_ZY[1] 10000000
data modify storage math: in.y set from storage minecraft:block_display quaternion_X[0]
function #math:float
#cal に代入
execute store result storage minecraft:block_display cal[1] float 0.0000001 run data get storage math: out.mul 1000000
#cal で計算
execute store result storage math: in.x float 0.000001 run data get storage minecraft:block_display cal[0] 10000000
execute store result storage math: in.y float 0.000001 run data get storage minecraft:block_display cal[1] 10000000
function #math:float
execute store result storage minecraft:block_display quaternion[2] float 0.0000001 run data get storage math: out.add 1000000

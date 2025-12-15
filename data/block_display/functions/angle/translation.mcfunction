##現在のtranslationを取得
#data modify storage minecraft:block_display translation set from entity @e[tag=BDselect,limit=1] transformation.translation

#x,y,zのクォータニオンを合成
data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_Z
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display quaternion_Y
function block_display:angle/quaternion_mul

data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display quaternion_X
function block_display:angle/quaternion_mul

data modify storage minecraft:block_display quaternion_combined set from storage minecraft:block_display quaternion_mul_out

#合成したクォータニオンの共役クォータニオンを計算
execute store result storage minecraft:block_display conj_quaternion[0] float -0.0000001 run data get storage minecraft:block_display quaternion_combined[0] 10000000
execute store result storage minecraft:block_display conj_quaternion[1] float -0.0000001 run data get storage minecraft:block_display quaternion_combined[1] 10000000
execute store result storage minecraft:block_display conj_quaternion[2] float -0.0000001 run data get storage minecraft:block_display quaternion_combined[2] 10000000
execute store result storage minecraft:block_display conj_quaternion[3] float 0.0000001 run data get storage minecraft:block_display quaternion_combined[3] 10000000

data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_combined
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display translation_tmp
# quaternion合成関数で合成
function block_display:angle/quaternion_mul

data modify storage minecraft:block_display quaternion_mul_1 set from storage minecraft:block_display quaternion_mul_out
data modify storage minecraft:block_display quaternion_mul_2 set from storage minecraft:block_display conj_quaternion
# quaternion合成関数で合成
function block_display:angle/quaternion_mul

#計算結果を適用
data modify entity @e[tag=BDselect,limit=1] transformation.translation[0] set from storage minecraft:block_display quaternion_mul_out[0]
data modify entity @e[tag=BDselect,limit=1] transformation.translation[1] set from storage minecraft:block_display quaternion_mul_out[1]
data modify entity @e[tag=BDselect,limit=1] transformation.translation[2] set from storage minecraft:block_display quaternion_mul_out[2]





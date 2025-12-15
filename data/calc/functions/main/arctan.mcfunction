#* Pos代入とFacingでarcTanを求める

#* 使い方～　
#* /data modify storage calc: in set value x を実行して数値をfloat型でセット
#* /function calc:main/arcTan を実行して計算
#* /data get storage calc: out を実行して結果を取得

#* Z
execute store result storage calc: arcTan-Pos-Z double 0.000001 run data get storage calc: in 1000000
#* X
data modify storage calc: arcTan-Pos-X set value 1.0d
#* Pos代入
execute positioned 0 0 0 run summon minecraft:armor_stand ~-0.5 ~ ~-0.5 {Tags:["arcTan_1"]}
execute positioned 0 0 0 run summon minecraft:armor_stand ~-0.5 ~ ~-0.5 {Tags:["arcTan_2"]}
data modify entity @e[tag=arcTan_2,limit=1] Pos[0] set from storage calc: arcTan-Pos-X
data modify entity @e[tag=arcTan_2,limit=1] Pos[2] set from storage calc: arcTan-Pos-Z
#* Facing
execute as @e[tag=arcTan_1] at @s facing entity @e[tag=arcTan_2] feet run tp @s ~ ~ ~ ~ ~
data modify storage math: in.x set from entity @e[tag=arcTan_1,limit=1] Rotation[0]
data modify storage math: in.y set value 90.0f
function #math:float
data modify storage calc: in set from storage math: out.add
function calc:main/to_radian
#* calc: in に元の値を渡す
execute store result storage calc: in float 0.000001 run data get storage calc: arcTan-Pos-X 1000000
#* Armorstand kill
kill @e[tag=arcTan_1]
kill @e[tag=arcTan_2]

#tellraw @p {"bold":true,"color":"gold","nbt":"out","storage":"calc:"}
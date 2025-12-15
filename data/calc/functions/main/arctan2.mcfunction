#* 入力x,yからarcTan2を求める


#* 使い方～　
#* /data modify storage calc: in set value [x,y] を実行して数値をfloat型でセット
#* /function calc:main/arcTan2 を実行して計算
#* /data get storage calc: out を実行して結果を取得

#* Z
execute store result storage calc: arcTan2-Pos-Z double 0.000001 run data get storage calc: in[1] 1000000
#* X
execute store result storage calc: arcTan2-Pos-X double 0.000001 run data get storage calc: in[0] 1000000
#* Pos代入
execute positioned 0 0 0 run summon minecraft:armor_stand ~-0.5 ~ ~-0.5 {Tags:["arcTan2_1"]}
execute positioned 0 0 0 run summon minecraft:armor_stand ~-0.5 ~ ~-0.5 {Tags:["arcTan2_2"]}
data modify entity @e[tag=arcTan2_2,limit=1] Pos[0] set from storage calc: arcTan2-Pos-X
data modify entity @e[tag=arcTan2_2,limit=1] Pos[2] set from storage calc: arcTan2-Pos-Z
#* Facing
execute as @e[tag=arcTan2_1] at @s facing entity @e[tag=arcTan2_2] feet run tp @s ~ ~ ~ ~ ~
data modify storage math: in.x set from entity @e[tag=arcTan2_1,limit=1] Rotation[0]
data modify storage math: in.y set value -1.0f
function #math:float
data modify storage calc: in set from storage math: out.mul
function calc:main/to_radian
#* calc: in に元の値を渡す
execute store result storage calc: in[0] float 0.000001 run data get storage calc: arcTan2-Pos-X 1000000
execute store result storage calc: in[1] float 0.000001 run data get storage calc: arcTan2-Pos-Z 1000000

#* Armorstand kill
kill @e[tag=arcTan2_1]
kill @e[tag=arcTan2_2]

#tellraw @p {"bold":true,"color":"gold","nbt":"out","storage":"calc:"}
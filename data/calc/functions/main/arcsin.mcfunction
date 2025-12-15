#* Pos代入とFacingでarcSinを求める

#* 使い方～　
#* /data modify storage calc: in set value x を実行して数値をfloat型でセット
#* /function calc:main/arcSin を実行して計算
#* /data get storage calc: out を実行して結果を取得

#* Z
execute store result storage calc: arcSin-Pos-Z double 0.000001 run data get storage calc: in 1000000
#* X=√1-n^2
data modify storage math: in set value {}
execute store result storage math: in.x float 0.0001 run data get storage calc: in 1000000
execute store result storage math: in.y float 0.0001 run data get storage calc: in 1000000
function #math:float
execute store result storage calc: arcSin-Pos-X float 0.000001 run data get storage math: out.mul -100
data modify storage math: in.x set from storage calc: arcSin-Pos-X
data modify storage math: in.y set value 1.0f
function #math:float
data modify storage math: in set from storage math: out.add
function #math:sqrt
execute store result storage calc: arcSin-Pos-X double 0.000001 run data get storage math: out 1000000
#* Pos代入
execute positioned 0 0 0 run summon minecraft:armor_stand ~-0.5 ~ ~-0.5 {Tags:["arcSin_1"]}
execute positioned 0 0 0 run summon minecraft:armor_stand ~-0.5 ~ ~-0.5 {Tags:["arcSin_2"]}
data modify entity @e[tag=arcSin_2,limit=1] Pos[0] set from storage calc: arcSin-Pos-X
data modify entity @e[tag=arcSin_2,limit=1] Pos[2] set from storage calc: arcSin-Pos-Z
#* Facing
execute as @e[tag=arcSin_1] at @s facing entity @e[tag=arcSin_2] feet run tp @s ~ ~ ~ ~ ~
data modify storage math: in set value {}
data modify storage math: in.x set from entity @e[tag=arcSin_1,limit=1] Rotation[0]
data modify storage math: in.y set value 90.0f
function #math:float
data modify storage calc: in set from storage math: out.add
function calc:main/to_radian
#* calc: in に元の値を渡す
execute store result storage calc: in float 0.000001 run data get storage calc: arcSin-Pos-Z 1000000
#* Armorstand kill
kill @e[tag=arcSin_1]
kill @e[tag=arcSin_2]

#tellraw @p {"bold":true,"color":"gold","nbt":"out","storage":"calc:"}
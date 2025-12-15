#* N/x
data modify storage math: in.x set from storage calc: in
data modify storage math: in.y set from storage calc: sqrt_x
function #math:float
data modify storage calc: sqrt_N/x set from storage math: out.div
#* x + N/x
data modify storage math: in.x set from storage calc: sqrt_x
data modify storage math: in.y set from storage calc: sqrt_N/x
function #math:float
#* ( x + N/x ) /2
data modify storage math: in.x set from storage math: out.add
data modify storage math: in.y set value 2.0f
function #math:float
#* 収束判定
data modify storage math: in.x set from storage math: out.div
data modify storage math: in.y set from storage calc: sqrt_x
function #math:float
execute store result score $sqrt_diff number run data get storage math: out.sub 10000
execute if score $sqrt_diff number < 2000 number run scoreboard players operation $sqrt_diff number *= -1 number
#tellraw @p ["new_sqrt: ",{"bold":true,"color":"gold","nbt":"in.x","storage":"math:"},"old_aqrt: ",{"bold":true,"color":"gold","nbt":"in.y","storage":"math:"},"$sqrt_diff: ",{"bold":true,"color":"gold","score":{"name":"$sqrt_diff","objective":"number"}}]
data modify storage calc: sqrt_x set from storage math: in.x
#誤差がある時のみもう一度実行
execute if score $sqrt_diff number > 2000 number run function calc:main/sqrt_loop


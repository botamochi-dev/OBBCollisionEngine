data modify storage math: in.y set from storage calc: in
function #math:float
data modify storage calc: exp_tmp set from storage math: out.mul
scoreboard players operation $exp_index number -= 1 number
data modify storage math: in.x set from storage math: out.mul
data modify storage math: in.y set value 100.0f
function #math:float
data modify storage calc: out set from storage math: out.div
data modify storage math: in.x set from storage calc: exp_tmp
tellraw @p [{"bold":true,"color":"gold","nbt":"out","storage":"calc:"},{"bold":true,"color":"blue","nbt":"exp_tmp","storage":"calc:"}]
execute if score $exp_index number > 1 number run function calc:main/exp_loop
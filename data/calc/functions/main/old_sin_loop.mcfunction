#* 2*n + 1
scoreboard players operation $sin_odd number = $sin_term number
scoreboard players operation $sin_odd number *= 2 number
scoreboard players operation $sin_odd number += 1 number

#* (-1)^n
scoreboard players operation $sin_term_tmp number = $sin_term number
scoreboard players operation $sin_term_tmp number %= 2 number

#* x^(2*n+1)
data modify storage calc: in set from storage calc: sin_x
execute store result storage calc: exp_index float 1 run scoreboard players get $sin_odd number
function calc:main/exp
data modify storage math: in.x set value -1f
data modify storage math: in.y set from storage calc: out
function #math:float
execute if score $sin_term_tmp number matches 0 run data modify storage math: in.x set from storage calc: out
execute if score $sin_term_tmp number matches 1 run data modify storage math: in.x set from storage math: out.mul

#* (2*n+1)!
execute store result storage calc: in float 1 run scoreboard players get $sin_odd number
function calc:main/factorial
data modify storage math: in.y set from storage calc: out

#* x^(2*n+1) / (2*n+1)!
function #math:float

#* 合計に加算
data modify storage math: in.x set from storage calc: sin_total
data modify storage math: in.y set from storage math: out.div
function #math:float
data modify storage calc: sin_total set from storage math: out.add

#* 次の項へ
scoreboard players operation $sin_term number += 1 number

#* ループ
execute if score $sin_term number <= 5 number run function calc:main/old_sin_loop
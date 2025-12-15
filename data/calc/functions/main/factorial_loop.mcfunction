scoreboard players operation $factorial_tmp number -= 1 number
scoreboard players operation $factorial number *= $factorial_tmp number
execute if score $factorial_tmp number > 1 number run function calc:main/factorial_loop
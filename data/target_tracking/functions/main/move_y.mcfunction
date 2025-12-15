execute as @s at @s run tp ^ ^0.0625 ^
scoreboard players operation $grid_y number -= 1 number
execute if score $grid_y number >= 1 number as @e[tag=paint_new] at @s run function paint:main/move_y

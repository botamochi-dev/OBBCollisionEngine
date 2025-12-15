data merge entity @e[tag=BDselect,limit=1] {transformation:{translation:[-0.5f,-0.5f,-0.5f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute as @e[tag=BDselect,limit=1] at @s run particle explosion ~ ~ ~ 0 0 0 1 1
execute as @p at @s run playsound entity.lightning_bolt.impact master @p ~ ~ ~ 1 1
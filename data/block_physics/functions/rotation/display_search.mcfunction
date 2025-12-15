#* 殴った面がどのディスプレイであるか判定する

#* プレイヤーからの距離が1番目、2番目、3番目に近いディスプレイにタグを付与
# タブ消去
tag @e[tag=rotation_display_near] remove rotation_display_near
# 1番目 
execute as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=rotation_display,tag=!rotation_display_near,limit=1,sort=nearest] run tag @s add rotation_display_near_1
execute as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=rotation_display,tag=!rotation_display_near,limit=1,sort=nearest] run tag @s add rotation_display_near
# 2番目
execute as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=rotation_display,tag=!rotation_display_near,limit=1,sort=nearest] run tag @s add rotation_display_near_2
execute as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=rotation_display,tag=!rotation_display_near,limit=1,sort=nearest] run tag @s add rotation_display_near
# 3番目
execute as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=rotation_display,tag=!rotation_display_near,limit=1,sort=nearest] run tag @s add rotation_display_near_3
execute as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=rotation_display,tag=!rotation_display_near,limit=1,sort=nearest] run tag @s add rotation_display_near



##* 殴ったxy座標が[-0.5,0.5]のディスプレイにタグを付与
#* 1番目のディスプレイのlocal_pos取得 
execute as @e[tag=rotation_display_near_1,tag=rotation_+x] at @s run function block_physics:main/display_viewpoint_x
execute as @e[tag=rotation_display_near_1,tag=rotation_-x] at @s run function block_physics:main/display_viewpoint_-x
execute as @e[tag=rotation_display_near_1,tag=rotation_+y] at @s run function block_physics:main/display_viewpoint_y
execute as @e[tag=rotation_display_near_1,tag=rotation_-y] at @s run function block_physics:main/display_viewpoint_-y
execute as @e[tag=rotation_display_near_1,tag=rotation_+z] at @s run function block_physics:main/display_viewpoint_z
execute as @e[tag=rotation_display_near_1,tag=rotation_-z] at @s run function block_physics:main/display_viewpoint_-z
#* 範囲内か調べる
execute store result score $rotation_local_pos_x number run data get storage display: local_pos[0] 10000
execute store result score $rotation_local_pos_y number run data get storage display: local_pos[1] 10000
execute if score $rotation_local_pos_x number > 5000 number run tag @e[tag=rotation_display_near_1] add rotation_out_of_range
execute if score $rotation_local_pos_y number > 5000 number run tag @e[tag=rotation_display_near_1] add rotation_out_of_range
execute if score $rotation_local_pos_x number < -5000 number run tag @e[tag=rotation_display_near_1] add rotation_out_of_range
execute if score $rotation_local_pos_y number < -5000 number run tag @e[tag=rotation_display_near_1] add rotation_out_of_range
#* 2番目のディスプレイのlocal_pos取得 
execute as @e[tag=rotation_display_near_2,tag=rotation_+x] at @s run function block_physics:main/display_viewpoint_x
execute as @e[tag=rotation_display_near_2,tag=rotation_-x] at @s run function block_physics:main/display_viewpoint_-x
execute as @e[tag=rotation_display_near_2,tag=rotation_+y] at @s run function block_physics:main/display_viewpoint_y
execute as @e[tag=rotation_display_near_2,tag=rotation_-y] at @s run function block_physics:main/display_viewpoint_-y
execute as @e[tag=rotation_display_near_2,tag=rotation_+z] at @s run function block_physics:main/display_viewpoint_z
execute as @e[tag=rotation_display_near_2,tag=rotation_-z] at @s run function block_physics:main/display_viewpoint_-z
#* 範囲内か調べる
execute store result score $rotation_local_pos_x number run data get storage display: local_pos[0] 10000
execute store result score $rotation_local_pos_y number run data get storage display: local_pos[1] 10000
execute if score $rotation_local_pos_x number > 5000 number run tag @e[tag=rotation_display_near_2] add rotation_out_of_range
execute if score $rotation_local_pos_y number > 5000 number run tag @e[tag=rotation_display_near_2] add rotation_out_of_range
execute if score $rotation_local_pos_x number < -5000 number run tag @e[tag=rotation_display_near_2] add rotation_out_of_range
execute if score $rotation_local_pos_y number < -5000 number run tag @e[tag=rotation_display_near_2] add rotation_out_of_range
#* 3番目のディスプレイのlocal_pos取得 
execute as @e[tag=rotation_display_near_3,tag=rotation_+x] at @s run function block_physics:main/display_viewpoint_x
execute as @e[tag=rotation_display_near_3,tag=rotation_-x] at @s run function block_physics:main/display_viewpoint_-x
execute as @e[tag=rotation_display_near_3,tag=rotation_+y] at @s run function block_physics:main/display_viewpoint_y
execute as @e[tag=rotation_display_near_3,tag=rotation_-y] at @s run function block_physics:main/display_viewpoint_-y
execute as @e[tag=rotation_display_near_3,tag=rotation_+z] at @s run function block_physics:main/display_viewpoint_z
execute as @e[tag=rotation_display_near_3,tag=rotation_-z] at @s run function block_physics:main/display_viewpoint_-z
#* 範囲内か調べる
execute store result score $rotation_local_pos_x number run data get storage display: local_pos[0] 10000
execute store result score $rotation_local_pos_y number run data get storage display: local_pos[1] 10000
execute if score $rotation_local_pos_x number > 5000 number run tag @e[tag=rotation_display_near_3] add rotation_out_of_range
execute if score $rotation_local_pos_y number > 5000 number run tag @e[tag=rotation_display_near_3] add rotation_out_of_range
execute if score $rotation_local_pos_x number < -5000 number run tag @e[tag=rotation_display_near_3] add rotation_out_of_range
execute if score $rotation_local_pos_y number < -5000 number run tag @e[tag=rotation_display_near_3] add rotation_out_of_range

#* プレイヤーからの距離が近いかつlocal_posが範囲内であるディスプレイにタグを付与
execute as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=rotation_display_near,tag=!rotation_out_of_range,limit=1,sort=nearest] run tag @s add rotation_display_click

#* 該当しなかったディスプレイは削除
kill @e[tag=rotation_display,tag=!rotation_display_click]

#* particle
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.1 0 0 0 0 1
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.2 0 0 0 0 1
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.3 0 0 0 0 1
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.4 0 0 0 0 1
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.5 0 0 0 0 1
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.6 0 0 0 0 1
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.7 0 0 0 0 1
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.8 0 0 0 0 1
execute as @e[tag=rotation_display_click] at @s run particle dust 1 1 1 1 ^ ^ ^0.9 0 0 0 0 1
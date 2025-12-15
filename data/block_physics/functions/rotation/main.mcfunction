#* local_pos取得
execute as @e[tag=rotation_display_click,tag=rotation_+x] at @s run function block_physics:main/display_viewpoint_x
execute as @e[tag=rotation_display_click,tag=rotation_-x] at @s run function block_physics:main/display_viewpoint_-x
execute as @e[tag=rotation_display_click,tag=rotation_+y] at @s run function block_physics:main/display_viewpoint_y
execute as @e[tag=rotation_display_click,tag=rotation_-y] at @s run function block_physics:main/display_viewpoint_-y
execute as @e[tag=rotation_display_click,tag=rotation_+z] at @s run function block_physics:main/display_viewpoint_z
execute as @e[tag=rotation_display_click,tag=rotation_-z] at @s run function block_physics:main/display_viewpoint_-z
#execute as @e[tag=display] at @s run function display_gui:main/common
#execute as @e[tag=rotation_display_click] at @s run function block_physics:main/display_viewpoint

#* グリッドID
function paint:main/grid_id

#* title
#title @a title ["",{"text":"x:"},{"score":{"name":"$grid_x","objective":"number"}},{"text":",y:"},{"score":{"name":"$grid_y","objective":"number"}}]
#title @p subtitle [{"bold":true,"color":"yellow","nbt":"local_pos","storage":"display:"}]
#title @a times 0 20 0

# z座標に0を追加する
data modify storage display: local_pos append value 0.0f

#* 殴った座標とブロックの表面の法線ベクトルの外積を計算し、回転ベクトルを求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage display: world_vector
data modify storage calc: in.y set from storage display: vector_zd_reverse
function calc:main/cross_product
data modify storage block_physics: rotation_vector set from storage calc: out
#* 回転ベクトルをクォータニオンに変換
data modify storage calc: in set value {}
data modify storage calc: in set from storage block_physics: rotation_vector
function calc:main/vector_to_quaternion
data modify storage block_physics: rotation_quaternion_base set from storage calc: out

#* 時間経過とともに回転速度が遅くなるようにブロックを回転
data modify storage block_physics: rotation_quaternion set from storage block_physics: rotation_quaternion_base
tag @e[tag=test,limit=1] add physics_rotating

tellraw @p "Clicked!"

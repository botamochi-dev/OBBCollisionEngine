###* ターゲット(tag=target) の位置と方向をプレイヤー(tag=target_tracking)に教える


##* 初期化
data modify storage target_tracking: target_Pos set value [0.0d,0.0d,0.0d]
data modify storage target_tracking: player_Pos set value [0.0d,0.0d,0.0d]
data modify storage target_tracking: player_forwardVector set value [0.0d,0.0d,0.0d]
data modify storage target_tracking: playerTotarget set value [0.0d,0.0d,0.0d]
##* 必要な情報を取得
#* ターゲット (座標target_Pos)
data modify storage target_tracking: target_Pos set from entity @e[tag=target,limit=1] Pos
#四捨五入して結果をスコアに代入
data modify storage calc: in set value {}
data modify storage calc: in set from storage target_tracking: target_Pos[0]
function calc:main/rounding
execute store result score $target_Pos_X number run data get storage calc: out 1
data modify storage calc: in set value {}
data modify storage calc: in set from storage target_tracking: target_Pos[1]
function calc:main/rounding
execute store result score $target_Pos_Y number run data get storage calc: out 1
data modify storage calc: in set value {}
data modify storage calc: in set from storage target_tracking: target_Pos[2]
function calc:main/rounding
execute store result score $target_Pos_Z number run data get storage calc: out 1
#* プレイヤー (座標player_Posと向きplayer_forwardVector)
#座標
data modify storage target_tracking: player_Pos set from entity @p[tag=target_tracking,limit=1] Pos
#向き(視線方向の単位ベクトル)
execute as @p[tag=target_tracking] at @s anchored feet positioned ^ ^ ^1 run summon minecraft:area_effect_cloud ^ ^ ^ {Tags:["player_forwardVector"]}
data modify storage target_tracking: player_forwardVector set from entity @e[tag=player_forwardVector,limit=1] Pos
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage target_tracking: player_forwardVector
data modify storage calc: in.y set from storage target_tracking: player_Pos
function calc:main/vector_sub
data modify storage target_tracking: player_forwardVector set value {}
data modify storage target_tracking: player_forwardVector set from storage calc: out
#* プレイヤーからターゲットへの方向ベクトル(playerTotarget)
execute as @p[tag=target_tracking] at @s anchored feet facing entity @e[tag=target,limit=1] feet positioned ^ ^ ^1 run summon minecraft:area_effect_cloud ^ ^ ^ {Tags:["playerTotarget"]}
data modify storage target_tracking: playerTotarget set from entity @e[tag=playerTotarget,limit=1] Pos
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage target_tracking: playerTotarget
data modify storage calc: in.y set from storage target_tracking: player_Pos
function calc:main/vector_sub
data modify storage target_tracking: playerTotarget set value {}
data modify storage target_tracking: playerTotarget set from storage calc: out
##* 計算
#* 右回りか左回りかを判定
#execute as @p[tag=target_tracking,limit=1] at @s facing entity @e[limit=1,tag=target] feet positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run say 右にいる
#execute as @p[tag=target_tracking,limit=1] at @s facing entity @e[limit=1,tag=target] feet positioned ^ ^ ^3.0 rotated as @s positioned ^-4.0 ^ ^ if entity @s[distance=..5.0] run say 左にいる
#data modify storage calc: in set value {}
#data modify storage calc: in.x set from storage target_tracking: player_forwardVector
#data modify storage calc: in.y set from storage target_tracking: playerTotarget
#function calc:main/cross_product
#data modify storage target_tracking: cross_product set from storage calc: out
#execute store result score $target_cross_product number run data get storage calc: out[2] 1000000
#execute if score $target_cross_product number > 0 number run tellraw @p "右回り"
#execute if score $target_cross_product number < 0 number run tellraw @p "左回り"
#execute if score $target_cross_product number = 0 number run tellraw @p "平行"
#* 距離計算
#target_Pos - player_Pos
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage target_tracking: target_Pos
data modify storage calc: in.y set from storage target_tracking: player_Pos
function calc:main/vector_sub
data modify storage target_tracking: distance set value {}
data modify storage target_tracking: distance set from storage calc: out
# ベクトルの長さを求める
data modify storage math: in set value {}
data modify storage math: in set from storage target_tracking: distance
function #math:length
data modify storage target_tracking: distance set from storage math: out
#四捨五入してスコアに結果を代入
data modify storage calc: in set value {}
data modify storage calc: in set from storage target_tracking: distance
function calc:main/rounding
execute store result score $target_distance number run data get storage calc: out 1
#* 方向計算
# プレイヤーの視線ベクトルとターゲットへの方向ベクトルをXZ平面に射影する
data modify storage target_tracking: player_forwardVector_copy set from storage target_tracking: player_forwardVector
data modify storage target_tracking: playerTotarget_copy set from storage target_tracking: playerTotarget
data modify storage target_tracking: player_forwardVector_copy[1] set value 0.0f
data modify storage target_tracking: playerTotarget_copy[1] set value 0.0f
# 2つのベクトル間の角度を計算
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage target_tracking: player_forwardVector_copy
data modify storage calc: in.y set from storage target_tracking: playerTotarget_copy
function calc:main/angle_between_vectors
#四捨五入してスコアに結果を代入
data modify storage calc: in set value {}
data modify storage calc: in set from storage calc: out
function calc:main/rounding
execute store result score $target_angle number run data get storage calc: out 1
#* 右回りか左回りかを判定
execute as @p[tag=target_tracking,limit=1] at @s facing entity @e[limit=1,tag=target] feet positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run scoreboard players operation $target_angle number *= -1 number
#execute as @p[tag=target_tracking,limit=1] at @s facing entity @e[limit=1,tag=target] feet positioned ^ ^ ^3.0 rotated as @s positioned ^-4.0 ^ ^ if entity @s[distance=..5.0] run scoreboard players operation $target_angle number *= -1 number

#* 四捨五入してスコアに結果を代入

##* プレイヤーの画面に表示
title @a actionbar ["",{"text":"\u30bf\u30fc\u30b2\u30c3\u30c8 x: "},{"score":{"name":"$target_Pos_X","objective":"number"}},{"text":" y: "},{"score":{"name":"$target_Pos_Y","objective":"number"}},{"text":" z: "},{"score":{"name":"$target_Pos_Z","objective":"number"}},{"text":" \u8ddd\u96e2: "},{"score":{"name":"$target_distance","objective":"number"}}]
#title @a title {"score":{"name":"$target_angle","objective":"number"}}

#* ボスバー
scoreboard players operation $target_bossbar_value number = $target_angle number
execute if score $target_angle number >= -45 number if score $target_angle number < 45 number run scoreboard players add $target_bossbar_value number 45
execute if score $target_angle number >= -45 number if score $target_angle number < 45 number run bossbar set minecraft:target name {"text":"\u30bf\u30fc\u30b2\u30c3\u30c8: \u2191"}
execute if score $target_angle number >= -45 number if score $target_angle number < 45 number run function target_tracking:main/bossbar_value_set

execute if score $target_angle number >= 45 number if score $target_angle number < 135 number run scoreboard players remove $target_bossbar_value number 45
execute if score $target_angle number >= 45 number if score $target_angle number < 135 number run bossbar set minecraft:target name {"text":"\u30bf\u30fc\u30b2\u30c3\u30c8: \u2190"}
execute if score $target_angle number >= 45 number if score $target_angle number < 135 number run function target_tracking:main/bossbar_value_set

execute if score $target_angle number >= -135 number if score $target_angle number < -45 number run scoreboard players add $target_bossbar_value number 135
execute if score $target_angle number >= -135 number if score $target_angle number < -45 number run bossbar set minecraft:target name {"text":"\u30bf\u30fc\u30b2\u30c3\u30c8: \u2192"}
execute if score $target_angle number >= -135 number if score $target_angle number < -45 number run function target_tracking:main/bossbar_value_set

execute if score $target_angle number >= 135 number if score $target_angle number <= 180 number run scoreboard players remove $target_bossbar_value number 135
execute if score $target_angle number >= 135 number if score $target_angle number <= 180 number run bossbar set minecraft:target name {"text":"\u30bf\u30fc\u30b2\u30c3\u30c8: \u2193"}
execute if score $target_angle number >= -180 number if score $target_angle number < -135 number run scoreboard players add $target_bossbar_value number 225
execute if score $target_angle number >= -180 number if score $target_angle number < -135 number run bossbar set minecraft:target name {"text":"\u30bf\u30fc\u30b2\u30c3\u30c8: \u2193"}
execute if score $target_angle number >= 135 number if score $target_angle number <= 180 number run function target_tracking:main/bossbar_value_set_behind
execute if score $target_angle number >= -180 number if score $target_angle number < -135 number run function target_tracking:main/bossbar_value_set_behind

# -45 <= angle < 45 正面
# 45 <= angle < 135 右
# 135 <= angle <= 180 or -180 <= angle < -135 後ろ
# -135 <= angle < -45
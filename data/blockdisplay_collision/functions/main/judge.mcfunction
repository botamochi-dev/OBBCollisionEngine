## 各軸に対して ( rA + rB ) - L を求める
## ( rA + rB ) - L >= 0 を満たさない軸が1つでもあれば衝突していない、すべての軸で満たしていれば衝突している

#* rA + rB 
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B
function calc:main/array_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].rA+rB set from storage calc: out

#* Length を temp にコピー
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length

#* スコアボードの初期化
scoreboard players set $blockdisplay_collision_result number 1

#* temp に要素がある場合にのみjudge_loopを実行
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp[0] run function blockdisplay_collision:main/judge_loop
#リセット
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp

# 判定結果を titleに表示
title @p title ""
execute if score $blockdisplay_collision_result number matches 0 run title @p subtitle {"text":"衝突している","bold":true}
execute if score $blockdisplay_collision_result number matches 1 run title @p subtitle {"text":"衝突していない","bold":true}
## 各軸に対して ( rA + rB ) - L を求める

# ( rA + rB ) - L
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].rA+rB
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp[0]
function calc:main/array_sub

# ( rA + rB ) - L >= 0 であるか判定
data modify storage calc: in set from storage calc: out
function calc:main/array_negative_judge


# 結果をAND演算
execute if score $array_negative_judge number matches 1 run scoreboard players operation $blockdisplay_collision_result number *= 0 number
execute if score $array_negative_judge number matches 0 run scoreboard players operation $blockdisplay_collision_result number *= 1 number

#* temp の先頭要素を削除
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp[0]

#* ループ処理
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp[0] run function blockdisplay_collision:main/judge_loop
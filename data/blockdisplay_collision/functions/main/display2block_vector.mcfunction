#* Blocks - Pos を計算し、結果をdisplay2block_vectorに格納する

#* 入力
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks[0]
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Pos

#* 計算
function calc:main/array_sub_low_prec

#* 出力
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].display2block_vector append from storage calc: out

#* 先頭要素を削除
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks[0]


#* ループ処理
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks[0] run function blockdisplay_collision:main/display2block_vector
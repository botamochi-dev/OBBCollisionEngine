data modify storage calc: in set value {}
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks run data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks[0]
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].TestAxis
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Distance append from storage calc: out
# データ削除
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Blocks[0]
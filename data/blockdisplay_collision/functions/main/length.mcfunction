### 分離軸15本すべての L を求める

##初期設定
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp[0]

##* 計算
# Ae1 ~ Ae3
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
#TODO : Be1 ~ Be3 は固定値なので計算をより省略可能
data modify storage calc: in.y set value [0.5f,0f,0f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set value [0f,0.5f,0f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set value [0f,0f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
# C11 ~ C33
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bx
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_By
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bz
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bx
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_By
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bz
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bx
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_By
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bz
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp append from storage calc: out

# 最後に絶対値化
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp
function calc:main/absolute_array
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp set from storage calc: out

#* Length に格納
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp

#* temp の先頭要素を削除
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp[0]

#* Length_temp のリセット
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Length_temp

#* ループ処理
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp[0] run function blockdisplay_collision:main/length
##* ブロックディスプレイの投影半径を求める ( r = 0.5|Ax・L| + 0.5|Ay・L| + 0.5|Az・L| )
#
# X
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].TestAxis
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 float 0.000000005 run data get storage calc: out 100000000
# Y
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].TestAxis
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.1 float 0.000000005 run data get storage calc: out 100000000
# Z
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].TestAxis
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.2 float 0.000000005 run data get storage calc: out 100000000
# X + Y + Z
data modify storage math: in set value {}
data modify storage math: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage math: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.1
function #math:float
data modify storage math: in.x set from storage math: out.add
data modify storage math: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.2
function #math:float
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage math: out.add
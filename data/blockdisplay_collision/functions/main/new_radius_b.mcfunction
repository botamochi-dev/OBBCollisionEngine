## 分離軸 15本すべての rA を求める


## A.e1 ~ A.e3
# A.e1
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
# A.e2
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
# A.e3
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out

## B.e1 ~ B.e3
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append value 0.5f
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append value 0.5f
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append value 0.5f

## C11 ~ C33
## C11
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bx
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.0f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
## C12
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_By
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.0f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
## C13
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bz
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.0f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
## C21
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bx
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.0f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
## C22
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_By
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.0f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
## C23
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bz
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.0f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
## C31
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bx
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.0f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
## C32
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_By
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.0f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out
## C33
data modify storage calc: in set value []
data modify storage calc: in set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bz
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.0f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_B append from storage calc: out

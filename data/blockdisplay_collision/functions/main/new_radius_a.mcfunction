## 分離軸 15本すべての rA を求める

## A.e1 ~ A.e3
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append value 0.5f
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append value 0.5f
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append value 0.5f
## B.e1 ~ B.e3
# B.e1
data modify storage calc: in set value []
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x[0]
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y[0]
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z[0]
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
# B.e2
data modify storage calc: in set value []
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x[1]
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y[1]
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z[1]
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
# B.e3
data modify storage calc: in set value []
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x[2]
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y[2]
data modify storage calc: in append from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z[2]
function calc:main/absolute_array
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage calc: out
data modify storage calc: in.y set value [0.5f,0.5f,0.5f]
function calc:main/dot_product
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C11 ~ C33
## C11
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bx
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bx
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C12
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_By
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_By
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C13
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bz
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ax_Bz
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C21
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bx
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bx
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C22
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_By
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_By
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C23
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bz
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.z
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Ay_Bz
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C31
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bx
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bx
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C32
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_By
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_By
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out
## C33
# 1つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.x
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bz
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0 set from storage calc: out
# 2つめの内積の絶対値を求める
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.y
data modify storage calc: in.y set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Axis.Az_Bz
function calc:main/dot_product
data modify storage calc: in set from storage calc: out
function calc:main/absolute_value
# 両者を足し合わせる
data modify storage calc: in set value {}
data modify storage calc: in.x set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].temp.0
data modify storage calc: in.y set from storage calc: out
function calc:main/value_add
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Radius_A append from storage calc: out


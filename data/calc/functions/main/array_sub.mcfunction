#* 配列A-Bを求める関数 (-10 ~ 10 くらいまでの数値に対応)

#! 注意
#! この関数を実行する前に data modify storage calc: in.x set value [x,y,z,w] を実行してデータを空にしたあとにcalc: in.x , in.y にデータを入力すること
#! calc: in にすでに数値が入っていると calc: in.x , in.y に数値を渡すことができないため

#* ~使い方~
#* /data modify storage calc: in.x set value [x,y,z,w]
#* /data modify storage calc: in.y set value [x,y,z,w] で二つのクォータニオンを入力
#* /function calc:main/array_sub を実行して計算
#* /data get storage calc: out を実行して結果を取得


#* リセット
data modify storage calc: out set value []


# calc を temp にコピー
data modify storage calc: temp1 set from storage calc: in.x
data modify storage calc: temp2 set from storage calc: in.y

# temp に要素がある場合にのみ判定を実行
execute if data storage calc: temp1[0] run function calc:main/array_sub_loop

#* リセット
data remove storage calc: temp1
data remove storage calc: temp2
data remove storage calc: temp3

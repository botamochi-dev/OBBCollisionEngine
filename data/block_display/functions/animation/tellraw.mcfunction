#* メモ tellrawのselectorを使えば色付き文字を使える
#/summon armor_stand ~ ~ ~ {CustomNameVisible:1b,Tags:["hello"],CustomName:'{"color":"gold","text":"HELLO!"}'}
#/tellraw @a {"selector":"@e[tag=hello]"}
#* BDselectのブロックID取得
data modify storage util: in set from entity @e[tag=BDselect,limit=1] block_state.Name
data modify storage util: in set value "minecraft:Block01."
#* 文字分割
function #util:split
#* 出力
data get storage util: out
#* 末尾にスペースを追加
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
data modify storage util: out append value " "
#* 初期化
data modify storage minecraft:animation tellraw set value [" |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
#* tellraw
tellraw @p [" ",{"nbt":"out[10]","storage":"util:"},{"nbt":"out[11]","storage":"util:"},{"nbt":"out[12]","storage":"util:"},{"nbt":"out[13]","storage":"util:"},{"nbt":"out[14]","storage":"util:"},{"nbt":"out[15]","storage":"util:"},{"nbt":"out[16]","storage":"util:"},{"nbt":"out[17]","storage":"util:"},{"nbt":"out[18]","storage":"util:"},{"nbt":"out[19]","storage":"util:"},{"nbt":"out[20]","storage":"util:"},{"nbt":"out[21]","storage":"util:"},{"nbt":"out[22]","storage":"util:"},{"nbt":"out[23]","storage":"util:"},{"nbt":"out[24]","storage":"util:"},{"nbt":"out[25]","storage":"util:"},{"nbt":"out[26]","storage":"util:"},{"nbt":"out[27]","storage":"util:"},{"nbt":"out[28]","storage":"util:"},{"nbt":"out[29]","storage":"util:"},{"nbt":"out[30]","storage":"util:"},{"nbt":"out[31]","storage":"util:"},{"nbt":"out[32]","storage":"util:"},{"nbt":"out[33]","storage":"util:"},{"nbt":"tellraw[0]","storage":"minecraft:animation"},{"nbt":"tellraw[1]","storage":"minecraft:animation"},{"nbt":"tellraw[2]","storage":"minecraft:animation"},{"nbt":"tellraw[3]","storage":"minecraft:animation"},{"nbt":"tellraw[4]","storage":"minecraft:animation"},{"nbt":"tellraw[5]","storage":"minecraft:animation"},{"nbt":"tellraw[6]","storage":"minecraft:animation"},{"nbt":"tellraw[7]","storage":"minecraft:animation"},{"nbt":"tellraw[8]","storage":"minecraft:animation"},{"nbt":"tellraw[9]","storage":"minecraft:animation"},{"nbt":"tellraw[10]","storage":"minecraft:animation"},{"nbt":"tellraw[11]","storage":"minecraft:animation"},{"nbt":"tellraw[12]","storage":"minecraft:animation"},{"nbt":"tellraw[13]","storage":"minecraft:animation"},{"nbt":"tellraw[14]","storage":"minecraft:animation"},{"nbt":"tellraw[15]","storage":"minecraft:animation"},{"nbt":"tellraw[16]","storage":"minecraft:animation"},{"nbt":"tellraw[17]","storage":"minecraft:animation"},{"nbt":"tellraw[18]","storage":"minecraft:animation"},{"nbt":"tellraw[19]","storage":"minecraft:animation"},{"nbt":"tellraw[20]","storage":"minecraft:animation"},{"nbt":"tellraw[21]","storage":"minecraft:animation"},{"nbt":"tellraw[22]","storage":"minecraft:animation"},{"nbt":"tellraw[23]","storage":"minecraft:animation"},{"nbt":"tellraw[24]","storage":"minecraft:animation"},{"nbt":"tellraw[25]","storage":"minecraft:animation"},{"nbt":"tellraw[26]","storage":"minecraft:animation"},{"nbt":"tellraw[27]","storage":"minecraft:animation"},{"nbt":"tellraw[28]","storage":"minecraft:animation"},{"nbt":"tellraw[29]","storage":"minecraft:animation"}]
#* 空いている行
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," ◆"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]
tellraw @p [" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," |"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," -"," |"]

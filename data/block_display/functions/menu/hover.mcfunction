
##視線先のblock displayを青色に発光
#team join block_display_glow @s

#Glowing付与
data merge entity @s {Glowing:1b,glow_color_override:44799}

#バグか不明だがblock display はteamで指定できないのでtagも付与
tag @s add BDhover
#効果音
execute as @p at @s run playsound entity.firework_rocket.shoot master @p ~ ~ ~ 1 2
#オフハンドのアイテム保存 (既にニンジン棒を持っている場合は保存しない)
execute unless entity @p[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"block display"}'}}}]}] run item replace block 1 4 12 container.0 from entity @p weapon.offhand
#オフハンドに人参棒セット
execute unless entity @p[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"block display"}'}}}]}] run item replace entity @p weapon.offhand with minecraft:carrot_on_a_stick{display:{Name:'{"text":"block display"}'}}


#2体選択をしないため、一度はtagを付与するがそのあとにplayerから一番遠いblock displayのtag team を削除
#BDhover_count にtag=BDhover がついたentityの数を記録して、2以上の場合には一体削除
execute store result score BDhover_count number run execute if entity @e[type=minecraft:block_display,tag=BDhover]
execute if score BDhover_count number >= 2 number as @p at @s run team leave @e[tag=BDhover,sort=furthest,limit=1]
execute if score BDhover_count number >= 2 number as @p at @s run tag @e[tag=BDhover,sort=furthest,limit=1] remove BDhover


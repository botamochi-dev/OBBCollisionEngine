#効果音
execute as @p at @s run playsound block.note_block.pling master @p ~ ~ ~ 1 2
data modify entity @e[tag=BDselect,limit=1] transformation set from storage minecraft:block_display_copy transformation
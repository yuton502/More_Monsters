execute as @s at @s if entity @e[type=#more_monsters:end_hostile,limit=1,distance=..1] run loot spawn ~ ~ ~ loot more_monsters:random/end_hostile
execute as @s at @s run function more_monsters:spawn

execute if score #IsRecursiveSpawn MM_Config matches 1 if score @s MM_Repeat <= #MaxRepeats MM_Config run function more_monsters:end_spawn
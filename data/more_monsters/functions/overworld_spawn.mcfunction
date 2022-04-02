execute as @s at @s if entity @e[tag=SpawnMonsters,type=#more_monsters:overworld_hostile,limit=1,dx=0,dy=0,dz=0] run loot spawn ~ ~ ~ loot more_monsters:random/overworld_hostile
execute as @s at @s run function more_monsters:spawn

execute if score #IsRecursiveSpawn MM_Config matches 1 if score @s MM_Repeat <= #MaxRepeats MM_Config as @s at @s run function more_monsters:overworld_spawn
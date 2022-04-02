execute as @s[tag=!Drowned,tag=!Ghast,tag=!Guardian,tag=!Phantom] at @s if entity @e[tag=SpawnMonsters,type=drowned,limit=1,dx=0,dy=0,dz=0] run tag @s add Drowned
execute as @s[tag=!Drowned,tag=!Ghast,tag=!Guardian,tag=!Phantom] at @s if entity @e[tag=SpawnMonsters,type=ghast,limit=1,dx=0,dy=0,dz=0] run tag @s add Ghast
execute as @s[tag=!Drowned,tag=!Ghast,tag=!Guardian,tag=!Phantom] at @s if entity @e[type=guardian,limit=1,dx=0,dy=0,dz=0] run tag @s add Guardian
execute as @s[tag=!Drowned,tag=!Ghast,tag=!Guardian,tag=!Phantom] at @s if entity @e[tag=SpawnMonsters,type=phantom,limit=1,dx=0,dy=0,dz=0] run tag @s add Phantom

execute as @s unless entity @s[tag=!Drowned,tag=!Ghast,tag=!Guardian,tag=!Phantom] store success score #Success MM_Config run loot spawn ~ ~ ~ loot more_monsters:random/other_hostile
execute as @s at @s if score #Success MM_Config matches 1 run function more_monsters:spawn

execute if score #IsRecursiveSpawn MM_Config matches 1 if score @s MM_Repeat <= #MaxRepeats MM_Config if score #Success MM_Config matches 1 run function more_monsters:other_spawn
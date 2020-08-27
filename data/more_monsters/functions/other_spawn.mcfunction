execute as @s[tag=!HasTag] at @s if entity @e[type=drowned,limit=1,distance=..1] run tag @s add Drowned
execute as @s[tag=!HasTag] at @s if entity @e[type=ghast,limit=1,distance=..1] run tag @s add Ghast
execute as @s[tag=!HasTag] at @s if entity @e[type=guardian,limit=1,distance=..1] run tag @s add Guardian
execute as @s[tag=!HasTag] at @s if entity @e[type=phantom,limit=1,distance=..1] run tag @s add Phantom

execute as @s unless entity @s[tag=!Drowned,tag=!Ghast,tag=!Guardian,tag=!Phantom] run loot spawn ~ ~ ~ loot more_monsters:random/other_hostile
execute as @s at @s run function more_monsters:spawn

execute if score #IsRecursiveSpawn MM_Config matches 1 if score @s MM_Repeat <= #MaxRepeats MM_Config run function more_monsters:other_spawn
execute as @s at @s unless entity @e[type=area_effect_cloud,tag=Spawner,dx=0,dy=0,dz=0] store success score @s MM_SCount run summon minecraft:area_effect_cloud ~ ~ ~ {Age:5s,Radius:2,Duration:500,Particle:"minecraft:cloud",Tags:["Spawner","More_Monsters"]}

execute as @e[type=area_effect_cloud,tag=Spawner] store result entity @s Duration int 1 run scoreboard players get #MaxRepeats MM_Config
tag @s[scores={MM_SCount=1..},tag=!Spawn_Already] add Spawn_Already

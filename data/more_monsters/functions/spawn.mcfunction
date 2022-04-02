#execute as @e[type=item,nbt={Item:{id:"minecraft:barrier"}}] run tellraw @a ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"is repeating"},{"score":{"name":"@s","objective":"MM_Repeat"}}]


#lootによって出現したアイテムによって敵をスポーンさせる
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/zombie] run summon minecraft:zombie
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/husk] run summon minecraft:husk
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/zombie_villager] run summon minecraft:zombie_villager
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/zombified_piglin] run summon minecraft:zombified_piglin
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/skeleton] run summon minecraft:skeleton
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/stray] run summon minecraft:stray
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/wither_skeleton] run summon minecraft:wither_skeleton
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/spider] run summon minecraft:spider
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/creeper] run summon minecraft:creeper
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/slime] run summon minecraft:slime
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/phantom] run summon minecraft:phantom
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/pillager] run summon minecraft:pillager
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/vindicator] run summon minecraft:vindicator
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/ravager] run summon minecraft:ravager
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/witch] run summon minecraft:witch
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/enderman] run summon minecraft:enderman
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/blaze] run summon minecraft:blaze
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/piglin] run summon minecraft:piglin
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/zoglin] run summon minecraft:zoglin
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/magma_cube] run summon minecraft:magma_cube
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/shulker] run summon minecraft:shulker ~ ~ ~ {Color:16b,Tags:["Despawn"]}

execute as @s[tag=Drowned] at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/is_spawn] run summon minecraft:drowned
#execute as @s[type=minecraft:enderman] at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/is_spawn] run summon minecraft:enderman
execute as @s[tag=Ghast] at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/is_spawn] run summon minecraft:ghast
execute as @s[tag=Guardian] at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/is_spawn] run summon minecraft:guardian
execute as @s[tag=Phantom] at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/is_spawn] run summon minecraft:phantom


execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/more_monsters] run tag @e[tag=!Spawner,type=#more_monsters:naturally_spawn_hostile,dx=0,dy=0,dz=0,sort=nearest] add Spawn_Already
execute as @s at @e[type=item,sort=nearest,limit=1,predicate=more_monsters:find_item/more_monsters] run tag @e[tag=!Spawner,type=#more_monsters:naturally_spawn_hostile,dx=0,dy=0,dz=0,sort=nearest] add More_Monsters

#自身のリピート回数が#MaxRepeatsに届くまでループ
scoreboard players add @s MM_Repeat 1
execute if score @s MM_Repeat = #MaxRepeats MM_Config run kill @s
execute positioned ~-0.25 ~-0.25 ~-0.25 as @e[sort=nearest,dx=0.5,dy=0.5,dz=0.5,type=item,predicate=more_monsters:find_item/more_monsters] run kill @s


#IsRecursiveSpawnが1(true)の場合、再帰処理で一気に行う
#execute if score #IsRecursiveSpawn MM_Config matches 1 if score @s MM_Repeat <= #MaxRepeats MM_Config as @s at @s run function more_monsters:spawn

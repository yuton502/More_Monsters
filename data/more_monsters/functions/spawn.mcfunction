#ディメンジョンごとにスポーンさせるMobを変える
#ドラウンドとガストとガーディアンは特殊扱い
execute as @s[tag=!HasTag,nbt={Dimension:0}] at @s if entity @e[type=#more_monsters:overworld_hostile,limit=1,distance=..1] run tag @s add Overworld
execute as @s[tag=!HasTag,nbt={Dimension:-1}] at @s if entity @e[type=#more_monsters:nether_hostile,limit=1,distance=..1] run tag @s add Nether
execute as @s[tag=!HasTag,nbt={Dimension:1}] at @s if entity @e[type=#more_monsters:end_hostile,limit=1,distance=..1] run tag @s add End
execute as @s[tag=!HasTag] at @s if entity @e[type=drowned,limit=1,distance=..1] run tag @s add Drowned
execute as @s[tag=!HasTag] at @s if entity @e[type=ghast,limit=1,distance=..1] run tag @s add Ghast
execute as @s[tag=!HasTag] at @s if entity @e[type=guardian,limit=1,distance=..1] run tag @s add Guardian
execute as @s unless entity @s[tag=!Overworld,tag=!Nether,tag=!End,tag=!Drowned,tag=!Ghast,tag=!Guardian] run tag @s add HasTag

execute as @s[tag=Overworld] at @s run loot spawn ~ ~ ~ loot more_monsters:random/overworld_hostile
execute as @s[tag=Nether] at @s run loot spawn ~ ~ ~ loot more_monsters:random/nether_hostile
execute as @s[tag=End] at @s run loot spawn ~ ~ ~ loot more_monsters:random/end_hostile
execute as @s at @s unless entity @s[tag=!Drowned,tag=!Ghast,tag=!Guardian] run loot spawn ~ ~ ~ loot more_monsters:random/other_hostile

#execute as @s run tellraw @a ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"is repeating"},{"score":{"name":"@s","objective":"MM_Repeat"}}]


#lootによって出現したアイテムによって敵をスポーンさせる
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:zombie}}}] run summon minecraft:zombie
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:husk}}}] run summon minecraft:husk
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:zombie_villager}}}] run summon minecraft:zombie_villager
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:zombie_pigman}}}] run summon minecraft:zombie_pigman
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:skeleton}}}] run summon minecraft:skeleton
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:stray}}}] run summon minecraft:stray
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:wither_skeleton}}}] run summon minecraft:wither_skeleton
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:spider}}}] run summon minecraft:spider
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:creeper}}}] run summon minecraft:creeper
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:slime}}}] run summon minecraft:slime
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:phantom}}}] run summon minecraft:phantom
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:pillager}}}] run summon minecraft:pillager
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:vindicator}}}] run summon minecraft:vindicator
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:ravager}}}] run summon minecraft:ravager
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:witch}}}] run summon minecraft:witch
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:enderman}}}] run summon minecraft:enderman
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:blaze}}}] run summon minecraft:blaze
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:magma_cube}}}] run summon minecraft:magma_cube
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{Mob:shulker}}}] run summon minecraft:shulker ~ ~ ~ {Color:16b,Tags:["Despawn"]}

execute as @s[tag=Drowned] at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{IsSpawn:true}}}] run summon minecraft:drowned
#execute as @s[type=minecraft:enderman] at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{IsSpawn:true}}}] run summon minecraft:enderman
execute as @s[tag=Ghast] at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{IsSpawn:true}}}] run summon minecraft:ghast
execute as @s[tag=Guardian] at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{IsSpawn:true}}}] run summon minecraft:guardian



#自身のリピート回数が#MaxRepeatsに届くまでループ
execute as @s at @e[type=item,sort=nearest,limit=1,nbt={Item:{id:"minecraft:barrier",tag:{ItemId:More_Monsters}}}] run tag @e[tag=!Spawner,type=#more_monsters:naturally_spawn_hostile,distance=..1,sort=nearest] add Spawn_Already

scoreboard players add @s MM_Repeat 1
execute if score @s MM_Repeat = #MaxRepeats MM_Config run kill @s
kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:barrier",tag:{ItemId:More_Monsters}}}]


#IsRecursiveSpawnが1(true)の場合、再帰処理で一気に行う
execute if score #IsRecursiveSpawn MM_Config matches 1 if score @s MM_Repeat <= #MaxRepeats MM_Config run function more_monsters:spawn

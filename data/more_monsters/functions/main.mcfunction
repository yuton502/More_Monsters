execute in the_nether run worldborder set 10000000
execute in the_nether store result score more_monsters _gm run worldborder get
execute in the_nether run worldborder set 1000000 9000

#自然スポーンする敵の指定
execute at @a as @e[sort=random,limit=1,distance=24..64,type=#more_monsters:naturally_spawn_hostile,predicate=!more_monsters:splitting_slime,tag=] run tag @s add SpawnMonsters
scoreboard players add @e[tag=SpawnMonsters,tag=!Spawn_Already] MM_SCount 1
execute as @e[tag=SpawnMonsters,scores={MM_SCount=3..}] run function more_monsters:set

#実際にスポーンさせる もしアイテムがあったらキルする
execute in minecraft:overworld as @e[type=area_effect_cloud,tag=Spawner,distance=0..] at @s run function more_monsters:overworld_spawn
execute in minecraft:the_nether as @e[type=area_effect_cloud,tag=Spawner,distance=0..] at @s run function more_monsters:nether_spawn
execute in minecraft:the_end as @e[type=area_effect_cloud,tag=Spawner,distance=0..] at @s run function more_monsters:end_spawn
execute as @e[type=area_effect_cloud,tag=Spawner] at @s run function more_monsters:other_spawn

kill @e[type=item,nbt={Item:{id:"minecraft:barrier",tag:{ItemId:More_Monsters}}}]


#アイテムを持つMobが現れる用に、定期的にPersistenceRequiredを0bにする
execute unless entity 00000000-0000-0006-0000-000000000006 as @e[type=#more_monsters:naturally_spawn_hostile,tag=More_Monsters,name=,predicate=!more_monsters:donot_despawn_item] run data merge entity @s {PersistenceRequired:0b}
execute unless entity 00000000-0000-0006-0000-000000000006 run summon minecraft:area_effect_cloud 0 0 0 {Duration:1200,Particle:"minecraft:note",Tags:["More_Monsters_CoolTime"],UUID:[I; 0, 6, 0, 6]}


#プレイヤーから一定距離、一定時間経ったシュルカーをデスポーンさせる
execute as @e[type=minecraft:shulker,tag=Despawn] at @s unless entity @a[distance=..24] run scoreboard players add @s MM_DCount 1
execute as @e[type=minecraft:shulker,tag=Despawn,scores={MM_DCount=3600..}] at @s unless entity @a[distance=..32] run data merge entity @s {DeathTime:19s,Health:0f}

#ワールドに入った際にloadを実行
execute as @p[scores={MM_LeaveCount=1..}] run function more_monsters:load
scoreboard players reset @a[scores={MM_LeaveCount=1..}] MM_LeaveCount

execute in the_nether store result score count _gm run worldborder get
scoreboard players operation more_monsters _gm -= count _gm


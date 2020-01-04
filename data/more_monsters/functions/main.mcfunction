#自然スポーンする敵の指定
execute at @a as @e[distance=20..80,type=#more_monsters:naturally_spawn_hostile,nbt=!{Size:1},nbt=!{Size:0},tag=!Spawn_Already] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age:5s,Radius:2,Duration:32768,Particle:"minecraft:cloud",Tags:["Spawner"]}
execute as @e[distance=20..80,type=#more_monsters:naturally_spawn_hostile,nbt=!{Size:1},nbt=!{Size:0},tag=!Spawn_Already] at @s if entity @e[type=minecraft:area_effect_cloud,distance=..0.5,limit=1,tag=Spawner] run tag @s add Spawn_Already

#実際にスポーンさせる もしアイテムがあったらキルする
execute as @e[type=minecraft:area_effect_cloud,tag=Spawner] at @s run function more_monsters:spawn
kill @e[type=item,nbt={Item:{id:"minecraft:barrier",tag:{ItemId:More_Monsters}}}]

#プレイヤーから一定距離、一定時間経ったシュルカーをデスポーンさせる
execute as @e[type=minecraft:shulker,tag=Despawn] at @s unless entity @a[distance=..24] run scoreboard players add @s MM_DCount 1
execute as @e[type=minecraft:shulker,tag=Despawn,scores={MM_DCount=3600..}] at @s unless entity @a[distance=..32] run data merge entity @s {DeathTime:19s,Health:0f}

#ワールドに入った際にloadを実行
execute as @p[scores={MM_LeaveCount=1..}] run function more_monsters:load
scoreboard players reset @a[scores={MM_LeaveCount=1..}] MM_LeaveCount
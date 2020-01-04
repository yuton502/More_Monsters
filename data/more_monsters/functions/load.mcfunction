scoreboard objectives add MM_Config dummy
scoreboard objectives add MM_Repeat dummy
scoreboard objectives add MM_DCount dummy
scoreboard objectives add MM_LeaveCount minecraft.custom:minecraft.leave_game

##MaxRepeatsが値を持っていない場合、初期値に5を入力
execute store success score #SuccessCount MM_Config run scoreboard players get #MaxRepeats MM_Config
execute if score #SuccessCount MM_Config matches 0 run scoreboard players set #MaxRepeats MM_Config 5

##IsRecursiveSpawnが値を持っていない場合、初期値に1(true)を入力
execute store success score #SuccessCount MM_Config run scoreboard players get #IsRecursiveSpawn MM_Config
execute if score #SuccessCount MM_Config matches 0 run scoreboard players set #IsRecursiveSpawn MM_Config 1


tellraw @a ["",{"text":"[More Monsters]","color":"aqua"},{"text":" Ver.1.1\n","color":"green"},{"text":"Produced by ","color":"gray"},{"text":"yuton502","color":"white"}]

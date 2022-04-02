execute as @e[tag=More_Monsters] run data merge entity @s {Health:0f,DeathTime:19s}
kill @e[type=item,predicate=more_monsters:find_item/more_monsters]
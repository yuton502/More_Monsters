execute as @e[tag=More_Monsters] run data merge entity @s {Health:0f,DeathTime:19s}
kill @e[type=item,nbt={Item:{tag:{ItemId:"More_Monsters"}}}]
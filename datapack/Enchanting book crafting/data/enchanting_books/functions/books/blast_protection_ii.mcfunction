#Blast protection II book

execute as @r at @s as @e[type=item,distance=..6,nbt={OnGround:1b,Item:{id:"minecraft:gunpowder",Count:32b}}] at @s run tag @s add drop_gunpowder_blast_protection_2
execute as @r at @s as @e[type=item,distance=..6,nbt={OnGround:1b,Item:{id:"minecraft:lapis_lazuli",Count:8b}}] at @s run tag @s add drop_lapis_lazuli_blast_protection_2
execute as @r at @s as @e[type=item,distance=..6,nbt={OnGround:1b,Item:{id:"minecraft:writable_book",Count:1b}}] at @s run tag @s add drop_writable_book_blast_protection_2

execute as @e[tag=drop_gunpowder_blast_protection_2] at @s if entity @e[tag=drop_lapis_lazuli_blast_protection_2,distance=..1] run tag @s add drop_enchanted_book_blast_protection_2
execute as @e[tag=drop_writable_book_blast_protection_2] at @s if entity @e[tag=drop_enchanted_book_blast_protection_2,distance=..1] run tag @s add craft_event_blast_protection_2

execute as @e[type=item,tag=craft_event_blast_protection_2] at @s run kill @e[tag=drop_lapis_lazuli_blast_protection_2,distance=..1,limit=1]
execute as @e[type=item,tag=craft_event_blast_protection_2] at @s run kill @e[tag=drop_enchanted_book_blast_protection_2,distance=..1,limit=1]
execute as @e[type=item,tag=craft_event_blast_protection_2] at @s run playsound minecraft:entity.experience_orb.pickup master @a
execute as @e[type=item,tag=craft_event_blast_protection_2] at @s run data merge entity @s {Motion:[0.0,0.3,0.0],Tags:[],Item:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:blast_protection",lvl:2}]}}}

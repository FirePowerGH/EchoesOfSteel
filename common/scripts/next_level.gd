extends Area2D

func _ready() -> void:
	randomize()

func _on_body_entered(body: Node2D) -> void:
	if get_tree().current_scene.name == "startLevel":
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/room_%s.tscn" % [str(randi() % 3)])
		return
	
	var levels = [0, 1, 2]
	var available = []
	var finishedLevels = levelSecretary.finishedLevels
	
	if len(finishedLevels) >= 3:
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/boss_room.tscn")
	
	for i in levels:
		if i not in finishedLevels:
			available.append(i)
	
	print(levelSecretary.adjacentLevels((int(String(get_tree().current_scene.name))))[0])
	
	if !levelSecretary.adjacentLevels(int(String(get_tree().current_scene.name)))[1]:
		print("generating new level..")
		var roomNum = available.pick_random()
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/room_%s.tscn" % [str(roomNum)])

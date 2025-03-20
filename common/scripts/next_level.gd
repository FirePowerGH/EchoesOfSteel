extends Area2D

func _ready() -> void:
	randomize()

func _on_body_entered(_body: Node2D) -> void:
	var room = get_tree().current_scene.name
	var levels = ["0", "1", "2"]
	var available = []
	var finishedLevels = levelSecretary.finishedLevels
	
	if room == "startLevel" && !finishedLevels:
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/room_%s.tscn" % [str(randi() % 3)])
		return
	elif room == "startLevel" && finishedLevels:
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/room_%s.tscn" % [str(finishedLevels[0])])
		return
	
	var nextLevel = levelSecretary.adjacentLevels(String(room))[1]
	
	print(finishedLevels)
	print(nextLevel)
	
	if len(finishedLevels) >= 3 && !nextLevel:
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/boss_room.tscn")
		return
	
	if nextLevel:
		print("yup")
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/room_%s.tscn" % [str(nextLevel)])
	
	for i in levels:
		if i not in finishedLevels:
			available.append(i)
	
	if !nextLevel:
		print("choosing new level..")
		var roomNum = available.pick_random()
		get_tree().change_scene_to_file.call_deferred("res://game/world/dungeon/rooms/room_%s.tscn" % [str(roomNum)])

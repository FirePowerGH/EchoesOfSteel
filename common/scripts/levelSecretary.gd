extends Node

var finishedLevels = []

func updateList(newLevel) -> void:
	finishedLevels.append(newLevel)

func adjacentLevels(level) -> Array:
	return [1, 0]

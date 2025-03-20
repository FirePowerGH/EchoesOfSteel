extends Node

var finishedLevels = []

func updateList(newLevel: String) -> void:
	if newLevel in finishedLevels:
		return
	
	finishedLevels.append(newLevel)

func adjacentLevels(level: String) -> Array:
	var index = finishedLevels.find(level)
	var backLevel = false
	var nextLevel = false
	
	if finishedLevels[-1] == level:
		nextLevel = false
	else:
		nextLevel = finishedLevels[index + 1]
	
	if index == 0:
		backLevel = false
	else:
		backLevel = finishedLevels[index - 1]
	
	return [backLevel, nextLevel]

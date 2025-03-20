extends Node

var finishedLevels = []

func updateList(newLevel: int) -> void:
	if newLevel in finishedLevels:
		return
	
	finishedLevels.append(newLevel)

func adjacentLevels(level: int) -> Array:
	print(level)
	var index = finishedLevels.find(level)
	
	if finishedLevels[-1] == level:
		return [finishedLevels[index - 1], false]
	
	if index == 0:
		return [false, finishedLevels[1]]
	
	return [finishedLevels[index - 1], finishedLevels[index + 1]]

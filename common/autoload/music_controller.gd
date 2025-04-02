extends Node

@onready var music = $music

var exploration = load("res://common/music/Exploration.mp3")
var titleMusic = load("res://common/music/FadingIntent.mp3")

func playExplore() -> void:
	music.stream = exploration
	music.play()

func playTitle() -> void:
	music.stream = titleMusic
	music.play()

func stopMusic() -> void:
	music.playing = false

func isPlaying():
	return music.playing

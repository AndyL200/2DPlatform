extends SoundComponent

@export var localSound : AudioStreamPlayer2D
@onready var sounds : Dictionary[String, AudioStream] = {
	"walk": preload("res://Assets/kenney_impact-sounds/Audio/footstep_grass_003.ogg"),
	"attack":preload("res://Assets/kenney_impact-sounds/Audio/impactPlate_medium_004.ogg"),
	"fall" : preload("res://Assets/kenney_interface-sounds/Audio/open_002.ogg"),
	"jump": preload("res://Assets/kenney_interface-sounds/Audio/scratch_004.ogg")
}


func play(aud : String) -> void:
	if not lock:
		lock = true
		localSound.stream = sounds[aud]
		localSound.play()
		await localSound.finished
		lock = false

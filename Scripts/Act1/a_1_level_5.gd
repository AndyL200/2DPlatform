extends Level

func _ready() -> void:
	GameManager.upgrade.connect(upgrade_animate)

func _on_level_end_component_change_level(i: int) -> void:
	level_end.emit(self, i)
	pass # Replace with function body.
	
func upgrade_animate() -> void:
	$UpgradeAnimation.play('upgrade')
	await $UpgradeAnimation.animation_finished
	$UpgradeAnimation.play('origin')

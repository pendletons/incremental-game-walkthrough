extends LinkButton
## Navigation link for Nebulas


func _ready() -> void:
	if Game.ref.data.cc_upgrades.upgrade_03_unlock_nebulas:
		visible = true

	else:
		visible = false
		HandlerCCUpgrades.ref.upgrade_03_unlock_nebulas.leveled_up.connect(_on_ccu03_level_up)


func _on_ccu03_level_up() -> void:
	visible = true
	HandlerCCUpgrades.ref.upgrade_03_unlock_nebulas.leveled_up.disconnect(_on_ccu03_level_up)

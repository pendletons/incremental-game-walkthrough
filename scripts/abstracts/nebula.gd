class_name Nebula
extends Node
## Abstract class containing the common features for Nebulas

@warning_ignore("unused_signal")
signal composition_updated

var given_name: String = tr("UNNAMED_NEBULA")

var data_index: int = -1

var stardust: int = 0

var stardust_consumed: int = 0


func _on_consume_stardust() -> void:
	var error: Error = HandlerStardust.ref.consume_stardust(stardust_consumed)

	if error:
		return

	stardust += stardust_consumed
	Game.ref.data.nebulas[data_index].stardust = stardust

	composition_updated.emit()

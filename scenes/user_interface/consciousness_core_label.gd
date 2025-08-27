class_name LabelConsciousnessCore
extends Label


func _ready() -> void:
	update_text()
	HandlerConsciousnessCore.ref.consciousness_core_created.connect(update_text)
	HandlerConsciousnessCore.ref.consciousness_core_consumed.connect(update_text)


## Update the label to correctly show the current consciousness core
func update_text(_quantity: int = -1) -> void:
	text = tr("CONSCIOUSNESS_CORE_AMOUNT") % Game.ref.data.consciousness_core

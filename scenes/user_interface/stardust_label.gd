class_name LabelStardust
extends Label
## Displays the current amount of stardust available


func _ready() -> void:
	update_text()
	HandlerStardust.ref.stardust_created.connect(update_text)
	HandlerStardust.ref.stardust_consumed.connect(update_text)


## Update the label to correctly show the current stardust
func update_text(_quantity: int = -1) -> void:
	text = tr("STARDUST_AMOUNT") % HandlerStardust.ref.stardust()

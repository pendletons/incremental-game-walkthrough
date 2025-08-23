class_name LabelStardust
extends Label
## Displays the current amount of stardust available

## Update the label to correctly show the current stardust
func update_text() -> void:
	text = "Stardust: %s" %Game.ref.data.stardust
	
## Temporary function to update the left panel label
func _process(_delta: float) -> void:
	update_text()

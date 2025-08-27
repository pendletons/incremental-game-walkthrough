class_name ComponentNebula
extends VBoxContainer

@export var label_name: Label

@export var label_composition: RichTextLabel

@export var consumption_slider: HSlider

var nebula: Nebula


func _ready() -> void:
	update_component()
	nebula.composition_updated.connect(update_label_composition)


func update_component() -> void:
	update_label_name()
	update_label_composition()
	update_slider()


func update_label_name() -> void:
	label_name.text = nebula.given_name


func update_label_composition() -> void:
	label_composition.text = tr("STARDUST_AMOUNT_BBCODE") % nebula.stardust


func update_slider() -> void:
	consumption_slider.max_value = 5
	consumption_slider.value = nebula.stardust_consumed


func _on_stardust_consumption_value_changed(value: float) -> void:
	HandlerNebulas.ref.update_nebula_stardust_consumption_value(nebula.data_index, int(value))

class_name ViewNebulas
extends View

@export var main_list: VBoxContainer

@export var scene_nebula: PackedScene = preload("res://scenes/views/nebulas/components/nebula.tscn")

@onready var handler: HandlerNebulas = HandlerNebulas.ref


func _ready() -> void:
	super()
	_generate_nebulas()
	handler.nebula_created.connect(_generate_newest_nebula)


func _on_create_nebula_button_up() -> void:
	handler.create_nebula()


func _generate_nebulas() -> void:
	if handler.nebulas.size() == 0:
		return

	for nebula: Nebula in handler.nebulas:
		_add_nebula_child_node(nebula)


func _generate_newest_nebula() -> void:
	var nebula_count: int = handler.nebulas.size()

	if nebula_count == 0:
		return

	_add_nebula_child_node(handler.nebulas[nebula_count - 1])


func _add_nebula_child_node(nebula: Nebula) -> void:
	var new_node: ComponentNebula = scene_nebula.instantiate() as ComponentNebula
	new_node.nebula = nebula
	main_list.add_child(new_node)

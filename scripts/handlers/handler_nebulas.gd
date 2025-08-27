class_name HandlerNebulas
extends Node

signal nebula_created

## Singleton reference
static var ref: HandlerNebulas

@export var timer: Timer

var nebulas: Array[Nebula] = []


## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return

	queue_free()


func _ready() -> void:
	load_nebulas()


func load_nebulas() -> void:
	if Game.ref.data.nebulas.size() == 0:
		return

	for index: int in Game.ref.data.nebulas.size():
		var current_nebula: DataNebula = Game.ref.data.nebulas[index]
		var new_nebula: Nebula = Nebula.new()
		new_nebula.name = current_nebula.name
		new_nebula.stardust = current_nebula.stardust
		new_nebula.stardust_consumed = current_nebula.stardust_consumed
		new_nebula.data_index = index

		timer.timeout.connect(new_nebula._on_consume_stardust)

		nebulas.append(new_nebula)


func get_all_nebulas() -> Array[Nebula]:
	return nebulas


func create_nebula() -> void:
	var new_nebula: Nebula = Nebula.new()
	new_nebula.data_index = nebulas.size()
	timer.timeout.connect(new_nebula._on_consume_stardust)
	nebulas.append(new_nebula)

	var data_nebula: DataNebula = DataNebula.new()
	data_nebula.name = new_nebula.given_name
	data_nebula.stardust = new_nebula.stardust
	data_nebula.stardust_consumed = new_nebula.stardust_consumed
	Game.ref.data.nebulas.append(data_nebula)

	nebula_created.emit()


func update_nebula_stardust_consumption_value(index: int, value: int) -> void:
	nebulas[index].stardust_consumed = value
	Game.ref.data.nebulas[index].stardust_consumed = value

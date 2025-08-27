class_name ProgressBarStardustMilestone
extends ProgressBar
## Displays the current progression towards next milestone

@onready var milestone: MilestoneStardust = HandlerConsciousnessCore.ref.stardust_milestone

@export var label: Label


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	milestone.progressed.connect(_on_milestone_progress)
	milestone.new_milestone_created.connect(_on_milestone_progress)


func _update_progress() -> void:
	max_value = milestone.stardust_goal
	value = milestone.stardust_progress

	label.text = "%s / %s" % [int(value), int(max_value)]


func _on_milestone_progress() -> void:
	_update_progress()

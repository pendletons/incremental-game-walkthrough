class_name ViewConsciousnessCore
extends View
## View displaying the upgrades purchaseable with Consciousness Core

@export var ccu_area: VBoxContainer

## Reference to the Component Upgrade scene
@export var component_upgrade_scene: PackedScene = preload(
	"res://scenes/components/upgrades/component_upgrade.tscn"
)


## Initialise the view
func _ready() -> void:
	super()
	initialise_upgrades()
	HandlerCCUpgrades.ref.upgrade_unlocked.connect(_on_upgrade_unlocked)


func initialise_upgrades() -> void:
	var upgrades: Array[Upgrade] = HandlerCCUpgrades.ref.get_all_unlocked_upgrades()

	if upgrades.size() == 0:
		return

	for upgrade: Upgrade in upgrades:
		var upgrade_node: ComponentUpgrade = (
			component_upgrade_scene.instantiate() as ComponentUpgrade
		)

		upgrade_node.upgrade = upgrade
		ccu_area.add_child(upgrade_node)


## Display a newly unlocked upgrade
func _on_upgrade_unlocked(_upgrade: Upgrade) -> void:
	for child: Node in ccu_area.get_children():
		child.queue_free()

	initialise_upgrades()

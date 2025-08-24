class_name SaveSystem

## Path of the save file
const SAVE_PATH : String = "user://save.tres"

## Boolean to store whether or not we should load save data
const SHOULD_LOAD_DATA : bool = false

static func save_data() -> void:
	ResourceSaver.save(Game.ref.data, SAVE_PATH)
	
static func load_data() -> void:
	if not SHOULD_LOAD_DATA:
		return
		
	if ResourceLoader.exists(SAVE_PATH):
		Game.ref.data = load(SAVE_PATH)

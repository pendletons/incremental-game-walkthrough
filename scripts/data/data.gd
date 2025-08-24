class_name Data
extends Resource
## Contain data to save and load

## Current amount of stardust available
@export var stardust : int = 0
## Current amount of the consciousness cores available
@export var consciousness_core : int = 1
## Level of the Upgrade01Clicker
@export var up_01_level : int = 0
## Level of the Upgrade02Generator
@export var up_02_level : int = 0

## Contains CCUpgrades data to save & load
@export var cc_upgrades : DataCCUpgrades = DataCCUpgrades.new()

## Contains universe data
@export var universe : DataUniverse = DataUniverse.new()

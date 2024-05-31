extends Node

# Variables for hexagon tile prefab and grid size
var hexagonPrefab = preload("res://addons/kaykit_medieval_hexagon_pack/Assets/obj/tiles/base/hex_grass.obj")
var gridSizeX = 10
var gridSizeY = 10

func _ready():
	generateHexagonGrid()

func generateHexagonGrid():
	for x in range(gridSizeX):
		for y in range(gridSizeY):
			var hexagon = hexagonPrefab.instance() # Instantiate hexagon tile
			var xPos = x * hexagon.size.x * 1.5 # Adjust for hexagon width and spacing
			var yPos = y * hexagon.size.y * 1.732 / 2  # Adjust for hexagon height and spacing
			if x % 2 == 1: # Offset every other row
				yPos += hexagon.size.y * 0.866

			hexagon.translation = Vector3(xPos, 0, yPos) # Set position
			add_child(hexagon) # Add hexagon to the scene

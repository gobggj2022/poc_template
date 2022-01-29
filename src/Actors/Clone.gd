class_name Clone
extends Actor

export(String) var action_suffix = ""

onready var ani = $AnimationPlayer
onready var sprite = $Sprite

var load_data : Dictionary = Dictionary()
var count = 0
var reverse_count = -1;

func _ready():
	load_data = load_file()
	reverse_count = load_data.size()
	pass

func load_file():
	var f := File.new()
	if f.file_exists("res://record.json"):
		f.open("res://record.json", File.READ)
		var result := JSON.parse(f.get_as_text())
		f.close()
		return result.result as Dictionary
	return Dictionary()
	
func _physics_process(_delta):
	#get_recording()
	get_reverse_recording()
	pass
	
func get_recording():
	count += 1
	var test = load_data.get(String(count))
	if(test != null):
		print(test[1])
		ani.play(test[0])
		global_position = str2var("Vector2" + test[1])
		sprite.flip_h = test[2]

func get_reverse_recording():
	reverse_count -= 1
	var test = load_data.get(String(reverse_count))
	if(test != null):
		print(test[1])
		ani.play(test[0])
		global_position = str2var("Vector2" + test[1])
		sprite.flip_h = test[2]

func _on_door_passed():
	print("heho from clone")
	

#func _ready():
#	# Static types are necessary here to avoid warnings.
#	var camera: Camera2D = $Camera
#	if action_suffix == "_p1":
#		camera.custom_viewport = $"../.."
#	elif action_suffix == "_p2":
#		var viewport: Viewport = $"../../../../ViewportContainer2/Viewport"
#		viewport.world_2d = ($"../.." as Viewport).world_2d
#		camera.custom_viewport = viewport


# Physics process is a built-in loop in Godot.
# If you define _physics_process on a node, Godot will call it every frame.

# We use separate functions to calculate the direction and velocity to make this one easier to read.
# At a glance, you can see that the physics process loop:
# 1. Calculates the move direction.
# 2. Calculates the move velocity.
# 3. Moves the character.
# 4. Updates the sprite direction.
# 5. Shoots bullets.
# 6. Updates the animation.

# Splitting the physics process logic into functions not only makes it
# easier to read, it help to change or improve the code later on:
# - If you need to change a calculation, you can use Go To -> Function
#   (Ctrl Alt F) to quickly jump to the corresponding function.
# - If you split the character into a state machine or more advanced pattern,
#   you can easily move individual functions.
	# We use the sprite's scale to store Robi’s look direction which allows us to shoot
	# bullets forward.
	# There are many situations like these where you can reuse existing properties instead of
	# creating new variables.

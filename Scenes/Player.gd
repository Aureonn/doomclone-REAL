extends KinematicBody

var velocity = Vector3()

var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002

onready var pistol = preload("res://scenes/PISTOL.tscn")
onready var shotgun = preload ("res://scenes/SHOTGUN.tscn")
onready var ak47 = preload ("res://scenes/ak47.tscn")
onready var rocketlauncher = preload ("res://scenes/RocketLauncher.tscn")
var current_gun = 0
onready var carried_guns = [pistol, shotgun, ak47, rocketlauncher]

#funcition
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("move_forward"):
		input_dir += -global_transform.basis.z
	if Input.is_action_pressed("move_backward"):
		input_dir += global_transform.basis.z
	if Input.is_action_pressed("strafe_left"):
		input_dir += -global_transform.basis.x
	if Input.is_action_pressed("strafe_right"):
		input_dir += global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		$Pivot.rotation.x = clamp ($Pivot.rotation.x, -1.2, 1.2)
	
	
func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
func change_gun(gun):
	$Pivot/Gun.get_child(0).queue_free()
	var new_gun = carried_guns[gun].instance()
	$Pivot/Gun.add_child(new_gun)
	PlayerStats.current_gun = new_gun.name
	
func _process(delta):
	if Input.is_action_just_pressed("next_gun"):
		current_gun +=1
		if current_gun > len(carried_guns)-1:
			current_gun = 0
		change_gun(current_gun)
	elif Input.is_action_just_pressed("prev_gun"):
		current_gun -=1
		if current_gun < 0:
			current_gun = len(carried_guns)-1
		change_gun(current_gun)
	

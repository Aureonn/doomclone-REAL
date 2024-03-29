extends Node
#Player variables


var health = 100
var max_health = 200
var armor = 0
var max_armor = 100
var guns_carried = []
var ammo_pistol = 100
var ammo_rocket = 20
var ammo_shells = 35
var ammo_plasma = 0
var ammo_ak = 200
var ammo_max_pistol = 200
var ammo_max_ak = 500
var ammo_max_rocket = 50
var ammo_max_shells = 100
var ammo_max_plasma = 200
	
var red_key = false
var blue_key = false
var yellow_key = false
var current_gun = "Pistol"

func reset():
	health = 100
	max_health = 200
	armor = 0
	max_armor = 100
	guns_carried = []
	ammo_pistol = 50
	ammo_rocket = 0
	ammo_shells = 0
	ammo_plasma = 0
	ammo_max_pistol = 200
	ammo_max_rocket = 50
	ammo_max_shells = 100
	ammo_max_plasma = 200
	ammo_max_ak = 500
	red_key = false
	blue_key = false
	yellow_key = false
	current_gun = "Pistol"

func _ready():
	pass
	
func take_damage(amount):
	var tmp = amount
	if amount > armor:
		amount = amount - armor
		armor = 0
	else:
		change_armor(-amount)
		return
	###apply remaining damage to health
	change_health(-amount)
		
	
func change_health(amount):
	health += amount
	health = clamp(health, 0, max_health)
	
func change_armor(amount):
	armor += amount
	armor = clamp(armor,0,max_armor)
	
func change_pistol_ammo(amount):
	ammo_pistol+=amount
	ammo_pistol = clamp(ammo_pistol,0,ammo_max_pistol)
	
func change_shotgun_ammo(amount):
	ammo_shells+=amount
	ammo_shells = clamp(ammo_shells,0,ammo_max_shells)
	
func change_rocket_ammo(amount):
	ammo_rocket+=amount
	ammo_rocket = clamp(ammo_rocket,0,ammo_max_rocket)
	
func change_plasma_ammo(amount):
	ammo_plasma+=amount
	ammo_plasma = clamp(ammo_plasma,0,ammo_max_plasma)
	
func change_ak_ammo(amount):
	ammo_ak+=amount
	ammo_ak = clamp(ammo_ak,0,ammo_max_ak)
	
func get_pistol_ammo():
	return str(ammo_pistol)

func get_shotgun_ammo():
	return str(ammo_shells)

func get_rocket_ammo():
	return str(ammo_rocket)
	
func get_plasma_ammo():
	return str(ammo_plasma)
	
func get_health():
	return str(health)

func get_armor():
	return str(armor)
	
func get_ak_ammo():
	return str(ammo_ak)

	

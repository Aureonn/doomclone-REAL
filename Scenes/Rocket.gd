extends Area

var rocket_speed = 10

func deal_damage(amount):
	pass
	
func _process(delta):
	translate(Vector3.FORWARD * speed * delta)


func _on_Rocket_body_entered(body):
	pass # Replace with function body.


func _on_SplashDMG_body_entered(body):
	pass # Replace with function body.

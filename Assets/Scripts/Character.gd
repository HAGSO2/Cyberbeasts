extends CharacterBody2D


#@onready var animated_sprite_2D = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#animated_sprite_2D.play("idle_down")
	pass

var speed = 200  # Velocidad de movimiento
#-----------------------------------#
#		Animations variables		#
#-----------------------------------#
var last_direction = Vector2.ZERO	#
var idle = true						#
#Surf								#
#Flying								#
# etc...							#
#-----------------------------------#
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Proces_input()
	#Proces_Animation()
	move_and_collide(direction * speed * delta)
	
func Proces_input() -> Vector2:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	
	# Normaliza la dirección para movimiento uniforme en diagonales
	if direction.length() > 0:
		direction = direction.normalized()
		last_direction = direction
		idle = false
	else:
		idle = true
		
	return direction
	
	
#func Proces_Animation():
	#if idle:
		#if last_direction.y > 0:
			#animated_sprite_2D.play("idle_down")
		#elif last_direction.x < 0:
			#animated_sprite_2D.play("idle_left")
		#elif last_direction.x > 0:
			#animated_sprite_2D.play("idle_right")
		#else:
			#animated_sprite_2D.play("idle_up")
	#else:
		#if last_direction.y > 0:
			#animated_sprite_2D.play("run_down")
		#elif last_direction.x < 0:
			#animated_sprite_2D.play("run_left")
		#elif last_direction.x > 0:
			#animated_sprite_2D.play("run_right")
		#else:
			#animated_sprite_2D.play("run_up")

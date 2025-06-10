extends CharacterBody2D

@export var spd := 150
@export var attack_cooldown := 0.5

var last_dir := "D"
var is_attacking := false
var attack_timer := 0.0

func _ready():
	$AnimBXN.play("Idle")

func _process(delta):
	var mov = handle_movement(delta)
	handle_attack()
	update_attack_timer(delta)
	update_animation(mov)

	if Input.is_key_pressed(KEY_Q):
		queue_free()

# ----------------------------
# Movimiento (ahora siempre permitido)
# ----------------------------
func handle_movement(delta):
	var mov = Vector2.ZERO

	if Input.is_action_pressed("L_MOVE"):
		mov.x -= 1
	if Input.is_action_pressed("R_MOVE"):
		mov.x += 1
	if Input.is_action_pressed("U_MOVE"):
		mov.y -= 1
	if Input.is_action_pressed("D_MOVE"):
		mov.y += 1

	mov = mov.normalized()
	velocity = mov * spd
	move_and_slide()  # movimiento siempre permitido

	# Solo actualiza dirección si no está atacando
	if mov != Vector2.ZERO and not is_attacking:
		if abs(mov.x) > abs(mov.y):
			last_dir = "R" if mov.x > 0 else "L"
		else:
			last_dir = "D" if mov.y > 0 else "U"

	return mov

# ----------------------------
# Ataque
# ----------------------------
func handle_attack():
	if Input.is_action_just_pressed("ATACK") and not is_attacking:
		is_attacking = true
		attack_timer = attack_cooldown
		$AnimBXN.play(last_dir + "_Atack")

# ----------------------------
# Timer de ataque
# ----------------------------
func update_attack_timer(delta):
	if is_attacking:
		attack_timer -= delta
		if attack_timer <= 0.0:
			is_attacking = false

# ----------------------------
# Animaciones
# ----------------------------
func update_animation(mov):
	if is_attacking:
		return  # no reproducimos otra animación si está atacando

	if mov != Vector2.ZERO:
		$AnimBXN.play(last_dir + "_Move")
	else:
		$AnimBXN.play("Idle")

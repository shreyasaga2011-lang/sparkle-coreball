extends Node
var multi = 1
var explosionBool = false

func upFirerate():
	if multi < 0.3:
		print(str(multi))
	else:
		multi -= 0.1
		print(str(multi))

func explosionUpgrade():
	if explosionBool == false:
		explosionBool = true
	else:
		explosionBool = false

var forcefieldBool = false
func buyForceField():
	forcefieldBool = true
var forceBlast = false

func buyForceBlast():
	forceBlast = true

var currentSpeed = 400
var dynamicSpeed = 100
func upMoveSpeed():
	currentSpeed += dynamicSpeed
	dynamicSpeed *= 0.90


var currentHealth = 5

signal force_blast_requested

func healthTick():
	currentHealth -= 1
	if forcefieldBool == true:
		emit_signal("force_blast_requested")

func healthAdd():
	currentHealth += 1
var shurikenBool = false

func buyShuriken():
	shurikenBool = true


var shurikenGlobalCooldown := 1.0
var cooldown_timer: SceneTreeTimer = null
var shuriken_on_cooldown := false

func start_shuriken_cooldown():
	if shuriken_on_cooldown:
		return

	shuriken_on_cooldown = true
	cooldown_timer = get_tree().create_timer(shurikenGlobalCooldown)

	await cooldown_timer.timeout

	cooldown_timer = null
	shuriken_on_cooldown = false

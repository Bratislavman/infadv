extends CharacterBody2D
class_name Hero
const SPEED :float = 300.0
var target
var commands :Array = []
var attributes :Dictionary = {}
@export var isHero = false
var attackDistance = 10
var damage = 10

@onready var _animation_player = $AnimationPlayer
@onready var _sprite = $Sprite2D

func _physics_process(delta: float) -> void:
	if (isLive()):
		if commands.size() && commands[0] is CommandMove && target && commands[0].actionDistance > 0: 
			move()
			move_and_slide()
	
func _ready() -> void:
	playAnim("unit/stay")
	attributes['dmg'] = Attributes.new('Урон', 10)
	attributes['hp'] = Attributes.new('Жизни', 10)
	

func move() -> void:
	var distTargetPosition
	var permissibleDistance = commands[0].actionDistance

	distTargetPosition = target.global_position - global_position
	var direction:Vector2 = distTargetPosition.normalized()
	if direction.x > 0:
		direction.x = 1
	elif direction.x < 0:
		direction.x = -1
				
	# завершяем движение и совершаем экшен команды движения где оно уничтожается с объектом мыши
	if G.checkDistance(self, target, permissibleDistance) && commands[0] is CommandMove:
		playAnim("unit/stay")
		commands[0].action()
		velocity = Vector2.ZERO
	else:
		playAnim("unit/run")
		velocity.x = (direction.x * SPEED)

	# инвертируем спрайт к цели
	if signf(velocity.x) != 0:
		_sprite.flip_h = velocity.x < 0

func initTargetAction() -> void:
	pass

func removeCommand():
	commands.pop_front()

func isLive():
	return attributes['hp'].value > 0
	
func dmg():
	attributes['hp'].minus(damage)
	if (!isLive()):
		playAnim("unit/death")
	
func playAnim(animName):
	if _animation_player:
		_animation_player.play(animName)
		
func actionAnimation():
	commands[0].actionAnimation()
	
func endAnimation():
	commands[0].endAnimation()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body, 'event4545') # Replace with f


func _on_button_button_up() -> void:
	if !isHero && isLive():
		CommandAttackMelee.new(G.hero, self)

extends ParallaxLayer

@export var scroll_speed: float = 100.0
@export var boosted_speed_multiplier: float = 3.0
@export var image_width: float = 2500.0  # Largura da imagem

# Variável interna para armazenar a velocidade atual
var current_speed: float

func _ready() -> void:
	# Inicializa a velocidade padrão
	current_speed = scroll_speed

func _process(delta: float) -> void:
	# Checa se a seta para a direita está pressionada
	if Input.is_action_pressed("ui_right"):
		current_speed = scroll_speed * boosted_speed_multiplier
	else:
		current_speed = scroll_speed

	# Move todas as imagens
	for sprite in get_children():
		sprite.position.x -= current_speed * delta

		# Reposiciona se a imagem sair da tela
		if sprite.position.x <= -image_width:
			sprite.position.x += image_width * 0.7

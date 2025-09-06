extends AudioStreamPlayer2D

var generator: AudioStreamGenerator
var generator_playback: AudioStreamGeneratorPlayback

func _ready():
	generator = AudioStreamGenerator.new()
	generator.mix_rate = 44100
	generator.buffer_length = 0.1
	stream = generator
	play()
	generator_playback = get_stream_playback()

# Função para gerar beep 1-bit
func play_beep(frequency: float, duration: float = 0.1):
	if not generator_playback:
		return

	var sample_rate = generator.mix_rate
	var samples = int(sample_rate * duration)
	for i in range(samples):
		var t = float(i) / sample_rate
		var value = 0.0
		if fmod(t * frequency, 1.0) < 0.5:
			value = 1.0
		else:
			value = -1.0
		generator_playback.push_frame(Vector2(value, value))


# Som de moeda
func play_coin():
	play_beep(8000, 0.1)
	await get_tree().create_timer(0.1).timeout
	play_beep(2000, 0.1)

# Som de morte
func play_death():
	play_beep(220, 0.3)

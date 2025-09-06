extends AudioStreamPlayer2D

var generator: AudioStreamGenerator
var generator_playback: AudioStreamGeneratorPlayback
var is_playing_song = false

func _ready():
	generator = AudioStreamGenerator.new()
	generator.mix_rate = 44100
	generator.buffer_length = 0.1
	stream = generator

func start_song():
	if not is_playing_song:
		play()
		generator_playback = get_stream_playback()
		is_playing_song = true
		generate_loop()

func stop_song():
	if is_playing_song:
		is_playing_song = false
		stop()

func generate_loop():
	var sample_rate = generator.mix_rate
	var notes = [440, 550, 660, 880, 660, 550]
	var duration = 0.2

	while is_playing_song:
		for freq in notes:
			if not is_playing_song:
				return
			var samples = int(sample_rate * duration)
			for i in range(samples):
				var t = float(i) / sample_rate
				var value = 0.1 if fmod(t * freq, 1.0) < 0.5 else -0.1
				generator_playback.push_frame(Vector2(value, value))
			await get_tree().create_timer(duration).timeout

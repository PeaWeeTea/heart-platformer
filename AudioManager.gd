extends Node

func play_sfx(sound: AudioStream, parent: Node):
	if sound != null and parent != null:
		var stream = AudioStreamPlayer.new()
		
		stream.volume_db = -5.0
		stream.stream = sound
		stream.PROCESS_MODE_ALWAYS
		
		parent.add_child(stream)
		stream.play()
		await stream.finished
		if stream.playing == false:
			stream.queue_free()

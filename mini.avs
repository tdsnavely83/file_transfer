part24b = DirectShowSource("Part 24-2.mp4", fps=30, convertfps=True).ReclockAudio().trim(1000,1500)

function ReclockAudio(clip c)
{
	AR = c.AudioRate()
	TR = Float(AR)*AR*c.FrameCount()/(c.AudioLengthF()*c.FrameRate())
	KScale = Int($7FFFFFFF/TR)
	c.ResampleAudio(Round(TR*KScale), KScale)
	c.AssumeSampleRate(AR)
}

return part24b


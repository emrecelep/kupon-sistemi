function showImage()
	sw, sh = guiGetScreenSize()
	resim = guiCreateStaticImage(0, 0, sw, sh, "banner.jpg", false)
	guiSetAlpha(resim, 0)
	alpha = 0
	setTimer(function() alpha = alpha+0.1 guiSetAlpha(resim, alpha) end, 100, 10)
	setTimer(destroyElement, 10000, 1, resim)
	--sound = playSound("sound.mp3")
	setTimer(setSoundVolume, 10000, 1, sound, 0.4)
end
addEvent("showImage", true)
addEventHandler("showImage", root, showImage)
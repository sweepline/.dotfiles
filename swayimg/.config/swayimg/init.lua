-- swayimg configuration (Lua script, v5.x)
-- See /usr/share/doc/swayimg/CONFIG.md and /usr/share/swayimg/example.lua

-- Use sway's own window decorations (pixel border) instead of client-side
-- decorations, so swayimg looks like every other window.
swayimg.decoration = false

-- Scale mode for newly opened images.
-- "optimal" = 100% for small images, scaled down to fit the window for big ones.
-- Aspect ratio is always preserved in every mode except "fill" (which crops).
-- Press F in the viewer to cycle: optimal / width / height / fit / fill / real.
swayimg.viewer.default_scale = "optimal"

-- Center the image in the window.
swayimg.viewer.default_position = "center"

-- Make the window match the image aspect ratio, but never exceed MAX_W x MAX_H.
local MAX_W = 1280
local MAX_H = 800
local MIN_SIDE = 200 -- keep the long side at least this big for tiny images

swayimg.on_initialized(function()
	local img = swayimg.viewer.get_image()
	if not img then
		return
	end
	local s = math.min(1, MAX_W / img.width, MAX_H / img.height)
	local long = math.max(img.width, img.height)
	if long * s < MIN_SIDE then
		s = MIN_SIDE / long
	end
	swayimg.set_window_size(
		math.floor(img.width * s + 0.5),
		math.floor(img.height * s + 0.5)
	)
	-- re-center once the compositor has applied the new size
	swayimg.defer(0.1, function()
		os.execute([[swaymsg '[app_id="swayimg"] move position center']])
	end)
end)

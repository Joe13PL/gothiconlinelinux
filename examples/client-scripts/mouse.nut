enum DrawColor
{
	RED,
	GREEN,
	BLUE
}

local drawPos = null
local currColor = DrawColor.RED
local colorValue = 150

local function init()
{
	setCursorVisible(true)

	drawPos = Draw(0, 0, "")
	drawPos.color.set(150, 0, 0)
	drawPos.visible = true
}

addEventHandler("onInit", init)

local function mouseClick(btn)
{
	colorValue = 150

	switch (btn)
	{
	case MOUSE_BUTTONLEFT:
		currColor = DrawColor.RED
		drawPos.color.set(colorValue, 0, 0)
		break

	case MOUSE_BUTTONRIGHT:
		currColor = DrawColor.GREEN
		drawPos.color.set(0, colorValue, 0)
		break

	case MOUSE_BUTTONMID:
		currColor = DrawColor.BLUE
		drawPos.color.set(0, 0, colorValue)
		break
	}
}

addEventHandler("onMouseDown", mouseClick)

local function mouseRelease(btn)
{
	local pos = getCursorPositionPx()

	drawPos.text = format("%d, %d", pos.x, pos.y)
	drawPos.setPositionPx(pos.x, pos.y)
}

addEventHandler("onMouseUp", mouseRelease)

local function mouseWheel(value)
{
	colorValue += (value * 5)

	switch (currColor)
	{
	case DrawColor.RED:
		drawPos.color.set(colorValue, 0, 0)
		break

	case DrawColor.GREEN:
		drawPos.color.set(0, colorValue, 0)
		break

	case DrawColor.BLUE:
		drawPos.color.set(0, 0, colorValue)
		break
	}
}

addEventHandler("onMouseWheel", mouseWheel)
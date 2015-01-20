local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local geometry = require "mjolnir.geometry"
local alert = require "mjolnir.alert"

-- luarocks install mjolnir.application
-- luarocks install mjolnir.hotkey
-- luarocks install mjolnir.alert

local function log(string)
  print(string)
end

local function frameString(frame)
  return "x: " .. frame.x .. " Y: " .. frame.y .. " @ " .. frame.w .. "x" .. frame.h
end

local function logFrame(frame, title)
  if title then
    log(title .. ": " .. frameString(frame))
  else
    log(frameString(frame))
  end
end

local function isClose(a, b, threshold)
  if not threshold then
    threshold = 20
  end

  return a == b or (a > b - threshold and a < b + threshold)
end

local function framesEqual(a, b)
  -- x and y must be exact
  -- width and height use isClose() because they can be imprecise depending on the application
  return isClose(a.x, b.x, 2) and isClose(a.y, b.y, 2) and isClose(a.w, b.w) and isClose(a.h, b.h)
end

frameGroups = {}
local function groupForScreen(group, screen)
  local win = window.focusedwindow()
  local s = screen:frame()
  local screenKey = s.x .. s.y .. s.w .. s.h

  if frameGroups[screenKey] then
    if frameGroups[screenKey][group] then
      return frameGroups[screenKey][group]
    end
  else
    frameGroups[screenKey] = {}
  end

  -- hydra.alert(screenKey, 2)
  local newGroup = {}

  if group == "halves" then
    newGroup = {
      -- left half
      geometry.rect(s.x, s.y, s.w/2, s.h),
      -- right half
      geometry.rect(s.x + s.w/2, s.y, s.w/2, s.h)
    }
  elseif group == "center" then
    local centeredOffset = 0.2
    newGroup = {
      geometry.rect(s.x, s.y, s.w, s.h),
      geometry.rect(s.x + s.w * centeredOffset, s.y, s.w - s.w * centeredOffset * 2, s.h),
    }
  elseif group == "quarters" then
    local halfWidth = s.w/2
    local halfHeight = s.h/2
    newGroup = {
      -- top left
      geometry.rect(s.x, s.y, halfWidth, halfHeight),
      -- top right
      geometry.rect(s.x + s.w/2, s.y, halfWidth, halfHeight),
      -- bottom right
      geometry.rect(s.x + s.w/2, s.y + halfHeight, halfWidth, halfHeight),
      -- bottom left
      geometry.rect(s.x, s.y + halfHeight, halfWidth, halfHeight)
    }
  elseif group == "verticalSections" then
    local bottomSectionHeight = math.ceil(s.h/2.3)
    newGroup = {
      geometry.rect(s.x, s.y + s.h - bottomSectionHeight, s.w, bottomSectionHeight),
      geometry.rect(s.x, s.y, s.w, s.h - bottomSectionHeight)
    }
  elseif group == "verticalThirds" then
    local thirdHeight = math.ceil(s.h/3)
    newGroup = {
      -- bottom to top
      geometry.rect(s.x, s.y + thirdHeight * 2, s.w, thirdHeight),
      geometry.rect(s.x, s.y + thirdHeight, s.w, thirdHeight),
      geometry.rect(s.x, s.y, s.w, thirdHeight)
    }
  elseif group == "horizontalThirds" then
    local thirdWidth = math.ceil(s.w/3)
    newGroup = {
      geometry.rect(s.x, s.y, thirdWidth, s.h),
      geometry.rect(s.x + thirdWidth, s.y, thirdWidth, s.h),
      geometry.rect(s.x + thirdWidth * 2, s.y, thirdWidth, s.h),
    }
  else
    hydra.alert("No group found: " .. group, 5)
    return nil
  end

  frameGroups[screenKey][group] = newGroup
  return newGroup
end

local function framesForScreenGroup(screenId, group)
  -- hydra.alert(frameGroups["halves"][2].x, 2)
end

local function cyclePositionGroup(groupName)
  -- hydra.alert(group[2].x, 2)
  local win = window.focusedwindow()
  if (win == nil) then return end

  local group = groupForScreen(groupName, win:screen())
  if (group == nil) then return end

  local currentFrame = win:frame()
  local targetIndex = 1
  for index, frame in ipairs(group) do
    -- logFrame(currentFrame, "current")
    -- logFrame(frame, "testing against")
    if framesEqual(currentFrame, frame) then
      -- log("Frame " .. index .. " is equal")
      if index < #group then
        targetIndex = index + 1
      end
    end
  end

  local targetFrame = group[targetIndex]

  win:setframe(targetFrame)
end

local function frameOnScreen(frame, screen)
  return geometry.rect(
    frame.x - screen.x,
    frame.y - screen.y,
    frame.w,
    frame.h
  )
end

local function nextScreen()
  local win = window.focusedwindow()
	local frame = win:frame()
	local thisScreen = win:screen():frame()
	local nextScreen = win:screen():next():frame()

  local adjustedFrame = frameOnScreen(frame, thisScreen)

  local widthFactor = nextScreen.w / thisScreen.w
  local heightFactor = nextScreen.h / thisScreen.h

  local newFrame = geometry.rect(
    adjustedFrame.x * widthFactor + nextScreen.x,
    adjustedFrame.y * heightFactor + nextScreen.y,
    adjustedFrame.w * widthFactor,
    adjustedFrame.h * heightFactor
  )

  -- logFrame(frame, "Frame")
  -- logFrame(thisScreen, "This")
  -- logFrame(nextScreen, "Next")
  -- logFrame(newFrame, "New frame")
  -- print("-----")

	win:setframe(newFrame)
end

lastPosition = {}
local function recordCurrentPosition()
  lastPosition['frame'] = window.focusedwindow():frame()
end

local function recallRecordedPosition()
  if (lastPosition['frame']) then
    window.focusedwindow():setframe(lastPosition['frame'])
  end
end

local function copyMousePosition()
  local p = mouse.get()
  local x = math.ceil(p.x)
  local y = math.ceil(p.y)
  local winFrame = window.focusedwindow():frame()

  -- local starting = "x: " .. x .. ", y: " .. y

  local yAdjustment = 24 -- for toolbar, generally
  local xAdjustment = 0
  local adjusted = "x: " .. x - winFrame.x - xAdjustment .. ", y: " .. y - winFrame.y - yAdjustment

  -- hydra.exec('echo "' .. adjusted .. '" >> ~/Desktop/coordinates.txt')
  hydra.exec('echo "' .. adjusted .. '" | pbcopy')


  alert.show("Copied: " .. adjusted, 0.8)
end

local function manualReload()
  alert.show "Reloading Mjolnir..."
  mjolnir.reload()
end

hotkey.bind({"alt"}, "0", nextScreen)

hotkey.bind({"alt"}, "1", function() cyclePositionGroup("halves") end)
hotkey.bind({"alt"}, "2", function() cyclePositionGroup("center") end)
hotkey.bind({"alt"}, "3", function() cyclePositionGroup("quarters") end)
hotkey.bind({"alt"}, "4", function() cyclePositionGroup("verticalSections") end)
hotkey.bind({"alt"}, "5", function() cyclePositionGroup("verticalThirds") end)
hotkey.bind({"alt"}, "6", function() cyclePositionGroup("horizontalThirds") end)

hotkey.bind({"alt"}, "7", recordCurrentPosition)
hotkey.bind({"alt"}, "8", recallRecordedPosition)

hotkey.bind({"alt"}, "9", manualReload)

hotkey.bind({"alt"}, "`", copyMousePosition)

-- move the window to the right a bit, and make it a little shorter
-- hotkey.new({"cmd", "ctrl", "alt"}, "J", function()
--     local win = window.focusedwindow()
--     local frame = win:frame()
--     frame.x = frame.x + 10
--     frame.h = frame.h - 10
--     win:setframe(frame)
-- end):enable()


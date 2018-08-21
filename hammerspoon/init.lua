hs.alert.show("HammerSpoon Reloaded...", 0.8)

hs.window.animationDuration = 0

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
  local win = hs.window.focusedWindow()
  local s = screen:frame()
  local screenKey = s.x .. s.y .. s.w .. s.h

  if frameGroups[screenKey] then
    if frameGroups[screenKey][group] then
      return frameGroups[screenKey][group]
    end
  else
    frameGroups[screenKey] = {}
  end

  -- hs.alert(screenKey, 2)
  local newGroup = {}

  if group == "halves" then
    newGroup = {
      -- left half
      hs.geometry.rect(s.x, s.y, s.w/2, s.h),
      -- right half
      hs.geometry.rect(s.x + s.w/2, s.y, s.w/2, s.h)
    }
  elseif group == "center" or group == "centerSides" then
    local desiredOffset = 0.25
    local centeredWidth = math.max(1100, s.w - s.w * desiredOffset * 2)
    local centeredMargins = (s.w - centeredWidth) / 2
    local centered = hs.geometry.rect(s.x + centeredMargins, s.y, centeredWidth, s.h)
    if group == "center" then
      local full = hs.geometry.rect(s.x, s.y, s.w, s.h)
      if s.w > 1920 then
        newGroup = { centered, full }
      else
        newGroup = { full, centered }
      end
    else
      -- the edeges outside the centered window
      newGroup = {
        hs.geometry.rect(s.x, s.y, centeredMargins, s.h),
        hs.geometry.rect(centeredMargins + centeredWidth, s.y, centeredMargins, s.h),
      }
    end
  elseif group == "quarters" then
    local halfWidth = s.w/2
    local halfHeight = s.h/2
    newGroup = {
      -- top left
      hs.geometry.rect(s.x, s.y, halfWidth, halfHeight),
      -- top right
      hs.geometry.rect(s.x + s.w/2, s.y, halfWidth, halfHeight),
      -- bottom right
      hs.geometry.rect(s.x + s.w/2, s.y + halfHeight, halfWidth, halfHeight),
      -- bottom left
      hs.geometry.rect(s.x, s.y + halfHeight, halfWidth, halfHeight)
    }
  elseif group == "verticalSections" then
    local bottomSectionHeight = math.ceil(s.h/2.3)
    newGroup = {
      hs.geometry.rect(s.x, s.y + s.h - bottomSectionHeight, s.w, bottomSectionHeight),
      hs.geometry.rect(s.x, s.y, s.w, s.h - bottomSectionHeight)
    }
  elseif group == "verticalThirds" then
    local thirdHeight = math.ceil(s.h/3)
    newGroup = {
      -- bottom to top
      hs.geometry.rect(s.x, s.y + thirdHeight * 2, s.w, thirdHeight),
      hs.geometry.rect(s.x, s.y + thirdHeight, s.w, thirdHeight),
      hs.geometry.rect(s.x, s.y, s.w, thirdHeight)
    }
  elseif group == "horizontalThirds" then
    local thirdWidth = math.ceil(s.w/3)
    newGroup = {
      hs.geometry.rect(s.x, s.y, thirdWidth, s.h),
      hs.geometry.rect(s.x + thirdWidth, s.y, thirdWidth, s.h),
      hs.geometry.rect(s.x + thirdWidth * 2, s.y, thirdWidth, s.h),
    }
  else
    hs.alert.show("No group found: " .. group, 5)
    return nil
  end

  frameGroups[screenKey][group] = newGroup
  return newGroup
end

local function framesForScreenGroup(screenId, group)
  -- hs.alert(frameGroups["halves"][2].x, 2)
end

local function cyclePositionGroup(groupName)
  -- hs.alert(group[2].x, 2)
  local win = hs.window.focusedWindow()
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

  win:setFrame(targetFrame)
end

local function frameOnScreen(frame, screen)
  return hs.geometry.rect(
    frame.x - screen.x,
    frame.y - screen.y,
    frame.w,
    frame.h
  )
end

local function nextScreen()
  local win = hs.window.focusedWindow()
  win:moveToScreen(win:screen():next())
end

lastPosition = {}
local function recordCurrentPosition()
  print(y)
  hs.alert.show("Recorded Window Position")
  lastPosition['frame'] = y
end

local function recallRecordedPosition()
  if (lastPosition['frame']) then
    hs.window.focusedWindow():setFrame(lastPosition['frame'])
  end
end
local function printCurrentPosition()
  hs.alert.show(frameString(hs.window.focusedWindow():frame()))
end

local function copyMousePosition()
  local p = mouse.get()
  local x = math.ceil(p.x)
  local y = math.ceil(p.y)
  local winFrame = hs.window.focusedWindow():frame()

  -- local starting = "x: " .. x .. ", y: " .. y

  local yAdjustment = 24 -- for toolbar, generally
  local xAdjustment = 0
  local adjusted = "x: " .. x - winFrame.x - xAdjustment .. ", y: " .. y - winFrame.y - yAdjustment

  -- hydra.exec('echo "' .. adjusted .. '" >> ~/Desktop/coordinates.txt')
  hydra.exec('echo "' .. adjusted .. '" | pbcopy')

  hs.alert.show("Copied: " .. adjusted, 0.8)
end

local function manualReload()
  hs.reload()
end

hs.hotkey.bind({"alt"}, "0", nextScreen)

hs.hotkey.bind({"alt"}, "1", function() cyclePositionGroup("halves") end)
hs.hotkey.bind({"alt"}, "2", function() cyclePositionGroup("center") end)
hs.hotkey.bind({"alt", "cmd"}, "2", function() cyclePositionGroup("centerSides") end)
hs.hotkey.bind({"alt"}, "3", function() cyclePositionGroup("horizontalThirds") end)
hs.hotkey.bind({"alt"}, "4", function() cyclePositionGroup("quarters") end)
hs.hotkey.bind({"alt"}, "5", function() cyclePositionGroup("verticalSections") end)
hs.hotkey.bind({"alt"}, "6", function() cyclePositionGroup("verticalThirds") end)

hs.hotkey.bind({"alt"}, "7", recordCurrentPosition)
hs.hotkey.bind({"alt", "shift"}, "7", printCurrentPosition)
hs.hotkey.bind({"alt"}, "8", recallRecordedPosition)

hs.hotkey.bind({"alt"}, "9", manualReload)

-- hs.hotkey.bind({"alt"}, "`", copyMousePosition)


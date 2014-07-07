-- Hi!
-- Save this as ~/.hydra/init.lua and choose Reload Config from the menu

pathwatcher.new(os.getenv("HOME") .. "/.hydra/", hydra.reload):start()
autolaunch.set(true)
logger.lines = {}
-- logger.show()

-- hydra.alert("Hydra sample config loaded", 1.5)

-- open a repl
--   the repl is a Lua prompt; type "print('hello world')"
--   when you're in the repl, type "help" to get started
--   almost all readline functionality works in the repl
hotkey.bind({"cmd", "ctrl", "alt"}, "R", repl.open)

-- save the time when updates are checked
function checkforupdates()
  updates.check()
  settings.set('lastcheckedupdates', os.time())
end

-- show a helpful menu
menu.show(function()
    local updatetitles = {[true] = "Install Update", [false] = "Check for Update..."}
    local updatefns = {[true] = updates.install, [false] = checkforupdates}
    local hasupdate = (updates.newversion ~= nil)

    return {
      {title = "Reload Config", fn = hydra.reload},
      {title = "-"},
      {title = "About", fn = hydra.showabout},
      {title = updatetitles[hasupdate], fn = updatefns[hasupdate]},
      {title = "Quit Hydra", fn = os.exit},
    }
end)

-- utilities
local function log(string)
  print(string)
end

local function logFrame(frame)
  print("x: " .. frame.x, ", Y: " .. frame.y, "\nW: " .. frame.w, ", H: " .. frame.h .. "\n")
end

local function close(a, b)
  local threshold = 5
  return a == b or (a > b-5 and a < b+5)
end

local function framesEqual(a, b)
  -- x and y must be exact
  -- width and height use close() because they can be imprecise depending on the application
  return a.x == b.x and a.y == b.y and close(a.w, b.w) and close(a.h, b.h)
end

namedFrames = {}
frameGroups = {}

local function generateNamedFrames()
  local win = window.focusedwindow()
  local s = win:screen():frame_without_dock_or_menu()

  namedFrames.leftHalf = { x = s.x, y = s.y, w = s.w/2, h = s.h }
  namedFrames.rightHalf = { x = s.w/2, y = s.y, w = s.w/2, h = s.h }

  frameGroups.halves = { namedFrames.leftHalf, namedFrames.rightHalf }
end

generateNamedFrames()

local function halves()
  local win = window.focusedwindow()
  local currentFrame = win:frame()

  group = frameGroups.halves

  local targetIndex = 1
  for index, frame in ipairs(group) do
    if framesEqual(currentFrame, frame) then
      log("Frame " .. index .. " is equal")
      if index < #group then
        targetIndex = index + 1
      end
    end
  end

  local targetFrame = group[targetIndex]

  win:setframe(targetFrame)
end

hotkey.bind({"alt"}, "1", halves)


-- move the window to the right a bit, and make it a little shorter
-- hotkey.new({"cmd", "ctrl", "alt"}, "J", function()
--     local win = window.focusedwindow()
--     local frame = win:frame()
--     frame.x = frame.x + 10
--     frame.h = frame.h - 10
--     win:setframe(frame)
-- end):enable()

-- show available updates
local function showupdate()
  os.execute('open https://github.com/sdegutis/Hydra/releases')
end

-- what to do when an udpate is checked
function updates.available(available)
  if available then
    notify.show("Hydra update available", "", "Click here to see the changelog and maybe even install it", "showupdate")
  else
    hydra.alert("No update available.")
  end
end

-- Uncomment this if you want Hydra to make sure it launches at login
-- autolaunch.set(true)

-- check for updates every week
timer.new(timer.weeks(1), checkforupdates):start()
notify.register("showupdate", showupdate)

-- if this is your first time running Hydra, you're launching it more than a week later, check now
local lastcheckedupdates = settings.get('lastcheckedupdates')
if lastcheckedupdates == nil or lastcheckedupdates <= os.time() - timer.days(7) then
  checkforupdates()
end




-- I've worked hard to make Hydra useful and easy to use. I've also
-- released it with a liberal open source license, so that you can do
-- with it as you please. So, instead of charging for licenses, I'm
-- asking for donations. If you find it helpful, I encourage you to
-- donate what you believe would have been a fair price for a license:

local function donate()
  os.execute("open 'https://www.paypal.com/cgi-bin/webscr?business=sbdegutis@gmail.com&cmd=_donations&item_name=Hydra.app%20donation'")
end

hotkey.bind({"cmd", "alt", "ctrl"}, "D", donate)

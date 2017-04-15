-- The default delay is too slow, making key repeating very slow
fast_delay = 1000

function tableContainsValue(tbl, value)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end

  return false
end

function itableUnion(a, b)
  local ab = {}
  for _, v in ipairs(a) do
    table.insert(ab, v)
  end

  for _, v in ipairs(b) do
    if not tableContainsValue(ab, v) then
      table.insert(ab, v)
    end
  end

  return ab
end

function tableKeys(tbl)
  local ret = {}
  for key, _ in pairs(tbl) do
    table.insert(ret, key)
  end

  return ret
end

EVENTPROPERTY_EVENTSOURCEUSERDATA = 42
USERDATA_LOCAL = 55555

function enableSymbolLayer()
  local symbols = {
    o = {{}, '-'},            -- o -> -
    p = {{'shift'}, '='},     -- p -> +
    s = {{}, '['},            -- s -> [
    d = {{'shift'}, '['},     -- d -> {
    f = {{'shift'}, '9'},     -- f -> (
    g = {{}, '='},            -- g -> =
    h = {{'shift'}, '-'},     -- h -> _
    j = {{'shift'}, '0'},     -- j -> )
    k = {{'shift'}, ']'},     -- k -> }
    l = {{}, ']'},            -- l -> ]
    c = {{'shift'}, '`'},     -- c -> ~
    v = {{}, '`'},            -- v -> `
    m = {{'shift'}, '\\'},    -- m -> |
    [','] = {{'shift'}, ','}, -- , -> <
    ['.'] = {{'shift'}, '.'}, -- . -> >
  }

  -- If you hold capslock for this long and then let go, ESC will not be sent.
  local cancel_delay_seconds = 0.3
  local triggered = true
  local resetTimer = hs.timer.delayed.new(cancel_delay_seconds, function()
    triggered = true
  end)

  -- This tap handles remapping. It is only enabled while capslock is held
  local tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    -- Check if this event is from the keyboard or from us. We need to ignore
    -- events from us.
    local userData = event:getProperty(EVENTPROPERTY_EVENTSOURCEUSERDATA)
    if userData == USERDATA_LOCAL then
      return false
    end

    triggered = true

    local key = hs.keycodes.map[event:getKeyCode()]

    if key == 'space' then
      return false
    end

    local remap = symbols[key]
    if remap then
      local mods = tableKeys(event:getFlags())
      local newMods = itableUnion(mods, remap[1])
      local newKey = remap[2]

      hs.eventtap.event.newKeyEvent(newMods, newKey, true):setProperty(EVENTPROPERTY_EVENTSOURCEUSERDATA, USERDATA_LOCAL):post()
      hs.eventtap.event.newKeyEvent(newMods, newKey, false):setProperty(EVENTPROPERTY_EVENTSOURCEUSERDATA, USERDATA_LOCAL):post()
    end

    -- Do not send event on
    return true
  end)

  -- This tap handles F18 (capslock) with any modifier and is enabled right away.
  return hs.eventtap.new({hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp}, function(event)
    local key = hs.keycodes.map[event:getKeyCode()]
    -- Ignore all events but f18
    if key ~= 'f18' then
      return false
    end

    if event:getType() == hs.eventtap.event.types.keyDown then
      resetTimer:start()
      triggered = false
      tap:start()
    else
      resetTimer:stop()
      tap:stop()

      if not triggered then
        -- Strip the fn flag, which is set because the key is f18
        local flags = event:getFlags()
        flags['fn'] = nil
        local mods = tableKeys(flags)
        hs.eventtap.keyStroke(mods, 'ESCAPE', fast_delay)
      end
    end

    -- Do not send event on
    return true
  end):start()
end

-- Store this in a global so it doesn't get GC'd
symbolLayerTap = enableSymbolLayer()

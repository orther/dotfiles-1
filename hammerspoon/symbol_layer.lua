-- A global variable for the Symbol Mode
k = hs.hotkey.modal.new()

fast_delay = 1000
-- If you hold capslock for this long and then let go, ESC will not be sent.
cancel_delay_seconds = 0.3

bindings = {
  {'o', {}, '-'},         -- o -> -
  {'p', {'shift'}, '='},  -- p -> +
  {'s', {}, '['},         -- s -> [
  {'d', {'shift'}, '['},  -- d -> {
  {'f', {'shift'}, '9'},  -- f -> (
  {'g', {}, '='},         -- g -> =
  {'h', {'shift'}, '-'},  -- h -> _
  {'j', {'shift'}, '0'},  -- j -> )
  {'k', {'shift'}, ']'},  -- k -> }
  {'l', {}, ']'},         -- l -> ]
  {'c', {'shift'}, '`'},  -- c -> ~
  {'v', {}, '`'},         -- v -> `
  {'m', {'shift'}, '\\'}, -- m -> |
  {',', {'shift'}, ','},  -- , -> <
  {'.', {'shift'}, '.'},  -- . -> >
}

for i, mapping in ipairs(bindings) do
  k:bind({}, mapping[1], function()
    hs.eventtap.keyStroke(mapping[2], mapping[3], fast_delay)
    k.triggered = true
  end, nil, function()
    hs.eventtap.keyStroke(mapping[2], mapping[3], fast_delay)
  end)
end

symbolResetTimer = hs.timer.delayed.new(cancel_delay_seconds, function()
  k.triggered = true
end)

-- Enter Symbol Mode when F18 (Capslock) is pressed
pressedF18 = function()
  symbolResetTimer:start()
  k.triggered = false
  k:enter()
end

-- Leave Symbol Mode when F18 (Capslock) is pressed,
-- send ESCAPE if no other keys are pressed
releasedF18 = function()
  symbolResetTimer:stop()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE', fast_delay)
  end
end

-- Bind the Symbol key
hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

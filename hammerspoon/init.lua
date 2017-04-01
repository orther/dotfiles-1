-- A global variable for the Symbol Mode
k = hs.hotkey.modal.new()

fast_delay = 1000

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

-- Enter Symbol Mode when F18 (Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Symbol Mode when F18 (Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE', fast_delay)
  end
end

-- Bind the Symbol key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

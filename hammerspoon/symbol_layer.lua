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

modifierCombinations = {}
for _, ctrl in ipairs({'ctrl', false}) do
  for _, cmd in ipairs({'cmd', false}) do
    for _, shift in ipairs({'shift', false}) do
      for _, alt in ipairs({'alt', false}) do
        local combination = {}
        if ctrl then table.insert(combination, ctrl) end
        if cmd then table.insert(combination, cmd) end
        if shift then table.insert(combination, shift) end
        if alt then table.insert(combination, alt) end

        table.insert(modifierCombinations, combination)
      end
    end
  end
end

function contains(tbl, value)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end

  return false
end

function union(a, b)
  local ab = {}
  for _, v in ipairs(a) do
    table.insert(ab, v)
  end

  for _, v in ipairs(b) do
    if not contains(ab, v) then
      table.insert(ab, v)
    end
  end

  return ab
end

function withAllModifiers(fn)
  for _, modifiers in ipairs(modifierCombinations) do
    fn(modifiers)
  end
end

for i, mapping in ipairs(bindings) do
  withAllModifiers(function(modifiers)
    local strokeModifiers = union(modifiers, mapping[2])
    k:bind(modifiers, mapping[1], function()
      hs.eventtap.keyStroke(strokeModifiers, mapping[3], fast_delay)
      k.triggered = true
    end, nil, function()
      hs.eventtap.keyStroke(strokeModifiers, mapping[3], fast_delay)
    end)
  end)
end

symbolResetTimer = hs.timer.delayed.new(cancel_delay_seconds, function()
  k.triggered = true
end)

-- Enter Symbol Mode when F18 (Capslock) is pressed
function pressedF18(modifiers)
  return function()
    symbolResetTimer:start()
    k.triggered = false
    k:enter()
  end
end

-- Leave Symbol Mode when F18 (Capslock) is pressed,
-- send ESCAPE if no other keys are pressed
function releasedF18(modifiers)
  return function()
    symbolResetTimer:stop()
    k:exit()
    if not k.triggered then
      hs.eventtap.keyStroke(modifiers, 'ESCAPE', fast_delay)
    end
  end
end

-- Bind the Symbol key
withAllModifiers(function(modifiers)
  hs.hotkey.bind(modifiers, 'F18', pressedF18(modifiers), releasedF18(modifiers))
end)

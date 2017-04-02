hyper = {'ctrl', 'alt', 'cmd', 'shift'}
super = {'ctrl', 'alt', 'cmd'}

-- Quick app switch bindings
quickSwitchBindings = {
  {hyper, 'c', '/Applications/Google Chrome.app'},
  {hyper, 'f', '/Applications/Firefox.app'},
  {hyper, 'g', '/Users/aaronjensen/Applications/HighfiveApp.app'},
  {hyper, 'i', '/Applications/iTerm.app'},
  {hyper, 'j', '/Applications/Emacs.app'},
  {hyper, 'k', '/Applications/Skype.app'},
  {hyper, 'l', '/Applications/Slack.app'},
  {hyper, 'm', '/Applications/Messages.app'},
  {hyper, 's', '/Applications/Safari.app'},
  {hyper, 'w', '/Applications/Xcode.app'},
  {hyper, 'x', '/Applications/Spark.app'},
  {hyper, 'z', '/Applications/Zeplin.app'}
}

for i, mapping in ipairs(quickSwitchBindings) do
  hs.hotkey.bind(mapping[1], mapping[2], function()
   hs.application.launchOrFocus(mapping[3])
  end)
end

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
  end, nil, function()
    hs.eventtap.keyStroke(mapping[2], mapping[3], fast_delay)
  end)
end

-- Enter Symbol Mode when F17 (Capslock) is pressed
pressedF17 = function()
  k:enter()
end

-- Leave Symbol Mode when F17 (Capslock) is pressed,
-- Karabiner-Elements will send ESC if Caplock is tapped on its own
releasedF17 = function()
  k:exit()
end

-- Bind the Symbol key
hs.hotkey.bind({}, 'F17', pressedF17, releasedF17)

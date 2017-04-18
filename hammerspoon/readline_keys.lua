readlineKeys = hs.hotkey.modal.new()
readlineKeyBindings = {
  {{'alt'}, 'w', {'cmd'}, 'c'},
  {{'ctrl'}, 'w', {'cmd'}, 'x'},
  {{'ctrl'}, 'y', {'cmd'}, 'v'},

  {{'ctrl'}, 'v', {}, 'pagedown'},
  {{'alt'}, 'v', {}, 'pageup'},

  {{'ctrl'}, 'a', {'cmd'}, 'left'},
  {{'ctrl'}, 'e', {'cmd'}, 'right'},
  {{'alt'}, 'f', {'alt'}, 'right'},
  {{'alt'}, 'b', {'alt'}, 'left'},
  {{'ctrl'}, 'f', {}, 'right'},
  {{'ctrl'}, 'b', {}, 'left'},
  {{'ctrl'}, 'n', {}, 'down'},
  {{'ctrl'}, 'p', {}, 'up'},
}

disableReadlineKeyBindingsIn = {
  'Emacs',
  'iTerm2',
}

for _, binding in ipairs(readlineKeyBindings) do
  local stroke = function()
    hs.eventtap.keyStroke(binding[3], binding[4], fast_delay)
  end
  readlineKeys:bind(binding[1], binding[2], stroke, nil, stroke)
end

function applicationWatcher(appName, eventType, appObject)
  if eventType == hs.application.watcher.activated then
    -- print(appName)
    local isMatch = false
    for _, app in ipairs(disableReadlineKeyBindingsIn) do
      if appName == app then
        readlineKeys:exit()
        isMatch = true
      end
    end

    if not isMatch then
      readlineKeys:enter()
    end
  end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

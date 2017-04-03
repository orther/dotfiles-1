-- Quick app switch bindings
quickSwitchBindings = {
  {hyper, 'c', '/Applications/Google Chrome.app'},
  {hyper, 'f', '/Applications/Firefox.app'},
  {hyper, 'g', os.getenv('HOME') .. '/Applications/HighfiveApp.app'},
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

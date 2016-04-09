'use strict'

require('~/test.js')

Phoenix.notify(foo)

var keys = []
var hyperMod = ['ctrl', 'shift', 'cmd', 'alt']
var superMod = ['ctrl', 'cmd', 'alt']

function launchOrFocus(appName) {
  var app = App.launch(appName)
  var done = app.focus()
  return app;
}

function callApp(appName) {
  var window = Window.focusedWindow();
  // if (window) {
  //   save_mouse_position_for_window(window);
  // }
  //App.launch(appName);
  var newWindow = _.first(launchOrFocus(appName).windows());
  // if (newWindow && window !== newWindow) {
  //   restore_mouse_position_for_window(newWindow);
  // }
}

function p(obj) {
  Phoenix.log(JSON.stringify(obj))
  return obj
}

function move_window(rect, screen) {
  screen = screen || Window.focusedWindow().screen()
  var scr = screen.visibleFrameInRectangle();
  p(scr)
  var r = {
    x: Math.round(scr.x + rect.x * scr.width),
    y: Math.round(scr.y + rect.y * scr.height),
    width: Math.round(scr.width * rect.width),
    height: Math.round(scr.height * rect.height),
  };
  p(r)
  var before = Window.focusedWindow().frame()
  p(before)
  p(Window.focusedWindow().setSize(r));
  p(Window.focusedWindow().setTopLeft(r));
  p(Window.focusedWindow().setSize(r));
  var after = Window.focusedWindow().frame()
  p("after:")
  p(after)

  if (isRectEqual(before, after)) {
    move_window(rect, screen.next())
  }
}

function move_window_to_next_screen() {
  var currW = Window.focusedWindow();
  var cwFrame = currW.frame();
  var currScreen = currW.screen();
  var nextScreen = currScreen.next();
  var currScreenSize = currScreen.visibleFrameInRectangle();
  var relative = {
    x: (cwFrame.x - currScreenSize.x) / currScreenSize.width,
    y: (cwFrame.y - currScreenSize.y) / currScreenSize.height,
    width: cwFrame.width / currScreenSize.width,
    height: cwFrame.height / currScreenSize.height,
  };
  move_window(relative, nextScreen);
}

function isRectEqual(a, b) {
  return a.x === b.x &&
    a.y === b.y &&
    a.width === b.width &&
    a.height === b.height
}

keys.push(Phoenix.bind('i', hyperMod, function() { callApp('iTerm') }))
keys.push(Phoenix.bind('h', ['cmd', 'ctrl'], function () {
  move_window({ x: 0, y: 0, width: 0.5, height: 1.0 })
}))

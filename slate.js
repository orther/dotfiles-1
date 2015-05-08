S.configAll({
  "defaultToCurrentScreen" : true,
  "checkDefaultsOnLoad" : true,
  "orderScreensLeftToRight" : false
});

var hyper = "ctrl,cmd,alt,shift"

/*
 * Quick app switching and launching
 * hyper + key to launch app or switch to it.
 */
var quickSwitchBindings = {
  "a" : "Android Studio",
  "c" : "Google Chrome",
  "f" : "Firefox",
  "i" : "iTerm",
  "k" : "Skype",
  "l" : "Flowdock",
  "m" : "Messages",
  "s" : "Safari",
  "x" : "Mailbox (Beta)"
};

_.each(quickSwitchBindings, function(app, key) {
  var appPath = "'/Applications/" + app + ".app'"

  S.bind(key + ":" + hyper, function() {
    S.op("focus", { "app" : app }).run() ||
      S.shell("/usr/bin/open " + appPath);
  });
});

/*
 * Size and move windows
 * Press binding twice to toggle between screens
 */
var fullscreen = {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
};

var windowSizes = createWindowSizes(fullscreen, {
  "fullscreen" : {},
  "left" : { "width" : "screenSizeX / 2" },
  "topLeft" : {
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY / 2"
  },
  "top" : { "height" : "screenSizeY / 2" },
  "topRight" : { "height" : "screenSizeY / 2" },
  "right" : {
    "x" : "screenOriginX + screenSizeX / 2",
    "width" : "screenSizeX / 2"
  },
  "bottomRight" : {
    "x" : "screenOriginX + screenSizeX / 2",
    "y" : "screenOriginY + screenSizeY / 2",
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY / 2"
  },
  "bottom" : {
    "x" : "screenOriginX + screenSizeX / 2",
    "height" : "screenSizeY / 2"
  },
  "bottomLeft" : {
    "y" : "screenOriginY + screenSizeY / 2",
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY / 2"
  },
  "rightThird" : {
    "x" : "screenOriginX + screenSizeX * 7 / 12",
    "width" : "screenSizeX * 5 / 12"
  },
  "leftTwoThirds" : { "width" : "screenSizeX * 7 / 12" },
});

var windowSizeBindings = {
  "i:ctrl,cmd" : "fullscreen",
  "h:ctrl,cmd" : "left",
  "h:ctrl,cmd,shift" : "topLeft",
  "k:ctrl,cmd" : "top",
  "k:ctrl,cmd,shift" : "topRight",
  "l:ctrl,cmd" : "right",
  "l:ctrl,cmd,shift" : "bottomRight",
  "j:ctrl,cmd" : "bottom",
  "j:ctrl,cmd,shift" : "bottomLeft",
  "l:ctrl,cmd,alt" : "rightThird",
  "h:ctrl,cmd,alt" : "leftTwoThirds"
};

_.each(windowSizeBindings, function(size, key) {
  S.bind(key, function(win) {
    if (!win) return false;

    var origRect = win.rect();
    var move = S.op("move", windowSizes[size]);

    win.doOperation(move);

    if (rectEq(origRect, win.rect())) {
      move = move.dup({ "screen" : "next" });
      win.doOperation(move);
    }
  });
});

/*
 * Miscellaneous bindings
 */
S.bindAll({
  "`:ctrl" : S.op("relaunch")
});

/*
 * Utility functions
 */
function rectEq(a, b) {
  return a.x === b.x &&
    a.y === b.y &&
    a.width === b.width &&
    a.height === b.height;
}

// Merge each size into the fullscreen size provided
function createWindowSizes(fullscreen, sizes) {
  windowSizes = {};

  _.each(sizes, function(size, name) {
    windowSizes[name] = _.extend({}, fullscreen, size);
  });

  return windowSizes;
}

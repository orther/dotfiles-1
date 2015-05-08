var hyper = "ctrl,cmd,alt,shift"

var quickSwitchApps = {
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

_.each(quickSwitchApps, function(app, key) {
  var appPath = "'/Applications/" + app + ".app'"
  S.bind(key + ":" + hyper, function() {
    S.op("focus", { "app" : app }).run();
    S.shell("/usr/bin/open " + appPath);
  });
});

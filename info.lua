t = ...  -- Required for this info file to work.

t.shortname = "More Context"  -- The name that will be displayed on the button in the plugins list. Should be no longer than 21 characters, or it will be wider than the button.
t.longname = "Expanded Scripting Context"  -- This can be about twice as long
t.author = "Elomavi"  -- Your name
t.version = "0.1"  -- The current version of this plugin, can be anything you want
t.minimumved = "1.11.1"  -- The minimum version of Ved this plugin is designed to work with. If unsure, just use the latest version.
t.description = [[
Provides more information about the script that the caret is currently looking at.

* Warns the user if a script runs a script from the main-game instead of a custom level script.
* Shows more information about createentity() entities

]]  -- The description that will be displayed in the plugins list. This uses the help/notepad system, so you can use text formatting here, and even images!
t.descriptionimgs = {}  -- List filenames of images you want to be able to include in the description
t.overrideinfo = false  -- Set this to true if you want to make your description fully custom and disable the default header with the plugin name, your username and the plugin version at the top. Leave at false if uncertain.

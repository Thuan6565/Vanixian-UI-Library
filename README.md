# 🚀 VanixiaUI Library (V1.0)

VanixiaUI is a premium, lightweight, and responsive Object-Oriented User Interface (UI) Library designed for Roblox script developers. Built entirely in Luau, it offers an elegant Fluent-inspired aesthetic, seamless cross-tab navigation, custom animated window systems, dynamic section categories, and automated auto-sizing tags.

> 🌟 **Key Advantage:** Operates 100% locally and offline. It avoids any network latency or security restrictions caused by the server's `Allow HTTP Requests` settings.

---

## 🛠️ Installation & Usage (Loadstring Script)

To execute the VanixiaUI library from any script executor or client-side script, copy and run the standard loadstring snippet below:


### Load Library
```lua
local VanixiaUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Thuan6565/Vanixian-UI-Library/refs/heads/main/VanixiaUI.lua"))()
```
# Create Window
```lua
local Window = VanixiaUI:CreateWindow({
	Title = "Vanixia Hub",
	Author = "by Thuan69392",
	Size = UDim2.fromOffset(536, 327),
	ToggleKey = Enum.KeyCode.K, -- set your key code
	Color = "Yellow" -- or Light, Dark, and Yellow
})
```
# Tag
```lua
Window:CreateTag("PREMIUM", "Yellow")
```
# Tabs
```lua
local MainTab = Window:CreateTab("Home", "home")
```
# Toggle
```lua
MainTab:CreateToggle("Toggle Name", function(state)
	--code here
end)
```
# DropDown
```lua

MainTab:CreateDropdown("Dropdown", {"Value 1", "Value 2 ", "Value 3", "Value 4"}, function(selectedOption)
	--code here
end)

```
# Slider
```lua
MainTab:CreateSlider("Slider", 16, 500, 16, function(value)
    --code here
end)
```
# Paragraph

```lua
MainTab:CreateParagraph("Paragraph Title", "You text here")
```
# Input
```lua

MainTab:CreateInput("Input Title", "Input Text", function(text, enterPressed)
    --code here
end)
```
# Notification
```lua
VanixiaUI:CreateNotification({
	Title = "Notification",
	Description = "Description Notification",
	Icon = "refresh-cw", -- lucide icons
	Theme = "Dark", -- or Light, Yellow
	Duration = 3
})
```

# Button
```lua
MainTab:CreateButton("Button", function()
	--code here
end)
```
# Dialog
```lua

Window:CreateDialog({
		Title = "Dialog",
		Message = "A dialog",
		AcceptText = "OK",
		CancelText = "NO",
		Callback = function(confirmed)
			if confirmed == true then
				--code here
			else
				--codehere
			end
		end
	})

```
 # this is all or 1.0, more in 1.2 version 

## Open Source License
This project is distributed under the lightweight MIT Open Source License. You are free to modify, customize, and bundle this UI package into your commercial or private script hubs. 

Crafted with 🧠 by **Thuan69392**.

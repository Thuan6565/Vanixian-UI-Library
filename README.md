# 🚀 VanixiaUI Library (V1.5)

VanixiaUI is a premium, lightweight, and responsive Object-Oriented User Interface (UI) Library designed for Roblox script developers. Built entirely in Luau, it offers an elegant Fluent-inspired aesthetic, seamless cross-tab navigation, custom animated window systems, dynamic section categories, and automated auto-sizing tags.

> 🌟 **Key Advantage:** Operates 100% locally and offline. It avoids any network latency or security restrictions caused by the server's `Allow HTTP Requests` settings.

---

## 🛠️ Installation & Usage (Loadstring Script)

To execute the VanixiaUI library from any script executor or client-side script, copy and run the standard loadstring snippet below:

```lua
-- 1. Load the UI Library from your GitHub Repository
local VanixiaUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Thuan6565/Vanixian-UI-Library/refs/heads/main/VanixiaUI.lua"))()

-- 2. Initialize the Main Window
local Window = VanixiaUI:CreateWindow({
	Title = "Vanixia Ultimate Engine",
	Author = "by Thuan69392",
	Size = UDim2.fromOffset(536, 327),
  Color = "Yellow", -- Supported Themes: "Dark", "Light", "Yellow"
	ToggleKey = Enum.KeyCode.K -- Keyboard shortcut to hide/show the menu
})

-- 3. Create a Version/Status Tag right next to the title
-- Supports custom Color3 values or syncs with predefined string names: "Dark", "Light", "Yellow"
Window:CreateTag("PREMIUM", "Yellow")

-- 4. Create Functional Tabs with Offline Lucide Icons
local MainTab = Window:CreateTab("Home", "home")
local CombatTab = Window:CreateTab("Combat", "rocket")

-- ========================================================================
-- 🧱 INTERACTIVE COMPONENTS (WIDGETS) WITHIN TABS
-- ========================================================================

-- A. Standard Click Button
MainTab:CreateButton("Claim Daily Reward", function()
	print("Reward successfully claimed!")
end)

-- B. Animated On/Off Switch (Toggle)
_G.AutoFarm = false
MainTab:CreateToggle("Auto Collect Items", function(state)
	_G.AutoFarm = state
	if _G.AutoFarm then
		print("Auto Collect activated!")
	else
		print("Auto Collect deactivated!")
	end
end)

-- C. Selection Dropdown Menu
MainTab:CreateDropdown("Select Teleport Area", {"Spawn Island", "Desert Village", "Snow City"}, function(selected)
	print("Player selected area: " .. tostring(selected))
end)

-- D. Continuous Value Slider
MainTab:CreateSlider("Movement Speed (WalkSpeed)", 16, 500, 16, function(value)
	local player = game.Players.LocalPlayer
	if player and player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.WalkSpeed = value
	end
end)

-- E. Informational Text Frame (Paragraph - Autogrows and adapts layout height to wrap text)
MainTab:CreateParagraph("System Patch Notes", "Notifications and Modal Confirmation Dialogs are now wrapped inside asynchronous task.spawn threads. This fixes past freezing bugs on the main viewport.")

-- F. User Keyboard Input (Input Text)
MainTab:CreateInput("Teleport to Target Player", "Type username here...", function(text, enterPressed)
	print("Searching database for player: " .. tostring(text))
end)

-- ========================================================================
-- 📁 ORGANIZING SUB-CATEGORIES (TAB SECTIONS)
-- ========================================================================
local PvpSection = CombatTab:CreateSection("PVP Combo Configuration")

-- All widgets called from a SectionObject will perfectly align inside that container block
PvpSection:CreateToggle("Enable Auto Killaura", function(state) end)
PvpSection:CreateButton("Target Nearest Enemy", function() end)

-- ========================================================================
-- 🌟 MODAL FLOATING POPUPS (NOTIFICATIONS & DIALOGS)
-- ========================================================================

-- G. Toast Notification Popups (Slide-in bottom right card with a Linear Progress Bar)
-- Can be globally invoked from anywhere via the VanixiaUI Core Class
MainTab:CreateButton("Trigger Sample Alert", function()
	VanixiaUI:CreateNotification({
		Title = "Syncing Configurations",
		Description = "Please wait a moment while the engine updates the remote settings...",
		Icon = "refresh-cw",
		Theme = "Dark", -- Match colors according to the chosen active layout
		Duration = 3 -- Runs the progress timeline and auto-destroys in 3 seconds
	})
end)

-- H. Viewport Dimming Confirmation Dialog (Dialog - Intercepts mouse input and darkens window view)
-- Bound directly to the main Window Object
CombatTab:CreateButton("Wipe Config Cache", function()
	Window:CreateDialog({
		Title = "Are you absolutely sure?",
		Message = "This permanent action will restore all mod configurations back to factory defaults. Do you want to proceed?",
		AcceptText = "Confirm Wipe",
		CancelText = "Go Back",
		Callback = function(confirmed)
			if confirmed then
				print("User confirmed action!")
			else
				print("User cancelled action!")
			end
		end
	})
end)
```

## Open Source License
This project is distributed under the lightweight MIT Open Source License. You are free to modify, customize, and bundle this UI package into your commercial or private script hubs. 

Crafted with 🧠 by **Thuan69392**.

local VanixiaUI = {}
VanixiaUI.__index = VanixiaUI

local VanixiaIcons = require(game:GetService("ReplicatedStorage"):WaitForChild("LucideIcons"))
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Themes = {
	["Dark"] = {
		Background = Color3.fromRGB(24, 24, 26),
		TopBar = Color3.fromRGB(32, 32, 35),
		Accent = Color3.fromRGB(0, 120, 212), 
		Text = Color3.fromRGB(255, 255, 255),
		TextMuted = Color3.fromRGB(150, 150, 150),
		WidgetDefault = Color3.fromRGB(40, 40, 43),
		WidgetHover = Color3.fromRGB(50, 50, 55)
	},
	["Light"] = {
		Background = Color3.fromRGB(240, 240, 245), 
		TopBar = Color3.fromRGB(255, 255, 255),
		Accent = Color3.fromRGB(0, 120, 212),       
		Text = Color3.fromRGB(30, 30, 30),         
		TextMuted = Color3.fromRGB(110, 110, 115),  
		WidgetDefault = Color3.fromRGB(225, 225, 228),
		WidgetHover = Color3.fromRGB(210, 210, 215)
	},
	["Yellow"] = {
		Background = Color3.fromRGB(40, 35, 10),
		TopBar = Color3.fromRGB(50, 45, 15),
		Accent = Color3.fromRGB(255, 193, 7), 
		Text = Color3.fromRGB(255, 255, 255),
		TextMuted = Color3.fromRGB(200, 190, 150),
		WidgetDefault = Color3.fromRGB(65, 55, 20),
		WidgetHover = Color3.fromRGB(80, 70, 25)
	}
}



function VanixiaUI:CreateWindow(option)
	local self = setmetatable({}, VanixiaUI)
	
	local themeName = option.Color or "Dark"
	local SelectedTheme = Themes[themeName] or Themes["Dark"]
	self.SelectedTheme = SelectedTheme 
	
	option = option or {}
	local Size = option.Size or UDim2.fromOffset(400 , 387)
	local Transparent = option.Transparency or 0.25
	local Title = option.Title or "VanixiaUI"
	local NameGui = option.Name or "VanixiaUI"
	local Author = option.Author or "by Thuan69392"
	
	local WindowPosition = UDim2.new(
		0.5, -Size.X.Offset / 2, 
		0.5, -Size.Y.Offset / 2
	)
	
	local PlayerGui
	if Players.LocalPlayer then
		
		PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
	else
		
		local firstPlayer = Players.PlayerAdded:Wait()
		PlayerGui = firstPlayer:WaitForChild("PlayerGui")
	end
	
	local VanixiaUIG = Instance.new("ScreenGui")
	VanixiaUIG.Name = NameGui
	VanixiaUIG.Parent = PlayerGui
	VanixiaUIG.ResetOnSpawn = false
	
	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = VanixiaUIG
	MainFrame.BackgroundColor3 = SelectedTheme.Background
	MainFrame.BackgroundTransparency = Transparent or 0.25
	MainFrame.BorderColor3 = SelectedTheme.Background
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = WindowPosition
	MainFrame.Size = Size
	
	local Corner = Instance.new("UICorner")
	Corner.Name = "Corner"
	Corner.Parent = MainFrame
	
	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.Parent = MainFrame
	TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TopBar.BackgroundTransparency = 1.000
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Size = UDim2.new(1, 0, 0, 39)
	
	local TCorner = Instance.new("UICorner")
	TCorner.Name = "TCorner"
	TCorner.Parent = TopBar
	
	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Name = "Title"
	TitleLabel.Parent = TopBar
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.BorderSizePixel = 0
	TitleLabel.Position = UDim2.new(0.0278293137, 0, 0.179487184, 0)
	TitleLabel.Size = UDim2.new(1, -20, 0, 25)
	TitleLabel.Font = Enum.Font.Nunito
	TitleLabel.Text = Title
	TitleLabel.TextColor3 = SelectedTheme.Text
	TitleLabel.TextSize = 23.000
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	
	if Author ~= "" then
		local AuthorLB = Instance.new("TextLabel")
		AuthorLB.Name = "Author"
		AuthorLB.Parent = TopBar
		AuthorLB.BackgroundTransparency = 1.010
		AuthorLB.BorderColor3 = Color3.fromRGB(0, 0, 0)
		AuthorLB.BorderSizePixel = 0
		AuthorLB.Position = UDim2.new(0, 15, 0, 26)
		AuthorLB.Size = UDim2.new(1, -20, 0, 15)
		AuthorLB.Font = Enum.Font.Nunito
		AuthorLB.Text = Author
		AuthorLB.TextColor3 = Color3.fromRGB(150, 150, 150)
		AuthorLB.TextSize = 16.000
		AuthorLB.TextXAlignment = Enum.TextXAlignment.Left
	end
	
	local Minimized = Instance.new("ImageButton")
	Minimized.Name = "Minimized"
	Minimized.Parent = TopBar
	Minimized.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimized.BackgroundTransparency = 1.000
	Minimized.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Minimized.BorderSizePixel = 0
	Minimized.Position = UDim2.new(0.898, 0,0, 0)
	Minimized.Size = UDim2.new(0, 25, 0, 25)
	Minimized.Image = VanixiaIcons["minus"]
	
	local ContentFarme = Instance.new("ScrollingFrame")
	ContentFarme.Name = "ContentFarme"
	ContentFarme.Parent = MainFrame
	ContentFarme.Active = true
	ContentFarme.CanvasSize = UDim2.new(0, 0, 0, 0)
	ContentFarme.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ContentFarme.BackgroundTransparency = 1.000
	ContentFarme.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContentFarme.BorderSizePixel = 0
	ContentFarme.Position = UDim2.new(0, 140, 0, 45)
	ContentFarme.Size = UDim2.new(1, -150, 1, -55)
	ContentFarme.ScrollBarThickness = 3
	
	local Corner_2 = Instance.new("UICorner")
	Corner_2.Name = "Corner"
	Corner_2.Parent = ContentFarme
	local Closed = Instance.new("ImageButton")
	local TabsFarme = Instance.new("ScrollingFrame")
	local Corner_5 = Instance.new("UICorner")
	TabsFarme.Name = "TabsFarme"
	TabsFarme.Parent = MainFrame
	TabsFarme.Active = true
	TabsFarme.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TabsFarme.BackgroundTransparency = 1.000
	TabsFarme.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabsFarme.BorderSizePixel = 0
	TabsFarme.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabsFarme.Position = UDim2.new(0, 5, 0, 45)
	TabsFarme.Size =  UDim2.new(0, 130, 1, -55)
	TabsFarme.ScrollBarThickness = 3
	
	Closed.Name = "Closed"
	Closed.Parent = TopBar
	Closed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Closed.BackgroundTransparency = 1.000
	Closed.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Closed.BorderSizePixel = 0
	Closed.Position = UDim2.new(0.944341242, 0, 0, 0)
	Closed.Size = UDim2.new(0, 25, 0, 25)
	Closed.Image = VanixiaIcons["x"]
	
	

	Corner_5.Name = "Corner"
	Corner_5.Parent = TabsFarme
	
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Padding = UDim.new(0, 8)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = ContentFarme

	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ContentFarme.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
	end)
	
	
	local TabListLayout = Instance.new("UIListLayout")
	TabListLayout.Padding = UDim.new(0, 5)
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabListLayout.Parent = TabsFarme

	TabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		TabsFarme.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)
	end)


	local dragging, dragInput, dragStart, startPos

	local function update(input)
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X, 
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
	
	MainFrame.Draggable = true
	MainFrame.Active = true

	TopBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = MainFrame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	local ToggleKey = option.ToggleKey or Enum.KeyCode.RightShift

	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if gameProcessedEvent then return end 

		if input.KeyCode == ToggleKey then
			local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

			if MainFrame.Visible then
				local fadeOut = TweenService:Create(MainFrame, tweenInfo, {BackgroundTransparency = 1})

				for _, child in pairs(MainFrame:GetDescendants()) do
					if child:IsA("Frame") or child:IsA("ScrollingFrame") then
						TweenService:Create(child, tweenInfo, {BackgroundTransparency = 1}):Play()
					elseif child:IsA("TextLabel") then
						TweenService:Create(child, tweenInfo, {TextTransparency = 1}):Play()
					elseif child:IsA("ImageButton") or child:IsA("ImageLabel") then
						TweenService:Create(child, tweenInfo, {ImageTransparency = 1}):Play()
					end
				end

				fadeOut:Play()
				fadeOut.Completed:Wait()
				MainFrame.Visible = false
			else
				MainFrame.Visible = true
				local fadeIn = TweenService:Create(MainFrame, tweenInfo, {BackgroundTransparency = option.Transparency or 0.25})

				for _, child in pairs(MainFrame:GetDescendants()) do
					if child:IsA("TextLabel") then
						TweenService:Create(child, tweenInfo, {TextTransparency = 0}):Play()
					elseif child:IsA("ImageButton") or child:IsA("ImageLabel") then
						TweenService:Create(child, tweenInfo, {ImageTransparency = 0}):Play()
					elseif child:IsA("Frame") or child:IsA("ScrollingFrame") then
						if child.Name == "ItemContainer" then
							child.BackgroundTransparency = 1
						elseif (child.Name == "ContentFarme" or child.Name == "TabsFarme") and child.Parent == MainFrame then
							TweenService:Create(child, tweenInfo, {BackgroundTransparency = 1}):Play()
						elseif child.Name == "Section" then
							TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0.5}):Play()
						elseif child.Name == "Button" or child.Name == "Toggle" or child.Name == "Dropdown" or child.Name == "Paragraph" or child.Name == "Slider" or child.Name == "InputText" or child.Name == "SectionButton" or child.Name == "SectionToggle" or child.Name == "SectionInput" then
							TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0}):Play()
						elseif child.Name == "SliderFill" or child.Name == "SliderKnob" or child.Name == "CornerFrame" or child.Name == "TextBox" then
							TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0}):Play()
						end
					elseif child:IsA("TextButton") then
				
						if child.Name == "ToggleButton" then
							TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0}):Play()
						elseif child.Name == "ButtonReal" or child.Name == "InvisibleClick" or child.Name == "DropdownHeader" or child.Name == "ToggleInvisibleClick" then
							child.BackgroundTransparency = 1
						end
					end
				end
				fadeIn:Play()
			end
		end
	end)

	TopBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	Minimized.MouseEnter:Connect(function()
		TweenService:Create(Minimized, TweenInfo.new(0.2), {BackgroundColor3 = Color.ButtonHover}):Play()
	end)

	Minimized.MouseLeave:Connect(function()
		TweenService:Create(Minimized, TweenInfo.new(0.2), {BackgroundColor3 = Color.ButtonDefault}):Play()
	end)

	Closed.MouseButton1Down:Connect(function()
		VanixiaUIG:Destroy()
	end)

	Minimized.MouseButton1Down:Connect(function()
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		if MainFrame.Visible then
			local fadeOut = TweenService:Create(MainFrame, tweenInfo, {BackgroundTransparency = 1})

			for _, child in pairs(MainFrame:GetDescendants()) do
				if child:IsA("Frame") or child:IsA("ScrollingFrame") then
					TweenService:Create(child, tweenInfo, {BackgroundTransparency = 1}):Play()
				elseif child:IsA("TextLabel") then
					TweenService:Create(child, tweenInfo, {TextTransparency = 1}):Play()
				elseif child:IsA("ImageButton") or child:IsA("ImageLabel") then
					TweenService:Create(child, tweenInfo, {ImageTransparency = 1}):Play()
				end
			end

			fadeOut:Play()
			fadeOut.Completed:Wait()
			MainFrame.Visible = false
		else
			MainFrame.Visible = true
			local fadeIn = TweenService:Create(MainFrame, tweenInfo, {BackgroundTransparency = option.Transparency or 0.25})

			for _, child in pairs(MainFrame:GetDescendants()) do
				if child:IsA("TextLabel") then
					TweenService:Create(child, tweenInfo, {TextTransparency = 0}):Play()
				elseif child:IsA("ImageButton") or child:IsA("ImageLabel") then
					TweenService:Create(child, tweenInfo, {ImageTransparency = 0}):Play()
				elseif child:IsA("Frame") or child:IsA("ScrollingFrame") then
					if child.Name == "ItemContainer" then
						child.BackgroundTransparency = 1
					elseif (child.Name == "ContentFarme" or child.Name == "TabsFarme") and child.Parent == MainFrame then
						TweenService:Create(child, tweenInfo, {BackgroundTransparency = 1}):Play()
					elseif child.Name == "Section" then
						TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0.5}):Play()
					elseif child.Name == "Button" or child.Name == "Toggle" or child.Name == "Dropdown" or child.Name == "Paragraph" or child.Name == "Slider" or child.Name == "InputText" or child.Name == "SectionButton" or child.Name == "SectionToggle" or child.Name == "SectionInput" then
						TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0}):Play()
					elseif child.Name == "SliderFill" or child.Name == "SliderKnob" or child.Name == "CornerFrame" or child.Name == "TextBox" then
						TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0}):Play()
					end
				elseif child:IsA("TextButton") then
					if child.Name == "ToggleButton" then
						TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0}):Play()
					elseif child.Name == "ButtonReal" or child.Name == "InvisibleClick" or child.Name == "DropdownHeader" or child.Name == "ToggleInvisibleClick" then
						child.BackgroundTransparency = 1
					end
				end
			end

			fadeIn:Play()
		end
	end)
	
	self.TopBarObject = TopBar    
	self.TitleLabelObject = TitleLabel 

	self.ScreenGuiObject = VanixiaUIG 
	self.MainFrameObject = MainFrame 
	self.TabsContainer = TabsFarme
	self.ContentContainer = ContentFarme
	return self
end


function VanixiaUI:CreateTag(tagText, customColor)
	if not tagText or tagText == "" then return end

	local TopBar = self.TopBarObject
	local TitleLabel = self.TitleLabelObject

	local NotificationThemes = {
		["Dark"] = Color3.fromRGB(0, 120, 212),  
		["Light"] = Color3.fromRGB(0, 120, 212), 
		["Yellow"] = Color3.fromRGB(255, 193, 7)  
	}

	local finalTagColor = Color3.fromRGB(0, 150, 255) 

	if customColor then
		if typeof(customColor) == "Color3" then
			finalTagColor = customColor
		elseif typeof(customColor) == "string" and NotificationThemes[customColor] then
			finalTagColor = NotificationThemes[customColor]
		end
	end

	local oldTag = TopBar:FindFirstChild("WindowTag")
	if oldTag then oldTag:Destroy() end

	local TagFrame = Instance.new("Frame")
	TagFrame.Name = "WindowTag"
	TagFrame.Parent = TopBar
	TagFrame.BackgroundColor3 = finalTagColor
	TagFrame.BorderSizePixel = 0
	TagFrame.AutomaticSize = Enum.AutomaticSize.X
	TagFrame.Size = UDim2.new(0, 0, 0, 16) 

	local TagCorner = Instance.new("UICorner")
	TagCorner.CornerRadius = UDim.new(0, 4)
	TagCorner.Parent = TagFrame

	local TagPadding = Instance.new("UIPadding")
	TagPadding.PaddingLeft = UDim.new(0, 6)
	TagPadding.PaddingRight = UDim.new(0, 6)
	TagPadding.Parent = TagFrame

	local TagTextLabel = Instance.new("TextLabel")
	TagTextLabel.Name = "TagText"
	TagTextLabel.Parent = TagFrame
	TagTextLabel.BackgroundTransparency = 1
	TagTextLabel.Size = UDim2.new(1, 0, 1, 0)
	TagTextLabel.Font = Enum.Font.Nunito
	TagTextLabel.Text = string.upper(tagText) 
	if customColor == "Light" then
		TagTextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		TagTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
	TagTextLabel.TextSize = 10

	local function repositionTag()
		task.wait()
		local titleWidth = TitleLabel.TextBounds.X
		TagFrame.Position = UDim2.new(0, 15 + titleWidth + 8, 0, 11) 
	end

	repositionTag()
	TitleLabel:GetPropertyChangedSignal("Text"):Connect(repositionTag) 
end


function VanixiaUI:CreateDialog(config)
	config = config or {}
	local titleText = config.Title or "Xác Nhận"
	local messageText = config.Message or "Bạn có chắc chắn muốn thực hiện hành động này?"
	local acceptText = config.AcceptText or "Đồng Ý"
	local cancelText = config.CancelText or "Hủy Bỏ"
	local callback = config.Callback or function() end

	local SelectedTheme = self.SelectedTheme
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	if self.MainFrameObject then
		self.MainFrameObject.ClipsDescendants = true
	end

	local DimOverlay = Instance.new("TextButton")
	DimOverlay.Name = "DimOverlay"
	DimOverlay.Parent = self.MainFrameObject
	DimOverlay.Size = UDim2.new(1, 0, 1, 0)
	DimOverlay.Position = UDim2.new(0, 0, 0, 0)
	DimOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	DimOverlay.BackgroundTransparency = 1 
	DimOverlay.BorderSizePixel = 0
	DimOverlay.Text = ""
	DimOverlay.AutoButtonColor = false
	DimOverlay.ZIndex = 100

	local DialogFrame = Instance.new("Frame")
	DialogFrame.Name = "DialogFrame"
	DialogFrame.Parent = DimOverlay
	DialogFrame.BackgroundColor3 = SelectedTheme.WidgetDefault 
	DialogFrame.BorderSizePixel = 0
	DialogFrame.Size = UDim2.fromOffset(300, 150) 
	DialogFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
	DialogFrame.BackgroundTransparency = 1
	DialogFrame.ZIndex = 101

	local DialogCorner = Instance.new("UICorner")
	DialogCorner.CornerRadius = UDim.new(0, 8)
	DialogCorner.Parent = DialogFrame

	local DialogStroke = Instance.new("UIStroke")
	DialogStroke.Color = SelectedTheme.WidgetHover
	DialogStroke.Thickness = 1
	DialogStroke.Transparency = 1
	DialogStroke.Parent = DialogFrame

	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Name = "Title"
	TitleLabel.Parent = DialogFrame
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Position = UDim2.fromOffset(15, 12)
	TitleLabel.Size = UDim2.new(1, -30, 0, 22)
	TitleLabel.Font = Enum.Font.Nunito
	TitleLabel.Text = titleText
	TitleLabel.TextColor3 = SelectedTheme.Text
	TitleLabel.TextSize = 15
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	TitleLabel.TextTransparency = 1
	TitleLabel.ZIndex = 102

	local MessageLabel = Instance.new("TextLabel")
	MessageLabel.Name = "Message"
	MessageLabel.Parent = DialogFrame
	MessageLabel.BackgroundTransparency = 1
	MessageLabel.Position = UDim2.fromOffset(15, 38)
	MessageLabel.Size = UDim2.new(1, -30, 0, 55)
	MessageLabel.Font = Enum.Font.Nunito
	MessageLabel.Text = messageText
	MessageLabel.TextColor3 = SelectedTheme.TextMuted
	MessageLabel.TextSize = 13
	MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
	MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
	MessageLabel.TextWrapped = true
	MessageLabel.TextTransparency = 1
	MessageLabel.ZIndex = 102

	local AcceptBtn = Instance.new("TextButton")
	AcceptBtn.Name = "AcceptBtn"
	AcceptBtn.Parent = DialogFrame
	AcceptBtn.BackgroundColor3 = SelectedTheme.Accent
	AcceptBtn.Size = UDim2.fromOffset(125, 30)
	AcceptBtn.Position = UDim2.new(0, 15, 1, -40)
	AcceptBtn.Font = Enum.Font.Nunito
	AcceptBtn.Text = acceptText
	AcceptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	AcceptBtn.TextSize = 13
	AcceptBtn.BackgroundTransparency = 1
	AcceptBtn.TextTransparency = 1
	AcceptBtn.ZIndex = 103

	local AcceptCorner = Instance.new("UICorner")
	AcceptCorner.CornerRadius = UDim.new(0, 6)
	AcceptCorner.Parent = AcceptBtn

	local CancelBtn = Instance.new("TextButton")
	CancelBtn.Name = "CancelBtn"
	CancelBtn.Parent = DialogFrame
	CancelBtn.BackgroundColor3 = SelectedTheme.Background 
	CancelBtn.Size = UDim2.fromOffset(125, 30)
	CancelBtn.Position = UDim2.new(1, -140, 1, -40)
	CancelBtn.Font = Enum.Font.Nunito
	CancelBtn.Text = cancelText
	CancelBtn.TextColor3 = SelectedTheme.Text
	CancelBtn.TextSize = 13
	CancelBtn.BackgroundTransparency = 1
	CancelBtn.TextTransparency = 1
	CancelBtn.ZIndex = 103

	local CancelCorner = Instance.new("UICorner")
	CancelCorner.CornerRadius = UDim.new(0, 6)
	CancelCorner.Parent = CancelBtn

	for _, subChild in pairs(DialogFrame:GetDescendants()) do
		if subChild:IsA("GuiObject") then
			subChild.ZIndex = 102
		end
	end
	AcceptBtn.ZIndex = 103
	CancelBtn.ZIndex = 103

	TweenService:Create(DimOverlay, tweenInfo, {BackgroundTransparency = 0.4}):Play()
	TweenService:Create(DialogFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
	TweenService:Create(DialogStroke, tweenInfo, {Transparency = 0}):Play()
	TweenService:Create(TitleLabel, tweenInfo, {TextTransparency = 0}):Play()
	TweenService:Create(MessageLabel, tweenInfo, {TextTransparency = 0}):Play()
	TweenService:Create(AcceptBtn, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
	TweenService:Create(CancelBtn, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()

	local function CloseDialog()
		local closeTween = TweenService:Create(DimOverlay, tweenInfo, {BackgroundTransparency = 1})
		TweenService:Create(DialogFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
		TweenService:Create(DialogStroke, tweenInfo, {Transparency = 1}):Play()
		TweenService:Create(TitleLabel, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(MessageLabel, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(AcceptBtn, tweenInfo, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
		TweenService:Create(CancelBtn, tweenInfo, {BackgroundTransparency = 1, TextTransparency = 1}):Play()

		closeTween:Play()
		closeTween.Completed:Wait()
		DimOverlay:Destroy()
	end

	AcceptBtn.MouseEnter:Connect(function() AcceptBtn.BackgroundColor3 = SelectedTheme.Accent:Lerp(Color3.fromRGB(255,255,255), 0.15) end)
	AcceptBtn.MouseLeave:Connect(function() AcceptBtn.BackgroundColor3 = SelectedTheme.Accent end)

	CancelBtn.MouseEnter:Connect(function() TweenService:Create(CancelBtn, tweenInfo, {BackgroundColor3 = SelectedTheme.WidgetHover}):Play() end)
	CancelBtn.MouseLeave:Connect(function() TweenService:Create(CancelBtn, tweenInfo, {BackgroundColor3 = SelectedTheme.Background}):Play() end)

	AcceptBtn.MouseButton1Click:Connect(function()
		task.spawn(callback, true)
		CloseDialog()
	end)

	CancelBtn.MouseButton1Click:Connect(function()
		task.spawn(callback, false)
		CloseDialog()
	end)
end




function VanixiaUI:CreateNotification(config)
	task.spawn(function()
		config = config or {}
		local titleText = config.Title or "Thông Báo"
		local descriptionText = config.Description or "Nội dung thông báo trống."
		local iconName = config.Icon or "badge-info"
		local duration = config.Duration or 4

		local NotificationThemes = {
			["Dark"] = { Background = Color3.fromRGB(28, 28, 30), Text = Color3.fromRGB(255, 255, 255), Accent = Color3.fromRGB(0, 120, 212) },
			["Light"] = { Background = Color3.fromRGB(255, 255, 255), Text = Color3.fromRGB(20, 20, 20), Accent = Color3.fromRGB(0, 120, 212) },
			["Yellow"] = { Background = Color3.fromRGB(45, 38, 15), Text = Color3.fromRGB(255, 255, 255), Accent = Color3.fromRGB(255, 193, 7) }
		}
		local chosenTheme = config.Theme or "Dark"
		local SelectedTheme = NotificationThemes[chosenTheme] or NotificationThemes["Dark"]

		local LocalPlayer = Players.LocalPlayer
		local PlayerGui = LocalPlayer and LocalPlayer:WaitForChild("PlayerGui") or Players.PlayerAdded:Wait():WaitForChild("PlayerGui")

		local NotifGui = PlayerGui:FindFirstChild("VanixiaNotificationGui")
		if not NotifGui then
			NotifGui = Instance.new("ScreenGui")
			NotifGui.Name = "VanixiaNotificationGui"
			NotifGui.ResetOnSpawn = false
			NotifGui.Parent = PlayerGui

			local NotifLayout = Instance.new("UIListLayout")
			NotifLayout.Padding = UDim.new(0, 10)
			NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
			NotifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
			NotifLayout.Parent = NotifGui

			local UIPadding = Instance.new("UIPadding")
			UIPadding.PaddingBottom = UDim.new(0, 20)
			UIPadding.PaddingRight = UDim.new(0, 20)
			UIPadding.Parent = NotifGui
		end

		local IconAssetId = VanixiaIcons[iconName] or "rbxassetid://131995373201472"

		local NotifCard = Instance.new("Frame")
		NotifCard.Name = "NotifCard"
		NotifCard.BackgroundColor3 = SelectedTheme.Background 
		NotifCard.BorderSizePixel = 0
		NotifCard.Size = UDim2.fromOffset(280, 70)
		NotifCard.BackgroundTransparency = 1
		NotifCard.Parent = NotifGui

		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 6)
		Corner.Parent = NotifCard

		local Stroke = Instance.new("UIStroke")
		Stroke.Color = Color3.fromRGB(50, 50, 53)
		Stroke.Thickness = 1
		Stroke.Transparency = 1
		Stroke.Parent = NotifCard

		local NotifIcon = Instance.new("ImageLabel")
		NotifIcon.Name = "NotifIcon"
		NotifIcon.Size = UDim2.fromOffset(20, 20)
		NotifIcon.Position = UDim2.fromOffset(12, 12)
		NotifIcon.Image = IconAssetId
		NotifIcon.ImageColor3 = SelectedTheme.Accent
		NotifIcon.BackgroundTransparency = 1
		NotifIcon.ImageTransparency = 1
		NotifIcon.Parent = NotifCard

		local TitleLabel = Instance.new("TextLabel")
		TitleLabel.Name = "Title"
		TitleLabel.Size = UDim2.new(1, -55, 0, 20)
		TitleLabel.Position = UDim2.fromOffset(42, 12)
		TitleLabel.Font = Enum.Font.Nunito
		TitleLabel.Text = titleText
		TitleLabel.TextColor3 =  SelectedTheme.Text
		TitleLabel.TextSize = 14
		TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
		TitleLabel.BackgroundTransparency = 1
		TitleLabel.TextTransparency = 1
		TitleLabel.Parent = NotifCard

		local DescLabel = Instance.new("TextLabel")
		DescLabel.Name = "Description"
		DescLabel.Size = UDim2.new(1, -55, 0, 30)
		DescLabel.Position = UDim2.fromOffset(42, 30)
		DescLabel.Font = Enum.Font.Nunito
		DescLabel.Text = descriptionText
		DescLabel.TextColor3 = SelectedTheme.Text
		DescLabel.TextSize = 12
		DescLabel.TextXAlignment = Enum.TextXAlignment.Left
		DescLabel.TextYAlignment = Enum.TextYAlignment.Top
		DescLabel.TextWrapped = true
		DescLabel.BackgroundTransparency = 1
		DescLabel.TextTransparency = 1
		DescLabel.Parent = NotifCard

		local ProgressBarTrack = Instance.new("Frame")
		ProgressBarTrack.Name = "ProgressBarTrack"
		ProgressBarTrack.Size = UDim2.new(1, -24, 0, 3)
		ProgressBarTrack.Position = UDim2.new(0, 12, 1, -8)
		ProgressBarTrack.BackgroundColor3 = Color3.fromRGB(45,45,48)
		ProgressBarTrack.BackgroundTransparency = 1
		ProgressBarTrack.BorderSizePixel = 0
		ProgressBarTrack.Parent = NotifCard

		local ProgressBar = Instance.new("Frame")
		ProgressBar.Name = "ProgressBar"
		ProgressBar.Size = UDim2.new(1, 0, 1, 0)
		ProgressBar.BackgroundColor3 = SelectedTheme.Accent
		ProgressBar.BorderSizePixel = 0
		ProgressBar.Parent = ProgressBarTrack

		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService:Create(NotifCard, tweenInfo, {BackgroundTransparency = 0}):Play()
		TweenService:Create(Stroke, tweenInfo, {Transparency = 0}):Play()
		TweenService:Create(NotifIcon, tweenInfo, {ImageTransparency = 0}):Play()
		TweenService:Create(TitleLabel, tweenInfo, {TextTransparency = 0}):Play()
		TweenService:Create(DescLabel, tweenInfo, {TextTransparency = 0}):Play()
		TweenService:Create(ProgressBarTrack, tweenInfo, {BackgroundTransparency = 0}):Play()

		task.wait(0.3)
		local barTween = TweenService:Create(ProgressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
			Size = UDim2.new(0, 0, 1, 0)
		})
		barTween:Play()
		barTween.Completed:Wait()

		local fadeOutTween = TweenService:Create(NotifCard, tweenInfo, {BackgroundTransparency = 1})
		TweenService:Create(Stroke, tweenInfo, {Transparency = 1}):Play()
		TweenService:Create(NotifIcon, tweenInfo, {ImageTransparency = 1}):Play()
		TweenService:Create(TitleLabel, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(DescLabel, tweenInfo, {TextTransparency = 1}):Play()
		TweenService:Create(ProgressBarTrack, tweenInfo, {BackgroundTransparency = 1}):Play()

		fadeOutTween:Play()
		fadeOutTween.Completed:Wait()
		NotifCard:Destroy()
	end)
end




function VanixiaUI:CreateTab(tabName, iconName)
	
	local SelectedTheme = self.SelectedTheme
	local IconAssetId = VanixiaIcons[iconName] or "rbxassetid://121018724060431" 


	local TabButton = Instance.new("TextButton")
	TabButton.Name = tabName .. "_TabBtn"
	TabButton.Size = UDim2.new(1, -10, 0, 36)
	TabButton.Position = UDim2.fromOffset(5, 0)
	TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 48)
	TabButton.BackgroundTransparency = 1
	TabButton.Font = Enum.Font.Nunito
	TabButton.Text = "          " .. tabName 
	TabButton.TextColor3 = Color3.fromRGB(150, 150, 150) 
	TabButton.TextSize = 14
	TabButton.TextXAlignment = Enum.TextXAlignment.Left
	TabButton.Parent = self.TabsContainer

	local TabBtnCorner = Instance.new("UICorner")
	TabBtnCorner.CornerRadius = UDim.new(0, 6)
	TabBtnCorner.Parent = TabButton

	
	local TabIcon = Instance.new("ImageLabel")
	TabIcon.Name = "Icon"
	TabIcon.Size = UDim2.fromOffset(16, 16)
	TabIcon.Position = UDim2.fromOffset(10, 10)
	TabIcon.Image = IconAssetId
	TabIcon.ImageColor3 = Color3.fromRGB(150, 150, 150)
	TabIcon.BackgroundTransparency = 1
	TabIcon.Parent = TabButton

	
	local TabPage = Instance.new("ScrollingFrame")
	TabPage.Name = tabName .. "_Page"
	TabPage.Size = UDim2.new(1, 0, 1, 0) 
	TabPage.BackgroundTransparency = 1
	TabPage.BorderSizePixel = 0
	TabPage.ScrollBarThickness = 3
	TabPage.Visible = false 
	TabPage.Parent = self.ContentContainer 

	local PageLayout = Instance.new("UIListLayout")
	PageLayout.Padding = UDim.new(0, 8)
	PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	PageLayout.Parent = TabPage

	PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
	end)

	local function ActivateTab()
		for _, page in pairs(self.ContentContainer:GetChildren()) do
			if page:IsA("ScrollingFrame") then page.Visible = false end
		end
		for _, btn in pairs(self.TabsContainer:GetChildren()) do
			if btn:IsA("TextButton") then
				TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150), BackgroundTransparency = 1}):Play()
				if btn:FindFirstChild("Icon") then
					TweenService:Create(btn.Icon, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(150, 150, 150)}):Play()
				end
			end
		end
		TabPage.Visible = true
		TweenService:Create(TabButton, TweenInfo.new(0.2), {TextColor3 = SelectedTheme.Text}):Play()
		TweenService:Create(TabIcon, TweenInfo.new(0.2), {ImageColor3 = SelectedTheme.Accent}):Play()
	end

	TabButton.MouseButton1Click:Connect(ActivateTab)

	if not self.HasActiveTab then
		self.HasActiveTab = true
		ActivateTab()
	end

	local TabObject = {}
	TabObject.__index = TabObject
	TabObject.PageContainer = TabPage 
	TabObject.SelectedTheme = self.SelectedTheme
	
	
	function TabObject:CreateSection(sectionName)
		local SelectedTheme = self.SelectedTheme

		local Section = Instance.new("Frame")
		Section.Name = "Section"
		Section.Parent = self.PageContainer 
		Section.BackgroundColor3 = SelectedTheme.WidgetDefault
		Section.BackgroundTransparency = 0.5
		Section.BorderSizePixel = 0
		Section.AutomaticSize = Enum.AutomaticSize.Y 
		Section.Size = UDim2.new(1, 0, 0, 0)

		local SectionCorner = Instance.new("UICorner")
		SectionCorner.CornerRadius = UDim.new(0, 6)
		SectionCorner.Parent = Section

		
		local SectionPadding = Instance.new("UIPadding")
		SectionPadding.PaddingTop = UDim.new(0, 5) 
		SectionPadding.PaddingBottom = UDim.new(0, 8)
		SectionPadding.PaddingLeft = UDim.new(0, 8)
		SectionPadding.PaddingRight = UDim.new(0, 8)
		SectionPadding.Parent = Section

	
		local SectionTitle = Instance.new("TextLabel")
		SectionTitle.Name = "SectionTitle"
		SectionTitle.Parent = Section 
		SectionTitle.LayoutOrder = 0 
		SectionTitle.BackgroundTransparency = 1
		SectionTitle.Position = UDim2.new(0, 12, 0, 8)
		SectionTitle.Size = UDim2.new(1, -24, 0, 18)
		SectionTitle.Font = Enum.Font.Nunito
		SectionTitle.Text = string.upper(sectionName) 
		SectionTitle.TextColor3 = SelectedTheme.Accent
		SectionTitle.TextSize = 12
		SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

		local SectionLayout = Instance.new("UIListLayout")
		SectionLayout.Padding = UDim.new(0, 6)
		SectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
		SectionLayout.Parent = Section

		Section:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			local PageLayout = self.PageContainer:FindFirstChildOfClass("UIListLayout")
			if PageLayout then
				self.PageContainer.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
			end
		end)

		local SectionObject = {}
		SectionObject.__index = SectionObject
		SectionObject.PageContainer = Section 
		SectionObject.SelectedTheme = SelectedTheme

		SectionObject.CreateButton = self.CreateButton
		SectionObject.CreateToggle = self.CreateToggle
		SectionObject.CreateDropdown = self.CreateDropdown
		SectionObject.CreateInput = self.CreateInput 

		return setmetatable(SectionObject, SectionObject)
	end


	function TabObject:CreateInput(titletext, placeholder, callback)
		local SelectedTheme = self.SelectedTheme
		placeholder = placeholder or "Nhập dữ liệu..."

		local InputFrame = Instance.new("Frame")
		InputFrame.Name = "InputText"
		InputFrame.Parent = self.PageContainer
		InputFrame.BackgroundColor3 = SelectedTheme.WidgetDefault
		InputFrame.BorderSizePixel = 0
		InputFrame.Size = UDim2.new(1, 0, 0, 42)

		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 6)
		Corner.Parent = InputFrame

	
		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.Parent = InputFrame
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 12, 0, 0)
		Title.Size = UDim2.new(1, -160, 1, 0)
		Title.Font = Enum.Font.Nunito
		Title.Text = titletext
		Title.TextColor3 = SelectedTheme.Text
		Title.TextSize = 14
		Title.TextXAlignment = Enum.TextXAlignment.Left

		
		local TextBox = Instance.new("TextBox")
		TextBox.Name = "TextBox"
		TextBox.Parent = InputFrame
		TextBox.BackgroundColor3 = SelectedTheme.WidgetHover
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(1, -145, 0.5, -12) 
		TextBox.Size = UDim2.fromOffset(133, 24)
		TextBox.Font = Enum.Font.Nunito
		TextBox.PlaceholderText = placeholder
		TextBox.PlaceholderColor3 = SelectedTheme.TextMuted
		TextBox.Text = ""
		TextBox.TextColor3 = SelectedTheme.Text
		TextBox.TextSize = 13
		TextBox.ClipsDescendants = true

		local TBCorner = Instance.new("UICorner")
		TBCorner.CornerRadius = UDim.new(0, 4)
		TBCorner.Parent = TextBox

		local TBStroke = Instance.new("UIStroke")
		TBStroke.Color = SelectedTheme.WidgetHover
		TBStroke.Thickness = 1
		TBStroke.Parent = TextBox

		TextBox.Focused:Connect(function()
			TweenService:Create(TBStroke, TweenInfo.new(0.1), {Color = SelectedTheme.Accent}):Play()
		end)

		TextBox.FocusLost:Connect(function(enterPressed)
			TweenService:Create(TBStroke, TweenInfo.new(0.1), {Color = SelectedTheme.WidgetHover}):Play()

			task.spawn(callback, TextBox.Text, enterPressed) 
		end)
	end

	
	function TabObject:CreateSlider(titletext, min, max, default, callback)
		local SelectedTheme = self.SelectedTheme
		min = min or 0
		max = max or 100
		default = math.clamp(default or min, min, max)

		local SliderFrame = Instance.new("Frame")
		SliderFrame.Name = "Slider"
		SliderFrame.Parent = self.PageContainer 
		SliderFrame.BackgroundColor3 = SelectedTheme.WidgetDefault
		SliderFrame.BorderSizePixel = 0
		SliderFrame.Size = UDim2.new(1, 0, 0, 46) 

		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 6)
		Corner.Parent = SliderFrame

		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.Parent = SliderFrame
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 12, 0, 4)
		Title.Size = UDim2.new(1, -100, 0, 20)
		Title.Font = Enum.Font.Nunito
		Title.Text = titletext
		Title.TextColor3 = SelectedTheme.Text
		Title.TextSize = 14
		Title.TextXAlignment = Enum.TextXAlignment.Left

		local ValueLabel = Instance.new("TextLabel")
		ValueLabel.Name = "ValueLabel"
		ValueLabel.Parent = SliderFrame
		ValueLabel.BackgroundTransparency = 1
		ValueLabel.Position = UDim2.new(1, -92, 0, 4)
		ValueLabel.Size = UDim2.new(0, 80, 0, 20)
		ValueLabel.Font = Enum.Font.Nunito
		ValueLabel.Text = tostring(default) .. " / " .. tostring(max)
		ValueLabel.TextColor3 = SelectedTheme.TextMuted
		ValueLabel.TextSize = 13
		ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

		local SliderTrack = Instance.new("TextButton")
		SliderTrack.Name = "SliderTrack"
		SliderTrack.Parent = SliderFrame
		SliderTrack.BackgroundColor3 = SelectedTheme.WidgetHover
		SliderTrack.BorderSizePixel = 0
		SliderTrack.Position = UDim2.new(0, 12, 1, -14)
		SliderTrack.Size = UDim2.new(1, -24, 0, 6)
		SliderTrack.Text = ""
		SliderTrack.AutoButtonColor = false

		local TrackCorner = Instance.new("UICorner")
		TrackCorner.CornerRadius = UDim.new(1, 0)
		TrackCorner.Parent = SliderTrack

		local SliderFill = Instance.new("Frame")
		SliderFill.Name = "SliderFill"
		SliderFill.Parent = SliderTrack
		SliderFill.BackgroundColor3 = SelectedTheme.Accent
		SliderFill.BorderSizePixel = 0
		local initPercent = (default - min) / (max - min)
		SliderFill.Size = UDim2.new(initPercent, 0, 1, 0)

		local FillCorner = Instance.new("UICorner")
		FillCorner.CornerRadius = UDim.new(1, 0)
		FillCorner.Parent = SliderFill

		local SliderKnob = Instance.new("Frame")
		SliderKnob.Name = "SliderKnob"
		SliderKnob.Parent = SliderFill
		SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
		SliderKnob.Position = UDim2.new(1, -6, 0.5, -6)
		SliderKnob.Size = UDim2.fromOffset(12, 12)

		local KnobCorner = Instance.new("UICorner")
		KnobCorner.CornerRadius = UDim.new(1, 0)
		KnobCorner.Parent = SliderKnob

		local dragging = false
		local function updateSlider(input)
			local trackWidth = SliderTrack.AbsoluteSize.X
			local mouseX = input.Position.X - SliderTrack.AbsolutePosition.X
			local percentage = math.clamp(mouseX / trackWidth, 0, 1)

			local rawValue = min + (percentage * (max - min))
			local finalValue = math.round(rawValue)

			TweenService:Create(SliderFill, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(percentage, 0, 1, 0)
			}):Play()

			ValueLabel.Text = tostring(finalValue) .. " / " .. tostring(max)

			task.spawn(callback, finalValue)
		end

		SliderTrack.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				updateSlider(input)
			end
		end)

		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				updateSlider(input)
			end
		end)
	end

	

	function TabObject:CreateParagraph(titletext, bodytext)
		
		local SelectedTheme = self.SelectedTheme
		
		
		local Paragraph = Instance.new("Frame")
		Paragraph.Name = "Paragraph"
		Paragraph.Parent = self.PageContainer
		Paragraph.BackgroundColor3 =  SelectedTheme.WidgetDefault
		Paragraph.BorderSizePixel = 0
		Paragraph.AutomaticSize = Enum.AutomaticSize.Y 
		Paragraph.Size = UDim2.new(1, 0, 0, 0) 

		local Corner_Para = Instance.new("UICorner")
		Corner_Para.CornerRadius = UDim.new(0, 6)
		Corner_Para.Parent = Paragraph

		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingTop = UDim.new(0, 8)
		UIPadding.PaddingBottom = UDim.new(0, 10)
		UIPadding.PaddingLeft = UDim.new(0, 12)
		UIPadding.PaddingRight = UDim.new(0, 12)
		UIPadding.Parent = Paragraph

		local ParaLayout = Instance.new("UIListLayout")
		ParaLayout.Padding = UDim.new(0, 4)
		ParaLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ParaLayout.Parent = Paragraph

		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.LayoutOrder = 1
		Title.Parent = Paragraph
		Title.BackgroundTransparency = 1
		Title.Size = UDim2.new(1, 0, 0, 20)
		Title.Font = Enum.Font.Nunito
		Title.Text = titletext
		Title.TextColor3 = SelectedTheme.Text
		Title.TextSize = 14
		Title.TextXAlignment = Enum.TextXAlignment.Left

		local Body = Instance.new("TextLabel")
		Body.Name = "Body"
		Body.LayoutOrder = 2
		Body.Parent = Paragraph
		Body.BackgroundTransparency = 1
		Body.AutomaticSize = Enum.AutomaticSize.Y 
		Body.Size = UDim2.new(1, 0, 0, 0) 
		Body.Font = Enum.Font.Nunito
		Body.Text = bodytext
		Body.TextColor3 = SelectedTheme.TextMuted
		Body.TextSize = 13
		Body.TextXAlignment = Enum.TextXAlignment.Left
		Body.TextYAlignment = Enum.TextYAlignment.Top
		Body.TextWrapped = true

		local function updateTabScroll()
			local PageLayout = self.PageContainer:FindFirstChildOfClass("UIListLayout")
			if PageLayout then
				self.PageContainer.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
			end
		end

		Paragraph:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateTabScroll)

		task.spawn(updateTabScroll)
	end






	function TabObject:CreateButton(text, callback)
		local SelectedTheme = self.SelectedTheme
		
		local Button = Instance.new("Frame")
		Button.Name = "Button"
		Button.Parent = self.PageContainer 
		Button.BackgroundColor3 = SelectedTheme.WidgetDefault
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(1, 0, 0, 42)

		local Corner_3 = Instance.new("UICorner")
		Corner_3.CornerRadius = UDim.new(0, 6)
		Corner_3.Name = "Corner"
		Corner_3.Parent = Button

		local Title_2 = Instance.new("TextLabel")
		Title_2.Name = "Title"
		Title_2.Parent = Button
		Title_2.BackgroundTransparency = 1.000
		Title_2.BorderSizePixel = 0
		Title_2.Position = UDim2.new(0, 12, 0, 0)
		Title_2.Size = UDim2.new(1, -24, 1, 0)
		Title_2.Font = Enum.Font.Nunito
		Title_2.Text = text
		Title_2.TextColor3 = SelectedTheme.Text
		Title_2.TextSize = 15.000
		Title_2.TextXAlignment = Enum.TextXAlignment.Left

		local ButtonReal = Instance.new("TextButton")
		ButtonReal.Name = "ButtonReal"
		ButtonReal.Parent = Button
		ButtonReal.BackgroundTransparency = 1.000
		ButtonReal.BorderSizePixel = 0
		ButtonReal.Size = UDim2.new(1, 0, 1, 0)
		ButtonReal.Font = Enum.Font.SourceSans
		ButtonReal.Text = "" 

		ButtonReal.MouseEnter:Connect(function()
			TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = SelectedTheme.WidgetHover}):Play()
		end)

		ButtonReal.MouseLeave:Connect(function()
			TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = SelectedTheme.WidgetDefault}):Play()
		end)

		ButtonReal.MouseButton1Click:Connect(function()
			local clickTween = TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = SelectedTheme.WidgetHover})
			clickTween:Play()
			clickTween.Completed:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = SelectedTheme.WidgetDefault}):Play()
			end)
			task.spawn(callback)
		end)
	end
	
	

	
	
	function TabObject:CreateDropdown(titletext, list, callback)
		local dropdownOpen = false
		list = list or {}
		local SelectedTheme = self.SelectedTheme


		local Dropdown = Instance.new("Frame")
		Dropdown.Name = "Dropdown"
		Dropdown.Parent = self.PageContainer 
		Dropdown.BackgroundColor3 = SelectedTheme.WidgetDefault
		Dropdown.BorderSizePixel = 0
		Dropdown.Size = UDim2.new(1, 0, 0, 42)
		Dropdown.ClipsDescendants = true 

		local Corner_Dropdown = Instance.new("UICorner")
		Corner_Dropdown.CornerRadius = UDim.new(0, 6)
		Corner_Dropdown.Parent = Dropdown

		local DropdownHeader = Instance.new("TextButton")
		DropdownHeader.Name = "DropdownHeader"
		DropdownHeader.Parent = Dropdown
		DropdownHeader.BackgroundTransparency = 1
		DropdownHeader.Size = UDim2.new(1, 0, 0, 42)
		DropdownHeader.Text = ""

		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.Parent = DropdownHeader
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 12, 0, 0)
		Title.Size = UDim2.new(1, -50, 1, 0)
		Title.Font = Enum.Font.Nunito
		Title.Text = titletext
		Title.TextColor3 = SelectedTheme.Text
		Title.TextSize = 15
		Title.TextXAlignment = Enum.TextXAlignment.Left

		local ArrowIcon = Instance.new("ImageLabel")
		ArrowIcon.Name = "ArrowIcon"
		ArrowIcon.Parent = DropdownHeader
		ArrowIcon.BackgroundTransparency = 1
		ArrowIcon.Position = UDim2.new(1, -32, 0.5, -8)
		ArrowIcon.Size = UDim2.fromOffset(16, 16)
		ArrowIcon.Image = VanixiaIcons["chevron-down"] or "rbxassetid://124408496673275" 
		ArrowIcon.ImageColor3 = Color3.fromRGB(150, 150, 150)

		local ItemContainer = Instance.new("ScrollingFrame")
		ItemContainer.Name = "ItemContainer"
		ItemContainer.Parent = Dropdown
		ItemContainer.BackgroundTransparency = 1
		ItemContainer.BorderSizePixel = 0
		ItemContainer.Position = UDim2.new(0, 5, 0, 45)
		ItemContainer.Size = UDim2.new(1, -10, 0, 0)
		ItemContainer.ScrollBarThickness = 2
		ItemContainer.CanvasSize = UDim2.new(0, 0, 0, 0)

		local ItemLayout = Instance.new("UIListLayout")
		ItemLayout.Padding = UDim.new(0, 4)
		ItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ItemLayout.Parent = ItemContainer

		ItemLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			ItemContainer.CanvasSize = UDim2.new(0, 0, 0, ItemLayout.AbsoluteContentSize.Y)
		end)

		local function updateParentLayout()
			local PageLayout = self.PageContainer:FindFirstChildOfClass("UIListLayout")
			if PageLayout then
				self.PageContainer.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y)
			end
		end

		local function addItem(itemName)
			local ItemBtn = Instance.new("TextButton")
			ItemBtn.Name = itemName .. "_Option"
			ItemBtn.Parent = ItemContainer
			ItemBtn.BackgroundColor3 = SelectedTheme.WidgetHover
			ItemBtn.Size = UDim2.new(1, 0, 0, 32)
			ItemBtn.Font = Enum.Font.Nunito
			ItemBtn.Text = "     " .. itemName
			ItemBtn.TextColor3 = SelectedTheme.Text
			ItemBtn.TextSize = 14
			ItemBtn.TextXAlignment = Enum.TextXAlignment.Left

			local ItemCorner = Instance.new("UICorner")
			ItemCorner.CornerRadius = UDim.new(0, 4)
			ItemCorner.Parent = ItemBtn

			ItemBtn.MouseEnter:Connect(function()
				TweenService:Create(ItemBtn, TweenInfo.new(0.1), {BackgroundColor3 = SelectedTheme.Accent, TextColor3 = Color3.new(255,255,255)}):Play()
			end)
			ItemBtn.MouseLeave:Connect(function()
				TweenService:Create(ItemBtn, TweenInfo.new(0.1), {BackgroundColor3 = SelectedTheme.WidgetHover, TextColor3 = SelectedTheme.Text}):Play()
			end)

			ItemBtn.MouseButton1Click:Connect(function()
				Title.Text = titletext .. " : " .. itemName 
				dropdownOpen = false

				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				TweenService:Create(Dropdown, tweenInfo, {Size = UDim2.new(1, 0, 0, 42)}):Play()
				TweenService:Create(ItemContainer, tweenInfo, {Size = UDim2.new(1, -10, 0, 0)}):Play()
				TweenService:Create(ArrowIcon, tweenInfo, {Rotation = 0}):Play() 

				task.wait(0.2)
				updateParentLayout()
				task.spawn(callback, itemName) 
			end)
		end

		for _, name in pairs(list) do
			addItem(name)
		end

		DropdownHeader.MouseButton1Click:Connect(function()
			dropdownOpen = not dropdownOpen
			local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

			if dropdownOpen then
				local contentHeight = math.clamp(ItemLayout.AbsoluteContentSize.Y, 0, 150)
				local targetDropdownHeight = 42 + contentHeight + 10 

				TweenService:Create(Dropdown, tweenInfo, {Size = UDim2.new(1, 0, 0, targetDropdownHeight)}):Play()
				TweenService:Create(ItemContainer, tweenInfo, {Size = UDim2.new(1, -10, 0, contentHeight)}):Play()
				TweenService:Create(ArrowIcon, tweenInfo, {Rotation = 180}):Play() 
			else
				TweenService:Create(Dropdown, tweenInfo, {Size = UDim2.new(1, 0, 0, 42)}):Play()
				TweenService:Create(ItemContainer, tweenInfo, {Size = UDim2.new(1, -10, 0, 0)}):Play()
				TweenService:Create(ArrowIcon, tweenInfo, {Rotation = 0}):Play()
			end

			task.wait(0.2)
			updateParentLayout()
		end)
	end

	
	function TabObject:CreateToggle(titletext, callback)
		local toggled = false 
		local SelectedTheme = self.SelectedTheme
		
		local Toggle = Instance.new("Frame")
		Toggle.Name = "Toggle"
		Toggle.Parent = self.PageContainer
		Toggle.BackgroundColor3 = SelectedTheme.WidgetDefault
		Toggle.BorderSizePixel = 0
		Toggle.Size = UDim2.new(1, 0, 0, 42)

		local Corner_5 = Instance.new("UICorner")
		Corner_5.CornerRadius = UDim.new(0, 6)
		Corner_5.Name = "Corner"
		Corner_5.Parent = Toggle

		local Title_3 = Instance.new("TextLabel")
		Title_3.Name = "Title"
		Title_3.Parent = Toggle
		Title_3.BackgroundTransparency = 1.000
		Title_3.BorderSizePixel = 0
		Title_3.Position = UDim2.new(0, 12, 0, 0)
		Title_3.Size = UDim2.new(1, -80, 1, 0) 
		Title_3.Font = Enum.Font.Nunito
		Title_3.Text = titletext
		Title_3.TextColor3 = SelectedTheme.Text
		Title_3.TextSize = 15.000 
		Title_3.TextXAlignment = Enum.TextXAlignment.Left

		local ToggleButton = Instance.new("TextButton")
		ToggleButton.Name = "ToggleButton"
		ToggleButton.Parent = Toggle
		ToggleButton.BackgroundColor3 = SelectedTheme.TextMuted 
		ToggleButton.BorderSizePixel = 0
		ToggleButton.Position = UDim2.new(1, -60, 0.5, -11) 
		ToggleButton.Size = UDim2.new(0, 46, 0, 22)
		ToggleButton.Font = Enum.Font.SourceSans
		ToggleButton.Text = ""

		local Corner_6 = Instance.new("UICorner")
		Corner_6.CornerRadius = UDim.new(1, 0) 
		Corner_6.Name = "Corner"
		Corner_6.Parent = ToggleButton

		local CornerFrame = Instance.new("Frame")
		CornerFrame.Name = "CornerFrame"
		CornerFrame.Parent = ToggleButton
		CornerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CornerFrame.BorderSizePixel = 0
		CornerFrame.Position = UDim2.new(0, 3, 0.5, -8)
		CornerFrame.Size = UDim2.new(0, 16, 0, 16)

		local Corner_Circle = Instance.new("UICorner")
		Corner_Circle.CornerRadius = UDim.new(1, 0)
		Corner_Circle.Parent = CornerFrame

		local InvisibleClick = Instance.new("TextButton")
		InvisibleClick.Name = "ToggleInvisibleClick"
		InvisibleClick.Parent = Toggle
		InvisibleClick.BackgroundTransparency = 1
		InvisibleClick.Size = UDim2.new(1, 0, 1, 0)
		InvisibleClick.Text = ""

		
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		InvisibleClick.MouseEnter:Connect(function()
			TweenService:Create(Toggle, tweenInfo, {BackgroundColor3 = SelectedTheme.WidgetHover}):Play()
		end)
		InvisibleClick.MouseLeave:Connect(function()
			TweenService:Create(Toggle, tweenInfo, {BackgroundColor3 = SelectedTheme.WidgetDefault}):Play()
		end)

		InvisibleClick.MouseButton1Click:Connect(function()
			toggled = not toggled

			if toggled then
			
				TweenService:Create(ToggleButton, tweenInfo, {BackgroundColor3 = SelectedTheme.Accent}):Play()
				TweenService:Create(CornerFrame, tweenInfo, {Position = UDim2.new(1, -19, 0.5, -8)}):Play()
			else
			
				TweenService:Create(ToggleButton, tweenInfo, {BackgroundColor3 = SelectedTheme.TextMuted}):Play()
				TweenService:Create(CornerFrame, tweenInfo, {Position = UDim2.new(0, 3, 0.5, -8)}):Play()
			end

			task.spawn(callback, toggled)
		end)
	end


	setmetatable(TabObject, TabObject)
	return TabObject
end

return VanixiaUI

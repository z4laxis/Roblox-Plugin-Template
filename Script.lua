-- Define constants
local PLUGIN_NAME = "MyPlugin"
local TOOLBAR_BUTTON_NAME = "OpenPluginButton" -- Name of Plugin
local PLUGIN_MENU_ITEM_NAME = "Open Plugin"
local PLUGIN_ICON_ID = "rbxassetid://8073107221" -- Icon

-- Define variables
local toolbar = plugin:CreateToolbar("MyPluginToolbar") -- Bottom Text
local toolbarButton = toolbar:CreateButton(TOOLBAR_BUTTON_NAME, "Open Plugin", PLUGIN_ICON_ID)
local pluginMenu = plugin:CreatePluginMenu(PLUGIN_MENU_ITEM_NAME)

-- Define UI variables
local pluginWidget = plugin:CreateDockWidgetPluginGui(PLUGIN_NAME, DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, false, 300, 200, 250, 150))
local mainFrame = Instance.new("Frame") -- Interface
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
mainFrame.Parent = pluginWidget

-- Define functions
local function OpenPlugin()
	pluginWidget.Enabled = not pluginWidget.Enabled
	print("MyPlugin opened!")
end

-- Connect the toolbar button click event
toolbarButton.Click:Connect(function()
	OpenPlugin()
end)

-- Connect the plugin menu item click event
pluginMenu:AddAction(plugin:GetMouse(), PLUGIN_MENU_ITEM_NAME)
pluginMenu.Triggered:Connect(function()
	OpenPlugin()
end)

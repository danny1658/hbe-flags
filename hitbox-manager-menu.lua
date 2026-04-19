local HitboxManager = {}  -- Create the GUI menu
local screenGui = Instance.new('ScreenGui')
local hitboxFrame = Instance.new('Frame', screenGui)
hitboxFrame.Size = UDim2.new(0, 300, 0, 200)
hitboxFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
hitboxFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
hitboxFrame.Visible = false

-- Hitbox Size Slider
local hitboxSizeSlider = Instance.new('Slider', hitboxFrame)
hitboxSizeSlider.Size = UDim2.new(1, -20, 0, 50)
hitboxSizeSlider.Position = UDim2.new(0, 10, 0, 10)
hitboxSizeSlider.MinValue = 1
hitboxSizeSlider.MaxValue = 100
hitboxSizeSlider.Value = 50

-- Transparency Controls
local transparencySlider = Instance.new('Slider', hitboxFrame)
transparencySlider.Size = UDim2.new(1, -20, 0, 50)
transparencySlider.Position = UDim2.new(0, 10, 0, 70)
transparencySlider.MinValue = 0
transparencySlider.MaxValue = 1
transparencySlider.Value = 0.5

-- Enable/Disable Button
local enableButton = Instance.new('TextButton', hitboxFrame)
enableButton.Size = UDim2.new(1, -20, 0, 50)
enableButton.Position = UDim2.new(0, 10, 0, 130)
enableButton.Text = "Enable"
enableButton.MouseButton1Click:Connect(function()
    if enableButton.Text == "Enable" then
        enableButton.Text = "Disable"
    else
        enableButton.Text = "Enable"
    end
end)

-- Draggable Panel
local function makeDraggable(frame)
    local dragging
    local dragInput
    local dragStart
    local startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            frame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
        end
    end)
end

makeDraggable(hitboxFrame)

-- Toggle Menu with F1 Key
local userInputService = game:GetService('UserInputService')
userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F1 then
        hitboxFrame.Visible = not hitboxFrame.Visible
    end
end)

screenGui.Parent = game.Players.LocalPlayer:WaitForChild('PlayerGui')

return HitboxManager
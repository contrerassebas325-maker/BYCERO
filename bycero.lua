-- BYCERO HUB v1.3.1 | PARTE 1/6
if not getgenv then getgenv = function() return _G end end
if not isfile then isfile = function() return false end end
if not readfile then readfile = function() return "" end end
if not writefile then writefile = function() end end
if not isfolder then isfolder = function() return false end end
if not makefolder then makefolder = function() end end
if not listfiles then listfiles = function() return {} end end

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local Tween=game:GetService("TweenService")
local RunSvc=game:GetService("RunService")
local HttpSvc=game:GetService("HttpService")
local Stats=game:GetService("Stats")
local TPS=game:GetService("TeleportService")
local MPS=game:GetService("MarketplaceService")
local Lighting=game:GetService("Lighting")
local player=Players.LocalPlayer
local pgui=player:WaitForChild("PlayerGui")
local camera=workspace.CurrentCamera

local DISCORD_LINK="https://discord.gg/wmWzjVW9x"
local WEBHOOK_URL="https://discord.com/api/webhooks/1550305628537233548/RJA6_Tp5bRhjeo9JQ8TkHeqYi9SAfwxN7ObonYMikASSTbdx-2CZlSiZO16KRCU9bRTU"

local C={Bg=Color3.fromRGB(15,15,20),Bg2=Color3.fromRGB(22,22,30),Bg3=Color3.fromRGB(30,30,42),Stroke=Color3.fromRGB(45,45,65),Text=Color3.fromRGB(235,235,245),TextDim=Color3.fromRGB(150,150,170),Accent=Color3.fromRGB(150,80,200),Accent2=Color3.fromRGB(110,46,126),Green=Color3.fromRGB(80,220,130),Red=Color3.fromRGB(230,80,90)}

local gui=Instance.new("ScreenGui")
gui.Name="ByceroHub"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true
gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
gui.DisplayOrder=999
gui.Parent=pgui

local uiScale=Instance.new("UIScale",gui)
uiScale.Scale=(UIS.TouchEnabled and not UIS.KeyboardEnabled) and 0.75 or 0.9

local function corner(p,r)
    local c=Instance.new("UICorner",p)
    c.CornerRadius=UDim.new(0,r or 6)
    return c
end

local function stroke(p,c,t)
    local s=Instance.new("UIStroke",p)
    s.Color=c or C.Stroke
    s.Thickness=t or 1
    s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
    return s
end

local function padding(p,t,r,b,l)
    local u=Instance.new("UIPadding",p)
    u.PaddingTop=UDim.new(0,t or 0)
    u.PaddingRight=UDim.new(0,r or 0)
    u.PaddingBottom=UDim.new(0,b or 0)
    u.PaddingLeft=UDim.new(0,l or 0)
    return u
end

local function tween(o,t,p)
    Tween:Create(o,TweenInfo.new(t or 0.2,Enum.EasingStyle.Quad),p):Play()
end

local function makeDraggable(frame,handle)
    handle=handle or frame
    local dragging,dragStart,startPos
    handle.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            dragging=true
            dragStart=i.Position
            startPos=frame.Position
            i.Changed:Connect(function()
                if i.UserInputState==Enum.UserInputState.End then dragging=false end
            end)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local d=i.Position-dragStart
            frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
        end
    end)
end-- PARTE 2/6
local NH=Instance.new("Frame")
NH.Size=UDim2.new(0,240,0.5,0)
NH.AnchorPoint=Vector2.new(1,1)
NH.Position=UDim2.new(1,-14,1,-14)
NH.BackgroundTransparency=1
NH.Parent=gui
local NLL=Instance.new("UIListLayout",NH)
NLL.VerticalAlignment=Enum.VerticalAlignment.Bottom
NLL.HorizontalAlignment=Enum.HorizontalAlignment.Right
NLL.SortOrder=Enum.SortOrder.LayoutOrder
NLL.Padding=UDim.new(0,6)

local function notify(text)
    task.spawn(function()
        local f=Instance.new("Frame")
        f.AutomaticSize=Enum.AutomaticSize.X
        f.Size=UDim2.new(0,0,0,24)
        f.BackgroundColor3=C.Bg2
        f.BackgroundTransparency=1
        f.Parent=NH
        corner(f,5)
        padding(f,0,10,0,10)
        local s=stroke(f,C.Stroke,1)
        s.Transparency=1
        local tl=Instance.new("TextLabel",f)
        tl.AutomaticSize=Enum.AutomaticSize.X
        tl.Size=UDim2.new(0,0,1,0)
        tl.BackgroundTransparency=1
        tl.Text=text
        tl.TextColor3=C.Text
        tl.Font=Enum.Font.GothamMedium
        tl.TextSize=11
        tl.TextTransparency=1
        tween(f,0.2,{BackgroundTransparency=0.1})
        tween(s,0.2,{Transparency=0.4})
        tween(tl,0.2,{TextTransparency=0})
        task.wait(2)
        tween(f,0.25,{BackgroundTransparency=1})
        tween(s,0.25,{Transparency=1})
        tween(tl,0.25,{TextTransparency=1})
        task.wait(0.3)
        f:Destroy()
    end)
end

local Win=Instance.new("Frame")
Win.Size=UDim2.new(0,440,0,300)
Win.Position=UDim2.new(0.5,-220,0.5,-150)
Win.BackgroundColor3=C.Bg
Win.BorderSizePixel=0
Win.Visible=true
Win.Parent=gui
corner(Win,10)
stroke(Win,C.Stroke,1)

local Top=Instance.new("Frame")
Top.Size=UDim2.new(1,0,0,30)
Top.BackgroundColor3=C.Bg2
Top.BorderSizePixel=0
Top.Parent=Win
corner(Top,10)
local topFix=Instance.new("Frame",Top)
topFix.Size=UDim2.new(1,0,0,8)
topFix.Position=UDim2.new(0,0,1,-8)
topFix.BackgroundColor3=C.Bg2
topFix.BorderSizePixel=0

local Title=Instance.new("TextLabel",Top)
Title.Size=UDim2.new(1,-110,1,0)
Title.Position=UDim2.new(0,10,0,0)
Title.BackgroundTransparency=1
Title.Text="BYCERO HUB v1.3.1"
Title.TextColor3=C.Text
Title.Font=Enum.Font.GothamBold
Title.TextSize=12
Title.TextXAlignment=Enum.TextXAlignment.Left

local function topBtn(txt,x,col)
    local b=Instance.new("TextButton",Top)
    b.Size=UDim2.new(0,22,0,22)
    b.Position=UDim2.new(1,x,0,4)
    b.BackgroundColor3=C.Bg3
    b.Text=txt
    b.TextColor3=C.Text
    b.Font=Enum.Font.GothamBold
    b.TextSize=11
    b.BorderSizePixel=0
    b.AutoButtonColor=false
    corner(b,5)
    b.MouseEnter:Connect(function() tween(b,0.15,{BackgroundColor3=col}) end)
    b.MouseLeave:Connect(function() tween(b,0.15,{BackgroundColor3=C.Bg3}) end)
    return b
end
local btnMin=topBtn("-",-56,C.Bg3)
local btnClose=topBtn("X",-28,C.Red)
makeDraggable(Win,Top)

local Side=Instance.new("Frame")
Side.Size=UDim2.new(0,105,1,-30)
Side.Position=UDim2.new(0,0,0,30)
Side.BackgroundColor3=C.Bg2
Side.BorderSizePixel=0
Side.Parent=Win

local SideScroll=Instance.new("ScrollingFrame",Side)
SideScroll.Size=UDim2.new(1,0,1,0)
SideScroll.BackgroundTransparency=1
SideScroll.BorderSizePixel=0
SideScroll.ScrollBarThickness=2
SideScroll.ScrollBarImageColor3=C.Accent
SideScroll.CanvasSize=UDim2.new(0,0,0,0)
SideScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
padding(SideScroll,5,3,5,3)
local SLL=Instance.new("UIListLayout",SideScroll)
SLL.Padding=UDim.new(0,2)
SLL.SortOrder=Enum.SortOrder.LayoutOrder

local Content=Instance.new("Frame")
Content.Size=UDim2.new(1,-105,1,-30)
Content.Position=UDim2.new(0,105,0,30)
Content.BackgroundTransparency=1
Content.Parent=Win

local CS=Instance.new("ScrollingFrame",Content)
CS.Size=UDim2.new(1,0,1,0)
CS.BackgroundTransparency=1
CS.BorderSizePixel=0
CS.ScrollBarThickness=2
CS.ScrollBarImageColor3=C.Accent
CS.CanvasSize=UDim2.new(0,0,0,0)
CS.AutomaticCanvasSize=Enum.AutomaticSize.Y
padding(CS,7,7,7,7)
local CSL=Instance.new("UIListLayout",CS)
CSL.Padding=UDim.new(0,4)
CSL.SortOrder=Enum.SortOrder.LayoutOrder

local currentTab=nil
local function createTab(name)
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,0,0,24)
    b.BackgroundTransparency=1
    b.Text="  "..name
    b.TextColor3=C.TextDim
    b.Font=Enum.Font.GothamMedium
    b.TextSize=10
    b.TextXAlignment=Enum.TextXAlignment.Left
    b.BorderSizePixel=0
    b.AutoButtonColor=false
    b.BackgroundColor3=C.Bg
    b.Parent=SideScroll
    corner(b,5)
    local p=Instance.new("Frame")
    p.Size=UDim2.new(1,0,0,0)
    p.AutomaticSize=Enum.AutomaticSize.Y
    p.BackgroundTransparency=1
    p.Visible=false
    p.Parent=CS
    local PL=Instance.new("UIListLayout",p)
    PL.Padding=UDim.new(0,4)
    PL.SortOrder=Enum.SortOrder.LayoutOrder
    local tab={Button=b,Page=p}
    b.MouseEnter:Connect(function()
        if currentTab~=tab then tween(b,0.15,{BackgroundTransparency=0.7,BackgroundColor3=C.Bg3,TextColor3=C.Text}) end
    end)
    b.MouseLeave:Connect(function()
        if currentTab~=tab then tween(b,0.15,{BackgroundTransparency=1,TextColor3=C.TextDim}) end
    end)
    b.MouseButton1Click:Connect(function()
        if currentTab==tab then return end
        if currentTab then
            currentTab.Page.Visible=false
            tween(currentTab.Button,0.15,{BackgroundTransparency=1,TextColor3=C.TextDim})
        end
        currentTab=tab
        p.Visible=true
        tween(b,0.15,{BackgroundTransparency=0.4,BackgroundColor3=C.Accent2,TextColor3=C.Text})
    end)
    if not currentTab then
        currentTab=tab
        p.Visible=true
        b.BackgroundTransparency=0.4
        b.BackgroundColor3=C.Accent2
        b.TextColor3=C.Text
    end
    return tab
end
-- PARTE 3/6
local function section(parent,title)
    local f=Instance.new("Frame",parent)
    f.Size=UDim2.new(1,0,0,20)
    f.BackgroundTransparency=1
    local t=Instance.new("TextLabel",f)
    t.Size=UDim2.new(1,0,1,0)
    t.BackgroundTransparency=1
    t.Text=title
    t.TextColor3=C.Accent
    t.Font=Enum.Font.GothamBold
    t.TextSize=10
    t.TextXAlignment=Enum.TextXAlignment.Left
end

local function paragraph(parent,title,desc,img,size)
    local f=Instance.new("Frame",parent)
    f.Size=UDim2.new(1,0,0,0)
    f.AutomaticSize=Enum.AutomaticSize.Y
    f.BackgroundColor3=C.Bg2
    f.BorderSizePixel=0
    corner(f,6)
    stroke(f,C.Stroke,1)
    padding(f,7,9,7,9)
    local l=Instance.new("UIListLayout",f)
    l.Padding=UDim.new(0,3)
    l.SortOrder=Enum.SortOrder.LayoutOrder
    if img then
        local i=Instance.new("ImageLabel",f)
        i.Size=UDim2.new(0,size or 32,0,size or 32)
        i.BackgroundTransparency=1
        i.Image=img
        i.LayoutOrder=0
        corner(i,5)
    end
    local t=Instance.new("TextLabel",f)
    t.Size=UDim2.new(1,0,0,14)
    t.AutomaticSize=Enum.AutomaticSize.Y
    t.BackgroundTransparency=1
    t.Text=title
    t.TextColor3=C.Text
    t.Font=Enum.Font.GothamBold
    t.TextSize=11
    t.TextXAlignment=Enum.TextXAlignment.Left
    t.TextWrapped=true
    t.LayoutOrder=1
    if desc then
        local d=Instance.new("TextLabel",f)
        d.Size=UDim2.new(1,0,0,12)
        d.AutomaticSize=Enum.AutomaticSize.Y
        d.BackgroundTransparency=1
        d.Text=desc
        d.TextColor3=C.TextDim
        d.Font=Enum.Font.Gotham
        d.TextSize=10
        d.TextXAlignment=Enum.TextXAlignment.Left
        d.TextWrapped=true
        d.RichText=true
        d.LayoutOrder=2
    end
end

local function makeToggle(parent,title,desc,default,callback)
    local f=Instance.new("Frame",parent)
    f.Size=UDim2.new(1,0,0,desc and 40 or 28)
    f.BackgroundColor3=C.Bg2
    f.BorderSizePixel=0
    corner(f,6)
    stroke(f,C.Stroke,1)
    padding(f,5,9,5,9)
    local tl=Instance.new("TextLabel",f)
    tl.Size=UDim2.new(1,-45,0,12)
    tl.Position=UDim2.new(0,0,0,desc and 2 or 7)
    tl.BackgroundTransparency=1
    tl.Text=title
    tl.TextColor3=C.Text
    tl.Font=Enum.Font.GothamMedium
    tl.TextSize=11
    tl.TextXAlignment=Enum.TextXAlignment.Left
    if desc then
        local dl=Instance.new("TextLabel",f)
        dl.Size=UDim2.new(1,-45,0,10)
        dl.Position=UDim2.new(0,0,0,16)
        dl.BackgroundTransparency=1
        dl.Text=desc
        dl.TextColor3=C.TextDim
        dl.Font=Enum.Font.Gotham
        dl.TextSize=9
        dl.TextXAlignment=Enum.TextXAlignment.Left
    end
    local state=default or false
    local bg=Instance.new("Frame",f)
    bg.Size=UDim2.new(0,32,0,16)
    bg.Position=UDim2.new(1,-34,0.5,-8)
    bg.BackgroundColor3=state and C.Accent or C.Bg3
    bg.BorderSizePixel=0
    corner(bg,8)
    local knob=Instance.new("Frame",bg)
    knob.Size=UDim2.new(0,12,0,12)
    knob.Position=state and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)
    knob.BackgroundColor3=Color3.fromRGB(255,255,255)
    knob.BorderSizePixel=0
    corner(knob,6)
    local btn=Instance.new("TextButton",f)
    btn.Size=UDim2.new(1,0,1,0)
    btn.BackgroundTransparency=1
    btn.Text=""
    btn.ZIndex=5
    local function apply(v)
        state=v
        bg.BackgroundColor3=state and C.Accent or C.Bg3
        tween(knob,0.15,{Position=state and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)})
        if callback then task.spawn(function() callback(state) end) end
    end
    btn.MouseButton1Click:Connect(function() apply(not state) end)
    return {Set=apply}
end

local function makeButton(parent,title,callback)
    local b=Instance.new("TextButton",parent)
    b.Size=UDim2.new(1,0,0,26)
    b.BackgroundColor3=C.Bg2
    b.Text=title
    b.TextColor3=C.Text
    b.Font=Enum.Font.GothamMedium
    b.TextSize=11
    b.BorderSizePixel=0
    b.AutoButtonColor=false
    corner(b,6)
    stroke(b,C.Stroke,1)
    b.MouseEnter:Connect(function() tween(b,0.15,{BackgroundColor3=C.Bg3}) end)
    b.MouseLeave:Connect(function() tween(b,0.15,{BackgroundColor3=C.Bg2}) end)
    b.MouseButton1Click:Connect(function()
        tween(b,0.1,{BackgroundColor3=C.Accent2})
        task.wait(0.1)
        tween(b,0.15,{BackgroundColor3=C.Bg3})
        if callback then task.spawn(function() callback() end) end
    end)
end

local function makeSlider(parent,title,minv,maxv,default,step,callback)
    local f=Instance.new("Frame",parent)
    f.Size=UDim2.new(1,0,0,42)
    f.BackgroundColor3=C.Bg2
    f.BorderSizePixel=0
    corner(f,6)
    stroke(f,C.Stroke,1)
    padding(f,5,9,5,9)
    local tl=Instance.new("TextLabel",f)
    tl.Size=UDim2.new(1,-45,0,12)
    tl.BackgroundTransparency=1
    tl.Text=title
    tl.TextColor3=C.Text
    tl.Font=Enum.Font.GothamMedium
    tl.TextSize=11
    tl.TextXAlignment=Enum.TextXAlignment.Left
    local vl=Instance.new("TextLabel",f)
    vl.Size=UDim2.new(0,40,0,12)
    vl.Position=UDim2.new(1,-40,0,0)
    vl.BackgroundTransparency=1
    vl.Text=tostring(default)
    vl.TextColor3=C.Accent
    vl.Font=Enum.Font.GothamBold
    vl.TextSize=11
    vl.TextXAlignment=Enum.TextXAlignment.Right
    local track=Instance.new("Frame",f)
    track.Size=UDim2.new(1,0,0,5)
    track.Position=UDim2.new(0,0,1,-10)
    track.BackgroundColor3=C.Bg3
    track.BorderSizePixel=0
    corner(track,3)
    local fill=Instance.new("Frame",track)
    fill.BackgroundColor3=C.Accent
    fill.BorderSizePixel=0
    fill.Size=UDim2.new((default-minv)/(maxv-minv),0,1,0)
    corner(fill,3)
    local knob=Instance.new("Frame",track)
    knob.Size=UDim2.new(0,12,0,12)
    knob.Position=UDim2.new((default-minv)/(maxv-minv),-6,0.5,-6)
    knob.BackgroundColor3=Color3.fromRGB(255,255,255)
    knob.BorderSizePixel=0
    corner(knob,6)
    local btn=Instance.new("TextButton",f)
    btn.Size=UDim2.new(1,0,1,0)
    btn.BackgroundTransparency=1
    btn.Text=""
    btn.ZIndex=5
    local dragging=false
    local function update(input)
        local x=math.clamp((input.Position.X-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
        local val=minv+(maxv-minv)*x
        if step then val=math.floor(val/step+0.5)*step end
        val=math.clamp(val,minv,maxv)
        fill.Size=UDim2.new((val-minv)/(maxv-minv),0,1,0)
        knob.Position=UDim2.new((val-minv)/(maxv-minv),-6,0.5,-6)
        vl.Text=(val%1==0) and tostring(math.floor(val)) or string.format("%.2f",val)
        if callback then task.spawn(function() callback(val) end) end
    end
    btn.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            dragging=true
            update(i)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then update(i) end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging=false end
    end)
    return {Set=function(v)
        v=math.clamp(v,minv,maxv)
        fill.Size=UDim2.new((v-minv)/(maxv-minv),0,1,0)
        knob.Position=UDim2.new((v-minv)/(maxv-minv),-6,0.5,-6)
        vl.Text=tostring(v)
    end}
end

local function makeInput(parent,title,ph,callback,multiline)
    local f=Instance.new("Frame",parent)
    f.Size=UDim2.new(1,0,0,multiline and 90 or 44)
    f.BackgroundColor3=C.Bg2
    f.BorderSizePixel=0
    corner(f,6)
    stroke(f,C.Stroke,1)
    padding(f,5,9,5,9)
    local tl=Instance.new("TextLabel",f)
    tl.Size=UDim2.new(1,0,0,12)
    tl.BackgroundTransparency=1
    tl.Text=title
    tl.TextColor3=C.Text
    tl.Font=Enum.Font.GothamMedium
    tl.TextSize=11
    tl.TextXAlignment=Enum.TextXAlignment.Left
    local tb=Instance.new("TextBox",f)
    tb.Size=UDim2.new(1,0,0,multiline and 60 or 20)
    tb.Position=UDim2.new(0,0,0,18)
    tb.BackgroundColor3=C.Bg3
    tb.Text=""
    tb.PlaceholderText=ph or "..."
    tb.TextColor3=C.Text
    tb.PlaceholderColor3=C.TextDim
    tb.Font=Enum.Font.Gotham
    tb.TextSize=10
    tb.BorderSizePixel=0
    tb.ClearTextOnFocus=false
    tb.MultiLine=multiline or false
    tb.TextWrapped=multiline or false
    tb.TextYAlignment=multiline and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
    corner(tb,5)
    padding(tb,3,5,3,5)
    tb.FocusLost:Connect(function()
        if callback and tb.Text~="" then task.spawn(function() callback(tb.Text) end) end
    end)
    return tb
end

local function makeDropdown(parent,title,values,default,callback)
    local f=Instance.new("Frame",parent)
    f.Size=UDim2.new(1,0,0,48)
    f.BackgroundColor3=C.Bg2
    f.BorderSizePixel=0
    corner(f,6)
    stroke(f,C.Stroke,1)
    padding(f,5,9,5,9)
    local tl=Instance.new("TextLabel",f)
    tl.Size=UDim2.new(1,0,0,12)
    tl.BackgroundTransparency=1
    tl.Text=title
    tl.TextColor3=C.Text
    tl.Font=Enum.Font.GothamMedium
    tl.TextSize=11
    tl.TextXAlignment=Enum.TextXAlignment.Left
    local sel=Instance.new("TextButton",f)
    sel.Size=UDim2.new(1,0,0,20)
    sel.Position=UDim2.new(0,0,0,18)
    sel.BackgroundColor3=C.Bg3
    sel.Text="   "..(default or values[1])
    sel.TextColor3=C.Text
    sel.Font=Enum.Font.Gotham
    sel.TextSize=10
    sel.TextXAlignment=Enum.TextXAlignment.Left
    sel.BorderSizePixel=0
    sel.AutoButtonColor=false
    corner(sel,5)
    local arrow=Instance.new("TextLabel",sel)
    arrow.Size=UDim2.new(0,16,1,0)
    arrow.Position=UDim2.new(1,-18,0,0)
    arrow.BackgroundTransparency=1
    arrow.Text="v"
    arrow.TextColor3=C.TextDim
    arrow.Font=Enum.Font.GothamBold
    arrow.TextSize=11
    local list=Instance.new("ScrollingFrame",f)
    list.Size=UDim2.new(1,0,0,0)
    list.Position=UDim2.new(0,0,1,4)
    list.BackgroundColor3=C.Bg3
    list.BorderSizePixel=0
    list.Visible=false
    list.ClipsDescendants=true
    list.ZIndex=50
    list.ScrollBarThickness=3
    list.ScrollBarImageColor3=C.Accent
    list.CanvasSize=UDim2.new(0,0,0,0)
    list.AutomaticCanvasSize=Enum.AutomaticSize.Y
    list.ScrollingDirection=Enum.ScrollingDirection.Y
    corner(list,5)
    stroke(list,C.Stroke,1)
    local ll=Instance.new("UIListLayout",list)
    ll.Padding=UDim.new(0,1)
    padding(list,3,3,3,3)
    local isOpen=false
    local function closeList()
        isOpen=false
        list.Visible=false
        list.Size=UDim2.new(1,0,0,0)
        arrow.Text="v"
    end
    for _,val in ipairs(values) do
        local opt=Instance.new("TextButton",list)
        opt.Size=UDim2.new(1,-6,0,20)
        opt.BackgroundColor3=C.Bg2
        opt.Text="  "..val
        opt.TextColor3=C.Text
        opt.Font=Enum.Font.Gotham
        opt.TextSize=10
        opt.TextXAlignment=Enum.TextXAlignment.Left
        opt.BorderSizePixel=0
        opt.AutoButtonColor=false
        corner(opt,4)
        opt.MouseEnter:Connect(function() tween(opt,0.15,{BackgroundColor3=C.Accent2}) end)
        opt.MouseLeave:Connect(function() tween(opt,0.15,{BackgroundColor3=C.Bg2}) end)
        opt.MouseButton1Click:Connect(function()
            sel.Text="   "..val
            closeList()
            if callback then task.spawn(function() callback(val) end) end
        end)
    end
    sel.MouseButton1Click:Connect(function()
        isOpen=not isOpen
        if isOpen then
            list.Visible=true
            local h=#values*22+8
            tween(list,0.15,{Size=UDim2.new(1,0,0,math.min(h,130))})
            arrow.Text="^"
        else closeList() end
    end)
    return {Select=function(v) sel.Text="   "..v end}
end

local function sendWebhook(titulo,mensaje,color)
    local req=request or http_request or (syn and syn.request) or (http and http.request)
    if not req then return false end
    local gname="?"
    pcall(function()
        gname=MPS:GetProductInfo(game.PlaceId).Name
    end)
    local campos={}
    table.insert(campos,{name="Jugador",value=player.Name,inline=true})
    table.insert(campos,{name="Display",value=player.DisplayName,inline=true})
    table.insert(campos,{name="Juego",value=gname,inline=true})
    table.insert(campos,{name="Place ID",value=tostring(game.PlaceId),inline=true})
    local data=HttpSvc:JSONEncode({
        username="Bycero Hub Logger",
        embeds={{title=titulo,description=mensaje,color=color or 10040575,fields=campos,footer={text="Bycero Hub v1.3.1"}}}
    })
    local ok=pcall(function()
        req({Url=WEBHOOK_URL,Method="POST",Headers={["Content-Type"]="application/json"},Body=data})
    end)
    return ok
end
-- PARTE 4/6
local speedEnabled,walkSpeed=false,50
local noclipEnabled=false
local infJumpEnabled=false
local espEnabled=false
local espColor=Color3.fromRGB(255,255,255)
local espLines=false
local espInfo={Glow=true,Name=true,Health=true,Distance=true}
local autoShootEnabled=false
local hitboxEnabled=false
local hitboxSize=10
local killAllEnabled=false
local autoFarmEnabled=false
local rainbowNameEnabled=false
local hideNameEnabled=false
local fakeNameEnabled=false
local creatorTagEnabled=false
local spoofNameText="Nombre falso"
local fpsEnabled=false
local fpsBoostEnabled=false

local TabInicio=createTab("Inicio")
local TabAim=createTab("Aimbot")
local TabKill=createTab("Kill All")
local TabVis=createTab("Visuales")
local TabMov=createTab("Movimiento")
local TabFarm=createTab("AutoFarm")
local TabGraficos=createTab("Graficos")
local TabAnim=createTab("Animaciones")
local TabCom=createTab("Comunidad")
local TabConfig=createTab("Config")

section(TabInicio.Page,"REGISTRO")
paragraph(TabInicio.Page,"Bycero Hub v1.3.1","<font color='#00ff80'>+ Fix reporte webhook</font>\n<font color='#00ff80'>+ Shaders y FPS Boost</font>\n<font color='#00ff80'>+ Boton flotante fix</font>")
paragraph(TabInicio.Page,"Discord","Unete: "..DISCORD_LINK,"rbxassetid://88267176037146",44)
makeButton(TabInicio.Page,"Copiar Discord",function()
    pcall(function() setclipboard(DISCORD_LINK) end)
    notify("Discord copiado!")
end)

section(TabInicio.Page,"JUEGOS SOPORTADOS")
local function TPseguro(pid,nombre)
    if game.PlaceId==pid then
        notify("Buscando server de "..nombre.."...")
        pcall(function() TPS:Teleport(pid,player) end)
    else
        notify("Yendo a "..nombre.."...")
        pcall(function() setclipboard("https://www.roblox.com/games/"..tostring(pid)) end)
        task.wait(0.5)
        pcall(function() TPS:Teleport(pid,player) end)
    end
end
makeButton(TabInicio.Page,"Murder Mystery 2",function() TPseguro(142823291,"MM2") end)
makeButton(TabInicio.Page,"Murderers VS Sheriffs",function() TPseguro(135856908115931,"Duels") end)
makeButton(TabInicio.Page,"Murder Mystery V",function() TPseguro(74369636333825,"MMV") end)

section(TabInicio.Page,"SERVIDOR")
makeButton(TabInicio.Page,"Cambiar de Servidor",function()
    notify("Buscando server vacio...")
    task.spawn(function()
        local req=request or http_request or (syn and syn.request)
        if not req then notify("Sin soporte HTTP") return end
        local Api="https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        pcall(function()
            local r=req({Url=Api,Method="GET"})
            if r and r.StatusCode==200 then
                local d=HttpSvc:JSONDecode(r.Body)
                local srvs={}
                if d and d.data then
                    for _,v in pairs(d.data) do
                        if v.playing<v.maxPlayers and v.id~=game.JobId then table.insert(srvs,v.id) end
                    end
                end
                if #srvs>0 then
                    notify("Server encontrado!")
                    TPS:TeleportToPlaceInstance(game.PlaceId,srvs[math.random(1,#srvs)],player)
                else notify("No hay servers vacios.") end
            end
        end)
    end)
end)

local statsBox=Instance.new("Frame",gui)
statsBox.Size=UDim2.new(0,140,0,48)
statsBox.Position=UDim2.new(1,-160,0,10)
statsBox.BackgroundTransparency=1
statsBox.Visible=false
statsBox.ZIndex=100

local fpsLbl=Instance.new("TextLabel",statsBox)
fpsLbl.Size=UDim2.new(1,0,0,24)
fpsLbl.BackgroundTransparency=1
fpsLbl.Text="FPS: --"
fpsLbl.TextColor3=Color3.fromRGB(255,255,255)
fpsLbl.Font=Enum.Font.GothamBlack
fpsLbl.TextSize=15
fpsLbl.TextXAlignment=Enum.TextXAlignment.Right

local pingLbl=Instance.new("TextLabel",statsBox)
pingLbl.Size=UDim2.new(1,0,0,24)
pingLbl.Position=UDim2.new(0,0,0,24)
pingLbl.BackgroundTransparency=1
pingLbl.Text="Ping: -- ms"
pingLbl.TextColor3=Color3.fromRGB(255,255,255)
pingLbl.Font=Enum.Font.GothamBlack
pingLbl.TextSize=15
pingLbl.TextXAlignment=Enum.TextXAlignment.Right

local fpsCount,lastUpd=0,tick()
RunSvc.RenderStepped:Connect(function()
    if not fpsEnabled then return end
    fpsCount=fpsCount+1
    if tick()-lastUpd>=1 then
        fpsLbl.Text="FPS: "..fpsCount
        if fpsCount>=50 then fpsLbl.TextColor3=Color3.fromRGB(46,204,113)
        elseif fpsCount>=30 then fpsLbl.TextColor3=Color3.fromRGB(241,196,15)
        else fpsLbl.TextColor3=Color3.fromRGB(231,76,60) end
        local pv=0
        pcall(function() pv=math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
        pingLbl.Text="Ping: "..pv.." ms"
        if pv<90 then pingLbl.TextColor3=Color3.fromRGB(46,204,113)
        elseif pv<150 then pingLbl.TextColor3=Color3.fromRGB(241,196,15)
        else pingLbl.TextColor3=Color3.fromRGB(231,76,60) end
        fpsCount=0
        lastUpd=tick()
    end
end)

makeToggle(TabInicio.Page,"Mostrar FPS y Ping",nil,false,function(v)
    fpsEnabled=v
    statsBox.Visible=v
    notify(v and "FPS/Ping: ON" or "FPS/Ping: OFF")
end)

section(TabMov.Page,"SPEED HACK")
local function applySpeed()
    local char=player.Character
    if char then
        local hum=char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed=speedEnabled and walkSpeed or 16 end
    end
end
makeToggle(TabMov.Page,"Activar Speed Hack","Modifica tu velocidad.",false,function(v)
    speedEnabled=v
    applySpeed()
    notify(v and "Speed: ON" or "Speed: OFF")
end)
makeSlider(TabMov.Page,"Velocidad",16,250,50,1,function(v)
    walkSpeed=v
    if speedEnabled then applySpeed() end
end)
RunSvc.Heartbeat:Connect(function() if speedEnabled then applySpeed() end end)

section(TabMov.Page,"NOCLIP")
RunSvc.Stepped:Connect(function()
    if noclipEnabled and player.Character then
        for _,p in ipairs(player.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide=false end
        end
    end
end)
makeToggle(TabMov.Page,"Atravesar Paredes","Noclip.",false,function(v)
    noclipEnabled=v
    notify(v and "Noclip: ON" or "Noclip: OFF")
end)

section(TabMov.Page,"SALTO INFINITO")
UIS.JumpRequest:Connect(function()
    if infJumpEnabled and player.Character then
        local hum=player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)
makeToggle(TabMov.Page,"Salto Infinito","Salta sin limite.",false,function(v)
    infJumpEnabled=v
    notify(v and "Inf Jump: ON" or "Inf Jump: OFF")
end)

section(TabMov.Page,"FANTASMA (VUELO)")
local isInvisible=false
local invisSeat,invisBg,invisBv=nil,nil,nil
local invisFlySpeed=40
local originalTransparencies={}

local function ToggleGhost(state)
    isInvisible=state
    local char=player.Character
    local hrp=char and char:FindFirstChild("HumanoidRootPart")
    local torso=char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"))
    local hum=char and char:FindFirstChild("Humanoid")
    if not char or not hrp or not torso or not hum then return end
    if isInvisible then
        for _,obj in pairs(char:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("Decal") or obj:IsA("Texture") then
                if obj.Name~="HumanoidRootPart" then
                    if not originalTransparencies[obj] then originalTransparencies[obj]=obj.Transparency end
                    obj.Transparency=1
                end
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("BillboardGui") then
                obj.Enabled=false
            end
        end
        local saved=hrp.CFrame+Vector3.new(0,1.5,0)
        hrp.CFrame=hrp.CFrame+Vector3.new(0,3,0)
        hum.PlatformStand=true
        task.wait(0.05)
        hrp.AssemblyLinearVelocity=Vector3.zero
        hrp.AssemblyAngularVelocity=Vector3.zero
        hrp.CFrame=CFrame.new(0,5000,0)
        hrp.Anchored=true
        task.wait(0.05)
        invisSeat=Instance.new("Seat")
        invisSeat.Anchored=false
        invisSeat.CanCollide=false
        invisSeat.Transparency=1
        invisSeat.Position=Vector3.new(0,5000,0)
        invisSeat.Parent=workspace
        local weld=Instance.new("Weld")
        weld.Part0=invisSeat
        weld.Part1=torso
        weld.Parent=invisSeat
        task.wait(0.05)
        invisSeat.CFrame=saved
        hrp.Anchored=false
        invisBg=Instance.new("BodyGyro")
        invisBg.P=9e4
        invisBg.maxTorque=Vector3.new(9e9,9e9,9e9)
        invisBg.cframe=invisSeat.CFrame
        invisBg.Parent=invisSeat
        invisBv=Instance.new("BodyVelocity")
        invisBv.velocity=Vector3.zero
        invisBv.maxForce=Vector3.new(9e9,9e9,9e9)
        invisBv.Parent=invisSeat
    else
        if invisBg then invisBg:Destroy() invisBg=nil end
        if invisBv then invisBv:Destroy() invisBv=nil end
        if invisSeat then invisSeat:Destroy() invisSeat=nil end
        if hum then hum.PlatformStand=false end
        for obj,tr in pairs(originalTransparencies) do
            if obj and obj.Parent then obj.Transparency=tr end
        end
        originalTransparencies={}
        for _,obj in pairs(char:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("BillboardGui") then
                obj.Enabled=true
            end
        end
    end
end

local cachedGhostControls=nil
RunSvc.RenderStepped:Connect(function()
    if isInvisible and invisSeat and invisBv and invisBg then
        if not cachedGhostControls then
            local ps=player:FindFirstChild("PlayerScripts")
            if ps then
                local pm=ps:FindFirstChild("PlayerModule")
                if pm then
                    local ok,ctrl=pcall(function() return require(pm):GetControls() end)
                    if ok then cachedGhostControls=ctrl end
                end
            end
        end
        if cachedGhostControls then
            local mv=cachedGhostControls:GetMoveVector()
            local md=camera.CFrame:VectorToWorldSpace(mv)
            invisBv.Velocity=md*invisFlySpeed
            invisBg.CFrame=camera.CFrame
        end
    end
end)

makeToggle(TabMov.Page,"Activar Fantasma","Vuelo + invisible.",false,function(v)
    task.spawn(function() ToggleGhost(v) end)
    notify(v and "Fantasma: ON" or "Fantasma: OFF")
end)
makeSlider(TabMov.Page,"Velocidad Fantasma",10,150,40,1,function(v) invisFlySpeed=v end)

player.CharacterAdded:Connect(function()
    if isInvisible then task.spawn(function() ToggleGhost(false) end) end
end)

local function esPistola(item)
    if not item or not item:IsA("Tool") then return false end
    if item:FindFirstChild("Throw",true) or item:FindFirstChild("KnifeClient",true) or item:FindFirstChild("KnifeServer",true) then return false end
    local n=string.lower(item.Name)
    for _,w in ipairs({"combat","fist","wallet","phone","punch","boombox","radio","knife","blade","cuchillo","dagger","kunai","sword","toy"}) do
        if string.find(n,w) then return false end
    end
    return true
end

local function esEnemigo(p)
    if p==player then return false end
    if player.Team~=nil and p.Team~=nil then return player.Team~=p.Team end
    return true
end

section(TabAim.Page,"AUTO SHOOT")
makeToggle(TabAim.Page,"Auto Shoot","Dispara automatico a enemigos.",false,function(v)
    autoShootEnabled=v
    notify(v and "AutoShoot: ON" or "AutoShoot: OFF")
end)

task.spawn(function()
    while task.wait(0.15) do
        if autoShootEnabled and player.Character then
            local char=player.Character
            local myHum=char:FindFirstChild("Humanoid")
            local myHrp=char:FindFirstChild("HumanoidRootPart")
            if myHum and myHum.Health>0 and myHrp then
                local arma=char:FindFirstChildOfClass("Tool")
                if arma then
                    local closest,minD=nil,math.huge
                    for _,p in ipairs(Players:GetPlayers()) do
                        if esEnemigo(p) and p.Character then
                            local eH=p.Character:FindFirstChild("Head")
                            local eHum=p.Character:FindFirstChild("Humanoid")
                            if eH and eHum and eHum.Health>0 then
                                local d=(eH.Position-myHrp.Position).Magnitude
                                if d<minD and d<200 then minD=d closest=eH end
                            end
                        end
                    end
                    if closest then
                        pcall(function() arma:Activate() task.wait(0.05) arma:Deactivate() end)
                    end
                end
            end
        end
    end
end)

section(TabAim.Page,"HITBOX")
makeToggle(TabAim.Page,"Aumentar Hitbox","Expande HRP enemigos.",false,function(v)
    hitboxEnabled=v
    if not v then
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local h=p.Character.HumanoidRootPart
                h.Size=Vector3.new(2,2,1)
                h.Transparency=1
                h.Material=Enum.Material.Plastic
            end
        end
    end
    notify(v and "Hitbox: ON" or "Hitbox: OFF")
end)
makeSlider(TabAim.Page,"Tamano de Hitbox",2,30,10,1,function(v) hitboxSize=v end)

task.spawn(function()
    while task.wait(0.1) do
        if hitboxEnabled then
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=player and p.Character then
                    local h=p.Character:FindFirstChild("HumanoidRootPart")
                    local hum=p.Character:FindFirstChild("Humanoid")
                    if h and hum and hum.Health>0 then
                        h.Size=Vector3.new(hitboxSize,hitboxSize,hitboxSize)
                        h.Transparency=0.7
                        h.Material=Enum.Material.ForceField
                        h.Color=espColor
                    end
                end
            end
        end
    end
end)
-- PARTE 5A/6
section(TabKill.Page,"KILL ALL")
makeToggle(TabKill.Page,"Activar Kill All (Riesgo de ban)","Mata con cuchillo.",false,function(v)
    killAllEnabled=v
    notify(v and "Kill All: ON" or "Kill All: OFF")
    if v then
        task.spawn(function()
            while killAllEnabled do
                local char=player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local myHrp=char.HumanoidRootPart
                    local myHum=char:FindFirstChild("Humanoid")
                    local posOrig=myHrp.CFrame
                    for _,p in ipairs(Players:GetPlayers()) do
                        if not killAllEnabled then break end
                        if esEnemigo(p) and p.Character then
                            local eHrp=p.Character:FindFirstChild("HumanoidRootPart")
                            local eHum=p.Character:FindFirstChild("Humanoid")
                            if eHrp and eHum and eHum.Health>0 then
                                if (posOrig.Position-eHrp.Position).Magnitude<=600 then
                                    eHrp.Size=Vector3.new(30,30,30)
                                    local fs=0
                                    while killAllEnabled and eHum.Health>0 and fs<200 do
                                        myHum.PlatformStand=true
                                        myHrp.CFrame=eHrp.CFrame*CFrame.new(0,-4,0)*CFrame.Angles(math.rad(90),0,0)
                                        myHrp.AssemblyLinearVelocity=Vector3.zero
                                        pcall(function()
                                            local arma=char:FindFirstChildOfClass("Tool")
                                            if not arma then
                                                local bp=player:FindFirstChild("Backpack")
                                                if bp then
                                                    for _,it in ipairs(bp:GetChildren()) do
                                                        if it:IsA("Tool") and not esPistola(it) then
                                                            myHum:EquipTool(it)
                                                            arma=it
                                                            task.wait(0.1)
                                                            break
                                                        end
                                                    end
                                                end
                                            end
                                            if arma then arma:Activate() end
                                        end)
                                        task.wait(0.02)
                                        fs=fs+1
                                    end
                                    myHum.PlatformStand=false
                                end
                            end
                        end
                    end
                    myHrp.CFrame=posOrig
                end
                task.wait(0.2)
            end
        end)
    end
end)

section(TabVis.Page,"ESP JUGADORES")
makeToggle(TabVis.Page,"Activar ESP","Muestra enemigos.",false,function(v)
    espEnabled=v
    notify(v and "ESP: ON" or "ESP: OFF")
end)

local espCache={}
local function cleanESP(p)
    if espCache[p] then
        if espCache[p].HL then espCache[p].HL:Destroy() end
        if espCache[p].BB then espCache[p].BB:Destroy() end
        espCache[p]=nil
    end
end

task.spawn(function()
    while task.wait(0.2) do
        if espEnabled then
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=player then
                    local char=p.Character
                    local hum=char and char:FindFirstChild("Humanoid")
                    local head=char and char:FindFirstChild("Head")
                    if char and hum and hum.Health>0 and head and esEnemigo(p) then
                        if not espCache[p] or espCache[p].Char~=char then
                            cleanESP(p)
                            local hl=Instance.new("Highlight")
                            hl.FillColor=espColor
                            hl.FillTransparency=0.5
                            hl.OutlineTransparency=1
                            hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
                            hl.Adornee=char
                            hl.Parent=gui
                            local bb=Instance.new("BillboardGui")
                            bb.Size=UDim2.new(0,140,0,50)
                            bb.StudsOffset=Vector3.new(0,3,0)
                            bb.AlwaysOnTop=true
                            bb.Adornee=head
                            bb.Parent=gui
                            local tl=Instance.new("TextLabel")
                            tl.Size=UDim2.new(1,0,1,0)
                            tl.BackgroundTransparency=1
                            tl.RichText=true
                            tl.Font=Enum.Font.GothamBold
                            tl.TextSize=11
                            tl.TextColor3=Color3.fromRGB(255,255,255)
                            tl.TextStrokeTransparency=0
                            tl.Parent=bb
                            espCache[p]={HL=hl,BB=bb,Text=tl,Char=char}
                        end
                        local o=espCache[p]
                        o.HL.FillColor=espColor
                        o.HL.Enabled=espInfo.Glow
                        local myHrp=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        local dist=myHrp and math.floor((head.Position-myHrp.Position).Magnitude) or 0
                        local txt=""
                        if espInfo.Name then txt=p.Name end
                        if espInfo.Health then txt=txt..(txt=="" and "" or " ").."["..math.floor(hum.Health).."]" end
                        if espInfo.Distance then txt=txt..(txt=="" and "" or "\n")..dist.."m" end
                        o.Text.Text=txt
                    else cleanESP(p) end
                end
            end
        else
            for _,p in ipairs(Players:GetPlayers()) do cleanESP(p) end
        end
    end
end)

makeToggle(TabVis.Page,"Mostrar Resplandor",nil,true,function(v) espInfo.Glow=v end)
makeToggle(TabVis.Page,"Mostrar Nombre",nil,true,function(v) espInfo.Name=v end)
makeToggle(TabVis.Page,"Mostrar Vida",nil,true,function(v) espInfo.Health=v end)
makeToggle(TabVis.Page,"Mostrar Distancia",nil,true,function(v) espInfo.Distance=v end)
makeToggle(TabVis.Page,"Mostrar Lineas (Tracer)","Linea desde el centro.",false,function(v)
    espLines=v
    notify(v and "Lineas: ON" or "Lineas: OFF")
end)

local tracerLines={}
RunSvc.RenderStepped:Connect(function()
    local vp=camera.ViewportSize
    local cx,cy=vp.X/2,vp.Y/2
    if not espEnabled or not espLines or not Drawing then
        for _,t in pairs(tracerLines) do if t.Visible then t.Visible=false end end
        return
    end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=player then
            local t=tracerLines[p]
            if not t then
                t=Drawing.new("Line")
                t.Thickness=1.5
                t.Transparency=1
                t.Visible=false
                tracerLines[p]=t
            end
            local char=p.Character
            local hrp=char and char.PrimaryPart
            if hrp and esEnemigo(p) then
                local hum=char:FindFirstChild("Humanoid")
                if hum and hum.Health>0 then
                    local pos,on=camera:WorldToViewportPoint(hrp.Position)
                    if on then
                        t.From=Vector2.new(cx,0)
                        t.To=Vector2.new(pos.X,pos.Y)
                        t.Color=espColor
                        t.Visible=true
                    else t.Visible=false end
                else t.Visible=false end
            else t.Visible=false end
        end
    end
end)
-- PARTE 5B/6
section(TabVis.Page,"NOMBRES")
local originalData={}
local isLooping=false
local visualConns={}

local function safeReplace(str,find,replace)
    local sf=find:gsub("[%-%^%$%(%)%%%.%[%]%*%+%?]","%%%1")
    return (str:gsub(sf,replace))
end

local function processText(v,myName,myDisp)
    local pGui=v:FindFirstAncestorWhichIsA("ScreenGui")
    if pGui and (string.find(pGui.Name,"Bycero") or string.find(pGui.Name,"WindUI")) then return end
    if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
        local txt=v.Text
        local has=false
        if txt and txt~="" then
            if string.find(txt,myName,1,true) or string.find(txt,myDisp,1,true) then has=true end
        end
        if has and not originalData[v] then
            originalData[v]={Text=txt,Color=v.TextColor3,TT=v.TextTransparency,ST=v.TextStrokeTransparency}
        end
        if originalData[v] then
            if fakeNameEnabled or creatorTagEnabled then
                local new=originalData[v].Text
                local base=fakeNameEnabled and spoofNameText or myDisp
                local isOH=false
                if player.Character and v:IsDescendantOf(player.Character) then isOH=true end
                local final=base
                if creatorTagEnabled and isOH then
                    v.RichText=true
                    final='<font color="#bee1e7">[Content Creator]</font> '..base
                end
                new=safeReplace(new,myName,final)
                new=safeReplace(new,myDisp,final)
                v.Text=new
                v.TextTransparency=originalData[v].TT
                v.TextStrokeTransparency=originalData[v].ST
                if rainbowNameEnabled then v.TextColor3=Color3.fromHSV(tick()%4/4,1,1)
                else v.TextColor3=originalData[v].Color end
            elseif hideNameEnabled then
                v.Text=" "
                v.TextTransparency=1
                v.TextStrokeTransparency=1
            else
                v.Text=originalData[v].Text
                if rainbowNameEnabled then v.TextColor3=Color3.fromHSV(tick()%4/4,1,1)
                else v.TextColor3=originalData[v].Color end
                v.TextTransparency=originalData[v].TT
                v.TextStrokeTransparency=originalData[v].ST
            end
        end
    end
end

local function updateSystem()
    local myName=player.Name
    local myDisp=player.DisplayName
    task.spawn(function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p.Character then
                for _,v in pairs(p.Character:GetDescendants()) do
                    if v:IsA("TextLabel") or v:IsA("TextBox") then processText(v,myName,myDisp) end
                end
            end
        end
        local pg=player:FindFirstChild("PlayerGui")
        if pg then
            for _,v in pairs(pg:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextBox") then processText(v,myName,myDisp) end
            end
        end
    end)
    if hideNameEnabled or fakeNameEnabled or rainbowNameEnabled or creatorTagEnabled then
        if not isLooping then
            isLooping=true
            local function infect(v)
                local pg=v:FindFirstAncestorWhichIsA("ScreenGui")
                if pg and (string.find(pg.Name,"Bycero") or string.find(pg.Name,"WindUI")) then return end
                if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
                    processText(v,myName,myDisp)
                    if not v:GetAttribute("BycInfect") then
                        v:SetAttribute("BycInfect",true)
                        v:GetPropertyChangedSignal("Text"):Connect(function()
                            if isLooping and v.Text~=" " then
                                originalData[v]=nil
                                processText(v,myName,myDisp)
                            end
                        end)
                    end
                end
            end
            local pg=player:FindFirstChild("PlayerGui")
            if pg then table.insert(visualConns,pg.DescendantAdded:Connect(function(n) task.spawn(function() infect(n) end) end)) end
            pcall(function()
                local cg=game:GetService("CoreGui")
                table.insert(visualConns,cg.DescendantAdded:Connect(function(n) task.spawn(function() infect(n) end) end))
            end)
        end
    else
        isLooping=false
        for _,c in ipairs(visualConns) do c:Disconnect() end
        visualConns={}
        for v,d in pairs(originalData) do
            if v and v.Parent then
                v.Text=d.Text
                v.TextColor3=d.Color
                v.TextTransparency=d.TT
                v.TextStrokeTransparency=d.ST
            end
        end
    end
end

makeToggle(TabVis.Page,"Ocultar mi Nombre","Nombre invisible (local).",false,function(v)
    hideNameEnabled=v
    updateSystem()
    notify(v and "Nombre oculto" or "Nombre visible")
end)
makeToggle(TabVis.Page,"Activar Nombre Falso","Reemplaza tu nombre.",false,function(v)
    fakeNameEnabled=v
    updateSystem()
    notify(v and "Nombre falso ON" or "OFF")
end)
makeToggle(TabVis.Page,"Tag [Content Creator]","Etiqueta de creador.",false,function(v)
    creatorTagEnabled=v
    updateSystem()
    notify(v and "Tag ON" or "OFF")
end)
makeInput(TabVis.Page,"Nuevo Nombre","Escribe tu nombre falso...",function(t)
    if t~="" then
        spoofNameText=t
        if fakeNameEnabled then updateSystem() end
        notify("Guardado: "..t)
    end
end)
makeToggle(TabVis.Page,"Efecto arcoiris en nombre","Cambia de color.",false,function(v)
    rainbowNameEnabled=v
    updateSystem()
    notify(v and "Rainbow ON" or "OFF")
end)

section(TabGraficos.Page,"RENDIMIENTO")
local origShadows,origFogEnd,origShadowSoft=true,100000,1
local autoFpsConn=nil

local function applyLowGraphics(v)
    if not v:IsA("BasePart") and not v:IsA("Decal") and not v:IsA("Texture") and not v:IsA("SpecialMesh") and not v:IsA("Light") and not v:IsA("PostEffect") and not v:IsA("SurfaceAppearance") and not v:IsA("Clothing") then return end
    pcall(function()
        if v:IsA("ScreenGui") then return end
        if v.Parent and v.Parent:FindFirstChild("Humanoid") then return end
        if v:IsA("BasePart") and not v:IsA("Terrain") then
            if not v:GetAttribute("OrigMat") then
                v:SetAttribute("OrigMat",v.Material.Name)
                v:SetAttribute("OrigCast",v.CastShadow)
            end
            v.Material=Enum.Material.SmoothPlastic
            v.Reflectance=0
            v.CastShadow=false
            if v:IsA("MeshPart") then
                if not v:GetAttribute("OrigTex") then v:SetAttribute("OrigTex",v.TextureID) end
                v.TextureID=""
            end
        elseif v:IsA("SpecialMesh") then
            if not v:GetAttribute("OrigTex") then v:SetAttribute("OrigTex",v.TextureId) end
            v.TextureId=""
        elseif v:IsA("Decal") or v:IsA("Texture") then
            if not v:GetAttribute("OrigTrans") then v:SetAttribute("OrigTrans",v.Transparency) end
            v.Transparency=1
        elseif v:IsA("Light") or v:IsA("PostEffect") then
            if v:GetAttribute("OrigEnabled")==nil then v:SetAttribute("OrigEnabled",v.Enabled) end
            v.Enabled=false
        end
    end)
end

makeToggle(TabGraficos.Page,"FPS Boost","Elimina texturas y sombras.",false,function(state)
    fpsBoostEnabled=state
    local Terrain=workspace:FindFirstChildOfClass("Terrain")
    if state then
        origShadows=Lighting.GlobalShadows
        origFogEnd=Lighting.FogEnd
        origShadowSoft=Lighting.ShadowSoftness
        Lighting.GlobalShadows=false
        Lighting.FogEnd=9e9
        Lighting.ShadowSoftness=0
        if Terrain then
            pcall(function()
                if not Terrain:GetAttribute("OrigWaveSize") then
                    Terrain:SetAttribute("OrigWaveSize",Terrain.WaterWaveSize)
                    Terrain:SetAttribute("OrigDeco",Terrain.Decoration)
                end
                Terrain.WaterWaveSize=0
                Terrain.WaterWaveSpeed=0
                Terrain.WaterReflectance=0
                Terrain.WaterTransparency=1
                Terrain.Decoration=false
            end)
        end
        task.spawn(function()
            local c=0
            for _,v in pairs(workspace:GetDescendants()) do
                applyLowGraphics(v)
                c=c+1
                if c%300==0 then task.wait() end
            end
        end)
        if not autoFpsConn then
            autoFpsConn=workspace.DescendantAdded:Connect(function(v)
                if fpsBoostEnabled then applyLowGraphics(v) end
            end)
        end
        notify("FPS Boost: ON")
    else
        Lighting.GlobalShadows=origShadows
        Lighting.FogEnd=origFogEnd
        Lighting.ShadowSoftness=origShadowSoft
        if Terrain and Terrain:GetAttribute("OrigWaveSize") then
            pcall(function()
                Terrain.WaterWaveSize=Terrain:GetAttribute("OrigWaveSize")
                Terrain.Decoration=Terrain:GetAttribute("OrigDeco")
            end)
        end
        task.spawn(function()
            local c=0
            for _,v in pairs(workspace:GetDescendants()) do
                pcall(function()
                    if v:IsA("BasePart") and v:GetAttribute("OrigMat") then
                        local mn=v:GetAttribute("OrigMat")
                        if Enum.Material[mn] then v.Material=Enum.Material[mn] end
                        v.CastShadow=v:GetAttribute("OrigCast")
                        if v:IsA("MeshPart") and v:GetAttribute("OrigTex") then v.TextureID=v:GetAttribute("OrigTex") end
                    elseif v:IsA("SpecialMesh") and v:GetAttribute("OrigTex") then
                        v.TextureId=v:GetAttribute("OrigTex")
                    elseif (v:IsA("Decal") or v:IsA("Texture")) and v:GetAttribute("OrigTrans") then
                        v.Transparency=v:GetAttribute("OrigTrans")
                    elseif (v:IsA("Light") or v:GetAttribute("OrigEnabled")~=nil) then
                        v.Enabled=v:GetAttribute("OrigEnabled")
                    end
                end)
                c=c+1
                if c%300==0 then task.wait() end
            end
        end)
        if autoFpsConn then autoFpsConn:Disconnect() autoFpsConn=nil end
        notify("FPS Boost: OFF")
    end
end)

section(TabGraficos.Page,"MODOS VISUALES")
local nightEffects,pinkEffects={},{}
local nightActive,pinkActive=false,false
local shaderCfg={Exposicion=0.28,Sombras=5,Neon=0.45,Desenfoque=2,LunaPos=85,PinkSat=0.4}

makeToggle(TabGraficos.Page,"Modo Noche","Cielo nocturno.",false,function(v)
    nightActive=v
    if v then
        if not Lighting:GetAttribute("OrigNightSaved") then
            Lighting:SetAttribute("OrigBrightN",Lighting.Brightness)
            Lighting:SetAttribute("OrigAmbientN",Lighting.Ambient)
            Lighting:SetAttribute("OrigOA",Lighting.OutdoorAmbient)
            Lighting:SetAttribute("OrigClockN",Lighting.ClockTime)
            Lighting:SetAttribute("OrigFogCN",Lighting.FogColor)
            Lighting:SetAttribute("OrigFogEN",Lighting.FogEnd)
            Lighting:SetAttribute("OrigNightSaved",true)
        end
        for _,v2 in ipairs(nightEffects) do pcall(function() v2:Destroy() end) end
        table.clear(nightEffects)
        local blur=Instance.new("BlurEffect")
        blur.Size=shaderCfg.Desenfoque
        blur.Parent=Lighting
        table.insert(nightEffects,blur)
        local bloom=Instance.new("BloomEffect")
        bloom.Intensity=shaderCfg.Neon
        bloom.Size=40
        bloom.Threshold=0.2
        bloom.Parent=Lighting
        table.insert(nightEffects,bloom)
        local cc=Instance.new("ColorCorrectionEffect")
        cc.Brightness=0.02
        cc.Contrast=0.15
        cc.Saturation=0.15
        cc.TintColor=Color3.fromRGB(210,225,255)
        cc.Parent=Lighting
        table.insert(nightEffects,cc)
        local Tropic=Instance.new("Sky")
        Tropic.Name="ByceroNight"
        Tropic.SkyboxUp="http://www.roblox.com/asset/?id=169210149"
        Tropic.SkyboxLf="http://www.roblox.com/asset/?id=169210133"
        Tropic.SkyboxBk="http://www.roblox.com/asset/?id=169210090"
        Tropic.SkyboxFt="http://www.roblox.com/asset/?id=169210121"
        Tropic.SkyboxDn="http://www.roblox.com/asset/?id=169210108"
        Tropic.SkyboxRt="http://www.roblox.com/asset/?id=169210143"
        Tropic.StarCount=5000
        Tropic.MoonAngularSize=18
        Tropic.Parent=Lighting
        table.insert(nightEffects,Tropic)
        Lighting.ClockTime=0
        Lighting.Brightness=4
        Lighting.GeographicLatitude=shaderCfg.LunaPos
        Lighting.ShadowSoftness=0.1
        Lighting.ExposureCompensation=shaderCfg.Exposicion
        Lighting.OutdoorAmbient=Color3.fromRGB(50,65,95)
        local s=shaderCfg.Sombras
        Lighting.Ambient=Color3.fromRGB(s,s+3,s+10)
        Lighting.FogColor=Color3.fromRGB(15,20,30)
        Lighting.FogEnd=2500
        notify("Noche: ON")
    else
        for _,v2 in ipairs(nightEffects) do pcall(function() v2:Destroy() end) end
        table.clear(nightEffects)
        if Lighting:GetAttribute("OrigNightSaved") then
            Lighting.Brightness=Lighting:GetAttribute("OrigBrightN")
            Lighting.Ambient=Lighting:GetAttribute("OrigAmbientN")
            Lighting.OutdoorAmbient=Lighting:GetAttribute("OrigOA")
            Lighting.ClockTime=Lighting:GetAttribute("OrigClockN")
            Lighting.FogColor=Lighting:GetAttribute("OrigFogCN")
            Lighting.FogEnd=Lighting:GetAttribute("OrigFogEN")
        end
        notify("Noche: OFF")
    end
end)

makeToggle(TabGraficos.Page,"Pink Hour","Estilo Synthwave rosa.",false,function(v)
    pinkActive=v
    if v then
        if not Lighting:GetAttribute("OrigPinkSaved") then
            Lighting:SetAttribute("OrigBrightP",Lighting.Brightness)
            Lighting:SetAttribute("OrigCSPB",Lighting.ColorShift_Bottom)
            Lighting:SetAttribute("OrigCSPT",Lighting.ColorShift_Top)
            Lighting:SetAttribute("OrigOAP",Lighting.OutdoorAmbient)
            Lighting:SetAttribute("OrigClockP",Lighting.ClockTime)
            Lighting:SetAttribute("OrigFogCP",Lighting.FogColor)
            Lighting:SetAttribute("OrigPinkSaved",true)
        end
        for _,v2 in ipairs(pinkEffects) do pcall(function() v2:Destroy() end) end
        table.clear(pinkEffects)
        local cc=Instance.new("ColorCorrectionEffect")
        cc.Parent=Lighting
        table.insert(pinkEffects,cc)
        local bloom=Instance.new("BloomEffect")
        bloom.Size=25
        bloom.Threshold=0.85
        bloom.Parent=Lighting
        table.insert(pinkEffects,bloom)
        local blur=Instance.new("BlurEffect")
        blur.Size=2
        blur.Parent=Lighting
        table.insert(pinkEffects,blur)
        local sky=Instance.new("Sky")
        sky.Name="ByceroPink"
        sky.SkyboxUp="rbxassetid://323493360"
        sky.SkyboxLf="rbxassetid://323494252"
        sky.SkyboxBk="rbxassetid://323494035"
        sky.SkyboxFt="rbxassetid://323494130"
        sky.SkyboxDn="rbxassetid://323494368"
        sky.SkyboxRt="rbxassetid://323494067"
        sky.Parent=Lighting
        table.insert(pinkEffects,sky)
        Lighting.Brightness=2
        Lighting.ClockTime=6.7
        Lighting.FogColor=Color3.fromRGB(120,20,150)
        Lighting.FogEnd=1200
        cc.TintColor=Color3.fromRGB(255,180,255)
        cc.Saturation=shaderCfg.PinkSat
        notify("Pink Hour: ON")
    else
        for _,v2 in ipairs(pinkEffects) do pcall(function() v2:Destroy() end) end
        table.clear(pinkEffects)
        if Lighting:GetAttribute("OrigPinkSaved") then
            Lighting.Brightness=Lighting:GetAttribute("OrigBrightP")
            Lighting.ColorShift_Bottom=Lighting:GetAttribute("OrigCSPB")
            Lighting.ColorShift_Top=Lighting:GetAttribute("OrigCSPT")
            Lighting.OutdoorAmbient=Lighting:GetAttribute("OrigOAP")
            Lighting.ClockTime=Lighting:GetAttribute("OrigClockP")
            Lighting.FogColor=Lighting:GetAttribute("OrigFogCP")
        end
        notify("Pink Hour: OFF")
    end
end)

section(TabGraficos.Page,"AJUSTES NOCHE")
makeSlider(TabGraficos.Page,"Claridad",0,1,0.28,0.05,function(v)
    shaderCfg.Exposicion=v
    if nightActive then Lighting.ExposureCompensation=v end
end)
makeSlider(TabGraficos.Page,"Sombras",0,50,5,5,function(v)
    shaderCfg.Sombras=v
    if nightActive then Lighting.Ambient=Color3.fromRGB(v,v+3,v+10) end
end)
-- PARTE 6/6
section(TabFarm.Page,"FARMEO DE EVENTO")
local RemoteFarm=nil
pcall(function()
    local RS=game:GetService("ReplicatedStorage")
    local pk=RS:FindFirstChild("Packages")
    if pk then
        local net=pk:FindFirstChild("Networking")
        if net then RemoteFarm=net:FindFirstChild("RE/Events/CollectEventSpawnable") end
    end
end)
makeToggle(TabFarm.Page,"Auto Farmear Evento","Recolecta eventos.",false,function(v)
    autoFarmEnabled=v
    notify(v and "Auto Farm: ON" or "Auto Farm: OFF")
    if v then
        task.spawn(function()
            while autoFarmEnabled do
                pcall(function() if RemoteFarm then RemoteFarm:FireServer() end end)
                task.wait(0.1)
            end
        end)
    end
end)

section(TabFarm.Page,"COMPRADOR DE CAJAS")
local selectedBox="Mythic Box #1"
makeDropdown(TabFarm.Page,"Caja a comprar",{"Mythic Box #1","Mythic Box #2","Mythic Box #3","Mythic Box #4","Gun Box #1","Gun Box #2","Knife Box #1","Knife Box #2"},"Mythic Box #1",function(v) selectedBox=v end)
makeButton(TabFarm.Page,"Comprar 1 Caja",function()
    pcall(function()
        local RS=game:GetService("ReplicatedStorage")
        local pk=RS:FindFirstChild("Packages")
        if pk then
            local net=pk:FindFirstChild("Networking")
            if net then
                local rf=net:FindFirstChild("RF/Shop/BuyCase")
                if rf then
                    rf:InvokeServer(selectedBox)
                    notify("Caja comprada!")
                end
            end
        end
    end)
end)

local animationData={
    ["Old School"]={Walk=10921244891,Run=10921240218,Jump=10921242013,Fall=10921241244,SwimIdle=10921244018,Swim=10921243048,Idle=10921230744,Idle2=10921232093,Climb=10921229866},
    ["Adidas Sports"]={Walk=18537392113,Run=18537384940,Jump=18537380791,Fall=18537367238,SwimIdle=18537387180,Swim=18537389531,Idle=18537376492,Idle2=18537371272,Climb=18537363391},
    ["Elder"]={Walk=10921111375,Run=10921104374,Jump=10921107367,Fall=10921105765,SwimIdle=10921110146,Swim=10921108971,Idle=10921101664,Idle2=10921102574,Climb=10921100400},
    ["Zombie"]={Walk=10921355261,Run=616163682,Jump=10921351278,Fall=10921350320,SwimIdle=10921353442,Swim=10921352344,Idle=10921344533,Idle2=10921345304,Climb=10921343576},
    ["Mage"]={Walk=10921152678,Run=10921148209,Jump=10921149743,Fall=10921148939,SwimIdle=10921151661,Swim=10921150788,Idle=10921144709,Idle2=10921145797,Climb=10921143404},
    ["Astronaut"]={Walk=10921046031,Run=10921039308,Jump=10921042494,Fall=10921040576,SwimIdle=10921045006,Swim=10921044000,Idle=10921034824,Idle2=10921036806,Climb=10921032124},
    ["Werewolf"]={Walk=10921342074,Run=10921336997,Fall=10921337907,SwimIdle=10921341319,Swim=10921340419,Idle=10921330408,Idle2=10921333667,Climb=10921329322},
    ["Superhero"]={Walk=10921298616,Run=10921291831,Jump=10921294559,Fall=10921293373,SwimIdle=10921297391,Swim=10921295495,Idle=10921288909,Idle2=10921290167,Climb=10921286911},
    ["Ninja"]={Walk=656121766,Run=656118852,Jump=656117878,Fall=656115606,SwimIdle=656121397,Swim=656119721,Idle=656117400,Idle2=656118341,Climb=656114359},
    ["Robot"]={Walk=616095330,Run=616091570,Jump=616090535,Fall=616087089,SwimIdle=616094091,Swim=616092998,Idle=616088211,Idle2=616089559,Climb=616086039},
    ["Cartoon"]={Walk=742640026,Run=742638842,Jump=742637942,Fall=742637151,SwimIdle=742639812,Swim=742639220,Idle=742637544,Idle2=742638445,Climb=742636889},
    ["Bubbly"]={Walk=910034870,Run=910025107,Jump=910016857,Fall=910001910,SwimIdle=910030921,Swim=910028158,Idle=910004836,Idle2=910009958,Climb=909997997},
}

local misAnimOriginales,animActual=nil,nil

local function clearAnims()
    local char=player.Character
    if not char then return end
    local hum=char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    for _,t in ipairs(hum:GetPlayingAnimationTracks()) do t:Stop(0) t:Destroy() end
    task.wait(0.05)
end

local function aplicarAnims(data)
    if not data then return end
    local char=player.Character
    if not char then return end
    clearAnims()
    local animate=char:FindFirstChild("Animate")
    if not animate then return end
    if not misAnimOriginales then
        local function g(f,n)
            local fo=animate:FindFirstChild(f)
            if fo then
                local a=fo:FindFirstChild(n)
                if a and a:IsA("Animation") then
                    local id=a.AnimationId:match("%d+")
                    if id then return tonumber(id) end
                end
            end
            return nil
        end
        misAnimOriginales={Idle=g("idle","Animation1") or 507766666,Idle2=g("idle","Animation2") or 507766951,Walk=g("walk","WalkAnim") or 507777826,Run=g("run","RunAnim") or 507767714,Jump=g("jump","JumpAnim") or 507765000,Climb=g("climb","ClimbAnim") or 507765644,Fall=g("fall","FallAnim") or 507767968,Swim=g("swim","Swim") or 507784897,SwimIdle=g("swimidle","SwimIdle") or 507785072}
    end
    animate.Disabled=true
    task.wait(0.05)
    local function s(f,n,id)
        if not id then return end
        local fo=animate:FindFirstChild(f)
        if fo then
            local a=fo:FindFirstChild(n)
            if a and a:IsA("Animation") then a.AnimationId="rbxassetid://"..tostring(id) end
        end
    end
    s("idle","Animation1",data.Idle)
    s("idle","Animation2",data.Idle2 or data.Idle)
    s("walk","WalkAnim",data.Walk)
    s("run","RunAnim",data.Run)
    s("jump","JumpAnim",data.Jump)
    s("climb","ClimbAnim",data.Climb)
    s("fall","FallAnim",data.Fall)
    s("swim","Swim",data.Swim)
    s("swimidle","SwimIdle",data.SwimIdle or data.Swim)
    task.wait(0.05)
    animate.Disabled=false
    local hum=char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:ChangeState(Enum.HumanoidStateType.Landed)
        task.wait(0.05)
        hum:ChangeState(Enum.HumanoidStateType.Running)
    end
end

local animList={"Ninguno"}
for n,_ in pairs(animationData) do table.insert(animList,n) end
table.sort(animList)

section(TabAnim.Page,"PAQUETES COMPLETOS")
local selectedPack="Ninguno"
makeDropdown(TabAnim.Page,"Elegir Paquete",animList,"Ninguno",function(v) selectedPack=v end)
makeButton(TabAnim.Page,"Aplicar Paquete",function()
    if selectedPack=="Ninguno" then
        notify("Elige un paquete primero")
        return
    end
    task.spawn(function()
        notify("Aplicando: "..selectedPack)
        animActual=animationData[selectedPack]
        aplicarAnims(animActual)
    end)
end)
makeButton(TabAnim.Page,"Restaurar Default",function()
    task.spawn(function()
        local def=misAnimOriginales or {Idle=507766666,Idle2=507766951,Walk=507777826,Run=507767714,Jump=507765000,Climb=507765644,Fall=507767968,Swim=507784897,SwimIdle=507785072}
        animActual=nil
        aplicarAnims(def)
        notify("Animaciones restauradas")
    end)
end)

section(TabCom.Page,"REPORTAR BUG / SUGERENCIA")
paragraph(TabCom.Page,"Envia tu reporte","Se enviara a nuestro Discord oficial.",nil,nil)

local bugMsg=""
local bugInput=makeInput(TabCom.Page,"Mensaje","Describe el bug...",function(t) bugMsg=t end,true)

local sendingBug=false
makeButton(TabCom.Page,"Enviar Reporte",function()
    if bugInput and bugInput.Text and bugInput.Text~="" then bugMsg=bugInput.Text end
    if sendingBug then notify("Enviando...") return end
    if not bugMsg or bugMsg=="" or not bugMsg:match("%S") then
        notify("Escribe algo primero")
        return
    end
    sendingBug=true
    notify("Enviando reporte...")
    task.spawn(function()
        local ok=sendWebhook("Reporte - Bycero Hub",bugMsg,10040575)
        sendingBug=false
        if ok then
            notify("Reporte enviado!")
            bugMsg=""
            if bugInput then bugInput.Text="" end
        else
            notify("Error al enviar.")
        end
    end)
end)

section(TabCom.Page,"CONTACTO")
makeButton(TabCom.Page,"Copiar Discord",function()
    pcall(function() setclipboard(DISCORD_LINK) end)
    notify("Discord copiado!")
end)
paragraph(TabCom.Page,"Discord Oficial",DISCORD_LINK)

local OpenBtn=Instance.new("TextButton",gui)
OpenBtn.Size=UDim2.new(0,100,0,28)
OpenBtn.Position=UDim2.new(0.02,0,0.5,0)
OpenBtn.BackgroundColor3=C.Bg
OpenBtn.Text="BYCERO HUB"
OpenBtn.TextColor3=C.Text
OpenBtn.Font=Enum.Font.GothamBold
OpenBtn.TextSize=11
OpenBtn.BorderSizePixel=0
OpenBtn.AutoButtonColor=false
corner(OpenBtn,6)
stroke(OpenBtn,C.Accent,1)

local bDrag,bStart,bPos
OpenBtn.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        bDrag=true
        bStart=i.Position
        bPos=OpenBtn.Position
        i.Changed:Connect(function()
            if i.UserInputState==Enum.UserInputState.End then bDrag=false end
        end)
    end
end)
UIS.InputChanged:Connect(function(i)
    if bDrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-bStart
        OpenBtn.Position=UDim2.new(bPos.X.Scale,bPos.X.Offset+d.X,bPos.Y.Scale,bPos.Y.Offset+d.Y)
    end
end)

local lastClick=0
OpenBtn.MouseButton1Click:Connect(function()
    if tick()-lastClick<0.3 then return end
    lastClick=tick()
    Win.Visible=not Win.Visible
end)

btnClose.MouseButton1Click:Connect(function() Win.Visible=false end)
btnMin.MouseButton1Click:Connect(function() Win.Visible=false end)

section(TabConfig.Page,"PERSONALIZACION")
makeToggle(TabConfig.Page,"Ocultar boton flotante","Oculta el boton Bycero.",false,function(v)
    if OpenBtn then OpenBtn.Visible=not v end
end)

player.CharacterAdded:Connect(function()
    task.wait(0.5)
    if speedEnabled then applySpeed() end
    if animActual then aplicarAnims(animActual) end
end)

notify("Bycero Hub v1.3 cargado")
print("[Bycero Hub v1.3] Listo.")

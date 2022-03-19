--[[

FE Krystal Dance v2
Movelist:
	Q = The Swoosher
	E = The nutty
	R = Spin me right round!
	T = Plum juice dance
	Y = Moonwalk
	U = Slav dance
	P = Barrel roll
	F = The Jerky
	G = The Shuffle
	H = The Spongebob
	J = Here comes the money!
	K = Runnin' in the 90's

Krystal dance! The old famous script that sadly has been broken (sorta), i've decided to rework this thing because... nostalgia.--
This is one of the first scripts i've ever ran on SB, seeing this back again really reminds me of how much of a noob i was.--

Credits to Krystalteam, they made the original krystal dance! Be sure to respect them or else...--

Updates by charlie:
	- Changed Music of the 'Slav dance' to the kazotsky kick music
	- Removed Actual Barrel Model
	- Removed Big Fedora
	- Made work with simple re-anim
	- Removed Fedora and Shades
	- Removed all (except intro) sound effects

#makeoldscriptsgreatagain

]]

local Players = game:GetService("Players")

local Connections = {}
function AddConnection(Connection)
	Connections[#Connections + 1] = Connection
end

Player = Players.LocalPlayer
Character = Player.Character
Humanoid = Character.Humanoid

LeftArm = Character["Left Arm"]
LeftLeg = Character["Left Leg"]
RightArm = Character["Right Arm"]
RightLeg = Character["Right Leg"]
Root = Character["HumanoidRootPart"]
Head = Character["Head"]
Torso = Character["Torso"]

Neck = Torso["Neck"]

mouse = Player:GetMouse()

walking = false
jumping = false
attacking = false
firsttime = false

tauntdebounce = false

position = nil

MseGuide = true
running = false

settime = 0
sine = 0
t = 0
ws = 14
change = 1

combo1 = true
dancing = false
equip = false

dgs = 75

combo2 = false
switch1 = true
switch2 = false
firsttime2 = false
combo3 = false
gunallowance = false
shooting = false

RunSrv = game:GetService("RunService")
RenderStepped = game:GetService("RunService").RenderStepped
removeuseless = game:GetService("Debris")

local HEADLERP = Instance.new("ManualWeld")
HEADLERP.Parent = Head
HEADLERP.Part0 = Head
HEADLERP.Part1 = Head
HEADLERP.C0 = CFrame.new(0, -1.5, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local TORSOLERP = Instance.new("ManualWeld")
TORSOLERP.Parent = Root
TORSOLERP.Part0 = Torso
TORSOLERP.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local ROOTLERP = Instance.new("ManualWeld")
ROOTLERP.Parent = Root
ROOTLERP.Part0 = Root
ROOTLERP.Part1 = Torso
ROOTLERP.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local RIGHTARMLERP = Instance.new("ManualWeld")
RIGHTARMLERP.Parent = RightArm
RIGHTARMLERP.Part0 = RightArm
RIGHTARMLERP.Part1 = Torso
RIGHTARMLERP.C0 = CFrame.new(-1.5, 0, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local LEFTARMLERP = Instance.new("ManualWeld")
LEFTARMLERP.Parent = LeftArm
LEFTARMLERP.Part0 = LeftArm
LEFTARMLERP.Part1 = Torso
LEFTARMLERP.C0 = CFrame.new(1.5, 0, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local RIGHTLEGLERP = Instance.new("ManualWeld")
RIGHTLEGLERP.Parent = RightLeg
RIGHTLEGLERP.Part0 = RightLeg
RIGHTLEGLERP.Part1 = Torso
RIGHTLEGLERP.C0 = CFrame.new(-0.5, 2, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local LEFTLEGLERP = Instance.new("ManualWeld")
LEFTLEGLERP.Parent = LeftLeg
LEFTLEGLERP.Part0 = LeftLeg
LEFTLEGLERP.Part1 = Torso
LEFTLEGLERP.C0 = CFrame.new(0.5, 2, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local function weldBetween(a, b)
	local weld = Instance.new("ManualWeld", a)
	weld.Part0 = a
	weld.Part1 = b
	weld.C0 = a.CFrame:inverse() * b.CFrame
	return weld
end

IntroSound = Instance.new("Sound",Head)
IntroSound.SoundId = "rbxassetid://236146895"
IntroSound.Volume = 8
IntroSound:Play()

ForceField = Instance.new("ForceField", Character)
ForceField.Visible = false

ArtificialHB = Instance.new("BindableEvent")
ArtificialHB.Name = "Heartbeat"

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false

lastframe = tick()
ArtificialHB:Fire()

AddConnection(game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end))

function swait(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait(0)
		end
	end
end

intro = true
ws = 0

ws = 14

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='k' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 0
			change = .5
			attacking = true

			local lol90 = 0

			coroutine.wrap(function()
				while dancing do
					lol90 = lol90 + 11
					ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(1 * math.sin(sine/10),.1 + .8 * math.sin(sine/3),0) * CFrame.Angles(math.rad(0),math.rad(0 * math.sin(sine/8)),math.rad(8 * math.sin(sine/7))),.25)
					ROOTLERP.C1 = ROOTLERP.C1:lerp(CFrame.new(0 * math.sin(sine/14),0,0) * CFrame.Angles(math.rad(0),math.rad(lol90),0),.25)
					LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.4,1.45,0) * CFrame.Angles(math.rad(180),math.rad(-5 * math.sin(sine/3)),math.rad(-6 * math.sin(sine/3))),0.25)
					RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.4,1.45,0) * CFrame.Angles(math.rad(180),math.rad(5 * math.sin(sine/3)),math.rad(6 * math.sin(sine/3))), 0.25)
					RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.3, 2 , 0) * CFrame.Angles(0, math.rad(0), math.rad(-10 + 5 * math.sin(sine/3))), 0.25)
					LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.3, 2.0, 0) * CFrame.Angles(0, math.rad(0), math.rad(10 - 5 * math.sin(sine/3))), 0.25)
					swait()
				end

				ws = 14
				ROOTLERP.C1 = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='j' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 3
			change = .5
			attacking = true

			local g1 = Instance.new("BodyGyro", Root)
			g1.D = 175
			g1.P = 20000
			g1.MaxTorque = Vector3.new(0,9000,0)

			local robuxpile = Instance.new("Part",Torso)
			robuxpile.Size = Vector3.new(1,1,1)
			robuxpile.CFrame = LeftArm.CFrame
			robuxpile.CanCollide = false

			local robuxpileweld = Instance.new("Weld",robuxpile)
			robuxpileweld.Part0 = robuxpile
			robuxpileweld.Part1 = Torso
			robuxpileweld.C0 = robuxpile.CFrame:inverse() * LeftArm.CFrame * CFrame.new(1,-.7,1.4)

			local mrobuxpile = Instance.new("SpecialMesh", robuxpile)
			mrobuxpile.MeshType = "FileMesh"
			mrobuxpile.Scale = Vector3.new(0.85, .85, .85)
			mrobuxpile.MeshId,mrobuxpile.TextureId = 'http://www.roblox.com/asset/?id=1285245','http://www.roblox.com/asset/?id=8587344'

			coroutine.wrap(function()
				coroutine.wrap(function()
					while wait(.35) do
						if not dancing then break end

						local robux = Instance.new("Part",Torso)
						robux.CFrame = robuxpile.CFrame * CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
						robux.Anchored = false
						robux.CanCollide = true
						robux.Size = Vector3.new(1,1,1)
						removeuseless:AddItem(robux,4)

						local mrobux = Instance.new("SpecialMesh", robux)
						mrobux.MeshType = "FileMesh"
						mrobux.Scale = Vector3.new(1.25, 1.25, 1.25)

						mrobux.MeshId,mrobux.TextureId = 'http://www.roblox.com/asset/?id=667285348','http://www.roblox.com/asset/?id=665939136'
						local bov = Instance.new("BodyVelocity",robux)
						bov.maxForce = Vector3.new(99999,99999,99999)
						robux.CFrame = CFrame.new(robux.Position,mouse.Hit.p)
						bov.velocity = robux.CFrame.lookVector*45
						removeuseless:AddItem(bov,.1)
					end
				end)()
				while dancing do
					g1.CFrame = g1.CFrame:lerp(CFrame.new(Root.Position,mouse.Hit.p),.4)
					ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(0,-.3,0) * CFrame.Angles(math.rad(20),math.rad(0 * math.sin(sine/8)),math.rad(0)),.25)
					LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1,.5 + .5 * math.sin(sine/2),.5) * CFrame.Angles(math.rad(-97),math.rad(40 - 20 * math.sin(sine/2)),math.rad(0)), 0.25)
					RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1,.5,.5) * CFrame.Angles(math.rad(-87),math.rad(-20),math.rad(0)), 0.25)
					RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.3, 2 , .5) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(-10)), 0.25)
					LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.3, 2.0, .5) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(10)), 0.25)
					swait()
				end
				ws = 14
				removeuseless:AddItem(g1,.001)
				robuxpile:Remove()
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='h' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 0
			change = .5
			attacking = true

			coroutine.wrap(function()
				while dancing do
					for i = 1, 15 do
						if not dancing then break end
						ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(.5,-.4 + .1 * math.sin(sine/4),0) * CFrame.Angles(math.rad(0),math.rad(20 * math.sin(sine/8)),math.rad(20)),.25)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(50 + 3 * math.sin(sine/12)),math.rad(3 - 1 * math.sin(sine/12))),.3)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(-50 - 3 * math.sin(sine/12)),math.rad(-3 + 1 * math.sin(sine/12))), .3)
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(0.25, 2.05,-0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-35)), 0.25)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.31, 2.05,-0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(14)), 0.25)
						swait()
					end
					for i = 1, 15 do
						if not dancing then break end
						ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(0,-.1 * math.sin(sine/4),0) * CFrame.Angles(math.rad(0),math.rad(20 * math.sin(sine/8)),math.rad(0)),.25)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(50 + 3 * math.sin(sine/12)),math.rad(3 - 1 * math.sin(sine/12))),.3)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(-50 - 3 * math.sin(sine/12)),math.rad(-3 + 1 * math.sin(sine/12))), .3)
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.25, .7,1.5) * CFrame.Angles(math.rad(72), math.rad(25), math.rad(-2)), 0.25)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.3, 2.0, 0) * CFrame.Angles(0, math.rad(0), math.rad(10)), 0.25)
						swait()
					end
					for i = 1, 15 do
						if not dancing then break end
						ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(-.5,-.4 + .1 * math.sin(sine/4),0) * CFrame.Angles(math.rad(0),math.rad(20 * math.sin(sine/8)),math.rad(-20)),.25)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(50 + 3 * math.sin(sine/12)),math.rad(3 - 1 * math.sin(sine/12))),.3)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(-50 - 3 * math.sin(sine/12)),math.rad(-3 + 1 * math.sin(sine/12))), .3)
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.3, 2 , 0) * CFrame.Angles(0, math.rad(0), math.rad(-10)), 0.25)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(-0.25, 2.05,0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(35)), 0.25)
						swait()
					end
					for i = 1, 15 do
						if not dancing then break end
						ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(-.5,-.1,0) * CFrame.Angles(math.rad(0),math.rad(20 * math.sin(sine/8)),math.rad(0)),.25)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(50 + 3 * math.sin(sine/12)),math.rad(3 - 1 * math.sin(sine/12))),.3)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(-50 - 3 * math.sin(sine/12)),math.rad(-3 + 1 * math.sin(sine/12))), .3)
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.31, 2.05,0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-14)), 0.3)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.25, .7,1.5) * CFrame.Angles(math.rad(72), math.rad(-25), math.rad(-2)), 0.25)
						swait()
					end
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='g' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 0
			change = .5
			attacking = true

			coroutine.wrap(function()
				coroutine.wrap(function()
					while dancing do
						ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(2 * math.sin(sine/9),-.4 + .1 * math.sin(sine/3),0) * CFrame.Angles(math.rad(0),math.rad(20 * math.sin(sine/9)),0),.25)
						swait()
					end
				end)()
				while dancing do
					for i = 1, 28 do
						if not dancing then break end
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(50 + 3 * math.sin(sine/12)),math.rad(3 - 1 * math.sin(sine/12))),.2)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.2,1.5,0) * CFrame.Angles(math.rad(180 - 7 * math.sin(sine/3)),math.rad(7 * math.sin(sine/3)),math.rad(7*math.sin(sine/3))), 0.2)
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5, .7,1) * CFrame.Angles(math.rad(75 - 10 * math.sin(sine/2)), math.rad(0), math.rad(0)), 0.25)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.31, 2.05,-.1) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(-2)), 0.3)
						swait()
					end
					for i = 1, 28 do
						if not dancing then break end
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.9,.65 + .4 * math.sin(sine/12),1.2) * CFrame.Angles(math.rad(-35 - 15 * math.sin(sine/12)),math.rad(50 + 3 * math.sin(sine/12)),math.rad(3 - 1 * math.sin(sine/12))),.2)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.2,1.5,0) * CFrame.Angles(math.rad(180 - 7 * math.sin(sine/3)),math.rad(7 * math.sin(sine/3)),math.rad(7*math.sin(sine/3))), 0.2)
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.31, 2.05,.1) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-8)), 0.25)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5, .7,1.1) * CFrame.Angles(math.rad(75 - 10 * math.sin(sine/2)), math.rad(0), math.rad(-2)), 0.25)
						swait()
					end
					swait()
				end
				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='f' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 6
			change = .5
			attacking = true

			coroutine.wrap(function()
				while dancing do
					ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(0,-.4,0) * CFrame.Angles(math.rad(20 + 5 * math.sin(sine/2)),math.rad(10 * math.sin(sine/4)),0),.25)
					RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.5,.89 - .4 * -math.sin(sine/2),.49) * CFrame.Angles(math.rad(-70 + 20 * -math.sin(sine/2)),0,math.rad(0)),.25)
					LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.5,.89 - .4 * math.sin(sine/2),.49) * CFrame.Angles(math.rad(-70  + 20 * math.sin(sine/2)),0,math.rad(0)),.25)
					RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.33, 2, -.2 + .3 * math.sin(sine/2)) * CFrame.Angles(math.rad(-20 - 20 * -math.sin(sine/2)), math.rad(0), math.rad(-8)), 0.25)
					LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.33, 2.0,-.2 - .3 * math.sin(sine/2)) * CFrame.Angles(math.rad(-20 - 20 * math.sin(sine/2)), math.rad(0), math.rad(8)), 0.25)
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='p' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 0
			change = .5
			attacking = true

			local barrelspin = 0

			coroutine.wrap(function()
				while dancing do
					ROOTLERP.C0 = ROOTLERP.C0:Lerp(CFrame.new(5 * math.sin(sine/8),-1.8,0) * CFrame.Angles(math.rad(-90),math.rad(180 * math.sin(sine/8)),0),.25)
					RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.5,1.5,0) * CFrame.Angles(math.rad(180),0,math.rad(0)),.25)
					LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.5,1.5,0) * CFrame.Angles(math.rad(180),0,math.rad(0)),.25)
					LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(.5,2,0) * CFrame.Angles(0,0,0),.25)
					RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-.5,2,0) * CFrame.Angles(0,0,0),.25)
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='q' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 0
			change = .5

			local spinningmove = 0
			attacking = true

			coroutine.wrap(function()
				while dancing do
					spinningmove = spinningmove + 10
					RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.52, 1.9, -.35) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)),.2)
					LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.52, 1.9, .35) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)),.2)
					ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(.2 * math.sin(sine/3), -.52, .2 * math.sin(sine/4)) * CFrame.Angles(math.rad(180),math.rad(spinningmove),math.rad(15 * math.sin(sine/9))),.2)
					LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.4,1.45,0) * CFrame.Angles(math.rad(180),math.rad(-1),math.rad(-3 * math.sin(sine/2))),0.3)
					RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.4,1.45,0) * CFrame.Angles(math.rad(180),math.rad(1),math.rad(3 * math.sin(sine/2))), 0.3)
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='u' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 6
			change = .5
			attacking = true

			coroutine.wrap(function()
				while dancing do
					for i = 1, 17 do
						if not dancing then break end
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.52, 1.5, -.5) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0)),.2)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.52, 1.2, .55) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)),.2)
						ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.8 + .1 * math.sin(sine/3), 0) * CFrame.Angles(math.rad(22 - 2 * math.sin(sine/3)),math.rad(0),math.rad(0)),.2)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1,-.2,.4) * CFrame.Angles(math.rad(-87 + .01 * math.sin(sine/9)),math.rad(80 - 3 * math.sin(sine/9)),math.rad(0)), 0.3)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.7,-.2,.4) * CFrame.Angles(math.rad(-87 - .01 * math.sin(sine/9)),math.rad(-88 + .7 * math.sin(sine/9)),math.rad(0)), 0.3)
						swait()
					end
					for i = 1, 17 do
						if not dancing then break end
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.52, 1.2, .55) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)),.2)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.52, 1.5, -.5) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0)),.2)
						ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.8 + .1 * math.sin(sine/3), 0) * CFrame.Angles(math.rad(22 - 2 * math.sin(sine/3)),math.rad(0),math.rad(0)),.2)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1,-.2,.4) * CFrame.Angles(math.rad(-87 + .01 * math.sin(sine/9)),math.rad(80 - 3 * math.sin(sine/9)),math.rad(0)), 0.3)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.7,-.2,.4) * CFrame.Angles(math.rad(-87 - .01 * math.sin(sine/9)),math.rad(-88 + .7 * math.sin(sine/9)),math.rad(0)), 0.3)
						swait()
					end
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='y' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 0
			change = .5

			local walkforward = 0
			local walkrotation = 0
			attacking = true

			coroutine.wrap(function()
				while dancing do
					for i = 1, 100 do
						if not dancing then break end
						walkforward = walkforward + .1
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.31, 2.05 , .1 * math.sin(sine/4)) * CFrame.Angles(math.rad(10 * math.sin(sine/4)), math.rad(0), math.rad(-8)), 0.3)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.31, 2.05, -.15 * math.sin(sine/4)) * CFrame.Angles(math.rad(-10 * math.sin(sine/4)), math.rad(0), math.rad(8)), 0.3)
						ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2, walkforward) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),.2)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.5,0,0) * CFrame.Angles(0,0,math.rad(0)),.3)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.5,0,0) * CFrame.Angles(0,0,math.rad(0)),.3)
						swait()
					end
					for i = 1, 50 do
						if not dancing then break end
						walkrotation = walkrotation + 15
						ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2, walkforward) * CFrame.Angles(math.rad(0),math.rad(walkrotation),math.rad(-0)),.2)
						swait()
					end
					walkrotation = 0
					for i = 1, 100 do
						if not dancing then break end
						walkforward = walkforward - .1
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.31, 2 , .1 * math.sin(sine/4)) * CFrame.Angles(math.rad(10 * math.sin(sine/4)), math.rad(0), math.rad(-8)), 0.3)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.31, 2, -.15 * math.sin(sine/4)) * CFrame.Angles(math.rad(-10 * math.sin(sine/4)), math.rad(0), math.rad(8)), 0.3)
						ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2, walkforward) * CFrame.Angles(math.rad(0),math.rad(-180),math.rad(-0)),.2)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.3,.7,.2) * CFrame.Angles(math.rad(220),math.rad(0),math.rad(-30)), 0.4)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.5,0,0) * CFrame.Angles(0,0,math.rad(0)),.3)
						swait()
					end
					for i = 1, 50 do
						if not dancing then break end
						walkrotation = walkrotation + 15
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.5,0,0) * CFrame.Angles(0,0,math.rad(0)),.1)
						ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2, walkforward) * CFrame.Angles(math.rad(0),math.rad(walkrotation),math.rad(-0)),.2)
						swait()
					end
					walkrotation = 0
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='t' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 0
			change = .5
			attacking = true

			coroutine.wrap(function()
				while dancing do
					for i = 1, 20 do
						if not dancing then break end
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.33, 2 , .05) * CFrame.Angles(math.rad(3), math.rad(0), math.rad(-8)), 0.2)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.33, 2.0, -.05) * CFrame.Angles(math.rad(-3), math.rad(0), math.rad(8)), 0.2)
						ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2, 0) * CFrame.Angles(math.rad(0),math.rad(0*math.sin(sine/4)),math.rad(15)),.2)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(.5,1.98,.05) * CFrame.Angles(0,0,math.rad(-140)),.2)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1,1.3,.05) * CFrame.Angles(0,0,math.rad(50)),.2)
						swait()
					end
					for i = 1, 20 do
						if not dancing then break end
						RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.33, 2, .05) * CFrame.Angles(math.rad(3), math.rad(0), math.rad(-8)), 0.2)
						LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.33, 2.0, -.05) * CFrame.Angles(math.rad(-3), math.rad(0), math.rad(8)), 0.2)
						ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2, 0) * CFrame.Angles(math.rad(0),math.rad(0*math.sin(sine/4)),math.rad(-15)),.2)
						RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1,1.4,.05) * CFrame.Angles(0,0,math.rad(-50)),.2)
						LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(-.6,2,.05) * CFrame.Angles(0,0,math.rad(140)),.2)
						swait()
					end
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='e' then
		if dancing then
			dancing = false
		else
			dancing = true
			ws = 0
			change = .5
			attacking = true

			coroutine.wrap(function()
				while dancing do
					RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.3, 2 , 0) * CFrame.Angles(0, math.rad(0), math.rad(-10)), 0.1)
					LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.3, 2.0, 0) * CFrame.Angles(0, math.rad(0), math.rad(10)), 0.1)
					ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2, 0) * CFrame.Angles(math.rad(0),math.rad(0*math.sin(sine/4)),math.rad(15*math.sin(sine/4))),.2)
					RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.3 + .3 * math.sin(sine/3.5),.5 * -math.sin(sine/3.5),.1) * CFrame.Angles(math.rad(0 * math.sin(sine/2)),0,math.rad(30 * math.sin(sine/3.5))),.2)
					LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.3 + .3 * math.sin(sine/3.5),.5 * math.sin(sine/3.5),.1) * CFrame.Angles(math.rad(0 * math.sin(sine/2)),0,math.rad(30 * math.sin(sine/3.5))),.2)
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

AddConnection(mouse.KeyDown:connect(function(Press)
	Press=Press:lower()
	if Press=='r' then
		if dancing then
			dancing = false
		else
			ws = 6

			local recordbaby = 0
			dancing = true
			change = .5
			attacking = true

			coroutine.wrap(function()
				while dancing do
					recordbaby = recordbaby + 10
					RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.27, 2 , .1 * math.sin(sine/4)) * CFrame.Angles(math.rad(10 * math.sin(sine/4)), math.rad(0), math.rad(-8)), 0.3)
					LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.27, 2.0, -.1 * math.sin(sine/4)) * CFrame.Angles(math.rad(-10 * math.sin(sine/4)), math.rad(0), math.rad(8)), 0.3)
					ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(.5 * math.sin(sine/5), -.2, .5 * math.sin(sine/4)) * CFrame.Angles(math.rad(0),math.rad(recordbaby),math.rad(0)),.3)
					RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-.5,1.98,0) * CFrame.Angles(0,0,math.rad(-90)),.3)
					LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(.5,1.98,0) * CFrame.Angles(0,0,math.rad(90)),.3)
					swait()
				end

				ws = 14
				attacking = false
			end)()
		end
	end
end))

checks1 = coroutine.wrap(function() -------Checks
	while true do
		if Root.Velocity.y > 1 then
			position = "Jump"
		elseif Root.Velocity.y < -1 then
			position = "Falling"
		elseif Root.Velocity.Magnitude < 2 then
			position = "Idle"
		elseif Root.Velocity.Magnitude > 2 then
			position = "Walking"
		elseif Root.Velocity.Magnitude > 20 then
			position = "Running"
		else
		end
		wait()
	end
end)

checks1()

OrgnC0 = Neck.C0

local movelimbs = coroutine.wrap(function()
	while RunSrv.RenderStepped:wait() do
		local Dist = nil
		local Diff = nil

		if not MseGuide then
			print("Failed to recognize")
		else
			local _, Point = workspace:FindPartOnRay(Ray.new(Head.CFrame.p, mouse.Hit.lookVector), workspace, false, true)
			Dist = (Head.CFrame.p-Point).magnitude
			Diff = Head.CFrame.Y-Point.Y

			local _, Point2 = workspace:FindPartOnRay(Ray.new(LeftArm.CFrame.p, mouse.Hit.lookVector), workspace, false, true)

			HEADLERP.C0 = CFrame.new(0, -1.5, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
			Neck.C0 = Neck.C0:lerp(OrgnC0 * CFrame.Angles(
				0, --(math.tan(Diff/Dist)*1), 
				0, 
				(((Head.CFrame.p-Point).Unit):Cross(Torso.CFrame.LookVector)).Y*1), 
				.1)
		end
	end
end)

movelimbs()

local Spin = false
local Animations = coroutine.wrap(function()
	while true do
		local Animation = Character:FindFirstChild('Animation')
		if Animation and Animation.Value ~= 'krystal' or Animation and not Animation:IsDescendantOf(game) then
			for _, Connection in pairs(Connections) do
				pcall(function()
					Connection:Disconnect()
				end)
			end

			break
		end

		settime = 0.05
		sine = sine + change

		if position == "Jump" and attacking == false then
			change = 1
			Spin = false

			LEFTLEGLERP.C1 = LEFTLEGLERP.C1:lerp(CFrame.new(0,0,0) * CFrame.Angles(0,0,0),.1)
			RIGHTLEGLERP.C1 = RIGHTLEGLERP.C1:lerp(CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),0,0),.1)
			LEFTARMLERP.C1 = LEFTARMLERP.C1:lerp(CFrame.new(0,0,0) * CFrame.Angles(0,0,0),.4)
			ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.2)
			LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.4,.1,-.2) * CFrame.Angles(math.rad(20),math.rad(-3),math.rad(-4)), 0.2)
			RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5, 2, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(0)), 0.2)
			LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5, 1.0, .9) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(0)), 0.2)
		elseif position == "Falling" and attacking == false then
			change = 1
			Spin = false

			ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(15), math.rad(0), math.rad(0)), 0.15)
			LEFTLEGLERP.C1 = LEFTLEGLERP.C1:lerp(CFrame.new(0,0,0) * CFrame.Angles(0,0,0),.1)
			RIGHTLEGLERP.C1 = RIGHTLEGLERP.C1:lerp(CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),0,0),.1)
			LEFTARMLERP.C1 = LEFTARMLERP.C1:lerp(CFrame.new(0,0,0) * CFrame.Angles(0,0,0),.4)
			RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5, 2, 0) * CFrame.Angles(math.rad(8), math.rad(4), math.rad(0)), 0.2)
			LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5, 2, 0) * CFrame.Angles(math.rad(8), math.rad(-4), math.rad(0)), 0.2)
			LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.5,.94 + .02 * math.sin(sine/12),-0) * CFrame.Angles(math.rad(28 + 5 * math.sin(sine/12)),math.rad(0),math.rad(45)), 0.2)
			RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.5,.94 + .02 * math.sin(sine/12),-0) * CFrame.Angles(math.rad(28 + 5 * math.sin(sine/12)),math.rad(0),math.rad(-45)), 0.2)
		elseif position == "Walking" and attacking == false and running == false then
			change = 1.2
			walking = true
			Spin = false

			RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.5 + Root.RotVelocity.Y / 85,.35,-.5*math.sin(sine/11)) * CFrame.Angles(math.rad(35*math.sin(sine/11)),math.rad(0*math.sin(sine/11)),math.rad(-10 + Root.RotVelocity.Y / 10, math.sin(-20 * math.sin(sine/4)))),.3)
			LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.5 + Root.RotVelocity.Y / 85,.45,.5*math.sin(sine/11)) * CFrame.Angles(math.rad(-55*math.sin(sine/11)),math.rad(-5*math.sin(sine/8)),math.rad(10 + Root.RotVelocity.Y / 10, math.sin(20 * math.sin(sine/4)))),.3)
			ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.15 * 0.6*-math.sin(sine/5.5), 0) * CFrame.Angles(math.rad(10), math.rad(12 * -math.sin(sine/11)), math.rad(0) + Root.RotVelocity.Y / 30, math.cos(25 * math.cos(sine/10))), 0.3)
			RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5, 1.92 - 0.35 * math.cos(sine/11)/2.8, -.2  + 0.2 - math.sin(sine/11)/3.4) * CFrame.Angles(math.rad(25 - 25) + -math.sin(sine/11)/2.3, math.rad(0)*math.cos(sine/1), math.rad(0), math.cos(-15 * 25 * math.cos(sine/11))), 0.3)
			LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5, 1.92 + 0.35 * math.cos(sine/11)/2.8, -.2 + 0.2 + math.sin(sine/11)/3.4) * CFrame.Angles(math.rad(25 - 25) - -math.sin(sine/11)/2.3, math.rad(0)*math.cos(sine/1), math.rad(0) , math.cos(-15 * 25 * math.cos(sine/11))), 0.3)
		elseif position == "Idle" and attacking == false and running == false then
			change = .5
			Spin = true

			ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2 + -.1 * math.sin(sine/12), 0) * CFrame.Angles(math.rad(6 * -math.sin(sine/12)),math.rad(0),math.rad(0)),.1)
			LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(1.5,.27 + .02 * math.sin(sine/12),.20 * -math.sin(sine/12)) * CFrame.Angles(math.rad(20 * math.sin(sine/12)),math.rad(0),math.rad(10)), 0.1)
			RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-1.5,.27 + .02 * math.sin(sine/12),.20 * -math.sin(sine/12)) * CFrame.Angles(math.rad(20 * math.sin(sine/12)),math.rad(0),math.rad(-10)), 0.1)
			RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.3, 2 - .1 * math.sin(sine/12), 0) * CFrame.Angles(math.rad(6 * -math.sin(sine/12)), math.rad(0), math.rad(-10)), 0.1)
			LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.3, 2.0 - .1 * math.sin(sine/12), 0) * CFrame.Angles(math.rad(6 * -math.sin(sine/12)), math.rad(0), math.rad(10)), 0.1)
		elseif position == "Running" and attacking == false then
			change = 1

			RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(0, .5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.3)
			LEFTARMLERP.C1 = LEFTARMLERP.C1:lerp(CFrame.new(-1.24+.6*math.sin(sine/4)/1.4, 0.54, 0-0.8*math.sin(sine/4))*CFrame.Angles(math.rad(6+140*math.sin(sine/4)/1.2), math.rad(0), math.rad(20+70*math.sin(sine/4))), 0.3)
			LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0,.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),.3)
			ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0, -.2, 0) * CFrame.Angles(math.rad(-20 - 0 * math.sin(sine/4)), math.rad(0 + 6 * math.sin(sine/4)), math.rad(0) + Root.RotVelocity.Y / 30, math.sin(10 * math.sin(sine/4))), 0.3)
			RIGHTLEGLERP.C1 = RIGHTLEGLERP.C1:lerp(CFrame.new(0,0,-.2 + .5*-math.sin(sine/4)),.3)
			RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5, 1.6+0.1*math.sin(sine/4),.7*-math.sin(sine/4)) * CFrame.Angles(math.rad(15+ -50 * math.sin(sine/4)),0,0),.3)
			LEFTLEGLERP.C1 = LEFTLEGLERP.C1:lerp(CFrame.new(0,0,-.2 + .5*math.sin(sine/4)),.3)
			LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5, 1.6-0.1*math.sin(sine/4),.7*math.sin(sine/4)) * CFrame.Angles(math.rad(15 + 50 * math.sin(sine/4)),0,0),.3)
		end
		swait()
	end
end)

Animations()

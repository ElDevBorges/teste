-------------------


local logoutDeaths = 1
local logoutDeaths = 2
local logoutDeaths = 3
local logoutDeaths = 4
local logoutDeaths = 5

if type(storage["death"]) ~= "table" then storage["death"] = { count = 0 } end
local deathCount = storage["death"].count
UI.Separator()
deathLabel = UI.Label("Death count: " .. deathCount)

if deathCount >= 3 then

CaveBot.setOff()

tyrBot.storage._configs.cavebot_configs.selected = 'ficarAFK'
CaveBot.setOn()

end


if deathCount >= 1 then
  deathLabel:setColor("red")
elseif deathCount >= 2 then
  deathLabel:setColor("orange")
else
  deathLabel:setColor("green")
end

UI.Button("Reset Deaths", function()
  storage["death"].count = 0
  deathLabel:setText("Death count: " .. storage["death"].count)
  deathLabel:setColor("green")
end )

xDeathCount = macro(1000, "Death Counter", function()

for i, rootW in pairs(g_ui.getRootWidget():getChildren()) do
  if rootW:getText() == "Você está morto" then
    storage["death"].count = storage["death"].count + 1
    deathLabel:setText("Death count: " .. storage["death"].count)
    modules.client_entergame.CharacterList.doLogin()
CaveBot.setOff()
TyrBot.storage._configs.cavebot_configs.selected = 'Iniciohospitalkonoha'
CaveBot.setOn()
end
  end
end)

UI.Separator()
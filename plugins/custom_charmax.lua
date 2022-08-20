PLUGIN.name = "Персональное количество персонажей"
PLUGIN.author = "Junk"
PLUGIN.description = ""

ix.command.Add("GetCharMax", {
    description = "Узнать ограничение персонажей у игрока",
    adminOnly = true,
    arguments = {
        ix.type.player
    },
    OnRun = function(self, client, target)
        return "Игрок имеет ограничение - " .. target:GetData("customCharMax", ix.config.Get("maxCharacters", 5)) .. " персонажей"
    end
})

ix.command.Add("SetCharMax", {
    description = "Установить ограничение персонажей игроку",
    superAdminOnly = true,
    arguments = {
        ix.type.player,
        ix.type.number
    },
    OnRun = function(self, client, target, newMax)
        newMax = math.Clamp(newMax, 1, 20)
        target:SetData("customCharMax", newMax)
        return "Игроку установлено ограничение - " .. newMax .. " персонажей"
    end
})

function PLUGIN:GetMaxPlayerCharacter(client)
    return client:GetData("customCharMax", ix.config.Get("maxCharacters", 5))
end
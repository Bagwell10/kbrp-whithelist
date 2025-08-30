-- ====================================
-- 📌 Whitelist KB Project - Version Complète
-- Auteur : Bagwell
-- ====================================

-- 🎯 Liste blanche : ajoute ici les SteamID autorisés
-- Tu peux trouver ton SteamID avec la commande "status" dans la console du jeu
local whitelist = {
    ["STEAM_0:0:87654321"] = true, -- Exemple
    ["STEAM_0:0:87654321"] = true  -- Exemple
}

-- ⚡ Fonction qui vérifie la whitelist à la connexion
hook.Add("CheckPassword", "WhitelistSystem", function(steamID64, ipAddress, svPassword, clPassword, name)
    local steamID = util.SteamIDFrom64(steamID64)

    -- Si le joueur n’est pas whitelist → kick
    if not whitelist[steamID] then
        print("[WHITELIST]  Refusé : " .. name .. " (" .. steamID .. ")")
        return false, " Tu n'es pas whitelist sur ce serveur.\nVa sur bagwelldarkrp.fr pour postuler"
    else
        print("[WHITELIST] ✓ Autorisé : " .. name .. " (" .. steamID .. ")")
    end
end)

-- 💡 Commande console pour tester un SteamID depuis le serveur
concommand.Add("whitelist_test", function(ply, cmd, args)
    if not args[1] then
        print("[WHITELIST] Utilisation : whitelist_test <SteamID>")
        return
    end

    local steamID = args[1]
    if whitelist[steamID] then
        print("[WHITELIST] ✓ " .. steamID .. " est whitelist.")
    else
        print("[WHITELIST]  " .. steamID .. " n'est pas whitelist.")
    end
end)

print("[WHITELIST] ✓ Script whitelist chargé avec succès")

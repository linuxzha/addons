if (not ExperienceFuLocals) then
    ExperienceFuLocals = AceLibrary("AceLocale-2.0"):new("ExperienceFu")
end

ExperienceFuLocals:RegisterTranslations("frFR", function() return {
    ["Current XP"] = "XP actuels",
    ["Display Value as..."] = "R\195\169glage des options d'affichage",
    ["Display Values"] = "Affichage",
    ["Display various XP statistics"] = "Affichage des statistiques d'XP",
    ["Gained"] = "Gagn\195\169s",
--    ["Hide Text at maximum level"] = true,
    ["Level"] = "Niveau",
    ["Pet XP"] = "Xp du familier",
    ["Remaining"] = "Restant",
    ["Reset session"] = "Remise a z\195\169ro de la session",
    ["Rest XP"] = "XP de repos",
    ["Show XP/hour"] = "Afficher les XP/heure",
    ["Show current XP percent"] = "Affiche les XP actuels en %",
    ["Show current XP until level"] = "Affiche les XP manquants",
    ["Show current XP value"] = "Affiche la valeur des XP actuels",
    ["Show current XP"] = "Affiche les XP actuels",
--    ["Show in relation to level"] = true,
    ["Show percent"] = "Afficher en %",
--    ["Show pet XP percent"] = true,
--    ["Show pet XP until level"] = true,
--    ["Show pet XP value"] = true,
--    ["Show pet XP"] = true,
    ["Show rest XP percent"] = "Afficher les pourcents d'XP de repos",
    ["Show rest XP value"] = "Afficher la valeur d'XP de repos",
    ["Show rest XP"] = "Afficher les XP de repos",
    ["Show time to level"] = "Afficher le temps avant level up",
    ["Show value"] = "Afficher la valeur",
    ["Statistics"] = "Statistiques",
    ["Time this level"] = "Temps de jeu \195\160 ce niveau",
    ["Time this session"] = "Dur\195\169e de la session",
    ["Time to level for this level"] = "Temps n\195\169cessaire pour lvl up (niveau)",
    ["Time to level for this session"] = "Temps n\195\169cessaire pour lvl up (session)",
--    ["Toggle between showing experience as an absolute or in relation to time."] = true,
    ["Total XP this level"] = "Total d'XP de ce niveau",
    ["Total XP this session"] = "Total d'XP de cette session",
    ["Total time played"] = "Temps de jeu total",
    ["View as Remaining XP"] = "Change l'affichage en relation aux XP manquants",
    ["XP/hour this level"] = "Xp/heure ce niveau",
    ["XP/hour this session"] = "XP/heure cette session",
} end)

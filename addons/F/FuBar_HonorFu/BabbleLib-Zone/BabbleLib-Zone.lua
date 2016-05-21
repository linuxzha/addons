local MAJOR_VERSION = "Zone 1.2"
local MINOR_VERSION = tonumber(string.sub("$Revision: 8254 $", 12, -3))

if BabbleLib and BabbleLib.versions[MAJOR_VERSION] and BabbleLib.versions[MAJOR_VERSION].minor >= MINOR_VERSION then
	return
end

local locale = GetLocale and GetLocale() or "enUS"

local totalZones = {
	["Ahn'Qiraj"] = "Ahn'Qiraj", -- Check
	["Alterac Mountains"] = "Alterac Mountains",
	["Alterac Valley"] = "Alterac Valley",
	["Arathi Basin"] = "Arathi Basin",
	["Arathi Highlands"] = "Arathi Highlands",
	["Ashenvale"] = "Ashenvale",
	["Azshara"] = "Azshara",
	["Badlands"] = "Badlands",
	["The Barrens"] = "The Barrens",
	["Blackfathom Deeps"] = "Blackfathom Deeps",
	["Blackrock Depths"] = "Blackrock Depths",
	["Blackrock Mountain"] = "Blackrock Mountain",
	["Blackrock Spire"] = "Blackrock Spire",
	["Blackwing Lair"] = "Blackwing Lair",
	["Blasted Lands"] = "Blasted Lands",
	["Booty Bay"] = "Booty Bay",
	["Burning Steppes"] = "Burning Steppes",
	["Caverns of Time"] = "Caverns of Time",
	["Darkshore"] = "Darkshore",
	["Darnassus"] = "Darnassus",
	["The Deadmines"] = "The Deadmines",
	["Deadwind Pass"] = "Deadwind Pass",
	["Deeprun Tram"] = "Deeprun Tram",
	["Desolace"] = "Desolace",
	["Dire Maul"] = "Dire Maul",
	["Dun Morogh"] = "Dun Morogh",
	["Durotar"] = "Durotar",
	["Duskwood"] = "Duskwood",
	["Dustwallow Marsh"] = "Dustwallow Marsh",
	["Eastern Plaguelands"] = "Eastern Plaguelands",
	["Elwynn Forest"] = "Elwynn Forest",
	["Felwood"] = "Felwood",
	["Feralas"] = "Feralas",
	["The Forbidding Sea"] = "The Forbidding Sea",
	["Gadgetzan"] = "Gadgetzan",
	["Gnomeregan"] = "Gnomeregan",
	["The Great Sea"] = "The Great Sea",
	["Hall of Legends"] = "Hall of Legends",
	["Hillsbrad Foothills"] = "Hillsbrad Foothills",
	["The Hinterlands"] = "The Hinterlands",
	["Hyjal"] = "Hyjal",
	["Ironforge"] = "Ironforge",
	["Loch Modan"] = "Loch Modan",
	["Maraudon"] = "Maraudon",
	["Molten Core"] = "Molten Core",
	["Moonglade"] = "Moonglade",
	["Mulgore"] = "Mulgore",
	["Naxxramas"] = "Naxxramas",
	["Onyxia's Lair"] = "Onyxia's Lair",
	["Orgrimmar"] = "Orgrimmar",
	["Ratchet"] = "Ratchet",
	["Ragefire Chasm"] = "Ragefire Chasm",
	["Razorfen Downs"] = "Razorfen Downs",
	["Razorfen Kraul"] = "Razorfen Kraul",
	["Redridge Mountains"] = "Redridge Mountains",
	["Ruins of Ahn'Qiraj"] = "Ruins of Ahn'Qiraj",
	["Scarlet Monastery"] = "Scarlet Monastery",
	["Scholomance"] = "Scholomance",
	["Searing Gorge"] = "Searing Gorge",
	["Shadowfang Keep"] = "Shadowfang Keep",
	["Silithus"] = "Silithus",
	["Silverpine Forest"] = "Silverpine Forest",
	["The Stockade"] = "The Stockade",
	["Stonetalon Mountains"] = "Stonetalon Mountains",
	["Stormwind City"] = "Stormwind City",
	["Stranglethorn Vale"] = "Stranglethorn Vale",
	["Stratholme"] = "Stratholme",
	["Swamp of Sorrows"] = "Swamp of Sorrows",
	["Tanaris"] = "Tanaris",
	["Teldrassil"] = "Teldrassil",
	["Temple of Ahn'Qiraj"] = "Temple of Ahn'Qiraj",
	["The Temple of Atal'Hakkar"] = "The Temple of Atal'Hakkar",
	["Thousand Needles"] = "Thousand Needles",
	["Thunder Bluff"] = "Thunder Bluff",
	["Tirisfal Glades"] = "Tirisfal Glades",
	["Uldaman"] = "Uldaman",
	["Un'Goro Crater"] = "Un'Goro Crater",
	["Undercity"] = "Undercity",
	["Wailing Caverns"] = "Wailing Caverns",
	["Warsong Gulch"] = "Warsong Gulch",
	["Western Plaguelands"] = "Western Plaguelands",
	["Westfall"] = "Westfall",
	["Wetlands"] = "Wetlands",
	["Winterspring"] = "Winterspring",
	["Zul'Farrak"] = "Zul'Farrak",
	["Zul'Gurub"] = "Zul'Gurub",
}

local englishToLocal

if locale == "deDE" then
	englishToLocal = {
		["Ahn'Qiraj"] = "Ahn'Qiraj", -- Check
		["Alterac Mountains"] = "Alteracgebirge",
		["Alterac Valley"] = "Alteractal",
		["Arathi Basin"] = "Arathibecken",
		["Arathi Highlands"] = "Arathihochland",
		["Ashenvale"] = "Ashenvale",
		["Azshara"] = "Azshara",
		["Badlands"] = "\195\150dland",
		["The Barrens"] = "Brachland",
		["Blackfathom Deeps"] = "Blackfathom-Tiefe",
		["Blackrock Depths"] = "Blackrocktiefen",
		["Blackrock Mountain"] = "Der Blackrock",
		["Blackrock Spire"] = "Blackrockspitze",
		["Blackwing Lair"] = "Pechschwingenhort",
		["Blasted Lands"] = "Verw\195\188steten Lande",
		["Booty Bay"] = "Booty Bay",
		["Burning Steppes"] = "Brennende Steppe",
		["Caverns of Time"] = "Die H\195\182hlen der Zeit", -- Check
		["Darkshore"] = "Dunkelk\195\188ste",
		["Darnassus"] = "Darnassus",
		["The Deadmines"] = "Die Todesminen",
		["Deadwind Pass"] = "Gebirgspass der Totenwinde",
		["Deeprun Tram"] = "Die Tiefenbahn",
		["Desolace"] = "Desolace",
		["Dire Maul"] = "D\195\188sterbruch",
		["Dun Morogh"] = "Dun Morogh",
		["Durotar"] = "Durotar",
		["Duskwood"] = "D\195\164mmerwald",
		["Dustwallow Marsh"] = "Marschen von Dustwallow",
		["Eastern Plaguelands"] = "\195\150stliche Pestl\195\164nder",
		["Elwynn Forest"] = "Wald von Elwynn",
		["Felwood"] = "Teufelswald",
		["Feralas"] = "Feralas",
		["The Forbidding Sea"] = "Das verbotene Meer",
		["Gadgetzan"] = "Gadgetzan",
		["Gnomeregan"] = "Gnomeregan",
		["The Great Sea"] = "Das grosse Meer",
		["Hall of Legends"] = "Halle der Legenden",
		["Hillsbrad Foothills"] = "Vorgebirge von Hillsbrad",
		["The Hinterlands"] = "Hinterland",
		["Hyjal"] = "Hyjal",
		["Ironforge"] = "Ironforge",
		["Loch Modan"] = "Loch Modan",
		["Maraudon"] = "Maraudon",
		["Molten Core"] = "Geschmolzener Kern",
		["Moonglade"] = "Moonglade",
		["Mulgore"] = "Mulgore",
		["Naxxramas"] = "Naxxramas", --Check
		["Onyxia's Lair"] = "Onyxias Hort",
		["Orgrimmar"] = "Orgrimmar",
		["Ratchet"] = "Ratchet",
		["Ragefire Chasm"] = "Ragefireabgrund",
		["Razorfen Downs"] = "Die H\195\188gel von Razorfen",
		["Razorfen Kraul"] = "Der Kral von Razorfen",
		["Redridge Mountains"] = "Rotkammgebirge",
		["Ruins of Ahn'Qiraj"] = "Ruinen von Ahn'Qiraj",
		["Scarlet Monastery"] = "Das Scharlachrote Kloster",
		["Scholomance"] = "Scholomance",
		["Searing Gorge"] = "Sengende Schlucht",
		["Shadowfang Keep"] = "Burg Shadowfang",
		["Silithus"] = "Silithus",
		["Silverpine Forest"] = "Silberwald",
		["The Stockade"] = "Das Verlies",
		["Stonetalon Mountains"] = "Steinkrallengebirge",
		["Stormwind City"] = "Stormwind",
		["Stranglethorn Vale"] = "Schlingendorntal",
		["Stratholme"] = "Stratholme",
		["Swamp of Sorrows"] = "S\195\188mpfe des Elends",
		["Tanaris"] = "Tanaris",
		["Teldrassil"] = "Teldrassil",
		["Temple of Ahn'Qiraj"] = "Tempel von Ahn'Qiraj",
		["The Temple of Atal'Hakkar"] = "Der Tempel von Atal'Hakkar",
		["Thousand Needles"] = "Tausend Nadeln",
		["Thunder Bluff"] = "Thunder Bluff",
		["Tirisfal Glades"] = "Tirisfal",
		["Uldaman"] = "Uldaman",
		["Un'Goro Crater"] = "Un'Goro-Krater",
		["Undercity"] = "Undercity",
		["Wailing Caverns"] = "Die H\195\182hlen des Wehklagens",
		["Warsong Gulch"] = "Warsongschlucht",
		["Western Plaguelands"] = "Westliche Pestl\195\164nder",
		["Westfall"] = "Westfall",
		["Wetlands"] = "Sumpfland",
		["Winterspring"] = "Winterspring",
		["Zul'Farrak"] = "Zul'Farrak",
		["Zul'Gurub"] = "Zul'Gurub",
	}
elseif locale == "frFR" then
	englishToLocal = {
		["Ahn'Qiraj"] = "Ahn'Qiraj", -- Check
		["Alterac Mountains"] = "Montagnes d'Alterac",
		["Alterac Valley"] = "Vall\195\169e d'Alterac",
		["Arathi Basin"] = "Bassin d'Arathi",
		["Arathi Highlands"] = "Hautes-terres d'Arathi",
		["Ashenvale"] = "Ashenvale",
		["Azshara"] = "Azshara",
		["Badlands"] = "Terres ingrates",
		["The Barrens"] = "Les Tarides",
		["Blackfathom Deeps"] = "Profondeurs de Brassenoire",
		["Blackrock Depths"] = "Profondeurs de Blackrock",
		["Blackrock Mountain"] = "Mont Blackrock",
		["Blackrock Spire"] = "Pic Blackrock",
		["Blackwing Lair"] = "Repaire de l'Aile noire",
		["Blasted Lands"] = "Terres foudroy\195\169es",
		["Booty Bay"] = "Baie-du-Butin",
		["Burning Steppes"] = "Steppes Ardentes",
		["Caverns of Time"] = "Grottes du temps",
		["Darkshore"] = "Sombrivage",
		["Darnassus"] = "Darnassus",
		["The Deadmines"] = "Les mortemines",
		["Deadwind Pass"] = "D\195\169fil\195\169 de Deuillevent",
		["Deeprun Tram"] = "Tram des profondeurs",
		["Desolace"] = "D\195\169solace",
		["Dire Maul"] = "Hache-Tripes",
		["Dun Morogh"] = "Dun Morogh",
		["Durotar"] = "Durotar",
		["Duskwood"] = "Bois de la p\195\169nombre",
		["Dustwallow Marsh"] = "Mar\195\169cage d'\195\130prefange",
		["Eastern Plaguelands"] = "Maleterres de l'est",
		["Elwynn Forest"] = "For\195\170t d'Elwynn",
		["Felwood"] = "Gangrebois",
		["Feralas"] = "Feralas",
		["The Forbidding Sea"] = "La Mer interdite",
		["Gadgetzan"] = "Gadgetzan", -- CHECK
		["Gnomeregan"] = "Gnomeregan",
		["The Great Sea"] = "La Grande mer",
		["Hall of Legends"] = "Hall des L\195\169gendes",
		["Hillsbrad Foothills"] = "Contreforts d'Hillsbrad",
		["The Hinterlands"] = "Les Hinterlands",
		["Hyjal"] = "Hyjal", -- CHECK
		["Ironforge"] = "Ironforge",
		["Loch Modan"] = "Loch Modan",
		["Maraudon"] = "Maraudon",
		["Molten Core"] = "C\221\181r du Magma",
		["Moonglade"] = "Reflet-de-lune",
		["Mulgore"] = "Mulgore",
		["Onyxia's Lair"] = "Repaire d'Onyxia",
		["Naxxramas"] = "Naxxramas", --Check
		["Orgrimmar"] = "Orgrimmar",
		["Ratchet"] = "Ratchet",
		["Ragefire Chasm"] = "Gouffre de Ragefeu",
		["Razorfen Downs"] = "Souilles de Tranchebauge",
		["Razorfen Kraul"] = "Kraal de Tranchebauge",
		["Redridge Mountains"] = "Les Carmines",
		["Ruins of Ahn'Qiraj"] = "Ruines d'Ahn'Qiraj",
		["Scarlet Monastery"] = "Monast\195\168re Ecarlate",
		["Scholomance"] = "Scholomance",
		["Searing Gorge"] = "Gorge des Vents br\195\187lants",
		["Shadowfang Keep"] = "Donjon d'Ombrecroc",
		["Silithus"] = "Silithus",
		["Silverpine Forest"] = "For\195\170t des pins argent\195\169s",
		["The Stockade"] = "La Prison",
		["Stonetalon Mountains"] = "Les Serres-Rocheuses",
		["Stormwind City"] = "Cit\195\169 de Stormwind",
		["Stranglethorn Vale"] = "Vall\195\169e de Strangleronce",
		["Stratholme"] = "Stratholme",
		["Swamp of Sorrows"] = "Marais des Chagrins",
		["Tanaris"] = "Tanaris",
		["Teldrassil"] = "Teldrassil",
		["Temple of Ahn'Qiraj"] = "Le temple d'Ahn'Qiraj",
		["The Temple of Atal'Hakkar"] = "Le Temple d'Atal'Hakkar",
		["Thousand Needles"] = "Mille pointes",
		["Thunder Bluff"] = "Thunder Bluff",
		["Tirisfal Glades"] = "Clairi\195\168res de Tirisfal",
		["Uldaman"] = "Uldaman",
		["Un'Goro Crater"] = "Crat\195\168re d'Un'Goro",
		["Undercity"] = "Undercity",
		["Wailing Caverns"] = "Cavernes des lamentations",
		["Warsong Gulch"] = "Goulet des Warsong",
		["Western Plaguelands"] = "Maleterres de l'ouest",
		["Westfall"] = "Marche de l'Ouest",
		["Wetlands"] = "Les Paluns",
		["Winterspring"] = "Berceau-de-l'Hiver",
		["Zul'Farrak"] = "Zul'Farrak",
		["Zul'Gurub"] = "Zul'Gurub",
	}
elseif locale == "zhCN" then
	englishToLocal = {
		["Ahn'Qiraj"] = "Ahn'Qiraj", -- Check
		["Alterac Mountains"] = "\229\165\165\231\137\185\229\133\176\229\133\139\229\177\177\232\132\137",
		["Alterac Valley"] = "\229\165\165\231\137\185\229\133\176\229\133\139\229\177\177\232\176\183",
		["Arathi Basin"] = "\233\152\191\230\139\137\229\184\140\231\155\134\229\156\176",
		["Arathi Highlands"] = "\233\152\191\230\139\137\229\184\140\233\171\152\229\156\176",
		["Ashenvale"] = "\231\129\176\232\176\183",
		["Azshara"] = "\232\137\190\232\144\168\230\139\137",
		["Badlands"] = "\232\141\146\232\138\156\228\185\139\229\156\176",
		["The Barrens"] = "\232\180\171\231\152\160\228\185\139\229\156\176",
		["Blackfathom Deeps"] = "\233\187\145\230\154\151\230\183\177\230\184\138",
		["Blackrock Depths"] = "\233\187\145\231\159\179\230\183\177\230\184\138",
		["Blackrock Mountain"] = "\233\187\145\231\159\179\229\177\177",
		["Blackrock Spire"] = "\233\187\145\231\159\179\229\161\148",
		["Blackwing Lair"] = "\233\187\145\231\191\188\228\185\139\229\183\162",
		["Blasted Lands"] = "\232\175\133\229\146\146\228\185\139\229\156\176",
		["Booty Bay"] = "Booty Bay", -- CHECK
		["Burning Steppes"] = "\231\135\131\231\131\167\229\185\179\229\142\159",
		["Caverns of Time"] = "\230\151\182\229\133\137\228\185\139\231\169\180",
		["Darkshore"] = "\233\187\145\230\181\183\229\178\184",
		["Darnassus"] = "\232\190\190\231\186\179\232\139\143\230\150\175",
		["The Deadmines"] = "\230\173\187\228\186\161\231\159\191\228\186\149",
		["Deadwind Pass"] = "\233\128\134\233\163\142\229\176\143\229\190\132",
		["Deeprun Tram"] = "\231\159\191\239\191\189?\239\191\189\229\156\176\239\191\189?", -- CHECK
		["Desolace"] = "\229\135\132\229\135\137\228\185\139\229\156\176",
		["Dire Maul"] = "\229\142\132\232\191\144\228\185\139\230\167\140",
		["Dun Morogh"] = "\228\184\185\232\142\171\231\189\151",
		["Durotar"] = "\230\157\156\233\154\134\229\161\148\229\176\148",
		["Duskwood"] = "\230\154\174\232\137\178\230\163\174\230\158\151",
		["Dustwallow Marsh"] = "\229\176\152\230\179\165\230\178\188\230\179\189",
		["Eastern Plaguelands"] = "\228\184\156\231\152\159\231\150\171\228\185\139\229\156\176",
		["Elwynn Forest"] = "\232\137\190\229\176\148\230\150\135\230\163\174\230\158\151",
		["Felwood"] = "\232\180\185\228\188\141\229\190\183\230\163\174\230\158\151",
		["Feralas"] = "\239\191\189?\239\191\189\230\139\137\230\150\175", -- CHECK
		["The Forbidding Sea"] = "The Forbidding Sea",
		["Gadgetzan"] = "Gadgetzan", -- CHECK
		["Gnomeregan"] = "\232\175\186\232\142\171\231\145\158\230\160\185",
		["The Great Sea"] = "The Great Sea", -- CHECK
		["Hall of Legends"] = "Hall of Legends", -- CHECK
		["Hillsbrad Foothills"] = "\229\184\140\229\176\148\230\150\175\229\184\131\232\142\177\229\190\183\228\184\152\233\153\181",
		["The Hinterlands"] = "\232\190\155\231\137\185\229\133\176",
		["Hyjal"] = "Hyjal", -- CHECK
		["Ironforge"] = "\233\147\129\231\130\137\229\160\161", 
		["Loch Modan"] = "\230\180\155\229\133\139\232\142\171\228\184\185",
		["Maraudon"] = "\231\142\155\230\139\137\233\161\191",
		["Molten Core"] = "\231\134\148\231\129\171\228\185\139\229\191\131",
		["Moonglade"] = "\230\156\136\229\133\137\230\158\151\229\156\176",
		["Mulgore"] = "\232\142\171\233\171\152\233\155\183",
		["Naxxramas"] = "Naxxramas", --Check
		["Onyxia's Lair"] = "\229\165\165\229\166\174\229\133\139\232\165\191\228\186\154\231\154\132\229\183\162\231\169\180",
		["Orgrimmar"] = "\229\165\165\230\160\188\231\145\158\231\142\155",
		["Ratchet"] = "Ratchet", -- CHECK
		["Ragefire Chasm"] = "\230\128\146\231\132\176\232\163\130\232\176\183",
		["Razorfen Downs"] = "\229\137\131\229\136\128\233\171\152\229\156\176",
		["Razorfen Kraul"] = "\229\137\131\229\136\128\230\178\188\230\179\189",
		["Redridge Mountains"] = "\232\181\164\232\132\138\229\177\177",
		["Ruins of Ahn'Qiraj"] = "\229\174\137\229\133\182\230\139\137\229\186\159\229\162\159",
		["Scarlet Monastery"] = "\232\161\128\232\137\178\228\191\174\233\129\147\233\153\162",
		["Scholomance"] = "\233\128\154\231\129\181\229\173\166\233\153\162", -- CHECK
		["Searing Gorge"] = "\231\129\188\231\131\173\229\179\161\232\176\183",
		["Shadowfang Keep"] = "\229\189\177\231\137\153\229\159\142\229\160\161",
		["Silithus"] = "\229\184\140\229\136\169\239\191\189?\230\150\175", -- CHECK
		["Silverpine Forest"] = "\233\147\182\239\191\189?\239\191\189\230\163\174\230\158\151", -- CHECK
		["The Stockade"] = "\230\154\180\233\163\142\229\159\142\231\155\145\231\139\177",
		["Stonetalon Mountains"] = "\231\159\179\231\136\170\229\177\177\232\132\137",
		["Stormwind City"] = "\230\154\180\233\163\142\229\159\142",
		["Stranglethorn Vale"] = "\232\141\134\230\163\152\232\176\183",
		["Stratholme"] = "\230\150\175\229\157\166\231\180\162\229\167\134",
		["Swamp of Sorrows"] = "\230\130\178\228\188\164\230\178\188\230\179\189",
		["Tanaris"] = "\229\161\148\231\186\179\229\136\169\230\150\175",
		["Teldrassil"] = "\230\179\176\232\190\190\229\184\140\229\176\148",
		["Temple of Ahn'Qiraj"] = "\229\174\137\229\133\182\230\139\137\231\165\158\230\174\191",
		["The Temple of Atal'Hakkar"] = "\233\152\191\229\161\148\229\147\136\239\191\189?\239\191\189\231\165\158\229\186\153", -- CHECK
		["Thousand Needles"] = "\239\191\189?\239\191\189\233\146\136\231\159\179", -- CHECK
		["Thunder Bluff"] = "\233\155\183\233\156\134\229\180\150",
		["Tirisfal Glades"] = "\230\143\144\231\145\158\230\150\175\230\179\149\230\158\151\229\156\176",
		["Uldaman"] = "\229\165\165\232\190\190\230\155\188",
		["Un'Goro Crater"] = "\231\142\175\229\158\139\229\177\177",
		["Undercity"] = "\229\185\189\230\154\151\229\159\142",
		["Wailing Caverns"] = "\229\147\128\229\154\142\230\180\158\231\169\180",
		["Warsong Gulch"] = "\230\136\152\230\173\140\229\179\161\232\176\183",
		["Western Plaguelands"] = "\232\165\191\231\152\159\231\150\171\228\185\139\229\156\176",
		["Westfall"] = "\232\165\191\233\131\168\232\141\146\233\135\142",
		["Wetlands"] = "\230\185\191\229\156\176",
		["Winterspring"] = "\229\134\172\230\179\137\232\176\183",
		["Zul'Farrak"] = "\231\165\150\229\176\148\230\179\149\230\139\137\229\133\139",
		["Zul'Gurub"] = "\231\165\150\229\176\148\230\160\188\230\139\137\229\184\131",
	}
elseif locale == "koKR" then
	englishToLocal = {
		["Ahn'Qiraj"] = "안퀴라즈", -- 확인요망
		["Alterac Mountains"] = "알터랙 산맥",
		["Alterac Valley"] = "알터랙 계곡",
		["Arathi Basin"] = "아라시 분지",
		["Arathi Highlands"] = "아라시 고원",
		["Ashenvale"] = "잿빛 골짜기",
		["Azshara"] = "아즈샤라",
		["Badlands"] = "황야의 땅",
		["The Barrens"] = "불모의 땅",
		["Blackfathom Deeps"] = "검은 심연의 나락",
		["Blackrock Depths"] = "검은바위 나락",
		["Blackrock Mountain"] = "검은바위 산",
		["Blackrock Spire"] = "검은바위 첨탑",
		["Blackwing Lair"] = "검은날개 둥지",
		["Blasted Lands"] = "저주받은 땅",
		["Booty Bay"] = "무법항",
		["Burning Steppes"] = "불타는 평원",
		["Caverns of Time"] = "시간의 동굴",
		["Darkshore"] = "어둠의 해안",
		["Darnassus"] = "다르나서스",
		["The Deadmines"] = "죽음의 폐광",
		["Deadwind Pass"] = "죽음의 고개",
		["Deeprun Tram"] = "깊은굴 지하철",
		["Desolace"] = "잊혀진 땅",
		["Dire Maul"] = "혈투의 전장",
		["Dun Morogh"] = "던 모로",
		["Durotar"] = "듀로타",
		["Duskwood"] = "그늘숲",
		["Dustwallow Marsh"] = "먼지진흙 습지대",
		["Eastern Plaguelands"] = "동부 역병지대",
		["Elwynn Forest"] = "엘윈 숲",
		["Felwood"] = "악령의 숲",
		["Feralas"] = "페랄라스",
		["The Forbidding Sea"] = "성난폭풍 해안",
		["Gadgetzan"] = "가젯잔",
		["Gnomeregan"] = "놈리건",
		["The Great Sea"] = "대해",
		["Hall of Legends"] = "용사의 전당",
		["Hillsbrad Foothills"] = "힐스브래드 구릉지",
		["The Hinterlands"] = "동부 내륙지",
		["Hyjal"] = "하이잘",
		["Ironforge"] = "아이언포지",
		["Loch Modan"] = "모단 호수",
		["Maraudon"] = "마라우돈",
		["Molten Core"] = "화산 심장부",
		["Moonglade"] = "달의 숲",
		["Mulgore"] = "멀고어",		
		["Naxxramas"] = "낙스라마스",
		["Onyxia's Lair"] = "오닉시아의 둥지",		
		["Orgrimmar"] = "오그리마",
		["Ratchet"] = "톱니항",
		["Ragefire Chasm"] = "성난 불길협곡",
		["Razorfen Downs"] = "가시덩쿨 구릉",
		["Razorfen Kraul"] = "가시덩쿨 우리",
		["Redridge Mountains"] = "붉은마루 산맥",
		["Ruins of Ahn'Qiraj"] = "안퀴라즈 폐허",
		["Scarlet Monastery"] = "붉은 십자군 수도원",
		["Scholomance"] = "스칼로맨스",
		["Searing Gorge"] = "이글거리는 협곡",
		["Shadowfang Keep"] = "그림자 송곳니 성채",
		["Silithus"] = "실리더스",
		["Silverpine Forest"] = "은빛소나무 숲",
		["The Stockade"] = "지하감옥",
		["Stonetalon Mountains"] = "돌발톱 산맥",
		["Stormwind City"] = "스톰윈드",
		["Stranglethorn Vale"] = "가시덤불 골짜기",
		["Stratholme"] = "스트라솔름",
		["Swamp of Sorrows"] = "슬픔의 늪",
		["Tanaris"] = "타나리스",
		["Teldrassil"] = "텔드랏실",
		["Temple of Ahn'Qiraj"] = "안퀴라즈",
		["The Temple of Atal'Hakkar"] = "아탈학카르 신전",
		["Thousand Needles"] = "버섯구름 봉우리",
		["Thunder Bluff"] = "썬더 블러프",
		["Tirisfal Glades"] = "티리스팔 숲",
		["Uldaman"] = "울다만",
		["Un'Goro Crater"] = "운고로 분화구",
		["Undercity"] = "언더시티",
		["Wailing Caverns"] = "통곡의 동굴",
		["Warsong Gulch"] = "전쟁노래 협곡",
		["Western Plaguelands"] = "서부 역병지대",
		["Westfall"] = "서부 몰락지대",
		["Wetlands"] = "저습지",
		["Winterspring"] = "여명의 설원",
		["Zul'Farrak"] = "줄파락",
		["Zul'Gurub"] = "줄구룹",
	}
elseif locale ~= "enUS" then
	-- no translations
	englishToLocal = {
	}
end

if englishToLocal then
	for key in pairs(englishToLocal) do
		if not totalZones[key] then			
			error("Improper translation exists. %q is likely misspelled for locale %s.", key, locale)
			break
		end
	end
end

-------------IRIEL'S-STUB-CODE--------------
local stub = {};

-- Instance replacement method, replace contents of old with that of new
function stub:ReplaceInstance(old, new)
   for k,v in pairs(old) do old[k]=nil; end
   for k,v in pairs(new) do old[k]=v; end
end

-- Get a new copy of the stub
function stub:NewStub()
  local newStub = {};
  self:ReplaceInstance(newStub, self);
  newStub.lastVersion = '';
  newStub.versions = {};
  return newStub;
end

-- Get instance version
function stub:GetInstance(version)
   if (not version) then version = self.lastVersion; end
   local versionData = self.versions[version];
   if (not versionData) then
	  message("Cannot find library instance with version '" 
			  .. version .. "'");
	  return;
   end
   return versionData.instance;
end

-- Register new instance
function stub:Register(newInstance)
   local version,minor = newInstance:GetLibraryVersion();
   self.lastVersion = version;
   local versionData = self.versions[version];
   if (not versionData) then
	  -- This one is new!
	  versionData = { instance = newInstance,
		 minor = minor,
		 old = {} 
	  };
	  self.versions[version] = versionData;
	  newInstance:LibActivate(self);
	  return newInstance;
   end
   if (minor <= versionData.minor) then
	  -- This one is already obsolete
	  if (newInstance.LibDiscard) then
		 newInstance:LibDiscard();
	  end
	  return versionData.instance;
   end
   -- This is an update
   local oldInstance = versionData.instance;
   local oldList = versionData.old;
   versionData.instance = newInstance;
   versionData.minor = minor;
   local skipCopy = newInstance:LibActivate(self, oldInstance, oldList);
   table.insert(oldList, oldInstance);
   if (not skipCopy) then
	  for i, old in ipairs(oldList) do
		 self:ReplaceInstance(old, newInstance);
	  end
   end
   return newInstance;
end

-- Bind stub to global scope if it's not already there
if (not BabbleLib) then
   BabbleLib = stub:NewStub();
end

-- Nil stub for garbage collection
stub = nil;
-----------END-IRIEL'S-STUB-CODE------------

local function assert(condition, message)
	if not condition then
		local stack = debugstack()
		local first = string.gsub(stack, "\n.*", "")
		local file = string.gsub(first, "^(.*\\.*).lua:%d+: .*", "%1")
		file = string.gsub(file, "([%(%)%.%*%+%-%[%]%?%^%$%%])", "%%%1")
		if not message then
			local _,_,second = string.find(stack, "\n(.-)\n")
			message = "assertion failed! " .. second
		end
		message = "BabbleLib-Zone: " .. message
		local i = 1
		for s in string.gfind(stack, "\n([^\n]*)") do
			i = i + 1
			if not string.find(s, file .. "%.lua:%d+:") then
				error(message, i)
				return
			end
		end
		error(message, 2)
		return
	end
	return condition
end

local function argCheck(arg, num, kind, kind2, kind3, kind4)
	if tostring(type(arg)) ~= kind then
		if kind2 then
			if tostring(type(arg)) ~= kind2 then
				if kind3 then
					if tostring(type(arg)) ~= kind3 then
						if kind4 then
							if tostring(type(arg)) ~= kind4 then
								local _,_,func = string.find(debugstack(), "\n.-`(.-)'\n")
								assert(false, format("Bad argument #%d to `%s' (%s, %s, %s, or %s expected, got %s)", num, func, kind, kind2, kind3, kind4, type(arg)))
							end
						else
							local _,_,func = string.find(debugstack(), "\n.-`(.-)'\n")
							assert(false, format("Bad argument #%d to `%s' (%s, %s, or %s expected, got %s)", num, func, kind, kind2, kind3, type(arg)))
						end
					end
				else
					local _,_,func = string.find(debugstack(), "\n.-`(.-)'\n")
					assert(false, format("Bad argument #%d to `%s' (%s or %s expected, got %s)", num, func, kind, kind2, type(arg)))
				end
			end
		else
			local _,_,func = string.find(debugstack(), "\n.-`(.-)'\n")
			assert(false, format("Bad argument #%d to `%s' (%s expected, got %s)", num, func, kind, type(arg)))
		end
	end
end

local lib = {}
local localToEnglish

if locale == "enUS" then
	function lib:GetEnglish(zone)
		argCheck(zone, 2, "string")
		assert(totalZones[zone], format("Zone %q does not exist", zone))
		return zone
	end
	
	function lib:GetLocalized(zone)
		argCheck(zone, 2, "string")
		assert(totalZones[zone], format("Zone %q does not exist", zone))
		return zone
	end
	
	function lib:GetIterator()
		return pairs(totalZones)
	end
	
	lib.GetReverseIterator = lib.GetIterator
	
	function lib:HasZone(zone)
		argCheck(zone, 2, "string")
		return totalZones[zone] and true or false
	end
else
	function lib:GetEnglish(zone)
		argCheck(zone, 2, "string")
		local z = localToEnglish[zone]
		assert(z, format("Zone %q does not exist or is not translated into %s", zone, locale))
		return z
	end
	
	function lib:GetLocalized(zone)
		argCheck(zone, 2, "string")
		assert(totalZones[zone], format("Zone %q does not exist", zone))
		local z = englishToLocal[zone]
		assert(z, format("Zone %q is not translated into %s", zone, locale))
		return z
	end
	
	local improperTranslation = nil
	for zone in pairs(totalZones) do
		if not englishToLocal[zone] then
			improperTranslation = zone
			break
		end
	end
	
	if improperTranslation then
		function lib:GetIterator()
			assert(false, "Zone %q not translated into %s", improperTranslation, locale)
		end
		
		lib.GetReverseIterator = lib.GetIterator
	else
		function lib:GetIterator()
			return pairs(englishToLocal)
		end
		
		function lib:GetReverseIterator()
			return pairs(localToEnglish)
		end
	end
	
	function lib:HasZone(zone)
		argCheck(zone, 2, "string")
		return (totalZones[zone] or localToEnglish[zone]) and true or false
	end
end

function lib:GetLibraryVersion()
	return MAJOR_VERSION, MINOR_VERSION
end

function lib:LibActivate(stub, oldLib, oldList)
	if locale ~= "enUS" then
		localToEnglish = {}
		for english, localized in pairs(englishToLocal) do
			localToEnglish[localized] = english
		end
	end
	
	local mt = getmetatable(self) or {}
    mt.__call = self.GetLocalized
    setmetatable(self, mt)
end

function lib:LibDeactivate()
	totalZones, localToEnglish, englishToLocal = nil
end

BabbleLib:Register(lib)
lib = nil

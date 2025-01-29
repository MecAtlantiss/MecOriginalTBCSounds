local yells = {
    [MOTS_KAEL_YELL_PHASE1] = {fileID = 558277, fileName = "TEMPEST_Kael_Intro01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHASE2] = {fileID = 558269, fileName = "TEMPEST_Kael_WpnRlse01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHASE3] = {fileID = 558264, fileName = "TEMPEST_Kael_AdvFight01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHASE4] = {fileID = 558275, fileName = "TEMPEST_Kael_Intro02.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHASE5] = {fileID = 558271, fileName = "TEMPEST_Kael_GoesNuts02.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHASE1_THALADRED] = {fileID = 558263, fileName = "TEMPEST_Kael_ThalIntro01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHASE1_SANGUINAR] = {fileID = 558276, fileName = "TEMPEST_Kael_SanIntro01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHASE1_CAPERNIAN] = {fileID = 558265, fileName = "TEMPEST_Kael_CapIntro01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHASE1_TELONICUS] = {fileID = 558274, fileName = "TEMPEST_Kael_TelIntro01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHOENIX1] = {fileID = 558273, fileName = "TEMPEST_Kael_SumnPhnx01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_PHOENIX2] = {fileID = 558262, fileName = "TEMPEST_Kael_SumnPhnx02.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_MIND_CONTROL1] = {fileID = 558268, fileName = "TEMPEST_Kael_MndCntrl01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_MIND_CONTROL2] = {fileID = 558260, fileName = "TEMPEST_Kael_MndCntrl02.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_GRAVITY_LAPSE1] = {fileID = 558261, fileName = "TEMPEST_Kael_GrvtyLpse01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_GRAVITY_LAPSE2] = {fileID = 558266, fileName = "TEMPEST_Kael_GrvtyLpse02.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_DEATH] = {fileID = 558272, fileName = "TEMPEST_Kael_Death02.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_SLAY1] = {fileID = 558259, fileName = "TEMPEST_Kael_Slay01.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_SLAY2] = {fileID = 558270, fileName = "TEMPEST_Kael_Slay02.mp3", unitName = "Kael'thas Sunstrider"},
    [MOTS_KAEL_YELL_SLAY3] = {fileID = 558267, fileName = "TEMPEST_Kael_Slay03.mp3", unitName = "Kael'thas Sunstrider"},
}

--mute TBCC sounds upon logging in or reloading UI
for yell, yell_info in pairs(yells) do
    MuteSoundFile(yell_info.fileID)
end

local function makeSoundPath(fileName)
    return "Interface\\Addons\\MecOriginalTBCSounds\\Sounds\\"..fileName
end

local frame = CreateFrame("Frame")
function frame:OnEvent(event, ...)
    if event == "CHAT_MSG_MONSTER_YELL" then
		yell_text, yeller_name = ...
        if not yells[yell_text] then return end
        if yells[yell_text].unitName ~= yeller_name then return end
        PlaySoundFile(makeSoundPath(yells[yell_text].fileName), "MASTER")
    end
end
frame:RegisterEvent("CHAT_MSG_MONSTER_YELL")
frame:SetScript("OnEvent", frame.OnEvent)

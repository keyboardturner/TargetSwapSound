local IsReplacingUnit = IsReplacingUnit or C_PlayerInteractionManager.IsReplacingUnit
local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
EventFrame:SetScript("OnEvent", function()
    if UnitExists("target") and not IsReplacingUnit() then
        if (UnitIsEnemy("target", "player")) then
            PlaySound(SOUNDKIT.IG_CREATURE_AGGRO_SELECT)
        elseif (UnitIsFriend("player", "target")) then
            PlaySound(SOUNDKIT.IG_CHARACTER_NPC_SELECT)
        else
            PlaySound(SOUNDKIT.IG_CREATURE_NEUTRAL_SELECT)
        end
    elseif not UnitExists("target") then
        PlaySound(SOUNDKIT.INTERFACE_SOUND_LOST_TARGET_UNIT);
    end
end)

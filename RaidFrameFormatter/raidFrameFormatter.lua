local DUNGEON_PROFILE = 3;
local SMALL_RAID_PROFILE = 3;
local MYTHIC_RAID_PROFILE = 3;
local MEDIUM_RAID_PROFILE = 5;
local SMALL_MEDIUM_RAID_PROFILE = 4;
local LARGE_RAID_PROFILE = 6;

function switchProfile()

    --Documentation https://wowpedia.fandom.com/wiki/Category:API_namespaces/C_EditMode

    --print("Active Layout: "..C_EditMode.GetLayouts().activeLayout);
    
    local _, typeOfInstance, difficulty, difficultyName, _, _, _, instanceMapId, _ = GetInstanceInfo();
    if InCombatLockdown() == false then --This should fix in-combat issues.
        if GetNumGroupMembers(LE_PARTY_CATEGORY_INSTANCE) > 0 then --**IN INSTANCE GROUP**
            if GetNumGroupMembers(LE_PARTY_CATEGORY_INSTANCE) <= 5 then
                if C_EditMode.GetLayouts().activeLayout ~= DUNGEON_PROFILE then -- if DUNGEON_PROFILE is not active
                    C_EditMode.SetActiveLayout(DUNGEON_PROFILE); --...set DUNGEON_PROFILE.
                    print("Activated RaidProfile: "..DUNGEON_PROFILE)
                end
            elseif GetNumGroupMembers(LE_PARTY_CATEGORY_INSTANCE) <= 15 then
                if C_EditMode.GetLayouts().activeLayout ~= SMALL_RAID_PROFILE then --if SMALL_RAID_PROFILE is not active
                    C_EditMode.SetActiveLayout(SMALL_RAID_PROFILE); --...set SMALL_RAID_PROFILE.
                    print("Activated RaidProfile: "..SMALL_RAID_PROFILE)
                end
            elseif GetNumGroupMembers(LE_PARTY_CATEGORY_INSTANCE) <= 20 then
                if C_EditMode.GetLayouts().activeLayout ~= MYTHIC_RAID_PROFILE then --if MYTHIC_RAID_PROFILE is not active
                    C_EditMode.SetActiveLayout(MYTHIC_RAID_PROFILE); --...set MYTHIC_RAID_PROFILE.
                    print("Activated RaidProfile: "..MYTHIC_RAID_PROFILE)
                end
            elseif GetNumGroupMembers(LE_PARTY_CATEGORY_INSTANCE) <= 25 then
                if C_EditMode.GetLayouts().activeLayout ~= SMALL_MEDIUM_RAID_PROFILE then --if SMALL_MEDIUM_RAID_PROFILE is not active
                    C_EditMode.SetActiveLayout(SMALL_MEDIUM_RAID_PROFILE); --...set SMALL_MEDIUM_RAID_PROFILE.
                    print("Activated RaidProfile: "..SMALL_MEDIUM_RAID_PROFILE)
                end
            elseif GetNumGroupMembers(LE_PARTY_CATEGORY_INSTANCE) <= 30 then
                if C_EditMode.GetLayouts().activeLayout ~= MEDIUM_RAID_PROFILE then --if MEDIUM_RAID_PROFILE is not active
                    C_EditMode.SetActiveLayout(MEDIUM_RAID_PROFILE); --...set MEDIUM_RAID_PROFILE.
                    print("Activated RaidProfile: "..MEDIUM_RAID_PROFILE)
                end
            else
                if C_EditMode.GetLayouts().activeLayout ~= LARGE_RAID_PROFILE then --if LARGE_RAID_PROFILE is not active
                    C_EditMode.SetActiveLayout(LARGE_RAID_PROFILE); --...set LARGE_RAID_PROFILE.
                    print("Activated RaidProfile: "..LARGE_RAID_PROFILE)
                end
            end
        elseif GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) > 0 then --**IN MANUAL GROUP**
            if difficultyName == "Mythic" and typeOfInstance == "raid" then
                if C_EditMode.GetLayouts().activeLayout ~= MYTHIC_RAID_PROFILE then --if MYTHIC_RAID_PROFILE is not active
                    C_EditMode.SetActiveLayout(MYTHIC_RAID_PROFILE); --...set MYTHIC_RAID_PROFILE.
                    print("Activated RaidProfile: "..MYTHIC_RAID_PROFILE)
                end
            else
                if GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) <= 5 then
                    if C_EditMode.GetLayouts().activeLayout ~= DUNGEON_PROFILE then -- if DUNGEON_PROFILE is not active
                        C_EditMode.SetActiveLayout(DUNGEON_PROFILE); --...set DUNGEON_PROFILE.
                        print("Activated RaidProfile: "..DUNGEON_PROFILE)
                    end
                elseif GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) <= 15 then
                    if C_EditMode.GetLayouts().activeLayout ~= SMALL_RAID_PROFILE then --if SMALL_RAID_PROFILE is not active
                        C_EditMode.SetActiveLayout(SMALL_RAID_PROFILE); --...set SMALL_RAID_PROFILE.
                        print("Activated RaidProfile: "..SMALL_RAID_PROFILE)
                    end
                elseif GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) <= 20 then
                    if C_EditMode.GetLayouts().activeLayout ~= MYTHIC_RAID_PROFILE then --if MYTHIC_RAID_PROFILE is not active
                        C_EditMode.SetActiveLayout(MYTHIC_RAID_PROFILE); --...set MYTHIC_RAID_PROFILE.
                        print("Activated RaidProfile: "..MYTHIC_RAID_PROFILE)
                    end
                elseif GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) <= 25 then
                    if C_EditMode.GetLayouts().activeLayout ~= SMALL_MEDIUM_RAID_PROFILE then --if SMALL_MEDIUM_RAID_PROFILE is not active
                        C_EditMode.SetActiveLayout(SMALL_MEDIUM_RAID_PROFILE); --...set SMALL_MEDIUM_RAID_PROFILE.
                        print("Activated RaidProfile: "..SMALL_MEDIUM_RAID_PROFILE)
                    end
                elseif GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) <= 30 then
                    if C_EditMode.GetLayouts().activeLayout ~= MEDIUM_RAID_PROFILE then --if MEDIUM_RAID_PROFILE is not active
                        C_EditMode.SetActiveLayout(MEDIUM_RAID_PROFILE); --...set MEDIUM_RAID_PROFILE.
                        print("Activated RaidProfile: "..MEDIUM_RAID_PROFILE)
                    end
                else
                    if C_EditMode.GetLayouts().activeLayout ~= LARGE_RAID_PROFILE then --if LARGE_RAID_PROFILE is not active
                        C_EditMode.SetActiveLayout(LARGE_RAID_PROFILE); --...set LARGE_RAID_PROFILE.
                        print("Activated RaidProfile: "..LARGE_RAID_PROFILE)
                    end
                end
            end
        end
    end

    CompactRaidFrameContainer:SetPoint("TOPLEFT", "UIParent", "CENTER", -260, -209);
end
local f = CreateFrame("Frame")
f:RegisterEvent("GROUP_ROSTER_UPDATE") --fires when player joins or leaves group
f:RegisterEvent("PLAYER_REGEN_ENABLED") --fires when leaving combat
f:SetScript("OnEvent",switchProfile);
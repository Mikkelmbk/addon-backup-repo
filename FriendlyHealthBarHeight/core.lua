local friendlyHealthBarSizeFrame = CreateFrame("Frame", friendlyHealthBarSizeFrame)

local function friendlyNamePlateSize(self, event, ...)
  C_NamePlate.SetNamePlateFriendlySize(1, 1)
  C_NamePlate.SetNamePlateFriendlyClickThrough(true) -- add 2 dashes in front of this line to allow clicking friendly nameplates, then save and reload wow.
end

friendlyHealthBarSizeFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
friendlyHealthBarSizeFrame:SetScript("OnEvent", friendlyNamePlateSize)
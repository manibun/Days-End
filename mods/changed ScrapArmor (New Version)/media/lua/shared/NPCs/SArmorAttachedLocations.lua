--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

local group = AttachedLocations.getGroup("Human")


group:getOrCreateLocation("Sword On Back69"):setAttachmentName("Sword_Back")
group:getOrCreateLocation("Shield Slot 69"):setAttachmentName("Shield_Slot")
group:getOrCreateLocation("Shield in Lhand"):setAttachmentName("ShieldLelftHand")

if getDebug() then
	group:getOrCreateLocation("OnBack"):setAttachmentName("back")
end




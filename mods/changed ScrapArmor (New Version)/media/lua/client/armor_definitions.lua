--Body Parts List --> Foot_L, Foot_R, ForeArm_L, ForeArm_R, Groin, Hand_L, Hand_R, Head, LowerLeg_L, LowerLeg_R, MAX, Neck, Torso_Lower, Torso_Upper, UpperArm_L, UpperArm_R, UpperLeg_L, UpperLeg_R 
--Available Res Types list --> ScratchRes|DeepWoundRes|BurnRes|BulletRes|FractureRes|GlassRes|BiteRes

if(ItemValueTable == nil) then ItemValueTable = {}; end
ItemValueTable["Armor.ScrapShield"] = 10.00;
ItemValueTable["Armor.ScrapShieldPainted1"] = 10.00;
ItemValueTable["Armor.ScrapShieldPainted2"] = 10.00;
ItemValueTable["Armor.ScrapShieldPainted3"] = 10.00;
if(GlobalArmor == nil) then GlobalArmor = {} end

local WorkingArmor;
	
	
-- Shields
		
WorkingArmor = "ScrapShield";
GlobalArmor[WorkingArmor] = {};
GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 70, ForeArm_L = 70, UpperArm_L = 70, Torso_Upper = 70, Torso_Lower = 70, Groin = 70, UpperLeg_L = 70, LowerLeg_L = 70};			
GlobalArmor[WorkingArmor]["Durability"] = 10;
GlobalArmor[WorkingArmor]["Location"] = "Shield";

WorkingArmor = "WoodenShield";
GlobalArmor[WorkingArmor] = {};
GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 70, ForeArm_L = 70, UpperArm_L = 70, Torso_Upper = 70, Torso_Lower = 70, Groin = 70, UpperLeg_L = 70, LowerLeg_L = 70};			
GlobalArmor[WorkingArmor]["Durability"] = 6;
GlobalArmor[WorkingArmor]["Location"] = "Shield";


WorkingArmor = "ScrapShieldPainted1";
GlobalArmor[WorkingArmor] = {};
GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 70, ForeArm_L = 70, UpperArm_L = 70, Torso_Upper = 70, Torso_Lower = 70, Groin = 70, UpperLeg_L = 70, LowerLeg_L = 70};			
GlobalArmor[WorkingArmor]["Durability"] = 10;
GlobalArmor[WorkingArmor]["Location"] = "Shield";

WorkingArmor = "ScrapShieldPainted2";
GlobalArmor[WorkingArmor] = {};
GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 70, ForeArm_L = 70, UpperArm_L = 70, Torso_Upper = 70, Torso_Lower = 70, Groin = 70, UpperLeg_L = 70, LowerLeg_L = 70};			
GlobalArmor[WorkingArmor]["Durability"] = 10;
GlobalArmor[WorkingArmor]["Location"] = "Shield";

WorkingArmor = "ScrapShieldPainted3";
GlobalArmor[WorkingArmor] = {};
GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 85, ForeArm_L = 85, UpperArm_L = 85, Torso_Upper = 85, Torso_Lower = 85, Groin = 85, UpperLeg_L = 15, LowerLeg_L = 1};	
GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 70, ForeArm_L = 70, UpperArm_L = 70, Torso_Upper = 70, Torso_Lower = 70, Groin = 70, UpperLeg_L = 70, LowerLeg_L = 70};			
GlobalArmor[WorkingArmor]["Durability"] = 10;
GlobalArmor[WorkingArmor]["Location"] = "Shield";


WorkingArmor = "CarDoorShield";
GlobalArmor[WorkingArmor] = {};
GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};
GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};	
GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};
GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_R = 60, Hand_L = 79, ForeArm_L = 79, UpperArm_L = 79, Torso_Upper = 79, Torso_Lower = 79, Groin = 79, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 32};			
GlobalArmor[WorkingArmor]["Durability"] = 10;
GlobalArmor[WorkingArmor]["Location"] = "Shield";

WorkingArmor = "CarDoorShield1";
GlobalArmor[WorkingArmor] = {};
GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};
GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};	
GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};
GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_R = 60, Hand_L = 79, ForeArm_L = 79, UpperArm_L = 79, Torso_Upper = 79, Torso_Lower = 79, Groin = 79, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 32};			
GlobalArmor[WorkingArmor]["Durability"] = 10;
GlobalArmor[WorkingArmor]["Location"] = "Shield";

WorkingArmor = "CarDoorShield2";
GlobalArmor[WorkingArmor] = {};
GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};
GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};	
GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_R = 60, Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 30};
GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_R = 60, Hand_L = 79, ForeArm_L = 79, UpperArm_L = 79, Torso_Upper = 79, Torso_Lower = 79, Groin = 79, UpperLeg_L = 79, UpperLeg_R = 79, LowerLeg_L = 32};			
GlobalArmor[WorkingArmor]["Durability"] = 10;
GlobalArmor[WorkingArmor]["Location"] = "Shield";




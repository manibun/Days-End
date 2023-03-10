function SFItemHandler(item, param)
	local testItem ScriptManager.instance:getItem(item)

	if testItem then 
		testItem:DoParam(param)
	end
end
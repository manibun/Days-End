require "ISUI/ISContextMenu"

function ISContextMenu:removeOption(option)

	local newOptions = {};
	local idChange = 0;
	for i,v in ipairs(self.options) do
		if v == option then
			local idChange = 1;
		else
			v.id = v.id - idChange;
			newOptions[v.id] = v;
		end
	end
	
	self.options = newOptions;
    self.numOptions = self.numOptions - 1;
	self:calcHeight()
	self:setWidth(self:calcWidth())
	return menu;
end

function ISContextMenu:replaceOption(option, name, target, onSelect, param1, param2, param3, param4, param5, param6)

	local menu = {id=option.id, name=name, onSelect=onSelect, target=target, param1 = param1, param2 = param2, param3 = param3, param4 = param4, param5 = param5, param6 = param6, subOption = nil};

	local newOptions = {};
	for i,v in ipairs(self.options) do
		if v == option then
			newOptions[v.id] = menu;
		else
			newOptions[v.id] = v;
		end
	end
	
	self.options = newOptions;
	self:setWidth(self:calcWidth())
	return menu;
end
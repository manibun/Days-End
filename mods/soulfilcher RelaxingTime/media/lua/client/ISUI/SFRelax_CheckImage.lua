--***********************************************************
--**              	  ROBERT JOHNSON                       **
--***********************************************************

require "ISUI/ISPanelJoypad"

SFRelax_CheckImage = ISPanelJoypad:derive("SFRelax_CheckImage");
SFRelax_CheckImage.instance = nil;


--************************************************************************--
--** SFRelax_CheckImage:initialise
--**
--************************************************************************--

function SFRelax_CheckImage:initialise()
	ISPanelJoypad.initialise(self);
    --
    self.zoom = ISImage:new(0,0,self.width,self:getHeight(), self.tex);
    --self.zoom.parent = self;
    self.zoom.scaledWidth = self:getWidth();
    self.zoom.scaledHeight = self.zoom.scaledWidth * self.prop;
    self.zoom.prerender = SFRelax_CheckImage.onPrerenderMap
    self.zoom.onMouseDown = SFRelax_CheckImage.onMouseDownMap;
    self.zoom.onMouseUp = SFRelax_CheckImage.onMouseUpMap;
    self.zoom:initialise();
    self.zoom:instantiate();
    self:addChild(self.zoom);

    local buttonHgt = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight() + 6
    local buttonPadBottom = 4
    local buttonY = self.height - buttonPadBottom - buttonHgt

    if JoypadState.players[self.playerNum+1] then
    	self.ok = ISButton:new(10, buttonY, 100, buttonHgt, getText("UI_Close"), self, ISMap.onButtonClick);
    	self.ok.internal = "OK";
    	self.ok:initialise();
    	self.ok:instantiate();
    	self.ok.borderColor = {r=1, g=1, b=1, a=0.4};
    	self:addChild(self.ok);
    end

end

function SFRelax_CheckImage:destroy()
    if self.symbolList then
        self.symbolList:destroy();
    end
    if self.modal then
        self.modal:setVisible(false);
        self.modal:removeFromUIManager();
    end
    self:setVisible(false);
    self:removeFromUIManager();
    if JoypadState.players[self.playerNum+1] then
        getSpecificPlayer(self.playerNum):setBannedAttacking(false)
        setJoypadFocus(self.playerNum, nil)
    end
end

function SFRelax_CheckImage:isKeyConsumed(key)
    return key == Keyboard.KEY_ESCAPE;
end

function SFRelax_CheckImage:onKeyRelease(key)
    if key == Keyboard.KEY_ESCAPE then
        self.wrap:close();
    end
end

function SFRelax_CheckImage:onClick(button)
    if button.internal == "OK" then
        self.wrap:close();
        if JoypadState.players[self.playerNum+1] then
            setJoypadFocus(self.playerNum, nil)
        end
    end

    if button.internal == "SCALE" then
        self.zoom.scaledWidth = self.tex:getWidth();
        self.zoom.scaledHeight = self.tex:getHeight();
    end
end

function SFRelax_CheckImage:truePrerender()
    ISPanelJoypad.prerender(self);
	self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
	self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
--    self.zoom:setStencilRect(-self.zoom.x+1,-self.zoom.y+1,self.width-2, self.height-2);
end

function SFRelax_CheckImage:onMouseDownMap()
--    print("OnMouseDownMap");
    self.parent:onMouseDown();
end

function SFRelax_CheckImage:onMouseDown()
--    print("OnMouseDown");
    self.draggingStartingX = self:getMouseX();
    self.draggingStartingY = self:getMouseY();
    self.dragging = true;
end

function SFRelax_CheckImage:onMouseUpMap()
    self.parent:onMouseUp();
end

function SFRelax_CheckImage:setWrapVisible(bVisible)
    if self.javaObject then
        self.javaObject:setVisible(bVisible)
        if not bVisible then
            self.mapUI:destroy();
            SFRelax_CheckImage.instance = nil
        end
    end
end

function SFRelax_CheckImage:onMouseUp()
    -- get the current scale we are on
    local xScale = self.zoom.scaledWidth/self.tex:getWidth();
    local yScale = self.zoom.scaledHeight/self.tex:getHeight();
--    print("size", self.zoom.scaledWidth.."/"..self.zoom.scaledHeight, self.tex:getWidth().."/"..self.tex:getHeight())
    --meeh
--    print("OnMouseUpX", self.zoom:getX(), self.zoom:getMouseX(), xScale);
--    print("OnMouseUpY", self.zoom:getY(), self.zoom:getMouseY(), yScale);

    self:replaceMap();
    if self.modal then
        self.modal:setVisible(false);
        self.modal:removeFromUIManager();
    end
    self.dragging = false;
    if self:getMouseX() == self.draggingStartingX and self:getMouseY() == self.draggingStartingY then
--        print("symbolX/Y",math.floor((self.zoom:getMouseX())/xScale), math.floor((self.zoom:getMouseY())/yScale), self:getMouseX(), self:getMouseY())
        if self.addingNote then
            -- store the X/Y at a 1:1 scale
            self.noteX =  math.floor(self.zoom:getMouseX()/xScale);
            self.noteY =  math.floor((self.zoom:getMouseY()-(9*xScale))/yScale);
--            print("add note on ", self.noteX, self.noteY)
            self.modal = ISTextBoxMap:new(0, 0, 280, 180, getText("IGUI_Map_AddNote"), "", nil, SFRelax_CheckImage.onAddNote, self.playerNum, self);
            self.modal:initialise();
            self.modal.noEmpty = true;
            self.modal:addToUIManager();
            self.modal.entry:focus();
            self.addingNote = false;
            self.modal.maxChars = 45;
        end
        if self.removingElement then
            if self.mouseOverNote then
                self.modal = ISModalDialog:new(0,0, 250, 150, getText("IGUI_Map_ConfirmRemoveNote",self.mouseOverNote.text), true, self, SFRelax_CheckImage.onConfirmRemove, self.playerNum, self.mouseOverNote);
                self.modal:initialise()
                self.modal:addToUIManager()
                self.modal:setAlwaysOnTop(true)
                self.removingElement = false;
            end
            if self.mouseOverSymbol then
                self.modal = ISModalDialog:new(0,0, 250, 150, getText("IGUI_Map_ConfirmRemoveSymbol"), true, self, SFRelax_CheckImage.onConfirmRemoveSymbol, self.playerNum, self.mouseOverSymbol);
                self.modal:initialise()
                self.modal:addToUIManager()
                self.modal:setAlwaysOnTop(true)
                self.removingElement = false;
            end
        end
        if self.symbolList and self.symbolList.selectedSymbol then
            local newSymbol = {};
            -- store the X/Y at a 1:1 scale
            newSymbol.x =  math.floor((self.zoom:getMouseX()-(9*xScale))/xScale);
            newSymbol.y =  math.floor((self.zoom:getMouseY()-(9*xScale))/yScale);
            newSymbol.symbol = self.symbolList.selectedSymbol.tex;
            newSymbol.r = self.symbolList.currentColor:getR();
            newSymbol.g = self.symbolList.currentColor:getG();
            newSymbol.b = self.symbolList.currentColor:getB();
            print("add new symbol", newSymbol.x ..",".. newSymbol.y, newSymbol.r,newSymbol.g,newSymbol.b,newSymbol.symbol)
            table.insert(self.mapObj:getModData()["symbols"],newSymbol);
        end
--        if self.drawLine then
--            self.drawLineOriginalX = self:getMouseX();
--            self.drawLineOriginalY = self:getMouseY();
--            print("original x/y", self.drawLineOriginalX, self.drawLineOriginalY)
--        end
    end
    self.draggingStartingX = 0;
    self.draggingStartingY = 0;
end

function SFRelax_CheckImage:replaceMap()
    local marginX = self.width / 2
    local marginY = self.height / 2
    if self.zoom:getX() > marginX then
        self.zoom:setX(marginX);
    end
    if self.zoom:getY() > marginY then
        self.zoom:setY(marginY);
    end
    if self.zoom.x + self.zoom.scaledWidth < self:getWidth() - marginX then
--        self.zoom:setX(-self.zoomed * self.zoomingPerc);
        self.zoom:setX(self:getWidth() - marginX - self.zoom.scaledWidth);
    end
    if self.zoom.y + self.zoom.scaledHeight < self:getHeight() - marginY then
        self.zoom:setY(self:getHeight() - marginY - self.zoom.scaledHeight);
    end
end

function SFRelax_CheckImage:onMouseUpOutside()
--    print("OnMouseUpOutside");
    self.dragging = false;
    self:replaceMap();
end

function SFRelax_CheckImage:onMouseWheel(del)
    local xScale = self.zoom.scaledWidth/self.tex:getWidth();
	local yScale = self.zoom.scaledHeight/self.tex:getHeight();
    -- limit the zoom to x3
    if xScale > 3 and del < 0 then return true; end
    -- blaah
    local originalWidth = self.zoom.scaledWidth;
    local originalHeight = self.zoom.scaledHeight;

	local oldCenterX =  (self.width/2-self.zoom.javaObject:getX()-(9*xScale))/xScale;
	local oldCenterY =  (self.height/2-self.zoom.javaObject:getY()-(9*yScale))/yScale;

    self.zoom.scaledWidth = self.zoom.scaledWidth + del * -self.zoomingPerc;
    self.zoom.scaledHeight = self.zoom.scaledWidth * self.prop;
    originalWidth = self.zoom.scaledWidth - originalWidth;
    originalHeight = self.zoom.scaledHeight - originalHeight;
    local xScale = self.zoom.scaledWidth/self.tex:getWidth();
	local yScale = self.zoom.scaledHeight/self.tex:getHeight();
    originalWidth = originalWidth / 2;
    originalHeight = originalHeight / 2;

	local newCenterXLocal = (self.width+(-2*oldCenterX-18)*xScale)/2;
	local newCenterYLocal = (self.height+(-2*oldCenterY-18)*yScale)/2;

    local doMove = true;
    --    print("OnMouseWheel", self.zoom:getMouseX(), self.width);
    if self.zoom.scaledWidth < self.width then
        self.zoom.scaledWidth = self.width;
        self.zoom.scaledHeight = self.zoom.scaledWidth * self.prop;
        doMove = false;
    end
    if self.zoom.scaledHeight < self.height then
        self.zoom.scaledHeight = self.height;
        doMove = false;
    end
    if doMove then
        --local movingX = (del*-self.zoomingPerc)/2;
        self.zoom:setX(newCenterXLocal);
        self.zoom:setY(newCenterYLocal);
	else
		self.zoom:setX(0)
		self.zoom:setY(0)
    end
    self:replaceMap();
    --    print("OnMouseWheel2", self.zoom:getX(), self.zoom:getY())
    return true;
end

function SFRelax_CheckImage:onMouseMove(dx, dy)
    if self.dragging then
        self.zoom:setX(self.zoom:getX() + dx);
        self.zoom:setY(self.zoom:getY() + dy);
        self:replaceMap();
    end
end

function SFRelax_CheckImage:onMouseMoveOutside(dx, dy)
    if self.dragging then
        self.zoom:setX(self.zoom:getX() + dx);
        self.zoom:setY(self.zoom:getY() + dy);
        self:replaceMap();
    end
end

--************************************************************************--
--** SFRelax_CheckImage:render
--**
--************************************************************************--
function SFRelax_CheckImage:noRender()

end

function SFRelax_CheckImage:onPrerenderMap()
    self.parent:setStencilRect(0, 0, self.parent.width, self.parent.height)
    ISImage.prerender(self)
    self.parent:clearStencilRect()
    self.parent.wrap:repaintStencilRect(0, 0, self.parent.wrap.width, self.parent.wrap.height)
    if JoypadState.players[self.parent.playerNum+1] then
        local rectY = self.parent.ok:getY() - 4
        self.parent:drawRectStatic(0, rectY, self.width, self.height - rectY, 0.75, 0, 0, 0)
    end
end

function SFRelax_CheckImage:trueRender()
--    ISPanelJoypad.render(self);
--    print("render map")
--    self.zoom:clearStencilRect();

    if not self.wrap.isCollapsed then

	self:drawTexture(self.cross, self.width/2-12, self.height/2-12, 1, 1,1,1);
        self:clearStencilRect()
    end

    self:renderMouseIcons();
end

function SFRelax_CheckImage:prerenderWrap()
    ISCollapsableWindow.prerender(self);
    self.closeButton:prerender();
    self.collapseButton:prerender();
    self.pinButton:prerender();
    self.infoButton:prerender();
end

function SFRelax_CheckImage:renderWrap()
--    print("render col")
    ISCollapsableWindow.render(self);
    self.mapUI:trueRender();
    self.closeButton:render();
    self.collapseButton:render();
    self.pinButton:render();
    self.infoButton:render();
    -- Moved this from update() so it is called more often
	self.mapUI:updateJoypad();
end

function SFRelax_CheckImage:closeWrap()
	self:setVisible(false)
	self:removeFromUIManager()
end

function SFRelax_CheckImage:checkElementsForRemoveFromJoy()
        self.mouseOverNote = nil;
        self.mouseOverSymbol = nil;
        local xScale = self.zoom.scaledWidth/self.tex:getWidth();
        local yScale = self.zoom.scaledHeight/self.tex:getHeight();
		local crossX =  math.floor((self.width/2-self.zoom.javaObject:getX()-(0*xScale))/xScale);
		local crossY =  math.floor((self.height/2-self.zoom.javaObject:getY()-(0*yScale))/yScale);

end

function SFRelax_CheckImage:checkElementsForRemove()
        self.mouseOverNote = nil;
        self.mouseOverSymbol = nil;
        local xScale = self.zoom.scaledWidth/self.tex:getWidth();
        local yScale = self.zoom.scaledHeight/self.tex:getHeight();
end

function SFRelax_CheckImage:renderMouseIcons()
	if (self.playerNum ~= 0) or (JoypadState.players[self.playerNum+1] and not wasMouseActiveMoreRecentlyThanJoypad()) then return end

    if self:getMouseX() < 0 or self:getMouseX() > self:getWidth() - 1 or self:getMouseY() < 0 or self:getMouseY() > self:getHeight() - 1 then
       return;
    end
    if self.addingNote then
        self:drawTexture(self.textCursor, self:getMouseX() + 15, self:getMouseY(), 1,1,1,1);
    end
    if self.removingElement then
        self:checkElementsForRemove()
    end

    if self.symbolList and self.symbolList.selectedSymbol then
        local xScale = self.zoom.scaledWidth/self.tex:getWidth();
        local yScale = self.zoom.scaledHeight/self.tex:getHeight();
        self:drawTextureScaled(self.symbolList.selectedSymbol.image,self:getMouseX()-(9*xScale), self:getMouseY()-(9*yScale), self.symbolList.selectedSymbol.image:getWidth() * xScale, self.symbolList.selectedSymbol.image:getHeight() * yScale,1, self.symbolList.selectedSymbol.textureColor.r,self.symbolList.selectedSymbol.textureColor.b,self.symbolList.selectedSymbol.textureColor.g);
    end

--    if self.drawLineOriginalX > -1 and self.drawLineOriginalY > -1 then
--        local xScale = self.zoom.scaledWidth/self.tex:getWidth();
--        local yScale = self.zoom.scaledHeight/self.tex:getHeight();
--        local originalX = self.drawLineOriginalX;
--        local originalY = self.drawLineOriginalY;
--        self:drawLine2(originalX,originalY,originalX + self:getMouseX(),originalY + self:getMouseY(),1,1,1,1);
--    end
end

function SFRelax_CheckImage:update()
    ISPanelJoypad.update(self);
    if not self.character:getInventory():contains(self.mapObj, true) then self.wrap:setVisible(false) end
    if self.symbolList then -- move the symbol list when moving the map
        self.symbolList:setX(self.wrap.x + self.wrap.width)
        self.symbolList:setY(self.wrap.y)
--        print(self.wrap.isCollapsed)
        self.symbolList:setVisible(not self.wrap.isCollapsed);
    end
    self:updateButtons();
end

function SFRelax_CheckImage:updateJoypad()
	if self.getJoypadFocus then
		self.getJoypadFocus = false;
		if JoypadState.players[self.playerNum+1] then
			setJoypadFocus(self.playerNum, self)
		end
	end

	self.updateMS = self.updateMS or getTimestampMs()
	local dt = getTimestampMs() - self.updateMS
	self.updateMS = getTimestampMs()

	if self.joyfocus == nil then return end

	self.JPZoomInc = 0;
	if isJoypadPressed(self.joyfocus.id, Joypad.LBumper) then
		self.JPZoomInc = dt / 1000 * 10
	end
	if isJoypadPressed(self.joyfocus.id, Joypad.RBumper) then
		self.JPZoomInc = -dt / 1000 * 10
	end
	if self.JPZoomInc ~= 0 then
		self:onMouseWheel(self.JPZoomInc)
	end

	local x = getControllerPovX(self.joyfocus.id);
	local y = getControllerPovY(self.joyfocus.id);
	if x~=0 or y ~= 0 then
		local scale = self.zoom.scaledWidth / self.tex:getWidth()
		local scrollDelta = -dt / 1000 * self.tex:getWidth() * 0.25 / scale
		self.zoom:setX(self.zoom:getX() + scrollDelta * x);
		self.zoom:setY(self.zoom:getY() + scrollDelta * y);
		self:replaceMap();
	end
end

function SFRelax_CheckImage:updateButtons()

end

function SFRelax_CheckImage:onGainJoypadFocus(joypadData)
	ISPanelJoypad.onGainJoypadFocus(self, joypadData)
	self.ok:setJoypadButton(Joypad.Texture.BButton)
end

function SFRelax_CheckImage:onJoypadDown(button)
	ISPanelJoypad.onJoypadDown(self, button)
	if button == Joypad.BButton then
		self.ok:forceClick()
	end
end

--************************************************************************--
--** SFRelax_CheckImage:new
--**
--************************************************************************--
function SFRelax_CheckImage:new(x, y, width, height, map, player)
    --if SFRelax_CheckImage.instance then
        --SFRelax_CheckImage.instance.closeWrap();
    --end
	local o = {}
	o = ISPanelJoypad:new(x, y, width, height);
	setmetatable(o, self)
    self.__index = self
	o.type = map:getType();
	o.texPath = "media/textures/Inspect/" .. o.type .. ".png";
	o.tex = getTexture(o.texPath);
	if map:getConditionMax() > 1 then
		if map:getItemCapacity() == -1.0 then
			local randomize = ZombRand(map:getConditionMax() + 1)
			local breakTexture = luautils.split(o.texPath, ".")[1]
			local newTexture = breakTexture .. "_" .. randomize .. ".png";
			map:setItemCapacity(randomize);
			o.tex = getTexture(newTexture);
		else
			local variation = map:getItemCapacity()
			local breakTexture = luautils.split(o.texPath, ".")[1]
			local newTexture = breakTexture .. "_" .. variation .. ".png";
			o.tex = getTexture(newTexture);
		end
	else
		o.tex = getTexture(o.texPath);
	end
	o.prop = o.tex:getHeight() / o.tex:getWidth();
	width = o.tex:getWidth();
	height = o.tex:getHeight()
	if width > 800 then
        width = 800
    end
    if height > getCore():getScreenHeight() - 70 then
        height = getCore():getScreenHeight() - 70;
    end

--    print("final img", width, height);
    o.character = getSpecificPlayer(player);
    o.playerNum = player;
    o.x = (getCore():getScreenWidth() - width) / 2;
    o.y = (getCore():getScreenHeight() - height) / 2;
    o:setY(o.y)
    o:setX(o.x)
	o.width = width;
	o.height = height;
	o.anchorLeft = true;
	o.anchorRight = true;
	o.anchorTop = true;
	o.anchorBottom = true;
    o.zooming = false;
    o.dragging = false;
    o.mapObj = map;
    o.zoomX = 0;
    o.zoomY = 0;
    o.zoomingPerc = 100;
    o.addingNote = false;
    o.removingElement = false;
    o.drawLine = true;
    o.drawLineOriginalX = -1;
    o.drawLineOriginalY = -1;
    o.draggingStartingX = 0;
    o.draggingStartingY = 0;
	o.JPZoomInc = 0.0;
	o.getJoypadFocus = false
    SFRelax_CheckImage.instance = o;
    return o;
end
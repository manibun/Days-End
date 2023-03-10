-- These are the default options.
if not ItemTweaker then  ItemTweaker = {} end
if not ItemTweaker.OPTIONS then ItemTweaker.OPTIONS = {} end
if not ItemTweaker.OPTIONS.Verbose then ItemTweaker.OPTIONS.Verbose = false end


-- Connecting the options to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(ItemTweaker.OPTIONS, "ItemTweakerAPI", "Item Tweaker API B41")
  local optVerbose = settings:getData("Verbose");
  function optVerbose:OnApplyInGame(val)
  end  
end



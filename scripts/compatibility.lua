local compatibility = {}

function compatibility.aai_industry()
  -- Disable AAI industry crash site
  if script.active_mods["aai-industry"] then
    remote.add_interface("kr-to-aai-industry", {
      allow_aai_crash_sequence = function(_)
        return { allow = false, weight = 1 }
      end,
    })
  end
end

function compatibility.disco_science()
  if
    game.active_mods["DiscoScience"]
    and remote.interfaces["DiscoScience"]
    and remote.interfaces["DiscoScience"]["setIngredientColor"]
  then
    remote.call("DiscoScience", "setIngredientColor", "basic-tech-card", { r = 0.823, g = 0.411, b = 0.117 })
  end
end

function compatibility.nuclear_fuel()
  if game.active_mods["Nuclear Fuel"] then
    remote.call("kr-radioactivity", "add_item", "breeder-fuel-cell")
    remote.call("kr-radioactivity", "add_item", "plutonium")
    remote.call("kr-radioactivity", "add_item", "used-up-breeder-fuel-cell")
  end
end

function compatibility.atomic_overhaul()       --Added This
  if game.active_mods["Atomic_Overhaul"] then
    remote.call("kr-radioactivity", "add_item", "plutonium")
    remote.call("kr-radioactivity", "add_item", "MOX")
    remote.call("kr-radioactivity", "add_item", "thorium")
    
    remote.call("kr-radioactivity", "add_item", "uranium-fuel-rod")
    remote.call("kr-radioactivity", "add_item", "plutonium-fuel-rod")
    remote.call("kr-radioactivity", "add_item", "MOX-fuel-rod")
    remote.call("kr-radioactivity", "add_item", "thorium-fuel-rod")
        
    remote.call("kr-radioactivity", "add_item", "non-moderated-fuel-cell")
    remote.call("kr-radioactivity", "add_item", "plutonium-fuel-cell")
    remote.call("kr-radioactivity", "add_item", "MOX-fuel-cell")
    remote.call("kr-radioactivity", "add_item", "thorium-fuel-cell")
    
    remote.call("kr-radioactivity", "add_item", "non-moderated-depleted-cell")
    remote.call("kr-radioactivity", "add_item", "plutonium-depleted-cell")
    remote.call("kr-radioactivity", "add_item", "MOX-depleted-cell")
    remote.call("kr-radioactivity", "add_item", "thorium-depleted-cell")
        
    remote.call("kr-radioactivity", "add_item", "nuclear-waste")
    remote.call("kr-radioactivity", "add_item", "waste-solution-barrel")   
  end
end

function compatibility.schall_uranium()
  if script.active_mods["SchallUraniumProcessing"] then
    remote.call("kr-radioactivity", "add_item", "uranium-concentrate")
    remote.call("kr-radioactivity", "add_item", "uranium-low-enriched")
  end
end

function compatibility.should_build_pump()
  if game.entity_prototypes["kr-electric-offshore-pump"] then
    return true
  end
  return false
end

return compatibility

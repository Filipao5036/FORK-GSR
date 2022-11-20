ARC9.CSGO = {}

ARC9.CSGO.BlendEmpty = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    local delta = wep:GetSightDelta()
    local smooth = math.cos(delta * (math.pi / 2))
    if wep:Clip1() == 0 --and !wep:GetReloading()-- This doesn't make it look well when reload due to the snappy instant pose set.
	then
        vm:SetPoseParameter( "empty", Lerp(smooth, 0, 1) )
    else
        vm:SetPoseParameter( "empty", Lerp(smooth, 0, 0) )
    end
end

ARC9.CSGO.BlendEmptyElite = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    if wep:Clip1() == 1 then
        vm:SetPoseParameter("empty", 1)
    elseif wep:Clip1() == 0 then
        vm:SetPoseParameter("empty", 2)
	else
        vm:SetPoseParameter("empty", 0)
	end
end

ARC9.CSGO.BlendEmptyEliteSingle = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    if wep:Clip1() == 0 then
        vm:SetPoseParameter("empty", 2)
	else
        vm:SetPoseParameter("empty", 0)
	end
end

ARC9.CSGO.BlendCylinder = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    vm:SetPoseParameter("cyl",8-wep:Clip1())
end

ARC9.CSGO.BlendSights = function(wep)
    local vm = wep:GetOwner():GetViewModel()
    local delta = wep:GetSightDelta()
    local coolilove = math.cos(delta * (math.pi / 2))
    vm:SetPoseParameter( "sights", Lerp(coolilove, 0, 1) ) -- thanks fesiug
end

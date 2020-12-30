WVoice.Compatibilities = {}

--[[ COMPATIBILITY DEFAULT TABLE

-- ADDON NAME by CREATOR : LINK TO BUY YOUR ADDON
WVoice.Compatibilities["YOUR GLOBAL TABLE"] = function(listener, talker)

    SIMPLE CONDITION
    return (condition)

    ADVANCED CONDITION
    if CONDITION then
        if CONDITION2 then
            return true
        end
    end

end
]]--

-- GDrugz Phone by SlownLS : Private addon
WVoice.Compatibilities["GDrugz.Phone"] = function(listener, talker)
    return (GDrugz.Phone:InCallWith(listener, talker) and GDrugz.Phone:InCallWith(talker, listener))
end

-- DRadio by Dan : https://www.gmodstore.com/market/view/5478
WVoice.Compatibilities["DRadio"] = function(listener, talker)
    if (talker.frequency ~= 0) and (listener.frequency == talker.frequency) then
        local activeWeapon = talker:GetActiveWeapon()
        if IsValid(activeWeapon) and activeWeapon:GetClass() == "dradio" then
            return true
        end
    end
end

-- RPhone by Dan : https://www.gmodstore.com/market/view/174
WVoice.Compatibilities["rPhone"] = function(listener, talker)
    return (rPhone.GetLibrary("phone").IsInCall(talker))
end

-- SlownLS - Chat by SlownLS : https://www.gmodstore.com/market/view/6497
WVoice.Compatibilities["SlownLS.Chat"] = function(listener, talker)
    return (SlownLS.Chat.CallVideos[talker.SlownLS_Chat_CurrentCall])
end

-- Brick's Enhanced SWEPs by Brick : https://www.gmodstore.com/market/view/6733
WVoice.Compatibilities["BES"] = function(listener, talker)
    local talkerSwep = talker:GetActiveWeapon()

    if IsValid(talkerSwep) and talkerSwep:GetClass() == "dsr_megaphone" and talkerSwep:GetTurnedOn() then
        if listener:GetPos():DistToSqr(talker:GetPos()) < 100000 then 
            return true, true 
        end
    end
end

WVoice.Compatibilities["SPhone"] = function(listener, talker)
     if IsValid(listener.call_target) && IsValid(talker.call_target) then
        
        if listener.call_target == talker && talker.call_target == listener then

            if talker:Alive() && listener:Alive() then
                if talker:HasWeapon("sphone") then
                    return true, false
                end
                if listener:HasWeapon("sphone") then
                    return true, false
                end
            end

        end
    end
end

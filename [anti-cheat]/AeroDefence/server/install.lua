function UninstallAuto(source)
    if source == 0 then
        count = 0
        skip = 0
        local filetodelete = PS.AntiInjectFileName
        for resources = 0, GetNumResources() - 1 do
            local _resname = GetResourceByFindIndex(resources)
            resourcefile = LoadResourceFile(_resname, "__resource.lua")
            resourcefile2 = LoadResourceFile(_resname, "fxmanifest.lua")
            if resourcefile then
                deletefile = LoadResourceFile(_resname, filetodelete)
                if deletefile then

                    local resource = GetResourcePath(_resname).."/__resource.lua"
                    local f = io.open(resource, "r")
                    local content = f:read("*all")
                    f:close()
                    content = string.gsub(content, "\n\nclient_script '" .. filetodelete .. "'", "")
                    local f = io.open(resource, "w")
                    f:write(content)
                    f:close()

                    _toremove = GetResourcePath(_resname).."/"..filetodelete
                    Wait(100)
                    os.remove(_toremove)
                    AntiDebug(PS.AntiInjectM.UnInstalled.."".._resname.."^7")
                    count = count + 1
                else
                    skip = skip + 1
                    AntiDebug(PS.AntiInjectM.SkippedRes.."" .._resname.." "..PS.AntiInjectM.Doesnt.." ^7")
                end
            elseif resourcefile2 then
                deletefile = LoadResourceFile(_resname, filetodelete)
                if deletefile then

                    local resource = GetResourcePath(_resname).."/fxmanifest.lua"
                    local f = io.open(resource, "r")
                    local content = f:read("*all")
                    f:close()
                    content = string.gsub(content, "\n\nclient_script '" .. filetodelete .. "'", "")
                    local f = io.open(resource, "w")
                    f:write(content)
                    f:close()

                    _toremove = GetResourcePath(_resname).."/"..filetodelete
                    Wait(100)
                    os.remove(_toremove)
                    AntiDebug(PS.AntiInjectM.UnInstalled.."".._resname.."^7")
                    count = count + 1
                else
                    skip = skip + 1
                    AntiDebug(PS.AntiInjectM.SkippedRes.."" .._resname.." "..PS.AntiInjectM.Doesnt.." ^7")
                end
            else
                skip = skip + 1
                AntiDebug(PS.AntiInjectM.SkippedRes.."".._resname)
            end
        end
        StartupPrin(PS.AntiInjectM.Uninstallationfinished1..""..count..""..PS.AntiInjectM.Installationfinished2..""..skip..""..PS.AntiInjectM.Installationfinished3.."^7")
    end
end

function InstallAuto(source)
    count = 0
    skip = 0
    if source == 0 then
        local randomtextfile = PS.AntiInjectFileName
        _antiinjection = LoadResourceFile(GetCurrentResourceName(), "AntiInjection.lua")
        for resources = 0, GetNumResources() - 1 do
            local _resname = GetResourceByFindIndex(resources)
            _resourcemanifest = LoadResourceFile(_resname, "__resource.lua")
            _resourcemanifest2 = LoadResourceFile(_resname, "fxmanifest.lua")
            if _resourcemanifest then
                if not LoadResourceFile(_resname, PS.AntiInjectFileName) then
                    Wait(100)
                    _toadd = _resourcemanifest .. "\n\nclient_script '" .. randomtextfile .. "'"
                    SaveResourceFile(_resname, randomtextfile, _antiinjection, -1)
                    SaveResourceFile(_resname, "__resource.lua", _toadd, -1)
                    AntiDebug(PS.AntiInjectM.Installed.."".._resname.."^7")
                    count = count + 1
                else
                    skip = skip + 1
                    AntiDebug(PS.AntiInjectM.SkippedRes.."" .._resname.." "..PS.AntiInjectM.AlreadyExist.."^7")
                end
            elseif _resourcemanifest2 and not LoadResourceFile(_resname, PS.AntiInjectFileName) then
                if not LoadResourceFile(_resname, PS.AntiInjectFileName) then
                    Wait(100)
                    _toadd = _resourcemanifest2 .. "\n\nclient_script '" .. randomtextfile .. "'"
                    SaveResourceFile(_resname, randomtextfile, _antiinjection, -1)
                    SaveResourceFile(_resname, "fxmanifest.lua", _toadd, -1)
                    AntiDebug(PS.AntiInjectM.Installed.."".._resname.."^7")
                    count = count + 1
                else
                    skip = skip + 1
                    AntiDebug(PS.AntiInjectM.SkippedRes.."" .._resname.." "..PS.AntiInjectM.AlreadyExist.."^7")
                end
            else
                skip = skip + 1
                AntiDebug(PS.AntiInjectM.SkippedRes.."".._resname.."^7")
            end
        end
        StartupPrin(PS.AntiInjectM.Installationfinished1..""..count..""..PS.AntiInjectM.Installationfinished2..""..skip..""..PS.AntiInjectM.Installationfinished3.."^7")
    end
end
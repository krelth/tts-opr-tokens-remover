function RemoveTokens(_, value, _)
    local customAssetUrls = {
        WHITEFLAG = "http://cloud-3.steamusercontent.com/ugc/1655598612928768363/33604B6ED7735A82BEC1B5A18BF58BB8C0944EFF/",
        THREEWOUNDS =  "http://cloud-3.steamusercontent.com/ugc/1655598612928768268/31357AD1AD70705DFDA14E4054ABBA28F8D1FB1A/",
        ONEWOUND = "http://cloud-3.steamusercontent.com/ugc/1655598612928768179/9C6945F68C1D0BA5E5658EC547C0BCB0A67BD1AA/",
        ACTIVATION = "http://cloud-3.steamusercontent.com/ugc/1655598612928764388/7DDBA7DF9719A059CB438972B8F389A90112FEB5/",
        EXCLAMATION = "http://cloud-3.steamusercontent.com/ugc/1655598612928765294/55CE1B2CF4EA1E15F7F9522ECCC5264DD09449D9/",
        STUN =  "http://cloud-3.steamusercontent.com/ugc/1655598612928768639/EBF4A7B8A6C170D60DE5CA6ACC613932B72732B7/",	
        WARNING =  "http://cloud-3.steamusercontent.com/ugc/1655598612928768541/0CF8C4428F8E39C62173C29C08756A937D5114F8/",
        MAGIC = "http://cloud-3.steamusercontent.com/ugc/1655598612928768450/8ED70D4AD9099C32E09BA6E79CCED3174A1A55DE/",
    }
    local customTileUrls = {
        WHITEFLAG = { "http://cloud-3.steamusercontent.com/ugc/769475743880285576/39306D971067226F924B3AD2350DFEF0068BC68E/", },
        THREEWOUNDS = {},
        ONEWOUND = { "http://cloud-3.steamusercontent.com/ugc/769475743880286951/2EAAEFFA7EF3A517AEA3AA41BAF15552D3F57DD7/", },
        EXCLAMATION = { "http://cloud-3.steamusercontent.com/ugc/769475743880284888/29442B1CFFFCB58CD3C4C765D2FD336D4681F225/", },
        WARNING =  { "http://cloud-3.steamusercontent.com/ugc/769475743880286247/3925AACC96856C33FED35A5494EC7F9F114D3232/", },
        ACTIVATION = {
            "http://cloud-3.steamusercontent.com/ugc/1746806070165747684/5F035359990D162869350BE1BE5FE556C18AB057/",
            "http://cloud-3.steamusercontent.com/ugc/769475743880281991/E1CE7FF62189595A38346C85DAD306DC7CEE778B/",
        },
        MAGIC = { "http://cloud-3.steamusercontent.com/ugc/769475743880282826/DABBBD32FDAA5C018876227B9A6F64DBC93320C7/", },
        STUN = { "http://cloud-3.steamusercontent.com/ugc/769475743880283545/08DCFA3650DB444B15CED15FA41900334C59619A/", }
    }
    for _, object in pairs(getObjects()) do
        local data = object.getCustomObject()
        if data ~= nil then
            if data["assetbundle"] == customAssetUrls[value] then
                destroyObject(object)
            else
                for _, matchingTileUrl in pairs(customTileUrls[value]) do
                    if data["image"] == matchingTileUrl then
                        destroyObject(object)
                    end
                end
            end
        end
    end
end

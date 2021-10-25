local i = string.byte;
local f = string.char;
local c = string.sub;
local s = table.concat;
local A = math.ldexp;
local F = getfenv or function() return _ENV end;
local B = setmetatable;
local r = select;
local t = unpack or table.unpack;
local h = tonumber;
local function G(t)
    local e, n, o = "", "", {}
    local d = 256;
    local a = {}
    for l = 0, d - 1 do a[l] = f(l) end
    local l = 1;
    local function i()
        local e = h(c(t, l, l), 36)
        l = l + 1;
        local n = h(c(t, l, l + e - 1), 36)
        l = l + e;
        return n
    end
    e = f(i())
    o[1] = e;
    while l < #t do
        local l = i()
        if a[l] then
            n = a[l]
        else
            n = e .. c(e, 1, 1)
        end
        a[d] = e .. c(n, 1, 1)
        o[#o + 1], e, d = n, n, d + 1
    end
    return table.concat(o)
end
local d = G(
              '23A23H23A27623922S27623A1Y141V1H1H1J1421127H1027H21F27L1O1223923D27A27G1O27H1N121J1I215121P1T1J1O23922Z27A1O1V17131J2811N28F27P28E1Q28E1L1U1J27X27H2151G1I1627R27A2101J1H1V1527Y1421H1P1R1R1N1O1I23923I27A22L29E29F29E23922U28W28Y29029221K1J1227N28527Q29J2761X1N27L2111U1V1J1Q1I22421D29P21J21R28V27621J1I1I29R27P21Q2981I28K1423923727A161N1V141523923827A21521D23923E27A21H1428O27Y1Y1U2B31N1I2AN27A2BC2BC23B27A21F29C23A25D2BI2372BF27727S27627U27W27Y2802822841O2BC2342BG27A25L27A21J2BI2602BI21M23I23Q23T2C627621R29U26029U1Z2322762602CJ23A2BH2CK2BI23B2BN23A2AZ2B12B82B52B728O1I2CS23A2BB2CT27927627C27E27G27I27K27M27O29T27A1G131U1S1V1C1P1G1C1G21U1C21V2DN1N23923527A1R285131Q2E023927527622E1G1P1329922E1V1O22422E23922O27A2A61221H13142B327P28X152E8141L1J21K1N2DY2BC23G27A21E2C923T26X2BI21I22U2CA2CG27621M2322F92CM21R27A26027A1Y22E2F922E27621222M2F922M27621323I2FN2CC23A21R23221223A2CL27621F22E29J2602FN2CN2C52BI2B027621N27A26927A21K23I29J25Y29C26U21D27A2662762GO23A2CA2GR23A26U2CO2BJ2BI21N2BI26O2H127A26E27A2C82CA25Z2BI21O23Y22X23A25F23Y23T1921F27A25T27A21N22U29J26R29U2GZ2BK2BD2HW23J2C327A2712HO2GB2CD2FH2HZ2G72C32CF29U2GF2CK2HZ2IC2AB2I52G42I32762DW2772AV2762AX2CT2BC23922R27T1Q1P1K1N1Q22E101N1422E1529P22E28222E28A1Q2AM2AO2AQ2AS23923627A29W1V122IM27A27225H21I2BC2G923A2F22HA2BI21C2FV23A26D2GN2GP2762GW2GO2FL23T2662FN26U21J27A25E27A21C2HQ23A26329J2GO2F32662GN21C22E21Y2JY2K821D2FD2K62CJ2K92GG2H82K526P2G92FG2762KC2AB2322HR2CM21I2FQ23T25Z2FS23A2H22762692BI21J22U2JP2FA23A21D2262GV2262GX21723A2G125Q27A2142LD26S2FS2K42GV2K82LT2LG27A21B2LD25K2LD1J2KB27A2172L623A26R2CM21D2KK2GN2KA2FN26V2EI26623T2K62MR1921I21Y2HA2KP23A21M2LP23T26P2LR23A2LJ2HR29U2GP2MS2GR2HJ2HU2BI22H2C027626B2ID2G22H82F32FX21Q2KT2G323A21Q2F82CB29U2L22NL2761Z2G92G82FO2K52O223A2162LA2602LD21A2GU23T25X27A2132MG2682CM2122MX2CB2MZ2162N22602N52132KF2LM21221I2F92JP2O62OP2N521823A2JP25F2GS2HL2762HN2IH2P82BI21F2CM25T2CM2G52P82G92OG2L72FT27A26O2LX2GK2HG2GN21F2LD25T2OA21Q2HA21Q2762MC27625K2M72LK2G22N92PX2K62PZ26U122122HA2G123A131M25I23A25Q1M276162QD2LB2QF1822U2KP25F2KI21F2MZ25T2MZ21F2OB23A25T2R221F2QM2R32R71721A24623A26W2R21327A26H2DX2RH2M723A2MO2EI26M2NB2RP1921A21A2HA2R21G2322FN25F2KV2QX2P82R02BI25T2BI21B2KF2HS2PA2H0276');
local o = bit and bit.bxor or function(l, e)
    local n, o = 1, 0
    while l > 0 and e > 0 do
        local d, c = l % 2, e % 2
        if d ~= c then o = o + n end
        l, e, n = (l - d) / 2, (e - c) / 2, n * 2
    end
    if l < e then l = e end
    while l > 0 do
        local e = l % 2
        if e > 0 then o = o + n end
        l, n = (l - e) / 2, n * 2
    end
    return o
end
local function l(e, l, n)
    if n then
        local l = (e / 2 ^ (l - 1)) % 2 ^ ((n - 1) - (l - 1) + 1);
        return l - l % 1;
    else
        local l = 2 ^ (l - 1);
        return (e % (l + l) >= l) and 1 or 0;
    end
end
local e = 1;
local function n()
    local c, n, l, d = i(d, e, e + 3);
    c = o(c, 118)
    n = o(n, 118)
    l = o(l, 118)
    d = o(d, 118)
    e = e + 4;
    return (d * 16777216) + (l * 65536) + (n * 256) + c;
end
local function a()
    local l = o(i(d, e, e), 118);
    e = e + 1;
    return l;
end
local function G()
    local e = n();
    local o = n();
    local c = 1;
    local n = (l(o, 1, 20) * (2 ^ 32)) + e;
    local e = l(o, 21, 31);
    local l = ((-1) ^ l(o, 32));
    if (e == 0) then
        if (n == 0) then
            return l * 0;
        else
            e = 1;
            c = 0;
        end
    elseif (e == 2047) then
        return (n == 0) and (l * (1 / 0)) or (l * (0 / 0));
    end
    return A(l, e - 1023) * (c + (n / (2 ^ 52)));
end
local h = n;
local function A(l)
    local n;
    if (not l) then
        l = h();
        if (l == 0) then return ''; end
    end
    n = c(d, e, e + l - 1);
    e = e + l;
    local e = {}
    for l = 1, #n do e[l] = f(o(i(c(n, l, l)), 118)) end
    return s(e);
end
local e = n;
local function h(...) return {...}, r('#', ...) end
local function u()
    local f = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };
    local t = {0, 0, 0, 0, 0};
    local e = {};
    local d = {f, nil, t, nil, e};
    d[4] = a();
    local e = n()
    local c = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    for n = 1, e do
        local e = a();
        local l;
        if (e == 1) then
            l = (a() ~= 0);
        elseif (e == 2) then
            l = G();
        elseif (e == 3) then
            l = A();
        end
        c[n] = l;
    end
    d[2] = c
    for l = 1, n() do t[l - 1] = u(); end
    for d = 1, n() do
        local c = o(n(), 69);
        local n = o(n(), 174);
        local o = l(c, 1, 2);
        local e = l(n, 1, 11);
        local e = {e, l(c, 3, 11), nil, nil, n};
        if (o == 0) then
            e[3] = l(c, 12, 20);
            e[5] = l(c, 21, 29);
        elseif (o == 1) then
            e[3] = l(n, 12, 33);
        elseif (o == 2) then
            e[3] = l(n, 12, 32) - 1048575;
        elseif (o == 3) then
            e[3] = l(n, 12, 32) - 1048575;
            e[5] = l(c, 21, 29);
        end
        f[d] = e;
    end
    return d;
end
local function s(l, i, f)
    local o = l[1];
    local e = l[2];
    local n = l[3];
    local l = l[4];
    return function(...)
        local c = o;
        local a = e;
        local G = n;
        local o = l;
        local l = h
        local e = 1;
        local d = -1;
        local A = {};
        local h = {...};
        local C = r('#', ...) - 1;
        local r = {};
        local n = {};
        for l = 0, C do
            if (l >= o) then
                A[l - o] = h[l + 1];
            else
                n[l] = h[l + 1];
            end
        end
        local C = C - o + 1
        local l;
        local o;
        while true do
            l = c[e];
            o = l[1];
            if o <= 30 then
                if o <= 14 then
                    if o <= 6 then
                        if o <= 2 then
                            if o <= 0 then
                                local o = l[2];
                                local c = {};
                                local e = 0;
                                local a = o + l[3] - 1;
                                for l = o + 1, a do
                                    e = e + 1;
                                    c[e] = n[l];
                                end
                                local c = {n[o](t(c, 1, a - o))};
                                local l = o + l[5] - 2;
                                e = 0;
                                for l = o, l do
                                    e = e + 1;
                                    n[l] = c[e];
                                end
                                d = l;
                            elseif o > 1 then
                                local l = l[2];
                                local c = {};
                                local e = 0;
                                local o = d;
                                for l = l + 1, o do
                                    e = e + 1;
                                    c[e] = n[l];
                                end
                                n[l](t(c, 1, o - l));
                                d = l;
                            else
                                local l = l[2];
                                local e = {};
                                local o = d;
                                for l = l + 1, o do
                                    e[#e + 1] = n[l];
                                end
                                do
                                    return n[l](t(e, 1, o - l))
                                end
                            end
                        elseif o <= 4 then
                            if o > 3 then
                                local o = l[3];
                                local e = n[o]
                                for l = o + 1, l[5] do
                                    e = e .. n[l];
                                end
                                n[l[2]] = e;
                            else
                                if (n[l[2]] ~= n[l[5]]) then
                                    e = e + 1;
                                else
                                    e = e + l[3];
                                end
                            end
                        elseif o > 5 then
                            e = e + l[3];
                        else
                            n[l[2]] = i[l[3]];
                        end
                    elseif o <= 10 then
                        if o <= 8 then
                            if o == 7 then
                                local a = G[l[3]];
                                local d;
                                local o = {};
                                d = B({}, {
                                    __index = function(e, l)
                                        local l = o[l];
                                        return l[1][l[2]];
                                    end,
                                    __newindex = function(n, l, e)
                                        local l = o[l]
                                        l[1][l[2]] = e;
                                    end
                                });
                                for d = 1, l[5] do
                                    e = e + 1;
                                    local l = c[e];
                                    if l[1] == 9 then
                                        o[d - 1] = {n, l[3]};
                                    else
                                        o[d - 1] = {i, l[3]};
                                    end
                                    r[#r + 1] = o;
                                end
                                n[l[2]] = s(a, d, f);
                            else
                                n[l[2]][n[l[3]]] = n[l[5]];
                            end
                        elseif o == 9 then
                            n[l[2]] = n[l[3]];
                        else
                            local o = l[2];
                            local c = d;
                            local e = {};
                            local l = 0;
                            for o = o, c do
                                l = l + 1;
                                e[l] = n[o];
                            end
                            do return t(e, 1, l) end
                        end
                    elseif o <= 12 then
                        if o == 11 then
                            if n[l[2]] then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        else
                            if (n[l[2]] == a[l[5]]) then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        end
                    elseif o == 13 then
                        n[l[2]] = s(G[l[3]], nil, f);
                    else
                        if not n[l[2]] then
                            e = e + 1;
                        else
                            e = e + l[3];
                        end
                    end
                elseif o <= 22 then
                    if o <= 18 then
                        if o <= 16 then
                            if o > 15 then
                                n[l[2]] = n[l[3]];
                            else
                                n[l[2]] = f[a[l[3]]];
                            end
                        elseif o == 17 then
                            i[l[3]] = n[l[2]];
                            e = e + 1;
                            l = c[e];
                            i[l[3]] = n[l[2]];
                            e = e + 1;
                            l = c[e];
                            f[a[l[3]]] = n[l[2]];
                            e = e + 1;
                            l = c[e];
                            i[l[3]] = n[l[2]];
                            e = e + 1;
                            l = c[e];
                            i[l[3]] = n[l[2]];
                            e = e + 1;
                            l = c[e];
                            do return end
                        else
                            if not n[l[2]] then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        end
                    elseif o <= 20 then
                        if o == 19 then
                            local l = l[2];
                            local o = {};
                            local e = 0;
                            local c = d;
                            for l = l + 1, c do
                                e = e + 1;
                                o[e] = n[l];
                            end
                            n[l](t(o, 1, c - l));
                            d = l;
                        else
                            for l = l[2], l[3] do
                                n[l] = nil;
                            end
                        end
                    elseif o > 21 then
                        n[l[2]] = n[l[3]][n[l[5]]];
                    else
                        e = e + l[3];
                    end
                elseif o <= 26 then
                    if o <= 24 then
                        if o > 23 then
                            local e = l[2];
                            local c = {};
                            local o = 0;
                            local l = e + l[3] - 1;
                            for l = e + 1, l do
                                o = o + 1;
                                c[o] = n[l];
                            end
                            n[e](t(c, 1, l - e));
                            d = e;
                        else
                            local o = l[2];
                            local c = d;
                            local e = {};
                            local l = 0;
                            for o = o, c do
                                l = l + 1;
                                e[l] = n[o];
                            end
                            do return t(e, 1, l) end
                        end
                    elseif o == 25 then
                        do return end
                    else
                        n[l[2]] = {};
                    end
                elseif o <= 28 then
                    if o > 27 then
                        n[l[2]] = {};
                    else
                        local t = G[l[3]];
                        local a;
                        local o = {};
                        a = B({}, {
                            __index = function(e, l)
                                local l = o[l];
                                return l[1][l[2]];
                            end,
                            __newindex = function(n, l, e)
                                local l = o[l]
                                l[1][l[2]] = e;
                            end
                        });
                        for d = 1, l[5] do
                            e = e + 1;
                            local l = c[e];
                            if l[1] == 9 then
                                o[d - 1] = {n, l[3]};
                            else
                                o[d - 1] = {i, l[3]};
                            end
                            r[#r + 1] = o;
                        end
                        n[l[2]] = s(t, a, f);
                    end
                elseif o > 29 then
                    local o = l[2];
                    local c = {};
                    local e = 0;
                    local a = o + l[3] - 1;
                    for l = o + 1, a do
                        e = e + 1;
                        c[e] = n[l];
                    end
                    local c = {n[o](t(c, 1, a - o))};
                    local l = o + l[5] - 2;
                    e = 0;
                    for l = o, l do
                        e = e + 1;
                        n[l] = c[e];
                    end
                    d = l;
                else
                    n[l[2]] = (l[3] ~= 0);
                end
            elseif o <= 46 then
                if o <= 38 then
                    if o <= 34 then
                        if o <= 32 then
                            if o == 31 then
                                local l = l[2];
                                local e = {};
                                local o = d;
                                for l = l + 1, o do
                                    e[#e + 1] = n[l];
                                end
                                do
                                    return n[l](t(e, 1, o - l))
                                end
                            else
                                n[l[2]][n[l[3]]] = n[l[5]];
                            end
                        elseif o > 33 then
                            local l = l[2];
                            d = l + C - 1;
                            for e = l, d do
                                local l = A[e - l];
                                n[e] = l;
                            end
                        else
                            local s;
                            local A;
                            local G;
                            local r;
                            local o;
                            local C, h;
                            local o;
                            n[l[2]] = f[a[l[3]]];
                            e = e + 1;
                            l = c[e];
                            n[l[2]] = a[l[3]];
                            e = e + 1;
                            l = c[e];
                            n[l[2]] = a[l[3]];
                            e = e + 1;
                            l = c[e];
                            n[l[2]] = i[l[3]];
                            e = e + 1;
                            l = c[e];
                            n[l[2]] = a[l[3]];
                            e = e + 1;
                            l = c[e];
                            n[l[2]] = f[a[l[3]]];
                            e = e + 1;
                            l = c[e];
                            o = l[2];
                            C, h = {n[o]()};
                            h = o + l[5] - 2;
                            r = 0;
                            for l = o, h do
                                r = r + 1;
                                n[l] = C[r];
                            end
                            d = h;
                            e = e + 1;
                            l = c[e];
                            G = l[3];
                            A = n[G]
                            for l = G + 1, l[5] do
                                A = A .. n[l];
                            end
                            n[l[2]] = A;
                            e = e + 1;
                            l = c[e];
                            o = l[2];
                            s = {};
                            r = 0;
                            h = o + l[3] - 1;
                            for l = o + 1, h do
                                r = r + 1;
                                s[r] = n[l];
                            end
                            n[o](t(s, 1, h - o));
                            d = o;
                            e = e + 1;
                            l = c[e];
                            do return end
                        end
                    elseif o <= 36 then
                        if o > 35 then
                            local e = l[2];
                            local c, o = {n[e]()};
                            local o = e + l[5] - 2;
                            local l = 0;
                            for e = e, o do
                                l = l + 1;
                                n[e] = c[l];
                            end
                            d = o;
                        else
                            do return end
                        end
                    elseif o > 37 then
                        for l = l[2], l[3] do n[l] = nil; end
                    else
                        local s;
                        local f;
                        local a;
                        local r;
                        local h;
                        local o;
                        n[l[2]] = i[l[3]];
                        e = e + 1;
                        l = c[e];
                        n[l[2]] = i[l[3]];
                        e = e + 1;
                        l = c[e];
                        o = l[2];
                        d = o + C - 1;
                        for l = o, d do
                            h = A[l - o];
                            n[l] = h;
                        end
                        e = e + 1;
                        l = c[e];
                        o = l[2];
                        r = {};
                        a = 0;
                        f = d;
                        for l = o + 1, f do
                            a = a + 1;
                            r[a] = n[l];
                        end
                        n[o](t(r, 1, f - o));
                        d = o;
                        e = e + 1;
                        l = c[e];
                        n[l[2]] = i[l[3]];
                        e = e + 1;
                        l = c[e];
                        o = l[2];
                        d = o + C - 1;
                        for l = o, d do
                            h = A[l - o];
                            n[l] = h;
                        end
                        e = e + 1;
                        l = c[e];
                        o = l[2];
                        r = {};
                        f = d;
                        for l = o + 1, f do
                            r[#r + 1] = n[l];
                        end
                        do return n[o](t(r, 1, f - o)) end
                        e = e + 1;
                        l = c[e];
                        o = l[2];
                        f = d;
                        s = {};
                        a = 0;
                        for l = o, f do
                            a = a + 1;
                            s[a] = n[l];
                        end
                        do return t(s, 1, a) end
                        e = e + 1;
                        l = c[e];
                        do return end
                    end
                elseif o <= 42 then
                    if o <= 40 then
                        if o == 39 then
                            local l = l[2];
                            d = l + C - 1;
                            for e = l, d do
                                local l = A[e - l];
                                n[e] = l;
                            end
                        else
                            n[l[2]] = (l[3] ~= 0);
                        end
                    elseif o > 41 then
                        local o = l[3];
                        local e = n[o]
                        for l = o + 1, l[5] do
                            e = e .. n[l];
                        end
                        n[l[2]] = e;
                    else
                        n[l[2]] = a[l[3]];
                    end
                elseif o <= 44 then
                    if o > 43 then
                        if n[l[2]] then
                            e = e + 1;
                        else
                            e = e + l[3];
                        end
                    else
                        local e = l[2];
                        local c = {};
                        local o = 0;
                        local l = e + l[3] - 1;
                        for l = e + 1, l do
                            o = o + 1;
                            c[o] = n[l];
                        end
                        n[e](t(c, 1, l - e));
                        d = e;
                    end
                elseif o > 45 then
                    n[l[2]] = n[l[3]][n[l[5]]];
                else
                    n[l[2]] = a[l[3]];
                end
            elseif o <= 54 then
                if o <= 50 then
                    if o <= 48 then
                        if o == 47 then
                            local o = l[2];
                            local c = l[5];
                            local l = o + 2;
                            local d = {n[o](n[o + 1], n[l])};
                            for e = 1, c do
                                n[l + e] = d[e];
                            end
                            local o = n[o + 3];
                            if o then
                                n[l] = o
                            else
                                e = e + 1;
                            end
                        else
                            f[a[l[3]]] = n[l[2]];
                        end
                    elseif o == 49 then
                        local d = l[2];
                        local c = {};
                        for l = 1, #r do
                            local l = r[l];
                            for e = 0, #l do
                                local e = l[e];
                                local o = e[1];
                                local l = e[2];
                                if o == n and l >= d then
                                    c[l] = o[l];
                                    e[1] = c;
                                end
                            end
                        end
                    else
                        f[a[l[3]]] = n[l[2]];
                    end
                elseif o <= 52 then
                    if o == 51 then
                        n[l[2]] = s(G[l[3]], nil, f);
                    else
                        local d = l[2];
                        local c = {};
                        for l = 1, #r do
                            local l = r[l];
                            for e = 0, #l do
                                local l = l[e];
                                local o = l[1];
                                local e = l[2];
                                if o == n and e >= d then
                                    c[e] = o[e];
                                    l[1] = c;
                                end
                            end
                        end
                    end
                elseif o > 53 then
                    local o = l[2];
                    local c = l[5];
                    local l = o + 2;
                    local d = {n[o](n[o + 1], n[l])};
                    for e = 1, c do n[l + e] = d[e]; end
                    local o = n[o + 3];
                    if o then
                        n[l] = o
                    else
                        e = e + 1;
                    end
                else
                    if (n[l[2]] ~= n[l[5]]) then
                        e = e + 1;
                    else
                        e = e + l[3];
                    end
                end
            elseif o <= 58 then
                if o <= 56 then
                    if o > 55 then
                        local r;
                        local i;
                        local h;
                        local o;
                        o = l[2];
                        h = {};
                        i = 0;
                        r = o + l[3] - 1;
                        for l = o + 1, r do
                            i = i + 1;
                            h[i] = n[l];
                        end
                        n[o](t(h, 1, r - o));
                        d = o;
                        e = e + 1;
                        l = c[e];
                        n[l[2]] = f[a[l[3]]];
                        e = e + 1;
                        l = c[e];
                        n[l[2]] = a[l[3]];
                        e = e + 1;
                        l = c[e];
                        o = l[2];
                        h = {};
                        i = 0;
                        r = o + l[3] - 1;
                        for l = o + 1, r do
                            i = i + 1;
                            h[i] = n[l];
                        end
                        n[o](t(h, 1, r - o));
                        d = o;
                        e = e + 1;
                        l = c[e];
                        n[l[2]] = f[a[l[3]]];
                        e = e + 1;
                        l = c[e];
                        n[l[2]] = a[l[3]];
                    else
                        i[l[3]] = n[l[2]];
                    end
                elseif o > 57 then
                    n[l[2]] = f[a[l[3]]];
                else
                    n[l[2]] = i[l[3]];
                end
            elseif o <= 60 then
                if o == 59 then
                    n[l[2]] = {};
                    e = e + 1;
                    l = c[e];
                    n[l[2]] = {};
                    e = e + 1;
                    l = c[e];
                    n[l[2]] = f[a[l[3]]];
                    e = e + 1;
                    l = c[e];
                    n[l[2]] = a[l[3]];
                    e = e + 1;
                    l = c[e];
                    f[a[l[3]]] = n[l[2]];
                    e = e + 1;
                    l = c[e];
                    n[l[2]] = {};
                    e = e + 1;
                    l = c[e];
                    for l = l[2], l[3] do n[l] = nil; end
                    e = e + 1;
                    l = c[e];
                    n[l[2]] = f[a[l[3]]];
                    e = e + 1;
                    l = c[e];
                    n[l[2]] = a[l[3]];
                else
                    local e = l[2];
                    local c, o = {n[e]()};
                    local o = e + l[5] - 2;
                    local l = 0;
                    for e = e, o do
                        l = l + 1;
                        n[e] = c[l];
                    end
                    d = o;
                end
            elseif o == 61 then
                if (n[l[2]] == a[l[5]]) then
                    e = e + 1;
                else
                    e = e + l[3];
                end
            else
                i[l[3]] = n[l[2]];
            end
            e = e + 1;
        end
    end;
end
return s(u(), {}, F())();

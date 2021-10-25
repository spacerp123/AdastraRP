local f = string.byte;
local H = string.char;
local d = string.sub;
local I = table.concat;
local B = math.ldexp;
local Y = getfenv or function() return _ENV end;
local h = setmetatable;
local r = select;
local t = unpack or table.unpack;
local J = tonumber;
local function i(f)
    local e, o, c = "", "", {}
    local a = 256;
    local n = {}
    for l = 0, a - 1 do n[l] = H(l) end
    local l = 1;
    local function t()
        local e = J(d(f, l, l), 36)
        l = l + 1;
        local o = J(d(f, l, l + e - 1), 36)
        l = l + e;
        return o
    end
    e = H(t())
    c[1] = e;
    while l < #f do
        local l = t()
        if n[l] then
            o = n[l]
        else
            o = e .. d(e, 1, 1)
        end
        n[a] = e .. d(o, 1, 1)
        c[#c + 1], e, a = o, o, a + 1
    end
    return table.concat(c)
end
local a = i(
              '1B1M1B27618172761B22Y22V22V22S23G23223322N22S22M23C232181127A22K22Y23H23222G22R22Q23222V233181027A21U22T22Q23J22Q27C22Q23527H1A1B181C27Q22Y23D28522T230181D27A22222Q22U22122S23J1927A28X28E28G27622H22Y23023228T23J28F27A22523D23223222022Y22U27827A29B23C22S23I23D22W23221Z22Q23C2971227A22W22H23223C22029L22T2971R27A29X23029R23J23223D21X23223J22627T2A2181U28H27T27V27X27Z21D27E22Y23322022V27X2AH1428P2332332AF2322A221V22Y22T23322V2AA29H27622029B22Y2A922N22R2BD2801827Q29Z2AI27A2AT23228I2262A228627X29Z22S22U22U2B523323C181F27A22C22C23022W182AX2912322A729S2AA2A02BY2C0181V2AK27U27W27Y23321D22W2B828I23F27H2C22CL27627R2AL2CO2AO2CS2BQ23D27T22R2C21S2CM2AM2CP2CR2CT23D22S22X22P23222W23J2C21O2DB2D22CQ2D428I2BZ23F181Q2DP2AN2CQ23327Y23023I22T181J2DY2DD2DS23D22L23227W2D42CX2E82D32DF22J2CW182DA2CZ27S2CN2DZ2DE2D521W2DI2DK2DM182DO2EO2D12ER2EA21Y22Y2DV28O27625K24P25L24225L24U2DX2761F28227A2C328H28628W28Y21B2232FK2762AQ28027927627C27E27G27I27K27M2BA1B29J29L29N29P2A81829U27629W29Y2A02E429727P2F02EQ2CP28128328528728928B2331A1A27O2GN2BU2GQ23228X2EZ1B26U2172A42452171B23V26Z1J26Z26S24Y2E723V26G1R2HC26Y2A41B26K2HB26S2412E71B26H1R2A424Z2HL26Z25F26S2HD2HZ23826G2172HJ2H71B26L2HR23Z2HR2HT2H72532HL26H132A42531327626W1Z2HC2531Z27627021N2IP21N27626O21F2IP21F27626G2232IP22327626H21V24R1B25321V2J22J426S2532J62HS2172572JB2I72HT2IJ2HL26X2IL2JB2JS1B2C42772JW1B27R2FM28Y22323O2FQ1P27A22N23D22Q23029423D22G2AA27T23D2B12AW28P22A22921X21D28428622J22V22Y2362AA28X2901B26W132HC26T2JS2702HI2JG2JQ2HU2JB2HL26W2HO2532HR2702I52JG2I726X2L82IF2762JR2762IK2762GU2FJ2GI1B2E129S23D23I2DL22S23D28N27A22R2C02B828Y1627A2711B2A425B27A2722II1B23Q2IL2H927A24Y2762H92IO2HD2IR23V2MA2H72MD2762722HR24L2HF26Z2L524Y2A42MS2MB1B2MV1B26P1B2MU2M92L82HW2LM132IW2682JS2LJ2NI2JQ2JS24B2JS182FN28E2GB1B22W2M029L28722T27N2JY23G23D2F528D27A2KX2NS28Y2M22762M42B62B82GV2762LV23J2LX2LZ2M12FV1B27M23J22U2AD2BE22Y22X2OF2NU2NW2DG23I2NZ27N1E27A2362DZ28Y2IR2LM27A23W27A2JR2IW2702JS2MF2A42MI2H826Z2ML2MN2N12HC2N32H82PH1B24E2MJ2PL2762MM2PK2HO2HE2H826P2JS23W2JS26T27A26B27A26P2NE2NN2762NP2762NA2H72732QA2HL24M2HL2L22LO2JS26P1J2IW2LD27626S2LG2532JN2HL2LL2I82R02QN1J2IJ2HR2QO2JT2J22MP26Y2P826H21722Z1B24D2I726L2JS2LP2HS2LK2IG2HR2QU2I827A25327A2HT2QT2HL2712P82IQ27626T2I72QY27626U2RL2PV2PM2PK2432I024Y2SC2382RE27626R2I72QB23F1B2552HL2QR2J62RR2IH2QP27626L2RT2RV2RO2NG2SU1B2LT26S2L026S26Y2Q61J2MU2HR26I26R21W1B24N26R26S23826X27A2422PC2HL2422JQ27A26D2PC2JS2422Q62SP2QN27A2472TT2QE2JU2BK2772ON22522Q2B62U723D29S2EK2802FI1B2U72B62AC23723J2UD2OG1B2BS2332UH2332UD2KW2PC27A26S27A2PF2IP2JS26O2L52R126S2LC2HR26X2S42LI2SX2T02R92772FJ2HL2UG2U82UQ22Q2UB23J2EC2EE2OF2CB2VH2UI2322UK2VN22Q2D4181527A2UP2UR2VV2D42UU2P92QV2UY2T52RM2V22IP2HL2V52IP2V72V92W62JB2U12VD28E2FJ2VQ2UR2UA29S2EU2DJ2DL2VY2992VI2UJ23J2WS2EW182M82762W12VI2X02DL2W51B2TK2W72IS2W92V12V32WD2V62LM2WH2XA2VB2XA2S827A2F728E2ON2FX27F27H27J27L2GZ2FR2JZ22Y2K128Y21U2FQ2ON2K82KA2KC2KI2972CY2Y02F12E92EJ2CW28X2VQ2KZ2HJ2JS26Y2172H72H62PZ2PP2HF2LB2HJ2LE2LG2412LI2QC27626Z25N2SD2Z32382YK2T62YM2MG2PJ2MK2PX2PN2N22N42IN2HJ2P82IT2HC2412IW2XA2Z02XN2U22XP2FJ2XS27D2XU2G02XX28E2JY2K028V28Y1B2Y42G32Y72KB2AA2YA2E62EH2DR2DF2W32B823C2YI27A2Z72T72762T72H72PU2PK2SA2H92Q02YT2HO26Y2YW2ZL2YZ2HV2HX24Z2SD31122Z62T5310L1B310W2762MZ2PK2ZF2H82ZH2T62ZJ2IU2HP2ZN2LJ31102VC2QF2762XQ2G32XT2FZ2XW27M2ZZ2FL31022Y32Y52K72K931082KH2AG2972EN2YD2GK2EI2ET2EV2DL310H27A2VG310K2Z9310O2S92ZD2YR2HD310U2YV2IS2YX310Z1B2NF1B26Z31122HD3114312H310M2ZA312K1B2PY2H9311D23V311F2RC2IS311I2ZM2LM2ZP2LN1B311O1B311Q2ZU2FY2XV2G12XY31002Y1311Y28X31052Y631222Y931252EY310C2ES28I2F42SM27A2VZ2IM31162YM2YO1B2YQ310S2YS311E310V310X2HP312S312U2Z22Z42TI313031182MY2N031373139311H2ZL311K313F2NO2JU2LT311R2ZV311T313O311W2EO2Y2313T2FQ2VQ22422Q27T22K2BQ23F22S22T27J2UM2ON2242AD2KR2KT2AA2UD2O92Z12502X227Q22622222J21W21X22C22J21U22G22N21W21Z315S21F2K42G32BC2BQ2BF2BH2BQ2GS28X2ON315V27621U23C2UD27V22S28U2U828M2UF315O2KU23D2UD21U280275276315M2AE2BT23J236316W2AA316N29A29C28Q22U316T2222972JU317923D31701831721B2AC23J23G2M022O3174317Q317S23D22O317029A2BX2BS28731772G3316N3183286236315Y27H3186316O27H315Y2KS316X28E2K627631072KC2KE2D63109313Y215314022727Y2AD23231883177221236317W2M023321U2272XZ3101315S2762JI2762192UV2762PB310M1R28D24L319I2H91326Y2HD131A313831482IS2L52HK2762712JS24P2NK2NB1B24327A2T72PI3133313526Z2572PP2JL3138314G312Q2HC2V8319X2XO2XL2QT27A26O2MP2S11B2R82RM2QB2IE2WD311I2532ZN2ST2VD26T1R31AV2S622B2IJ22B2PK22J2PP22J2H826S2IZ2T62J12HS2JS26B2TW2H724U2HL26U21N2PI2IW2MO2PP2MR26Q21723V2PT2H7314D312N31BD21V2HJ2JD1B26G31BA2HP31BC2R227626B2R42HV2HR26W22B2HJ31B81B27022Z2ZL2RG2ZO311M312V26326T2HD31CU2TJ314Y2761K310J319T311813312J310Q312L31C12Q131AE312P31CM312R313E31CS312W3113314N31D326Y31A41B24L31A42H924B2PP24B2H82XB1B319G2XL27624X319E1B24A31E131DX26Y22R311A31E72H931CO2HD2RG31382RB314U26S2512ZN2IY2J0319X31B32L92IX2JF2JH2QV31C42JG31C626H2XM2RK2T126X31BQ2JB2ZN26W31C925331CB27226R31D12TG2TI31DV2TS31DF312T2QD313H2JU2P3277317O3192317Y317V2AD317X317Z2UQ2DG22U318Y23618318K1B318M2AA318O2KG310A318S2GJ2DC2AO318U2B82A931FW319031FN31943196313Q315727A22A319B2N62WI31DX2JR2J62PF2Z131ET24Y2JD2HG31D32I92762492IC31EN2R126K2XG2762682XI1B26D2XK2I92R627626K2QX2I726831AP2P826L2SZ2XL2A425927A26Z2SC2HD2SF313G313I313K283318E233318G315P2M131FM31FQ317T31FP317R317T318031FU31FW31FY31212Y831G22KF318Q2B229731G6312831G82CQ31GA318W31GD319131I623D31GG3197313R319931GL28X1T31E42TT31GR2JS26Z2372PP2372H826G31GY2HR26B31H231BM2HL26I2JS24L31A82PN311I24Y31BS2HH2HJ2HL31GZ1B23T31JG31EO2HM31H926831HH27631HB2LO2RJ2R52JB2HR26G31EF31HF313C31AZ313F2N631HQ2Z122R2SD31KJ31CY2ZR27631FK28E31I531I931FO2AD31FN31FS318131FV317631FX31FZ31G12KD31II312431IK1831IM2D0312931IP318V31GC31KZ31GE31IU31IW31GI313S31GK31GM2VG31DV31GP1331J531GT2PP31GW31JC2YL2SV2HR31H12J731H32HL31H52WC31H731H931K42JM31LW31HE2HM31K21B31HJ2IP31HL31HN2TK31HP31HR31HT2SE31FC31CZ311P2FJ31KR31FR31I831FR31IB318231KZ31IE318L313W31IH318P31L52AH31L82EP31IO21D31IQ31LD318423631LF31KS31LH311X31IZ3120316M31I031I2318I27A21R31J32NG31LQ312V31GU31LT31JD31H031JX31H431H631MC31M531HC31K72RR31HG2IP31HI31HK2SV31MG31KG31MJ2SD31HV2Q42NK31LP31CM31J631J82HD31JA2HG311I26Y2ZN31JU31JF31LZ31JH27631JJ311A31JM2PK31NS31JB31NU1B31LY2RN31B42HM31NY31H82WF31K331O131M931O42LH31H731O72R22JP2P931MI31KI31KK31FC2HL23W2NN31NQ26Z31OZ31GX31LV2I831LX31NW31M131P731O031K531M831K831HF31MB31MD2JG31MF31PI31HO1B31KH312V31MK31OD31KN1B31KP316L1B3174317K21X29F27N317J318H317A2801N27A22923D22N21S2KT2O421E21R21W22T22629S21Z22Y22523J22921S22H23J23I2A02A031MX31G031MZ31L331N1310A2H12A723029L22X29L27E23I31RS23I31RU23I2KS28X2UF2Z723V2L331NY319Y31EZ31A22RU31312QT31OX31362PP2ZG2LG2YN2IS2MP2412P8311L31FG311N2JS23131D22HC2KZ2P92IE2PC1J2SR2HR319Y2IE2JS27121N2SM31AY319X22331T82JI26O31ET2JC31AJ2IJ2NK1Z2A423P2P826W2L525A2TQ2LO310J31F531CB31DV31SC2KY31CJ2JG31CL26W31EB25331CQ27022R2IP31E731CR31JY26W23F2IP314431U631U82IX312V26S26Q31SZ31CG2IM31OJ26Y31JA31OH2HC26Q2NK2ZP26W2H92T631BY31HO1A2N831A62MH31SF2HA26X312N1923V31MH1B2QJ319U31UT2JQ24B31TL31DT1B2722L824N2N431DV2TM27626Q31K724N2HF313G2TV2S62H42TF31C031VX2JS26I31TK2TF2MR31W331HF2432HJ31DM26824R2ZL2JA1B26C31BF26Q31BH31HD312T2HR26K31WB2T631WD24J2ZL24J27626C2JF26Q2JI31WN24Z31WP31WR31DL31H731AB2HP2JL31WI31ET26Q31C631X231X431WC31H724Z2ZL24Z31WX31C926Q31CB31XF2SV27A23N27A26831X531DM26C25N2ZL25N27626222J2A424N31BC31VB2P82422P826931K726M2HR26831U331CQ26C25F2IP25F27626931HN26831UD2JG314431YJ31YL31Y231B62TF31B831VB2HR2422HR31YC2A431YE31H731YH31WX2632IP26331YN31YP31YR25331YT31ZA2JG31ZC1B26222Z31Y531ED2LJ2762TP31YN31YD31YF31Z831WI25V2IP25V31ZD31QA31YQ31UE31WX31ZY2JG320031ZL22R31Y531E931AI1B2422I731Z41B31Z631MC31ZW26C26J2IP26J320131JY320331YS31WX320N2JG320P31ZL23F2IW24N2SM31Z031ZR2V72TO2JQ2I7320F31ZT31UN31DY1B252310J31XW2IS26B2ZL2Q91B26O31UY26Q31V026X31K731X331SR276');
local n = bit and bit.bxor or function(l, o)
    local e, n = 1, 0
    while l > 0 and o > 0 do
        local d, c = l % 2, o % 2
        if d ~= c then n = n + e end
        l, o, e = (l - d) / 2, (o - c) / 2, e * 2
    end
    if l < o then l = o end
    while l > 0 do
        local o = l % 2
        if o > 0 then n = n + e end
        l, e = (l - o) / 2, e * 2
    end
    return n
end
local function e(o, l, e)
    if e then
        local l = (o / 2 ^ (l - 1)) % 2 ^ ((e - 1) - (l - 1) + 1);
        return l - l % 1;
    else
        local l = 2 ^ (l - 1);
        return (o % (l + l) >= l) and 1 or 0;
    end
end
local l = 1;
local function o()
    local d, c, e, o = f(a, l, l + 3);
    d = n(d, 11)
    c = n(c, 11)
    e = n(e, 11)
    o = n(o, 11)
    l = l + 4;
    return (o * 16777216) + (e * 65536) + (c * 256) + d;
end
local function c()
    local e = n(f(a, l, l), 11);
    l = l + 1;
    return e;
end
local function J()
    local n = o();
    local l = o();
    local d = 1;
    local n = (e(l, 1, 20) * (2 ^ 32)) + n;
    local o = e(l, 21, 31);
    local l = ((-1) ^ e(l, 32));
    if (o == 0) then
        if (n == 0) then
            return l * 0;
        else
            o = 1;
            d = 0;
        end
    elseif (o == 2047) then
        return (n == 0) and (l * (1 / 0)) or (l * (0 / 0));
    end
    return B(l, o - 1023) * (d + (n / (2 ^ 52)));
end
local i = o;
local function B(e)
    local o;
    if (not e) then
        e = i();
        if (e == 0) then return ''; end
    end
    o = d(a, l, l + e - 1);
    l = l + e;
    local e = {}
    for l = 1, #o do e[l] = H(n(f(d(o, l, l)), 11)) end
    return I(e);
end
local l = o;
local function H(...) return {...}, r('#', ...) end
local function L()
    local f = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0
    };
    local d = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    local l = {};
    local a = {f, nil, d, nil, l};
    a[4] = c();
    local l = o()
    local t = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
    };
    for o = 1, l do
        local e = c();
        local l;
        if (e == 1) then
            l = (c() ~= 0);
        elseif (e == 2) then
            l = J();
        elseif (e == 3) then
            l = B();
        end
        t[o] = l;
    end
    a[2] = t
    for l = 1, o() do d[l - 1] = L(); end
    for c = 1, o() do
        local d = n(o(), 242);
        local o = n(o(), 188);
        local n = e(d, 1, 2);
        local l = e(o, 1, 11);
        local l = {l, e(d, 3, 11), nil, nil, o};
        if (n == 0) then
            l[3] = e(d, 12, 20);
            l[5] = e(d, 21, 29);
        elseif (n == 1) then
            l[3] = e(o, 12, 33);
        elseif (n == 2) then
            l[3] = e(o, 12, 32) - 1048575;
        elseif (n == 3) then
            l[3] = e(o, 12, 32) - 1048575;
            l[5] = e(d, 21, 29);
        end
        f[c] = l;
    end
    return a;
end
local function B(l, J, f)
    local n = l[1];
    local o = l[2];
    local e = l[3];
    local l = l[4];
    return function(...)
        local n = n;
        local d = o;
        local I = e;
        local c = l;
        local D = H
        local e = 1;
        local a = -1;
        local Y = {};
        local L = {...};
        local H = r('#', ...) - 1;
        local i = {};
        local o = {};
        for l = 0, H do
            if (l >= c) then
                Y[l - c] = L[l + 1];
            else
                o[l] = L[l + 1];
            end
        end
        local l = H - c + 1
        local l;
        local c;
        while true do
            l = n[e];
            c = l[1];
            if c <= 44 then
                if c <= 21 then
                    if c <= 10 then
                        if c <= 4 then
                            if c <= 1 then
                                if c > 0 then
                                    local c = l[2];
                                    local n = {};
                                    for l = 1, #i do
                                        local l = i[l];
                                        for e = 0, #l do
                                            local l = l[e];
                                            local d = l[1];
                                            local e = l[2];
                                            if d == o and e >= c then
                                                n[e] = d[e];
                                                l[1] = n;
                                            end
                                        end
                                    end
                                else
                                    local i;
                                    local r;
                                    local H;
                                    local J;
                                    local c;
                                    o[l[2]] = o[l[3]];
                                    e = e + 1;
                                    l = n[e];
                                    c = l[2];
                                    J = {};
                                    H = 0;
                                    r = c + l[3] - 1;
                                    for l = c + 1, r do
                                        H = H + 1;
                                        J[H] = o[l];
                                    end
                                    i = {o[c](t(J, 1, r - c))};
                                    r = c + l[5] - 2;
                                    H = 0;
                                    for l = c, r do
                                        H = H + 1;
                                        o[l] = i[H];
                                    end
                                    a = r;
                                    e = e + 1;
                                    l = n[e];
                                    o[l[2]] = f[d[l[3]]];
                                    e = e + 1;
                                    l = n[e];
                                    o[l[2]] = d[l[3]];
                                    e = e + 1;
                                    l = n[e];
                                    o[l[2]] = o[l[3]];
                                    e = e + 1;
                                    l = n[e];
                                    c = l[2];
                                    J = {};
                                    H = 0;
                                    r = c + l[3] - 1;
                                    for l = c + 1, r do
                                        H = H + 1;
                                        J[H] = o[l];
                                    end
                                    o[c](t(J, 1, r - c));
                                    a = c;
                                    e = e + 1;
                                    l = n[e];
                                    o[l[2]] = f[d[l[3]]];
                                    e = e + 1;
                                    l = n[e];
                                    o[l[2]] = d[l[3]];
                                    e = e + 1;
                                    l = n[e];
                                    c = l[2];
                                    J = {};
                                    H = 0;
                                    r = c + l[3] - 1;
                                    for l = c + 1, r do
                                        H = H + 1;
                                        J[H] = o[l];
                                    end
                                    o[c](t(J, 1, r - c));
                                    a = c;
                                end
                            elseif c <= 2 then
                                local i;
                                local r;
                                local H;
                                local J;
                                local c;
                                o[l[2]] = f[d[l[3]]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = d[l[3]];
                                e = e + 1;
                                l = n[e];
                                c = l[2];
                                J = {};
                                H = 0;
                                r = c + l[3] - 1;
                                for l = c + 1, r do
                                    H = H + 1;
                                    J[H] = o[l];
                                end
                                i = {o[c](t(J, 1, r - c))};
                                r = c + l[5] - 2;
                                H = 0;
                                for l = c, r do
                                    H = H + 1;
                                    o[l] = i[H];
                                end
                                a = r;
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = d[l[3]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = d[l[3]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = (l[3] ~= 0);
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = (l[3] ~= 0);
                                e = e + 1;
                                l = n[e];
                                c = l[2];
                                J = {};
                                H = 0;
                                r = c + l[3] - 1;
                                for l = c + 1, r do
                                    H = H + 1;
                                    J[H] = o[l];
                                end
                                o[c](t(J, 1, r - c));
                                a = c;
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = f[d[l[3]]];
                            elseif c == 3 then
                                o[l[2]] = (l[3] ~= 0);
                            else
                                local e = l[2];
                                local d = {};
                                local n = 0;
                                local l = e + l[3] - 1;
                                for l = e + 1, l do
                                    n = n + 1;
                                    d[n] = o[l];
                                end
                                o[e](t(d, 1, l - e));
                                a = e;
                            end
                        elseif c <= 7 then
                            if c <= 5 then
                                e = e + l[3];
                            elseif c == 6 then
                                o[l[2]] = (not o[l[3]]);
                            else
                                o[l[2]]();
                                a = A;
                            end
                        elseif c <= 8 then
                            o[l[2]] = o[l[3]][d[l[5]]];
                        elseif c == 9 then
                            local r;
                            local H;
                            local J;
                            local c;
                            f[d[l[3]]] = o[l[2]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = {};
                            e = e + 1;
                            l = n[e];
                            f[d[l[3]]] = o[l[2]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = {};
                            e = e + 1;
                            l = n[e];
                            f[d[l[3]]] = o[l[2]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = d[l[3]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            J = {};
                            H = 0;
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                H = H + 1;
                                J[H] = o[l];
                            end
                            o[c](t(J, 1, r - c));
                            a = c;
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = d[l[3]];
                        else
                            local n = l[2];
                            local d = l[5];
                            local l = n + 2;
                            local c = {o[n](o[n + 1], o[l])};
                            for e = 1, d do
                                o[l + e] = c[e];
                            end
                            local n = o[n + 3];
                            if n then
                                o[l] = n
                            else
                                e = e + 1;
                            end
                        end
                    elseif c <= 15 then
                        if c <= 12 then
                            if c > 11 then
                                local i;
                                local r;
                                local H;
                                local J;
                                local c;
                                o[l[2]] = o[l[3]];
                                e = e + 1;
                                l = n[e];
                                c = l[2];
                                J = {};
                                H = 0;
                                r = c + l[3] - 1;
                                for l = c + 1, r do
                                    H = H + 1;
                                    J[H] = o[l];
                                end
                                i = {o[c](t(J, 1, r - c))};
                                r = c + l[5] - 2;
                                H = 0;
                                for l = c, r do
                                    H = H + 1;
                                    o[l] = i[H];
                                end
                                a = r;
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = f[d[l[3]]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = d[l[3]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = o[l[3]];
                                e = e + 1;
                                l = n[e];
                                c = l[2];
                                J = {};
                                H = 0;
                                r = c + l[3] - 1;
                                for l = c + 1, r do
                                    H = H + 1;
                                    J[H] = o[l];
                                end
                                o[c](t(J, 1, r - c));
                                a = c;
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = f[d[l[3]]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = d[l[3]];
                                e = e + 1;
                                l = n[e];
                                c = l[2];
                                J = {};
                                H = 0;
                                r = c + l[3] - 1;
                                for l = c + 1, r do
                                    H = H + 1;
                                    J[H] = o[l];
                                end
                                o[c](t(J, 1, r - c));
                                a = c;
                            else
                                local t = I[l[3]];
                                local a;
                                local d = {};
                                a = h({}, {
                                    __index = function(e, l)
                                        local l = d[l];
                                        return l[1][l[2]];
                                    end,
                                    __newindex = function(o, l, e)
                                        local l = d[l]
                                        l[1][l[2]] = e;
                                    end
                                });
                                for c = 1, l[5] do
                                    e = e + 1;
                                    local l = n[e];
                                    if l[1] == 37 then
                                        d[c - 1] = {o, l[3]};
                                    else
                                        d[c - 1] = {J, l[3]};
                                    end
                                    i[#i + 1] = d;
                                end
                                o[l[2]] = B(t, a, f);
                            end
                        elseif c <= 13 then
                            local J;
                            local H;
                            local r;
                            local c;
                            c = l[2];
                            r = {};
                            H = 0;
                            J = c + l[3] - 1;
                            for l = c + 1, J do
                                H = H + 1;
                                r[H] = o[l];
                            end
                            o[c](t(r, 1, J - c));
                            a = c;
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = d[l[3]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            r = {};
                            H = 0;
                            J = c + l[3] - 1;
                            for l = c + 1, J do
                                H = H + 1;
                                r[H] = o[l];
                            end
                            o[c](t(r, 1, J - c));
                            a = c;
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = d[l[3]];
                        elseif c == 14 then
                            local r;
                            local f;
                            local H;
                            local c;
                            o[l[2]][d[l[3]]] = d[l[5]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]][d[l[3]]] = o[l[5]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = J[l[3]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = o[l[3]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            H = {};
                            f = 0;
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                f = f + 1;
                                H[f] = o[l];
                            end
                            o[c](t(H, 1, r - c));
                            a = c;
                            e = e + 1;
                            l = n[e];
                            do return end
                        else
                            local n = l[2];
                            local d = l[5];
                            local l = n + 2;
                            local c = {o[n](o[n + 1], o[l])};
                            for e = 1, d do
                                o[l + e] = c[e];
                            end
                            local n = o[n + 3];
                            if n then
                                o[l] = n
                            else
                                e = e + 1;
                            end
                        end
                    elseif c <= 18 then
                        if c <= 16 then
                            local a = I[l[3]];
                            local c;
                            local d = {};
                            c = h({}, {
                                __index = function(e, l)
                                    local l = d[l];
                                    return l[1][l[2]];
                                end,
                                __newindex = function(o, l, e)
                                    local l = d[l]
                                    l[1][l[2]] = e;
                                end
                            });
                            for c = 1, l[5] do
                                e = e + 1;
                                local l = n[e];
                                if l[1] == 37 then
                                    d[c - 1] = {o, l[3]};
                                else
                                    d[c - 1] = {J, l[3]};
                                end
                                i[#i + 1] = d;
                            end
                            o[l[2]] = B(a, c, f);
                        elseif c == 17 then
                            local r;
                            local H;
                            local i;
                            local c;
                            o[l[2]][d[l[3]]] = o[l[5]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = J[l[3]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]][d[l[3]]] = o[l[5]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = o[l[3]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = J[l[3]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            i = {};
                            H = 0;
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                H = H + 1;
                                i[H] = o[l];
                            end
                            o[c](t(i, 1, r - c));
                            a = c;
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = (l[3] ~= 0);
                        else
                            if o[l[2]] then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        end
                    elseif c <= 19 then
                        do return end
                    elseif c > 20 then
                        f[d[l[3]]] = o[l[2]];
                    else
                        o[l[2]][d[l[3]]] = o[l[5]];
                    end
                elseif c <= 32 then
                    if c <= 26 then
                        if c <= 23 then
                            if c > 22 then
                                o[l[2]] = {unpack or table.unpack({}, 1, l[3])};
                            else
                                e = e + l[3];
                            end
                        elseif c <= 24 then
                            if (o[l[2]] == d[l[5]]) then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        elseif c > 25 then
                            o[l[2]] = d[l[3]];
                        else
                            local n = l[2];
                            local d = {};
                            local e = 0;
                            local c = n + l[3] - 1;
                            for l = n + 1, c do
                                e = e + 1;
                                d[e] = o[l];
                            end
                            local d = {o[n](t(d, 1, c - n))};
                            local l = n + l[5] - 2;
                            e = 0;
                            for l = n, l do
                                e = e + 1;
                                o[l] = d[e];
                            end
                            a = l;
                        end
                    elseif c <= 29 then
                        if c <= 27 then
                            if o[l[2]] then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        elseif c > 28 then
                            local e = l[2];
                            local d, l = D(o[e]());
                            a = e - 1;
                            l = l + e - 1;
                            local n = 0;
                            for l = e, l do
                                n = n + 1;
                                o[l] = d[n];
                            end
                            a = l;
                        else
                            local i;
                            local r;
                            local H;
                            local J;
                            local c;
                            o[l[2]] = o[l[3]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            J = {};
                            H = 0;
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                H = H + 1;
                                J[H] = o[l];
                            end
                            i = {o[c](t(J, 1, r - c))};
                            r = c + l[5] - 2;
                            H = 0;
                            for l = c, r do
                                H = H + 1;
                                o[l] = i[H];
                            end
                            a = r;
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = d[l[3]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = o[l[3]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            J = {};
                            H = 0;
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                H = H + 1;
                                J[H] = o[l];
                            end
                            o[c](t(J, 1, r - c));
                            a = c;
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = d[l[3]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            J = {};
                            H = 0;
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                H = H + 1;
                                J[H] = o[l];
                            end
                            o[c](t(J, 1, r - c));
                            a = c;
                        end
                    elseif c <= 30 then
                        local l = l[2];
                        local d, e = D(o[l]());
                        a = l - 1;
                        e = e + l - 1;
                        local n = 0;
                        for l = l, e do
                            n = n + 1;
                            o[l] = d[n];
                        end
                        a = e;
                    elseif c == 31 then
                        local e = l[2];
                        local n = o[e];
                        local l = l[3];
                        for l = 1, l do n[l] = o[e + l] end
                    else
                        local d = l[2];
                        local n = a;
                        local e = {};
                        local l = 0;
                        for n = d, n do
                            l = l + 1;
                            e[l] = o[n];
                        end
                        do return t(e, 1, l) end
                    end
                elseif c <= 38 then
                    if c <= 35 then
                        if c <= 33 then
                            if not o[l[2]] then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        elseif c == 34 then
                            if (o[l[2]] == d[l[5]]) then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        else
                            o[l[2]] = (not o[l[3]]);
                        end
                    elseif c <= 36 then
                        local n = l[2];
                        local d = {};
                        local e = 0;
                        local c = a;
                        for l = n + 1, c do
                            e = e + 1;
                            d[e] = o[l];
                        end
                        local d = {o[n](t(d, 1, c - n))};
                        local l = n + l[5] - 2;
                        e = 0;
                        for l = n, l do
                            e = e + 1;
                            o[l] = d[e];
                        end
                        a = l;
                    elseif c > 37 then
                        o[l[2]] = d[l[3]];
                    else
                        o[l[2]] = o[l[3]];
                    end
                elseif c <= 41 then
                    if c <= 39 then
                        o[l[2]] = o[l[3]][d[l[5]]];
                    elseif c > 40 then
                        if (o[l[2]] ~= d[l[5]]) then
                            e = e + 1;
                        else
                            e = e + l[3];
                        end
                    else
                        o[l[2]] = B(I[l[3]], nil, f);
                    end
                elseif c <= 42 then
                    local i;
                    local H;
                    local f;
                    local r;
                    local c;
                    o[l[2]] = o[l[3]][d[l[5]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = o[l[3]];
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    r = {};
                    f = 0;
                    H = c + l[3] - 1;
                    for l = c + 1, H do
                        f = f + 1;
                        r[f] = o[l];
                    end
                    o[c](t(r, 1, H - c));
                    a = c;
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = J[l[3]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = o[l[3]];
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    r = {};
                    f = 0;
                    H = c + l[3] - 1;
                    for l = c + 1, H do
                        f = f + 1;
                        r[f] = o[l];
                    end
                    i = {o[c](t(r, 1, H - c))};
                    H = c + l[5] - 2;
                    f = 0;
                    for l = c, H do
                        f = f + 1;
                        o[l] = i[f];
                    end
                    a = H;
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = o[l[3]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = o[l[3]];
                    e = e + 1;
                    l = n[e];
                    if o[l[2]] then
                        e = e + 1;
                    else
                        e = e + l[3];
                    end
                elseif c > 43 then
                    do return end
                else
                    local e = l[2];
                    local d, n = {o[e]()};
                    local n = e + l[5] - 2;
                    local l = 0;
                    for e = e, n do
                        l = l + 1;
                        o[e] = d[l];
                    end
                    a = n;
                end
            elseif c <= 67 then
                if c <= 55 then
                    if c <= 49 then
                        if c <= 46 then
                            if c > 45 then
                                local i;
                                local r;
                                local H;
                                local J;
                                local c;
                                o[l[2]] = o[l[3]];
                                e = e + 1;
                                l = n[e];
                                c = l[2];
                                J = {};
                                H = 0;
                                r = c + l[3] - 1;
                                for l = c + 1, r do
                                    H = H + 1;
                                    J[H] = o[l];
                                end
                                i = {o[c](t(J, 1, r - c))};
                                r = c + l[5] - 2;
                                H = 0;
                                for l = c, r do
                                    H = H + 1;
                                    o[l] = i[H];
                                end
                                a = r;
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = f[d[l[3]]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = d[l[3]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = o[l[3]];
                                e = e + 1;
                                l = n[e];
                                c = l[2];
                                J = {};
                                H = 0;
                                r = c + l[3] - 1;
                                for l = c + 1, r do
                                    H = H + 1;
                                    J[H] = o[l];
                                end
                                o[c](t(J, 1, r - c));
                                a = c;
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = f[d[l[3]]];
                                e = e + 1;
                                l = n[e];
                                o[l[2]] = d[l[3]];
                                e = e + 1;
                                l = n[e];
                                c = l[2];
                                J = {};
                                H = 0;
                                r = c + l[3] - 1;
                                for l = c + 1, r do
                                    H = H + 1;
                                    J[H] = o[l];
                                end
                                o[c](t(J, 1, r - c));
                                a = c;
                            else
                                J[l[3]] = o[l[2]];
                            end
                        elseif c <= 47 then
                            o[l[2]] = {};
                        elseif c > 48 then
                            if not o[l[2]] then
                                e = e + 1;
                            else
                                e = e + l[3];
                            end
                        else
                            for l = l[2], l[3] do
                                o[l] = nil;
                            end
                        end
                    elseif c <= 52 then
                        if c <= 50 then
                            o[l[2]][d[l[3]]] = o[l[5]];
                        elseif c == 51 then
                            f[d[l[3]]] = o[l[2]];
                        else
                            o[l[2]] = (l[3] ~= 0);
                        end
                    elseif c <= 53 then
                        o[l[2]] = {unpack or table.unpack({}, 1, l[3])};
                    elseif c == 54 then
                        o[l[2]]();
                        a = A;
                    else
                        local n = l[2];
                        local d = {};
                        local e = 0;
                        local c = n + l[3] - 1;
                        for l = n + 1, c do
                            e = e + 1;
                            d[e] = o[l];
                        end
                        local d = {o[n](t(d, 1, c - n))};
                        local l = n + l[5] - 2;
                        e = 0;
                        for l = n, l do
                            e = e + 1;
                            o[l] = d[e];
                        end
                        a = l;
                    end
                elseif c <= 61 then
                    if c <= 58 then
                        if c <= 56 then
                            local i;
                            local B;
                            local r;
                            local H;
                            local J;
                            local c;
                            o[l[2]] = o[l[3]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            J = {};
                            H = 0;
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                H = H + 1;
                                J[H] = o[l];
                            end
                            B = {o[c](t(J, 1, r - c))};
                            r = c + l[5] - 2;
                            H = 0;
                            for l = c, r do
                                H = H + 1;
                                o[l] = B[H];
                            end
                            a = r;
                            e = e + 1;
                            l = n[e];
                            o[l[2]]();
                            a = c;
                            e = e + 1;
                            l = n[e];
                            f[d[l[3]]] = o[l[2]];
                            e = e + 1;
                            l = n[e];
                            f[d[l[3]]] = o[l[2]];
                            e = e + 1;
                            l = n[e];
                            f[d[l[3]]] = o[l[2]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]][d[l[3]]] = d[l[5]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            i = o[l[3]];
                            o[c + 1] = i;
                            o[c] = i[d[l[5]]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            J = {};
                            H = 0;
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                H = H + 1;
                                J[H] = o[l];
                            end
                            o[c](t(J, 1, r - c));
                            a = c;
                            e = e + 1;
                            l = n[e];
                            do return end
                        elseif c > 57 then
                            local n = l[2];
                            local d = {};
                            local e = 0;
                            local c = a;
                            for l = n + 1, c do
                                e = e + 1;
                                d[e] = o[l];
                            end
                            local d = {o[n](t(d, 1, c - n))};
                            local l = n + l[5] - 2;
                            e = 0;
                            for l = n, l do
                                e = e + 1;
                                o[l] = d[e];
                            end
                            a = l;
                        else
                            local H;
                            local B;
                            local r;
                            local i;
                            local c;
                            o[l[2]] = J[l[3]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            o[l[2]] = f[d[l[3]]];
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            i = {};
                            r = c + l[3] - 1;
                            for l = c + 1, r do
                                i[#i + 1] = o[l];
                            end
                            do
                                return o[c](t(i, 1, r - c))
                            end
                            e = e + 1;
                            l = n[e];
                            c = l[2];
                            r = a;
                            B = {};
                            H = 0;
                            for l = c, r do
                                H = H + 1;
                                B[H] = o[l];
                            end
                            do return t(B, 1, H) end
                            e = e + 1;
                            l = n[e];
                            do return end
                        end
                    elseif c <= 59 then
                        o[l[2]] = J[l[3]];
                    elseif c == 60 then
                        local c;
                        local c;
                        local i;
                        local c;
                        local J, r;
                        local H;
                        o[l[2]] = f[d[l[3]]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = f[d[l[3]]];
                        e = e + 1;
                        l = n[e];
                        H = l[2];
                        J, r = D(o[H]());
                        a = H - 1;
                        r = r + H - 1;
                        c = 0;
                        for l = H, r do
                            c = c + 1;
                            o[l] = J[c];
                        end
                        a = r;
                        e = e + 1;
                        l = n[e];
                        H = l[2];
                        i = {};
                        c = 0;
                        r = a;
                        for l = H + 1, r do
                            c = c + 1;
                            i[c] = o[l];
                        end
                        J = {o[H](t(i, 1, r - H))};
                        r = H + l[5] - 2;
                        c = 0;
                        for l = H, r do
                            c = c + 1;
                            o[l] = J[c];
                        end
                        a = r;
                        e = e + 1;
                        l = n[e];
                        if (o[l[2]] ~= d[l[5]]) then
                            e = e + 1;
                        else
                            e = e + l[3];
                        end
                    else
                        o[l[2]][d[l[3]]] = d[l[5]];
                    end
                elseif c <= 64 then
                    if c <= 62 then
                        local i;
                        local r;
                        local H;
                        local J;
                        local c;
                        o[l[2]] = o[l[3]];
                        e = e + 1;
                        l = n[e];
                        c = l[2];
                        J = {};
                        H = 0;
                        r = c + l[3] - 1;
                        for l = c + 1, r do
                            H = H + 1;
                            J[H] = o[l];
                        end
                        i = {o[c](t(J, 1, r - c))};
                        r = c + l[5] - 2;
                        H = 0;
                        for l = c, r do
                            H = H + 1;
                            o[l] = i[H];
                        end
                        a = r;
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = f[d[l[3]]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = d[l[3]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = o[l[3]];
                        e = e + 1;
                        l = n[e];
                        c = l[2];
                        J = {};
                        H = 0;
                        r = c + l[3] - 1;
                        for l = c + 1, r do
                            H = H + 1;
                            J[H] = o[l];
                        end
                        o[c](t(J, 1, r - c));
                        a = c;
                    elseif c == 63 then
                        local e = l[2];
                        local n = o[e];
                        local l = l[3];
                        for l = 1, l do n[l] = o[e + l] end
                    else
                        local i;
                        local r;
                        local H;
                        local J;
                        local c;
                        o[l[2]] = o[l[3]];
                        e = e + 1;
                        l = n[e];
                        c = l[2];
                        J = {};
                        H = 0;
                        r = c + l[3] - 1;
                        for l = c + 1, r do
                            H = H + 1;
                            J[H] = o[l];
                        end
                        i = {o[c](t(J, 1, r - c))};
                        r = c + l[5] - 2;
                        H = 0;
                        for l = c, r do
                            H = H + 1;
                            o[l] = i[H];
                        end
                        a = r;
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = f[d[l[3]]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = d[l[3]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = o[l[3]];
                        e = e + 1;
                        l = n[e];
                        c = l[2];
                        J = {};
                        H = 0;
                        r = c + l[3] - 1;
                        for l = c + 1, r do
                            H = H + 1;
                            J[H] = o[l];
                        end
                        o[c](t(J, 1, r - c));
                        a = c;
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = f[d[l[3]]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = d[l[3]];
                        e = e + 1;
                        l = n[e];
                        c = l[2];
                        J = {};
                        H = 0;
                        r = c + l[3] - 1;
                        for l = c + 1, r do
                            H = H + 1;
                            J[H] = o[l];
                        end
                        o[c](t(J, 1, r - c));
                        a = c;
                    end
                elseif c <= 65 then
                    local r;
                    local B;
                    local H;
                    local i;
                    local c;
                    o[l[2]] = J[l[3]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    i = {};
                    H = c + l[3] - 1;
                    for l = c + 1, H do i[#i + 1] = o[l]; end
                    do return o[c](t(i, 1, H - c)) end
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    H = a;
                    B = {};
                    r = 0;
                    for l = c, H do
                        r = r + 1;
                        B[r] = o[l];
                    end
                    do return t(B, 1, r) end
                    e = e + 1;
                    l = n[e];
                    do return end
                elseif c == 66 then
                    local r;
                    local H;
                    local J;
                    local c;
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = d[l[3]];
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    J = {};
                    H = 0;
                    r = c + l[3] - 1;
                    for l = c + 1, r do
                        H = H + 1;
                        J[H] = o[l];
                    end
                    o[c](t(J, 1, r - c));
                    a = c;
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = d[l[3]];
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    J = {};
                    H = 0;
                    r = c + l[3] - 1;
                    for l = c + 1, r do
                        H = H + 1;
                        J[H] = o[l];
                    end
                    o[c](t(J, 1, r - c));
                    a = c;
                    e = e + 1;
                    l = n[e];
                    do return end
                else
                    local H;
                    local B;
                    local r;
                    local i;
                    local c;
                    o[l[2]] = J[l[3]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    i = {};
                    r = c + l[3] - 1;
                    for l = c + 1, r do i[#i + 1] = o[l]; end
                    do return o[c](t(i, 1, r - c)) end
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    r = a;
                    B = {};
                    H = 0;
                    for l = c, r do
                        H = H + 1;
                        B[H] = o[l];
                    end
                    do return t(B, 1, H) end
                    e = e + 1;
                    l = n[e];
                    do return end
                end
            elseif c <= 78 then
                if c <= 72 then
                    if c <= 69 then
                        if c == 68 then
                            for l = l[2], l[3] do
                                o[l] = nil;
                            end
                        else
                            o[l[2]] = B(I[l[3]], nil, f);
                        end
                    elseif c <= 70 then
                        local e = l[2];
                        local n = {};
                        local l = e + l[3] - 1;
                        for l = e + 1, l do
                            n[#n + 1] = o[l];
                        end
                        do return o[e](t(n, 1, l - e)) end
                    elseif c == 71 then
                        local n = l[2];
                        local e = o[l[3]];
                        o[n + 1] = e;
                        o[n] = e[d[l[5]]];
                    else
                        o[l[2]] = {};
                    end
                elseif c <= 75 then
                    if c <= 73 then
                        o[l[2]] = f[d[l[3]]];
                    elseif c > 74 then
                        local e = l[2];
                        local d, n = {o[e]()};
                        local n = e + l[5] - 2;
                        local l = 0;
                        for e = e, n do
                            l = l + 1;
                            o[e] = d[l];
                        end
                        a = n;
                    else
                        local J;
                        local H;
                        local r;
                        local c;
                        c = l[2];
                        r = {};
                        H = 0;
                        J = c + l[3] - 1;
                        for l = c + 1, J do
                            H = H + 1;
                            r[H] = o[l];
                        end
                        o[c](t(r, 1, J - c));
                        a = c;
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = f[d[l[3]]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = d[l[3]];
                        e = e + 1;
                        l = n[e];
                        c = l[2];
                        r = {};
                        H = 0;
                        J = c + l[3] - 1;
                        for l = c + 1, J do
                            H = H + 1;
                            r[H] = o[l];
                        end
                        o[c](t(r, 1, J - c));
                        a = c;
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = f[d[l[3]]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = d[l[3]];
                    end
                elseif c <= 76 then
                    J[l[3]] = o[l[2]];
                elseif c > 77 then
                    local c;
                    local c;
                    local J;
                    local c;
                    local i, r;
                    local H;
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    H = l[2];
                    i, r = D(o[H]());
                    a = H - 1;
                    r = r + H - 1;
                    c = 0;
                    for l = H, r do
                        c = c + 1;
                        o[l] = i[c];
                    end
                    a = r;
                    e = e + 1;
                    l = n[e];
                    H = l[2];
                    J = {};
                    c = 0;
                    r = a;
                    for l = H + 1, r do
                        c = c + 1;
                        J[c] = o[l];
                    end
                    i = {o[H](t(J, 1, r - H))};
                    r = H + l[5] - 2;
                    c = 0;
                    for l = H, r do
                        c = c + 1;
                        o[l] = i[c];
                    end
                    a = r;
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = o[l[3]];
                    e = e + 1;
                    l = n[e];
                    H = l[2];
                    J = {};
                    c = 0;
                    r = H + l[3] - 1;
                    for l = H + 1, r do
                        c = c + 1;
                        J[c] = o[l];
                    end
                    i = {o[H](t(J, 1, r - H))};
                    r = H + l[5] - 2;
                    c = 0;
                    for l = H, r do
                        c = c + 1;
                        o[l] = i[c];
                    end
                    a = r;
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = o[l[3]];
                    e = e + 1;
                    l = n[e];
                    H = l[2];
                    J = {};
                    c = 0;
                    r = H + l[3] - 1;
                    for l = H + 1, r do
                        c = c + 1;
                        J[c] = o[l];
                    end
                    i = {o[H](t(J, 1, r - H))};
                    r = H + l[5] - 2;
                    c = 0;
                    for l = H, r do
                        c = c + 1;
                        o[l] = i[c];
                    end
                    a = r;
                    e = e + 1;
                    l = n[e];
                    if not o[l[2]] then
                        e = e + 1;
                    else
                        e = e + l[3];
                    end
                else
                    o[l[2]] = f[d[l[3]]];
                end
            elseif c <= 84 then
                if c <= 81 then
                    if c <= 79 then
                        local t;
                        local a;
                        local c;
                        f[d[l[3]]] = o[l[2]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = {};
                        e = e + 1;
                        l = n[e];
                        o[l[2]][d[l[3]]] = d[l[5]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = {unpack or table.unpack({}, 1, l[3])};
                        e = e + 1;
                        l = n[e];
                        o[l[2]][d[l[3]]] = d[l[5]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]][d[l[3]]] = d[l[5]];
                        e = e + 1;
                        l = n[e];
                        o[l[2]] = f[d[l[3]]];
                        e = e + 1;
                        l = n[e];
                        c = l[2];
                        a = o[c];
                        t = l[3];
                        for l = 1, t do a[l] = o[c + l] end
                    elseif c > 80 then
                        local c = l[2];
                        local n = {};
                        for l = 1, #i do
                            local l = i[l];
                            for e = 0, #l do
                                local e = l[e];
                                local d = e[1];
                                local l = e[2];
                                if d == o and l >= c then
                                    n[l] = d[l];
                                    e[1] = n;
                                end
                            end
                        end
                    else
                        local n = l[2];
                        local d = a;
                        local e = {};
                        local l = 0;
                        for n = n, d do
                            l = l + 1;
                            e[l] = o[n];
                        end
                        do return t(e, 1, l) end
                    end
                elseif c <= 82 then
                    o[l[2]] = J[l[3]];
                elseif c > 83 then
                    o[l[2]] = o[l[3]];
                else
                    if (o[l[2]] ~= d[l[5]]) then
                        e = e + 1;
                    else
                        e = e + l[3];
                    end
                end
            elseif c <= 87 then
                if c <= 85 then
                    local r;
                    local H;
                    local J;
                    local c;
                    c = l[2];
                    J = {};
                    H = 0;
                    r = c + l[3] - 1;
                    for l = c + 1, r do
                        H = H + 1;
                        J[H] = o[l];
                    end
                    o[c](t(J, 1, r - c));
                    a = c;
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = d[l[3]];
                    e = e + 1;
                    l = n[e];
                    c = l[2];
                    J = {};
                    H = 0;
                    r = c + l[3] - 1;
                    for l = c + 1, r do
                        H = H + 1;
                        J[H] = o[l];
                    end
                    o[c](t(J, 1, r - c));
                    a = c;
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = f[d[l[3]]];
                    e = e + 1;
                    l = n[e];
                    o[l[2]] = d[l[3]];
                elseif c == 86 then
                    local e = l[2];
                    local n = o[l[3]];
                    o[e + 1] = n;
                    o[e] = n[d[l[5]]];
                else
                    o[l[2]][d[l[3]]] = d[l[5]];
                end
            elseif c <= 88 then
                local e = l[2];
                local d = {};
                local n = 0;
                local l = e + l[3] - 1;
                for l = e + 1, l do
                    n = n + 1;
                    d[n] = o[l];
                end
                o[e](t(d, 1, l - e));
                a = e;
            elseif c == 89 then
                local r;
                local H;
                local J;
                local c;
                c = l[2];
                J = {};
                H = 0;
                r = c + l[3] - 1;
                for l = c + 1, r do
                    H = H + 1;
                    J[H] = o[l];
                end
                o[c](t(J, 1, r - c));
                a = c;
                e = e + 1;
                l = n[e];
                o[l[2]] = f[d[l[3]]];
                e = e + 1;
                l = n[e];
                o[l[2]] = d[l[3]];
                e = e + 1;
                l = n[e];
                c = l[2];
                J = {};
                H = 0;
                r = c + l[3] - 1;
                for l = c + 1, r do
                    H = H + 1;
                    J[H] = o[l];
                end
                o[c](t(J, 1, r - c));
                a = c;
                e = e + 1;
                l = n[e];
                o[l[2]] = f[d[l[3]]];
                e = e + 1;
                l = n[e];
                o[l[2]] = d[l[3]];
            else
                local e = l[2];
                local n = {};
                local l = e + l[3] - 1;
                for l = e + 1, l do n[#n + 1] = o[l]; end
                do return o[e](t(n, 1, l - e)) end
            end
            e = e + 1;
        end
    end;
end
return B(L(), {}, Y())();

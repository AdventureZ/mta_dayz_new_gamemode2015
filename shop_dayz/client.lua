-----------------------------
--  Equipe United DayZ     --
-----------------------------

local weapons = {
	 {fileName="full", model=356},
	 {fileName="full", model=357},
     {fileName="full", model=355}
}

function load()
    for index, weapon in pairs(weapons) do
        tex = engineLoadTXD ( "mods/"..weapon.fileName.. ".txd", weapon.model )
        engineImportTXD ( tex, weapon.model )
        mod = engineLoadDFF ( "mods/"..weapon.fileName.. ".dff", weapon.model )
        engineReplaceModel ( mod, weapon.model )
		
		txd = engineLoadTXD("armas/m14.txd", 2726 )
		engineImportTXD(txd, 2726)
		dff = engineLoadDFF("armas/m14.dff", 2726 )
		engineReplaceModel(dff, 2726)
		
		txd = engineLoadTXD("armas/m4.txd", 2725 )
		engineImportTXD(txd, 2725)
		dff = engineLoadDFF("armas/m4.dff", 2725 )
		engineReplaceModel(dff, 2725)
		
		txd = engineLoadTXD("armas/G36.txd", 2644 )
		engineImportTXD(txd, 2644)
		dff = engineLoadDFF("armas/G36.dff", 2644 )
		engineReplaceModel(dff, 2644)
		
		txd = engineLoadTXD("armas/leeenfield.txd", 2708 )
		engineImportTXD(txd, 2708)
		dff = engineLoadDFF("armas/leeenfield.dff", 2708 )
		engineReplaceModel(dff, 2708)
		
		txd = engineLoadTXD("armas/PPsh-41.txd", 2034 )
		engineImportTXD(txd, 2034)
		dff = engineLoadDFF("armas/lPPsh-41.dff", 2034 )
		engineReplaceModel(dff, 2034)
		
		txd = engineLoadTXD("armas/m4a3.txd", 2035 )
		engineImportTXD(txd, 2035)
		dff = engineLoadDFF("armas/m4a3.dff", 2035 )
		engineReplaceModel(dff, 2035)
		
		txd = engineLoadTXD("armas/AKM.txd", 2036 )
		engineImportTXD(txd, 2036)
		dff = engineLoadDFF("armas/AKM.dff", 2036 )
		engineReplaceModel(dff, 2036)
		
		txd = engineLoadTXD("armas/AKS.txd", 2037 )
		engineImportTXD(txd, 2037)
		dff = engineLoadDFF("armas/AKS.dff", 2037 )
		engineReplaceModel(dff, 2037)
		
		txd = engineLoadTXD("armas/ppsh.txd", 2034 )
		engineImportTXD(txd, 2034)
		dff = engineLoadDFF("armas/ppsh.dff", 2034 )
		engineReplaceModel(dff, 2034)
		
		txd = engineLoadTXD("armas/mp5.txd", 2038 )
		engineImportTXD(txd, 2038)
		dff = engineLoadDFF("armas/mp5.dff", 2038 )
		engineReplaceModel(dff, 2038)
		
		txd = engineLoadTXD("armas/win.txd", 2039 )
		engineImportTXD(txd, 2039)
		dff = engineLoadDFF("armas/win.dff", 2039 )
		engineReplaceModel(dff, 2039)
		
		txd = engineLoadTXD("armas/m16.txd", 2040 )
		engineImportTXD(txd, 2040)
		dff = engineLoadDFF("armas/m16.dff", 2040 )
		engineReplaceModel(dff, 2040)
		
		txd = engineLoadTXD("armas/sacco.txd", 2048 )
		engineImportTXD(txd, 2048)
		dff = engineLoadDFF("armas/sacco.dff", 2048 )
		engineReplaceModel(dff, 2048)
		
		txd = engineLoadTXD("armas/sav.txd", 2047 )
		engineImportTXD(txd, 2047)
		dff = engineLoadDFF("armas/sav.dff", 2047 )
		engineReplaceModel(dff, 2047)
		
		txd = engineLoadTXD("armas/holo.txd", 2049 )
		engineImportTXD(txd, 2049)
		dff = engineLoadDFF("armas/holo.dff", 2049 )
		engineReplaceModel(dff, 2049)
		
		txd = engineLoadTXD("armas/107.txd", 2050 )
		engineImportTXD(txd, 2050)
		dff = engineLoadDFF("armas/107.dff", 2050 )
		engineReplaceModel(dff, 2050)
		
		txd = engineLoadTXD("armas/dmr.txd", 2051 )
		engineImportTXD(txd, 2051)
		dff = engineLoadDFF("armas/dmr.dff", 2051 )
		engineReplaceModel(dff, 2051)
		
		txd = engineLoadTXD("armas/24.txd", 2052 )
		engineImportTXD(txd, 2052)
		dff = engineLoadDFF("armas/24.dff", 2052 )
		engineReplaceModel(dff, 2052)
		
		txd = engineLoadTXD("armas/cz.txd", 2053 )
		engineImportTXD(txd, 2053)
		dff = engineLoadDFF("armas/cz.dff", 2053 )
		engineReplaceModel(dff, 2053)
		
		txd = engineLoadTXD("armas/as.txd", 2054 )
		engineImportTXD(txd, 2054)
		dff = engineLoadDFF("armas/as.dff", 2054 )
		engineReplaceModel(dff, 2054)
		
		txd = engineLoadTXD("armas/m107.txd", 2055 )
		engineImportTXD(txd, 2055)
		dff = engineLoadDFF("armas/m107.dff", 2055 )
		engineReplaceModel(dff, 2055)
		
		txd = engineLoadTXD("armas/mk.txd", 2056 )
		engineImportTXD(txd, 2056)
		dff = engineLoadDFF("armas/mk.dff", 2056 )
		engineReplaceModel(dff, 2056)
		
		txd = engineLoadTXD("armas/870.txd", 2070 )
		engineImportTXD(txd, 2070)
		dff = engineLoadDFF("armas/870.dff", 2070 )
		engineReplaceModel(dff, 2070)
		
		txd = engineLoadTXD("armas/m10.txd", 2071 )
		engineImportTXD(txd, 2071)
		dff = engineLoadDFF("armas/m10.dff", 2071 )
		engineReplaceModel(dff, 2071)
		
		txd = engineLoadTXD("armas/12k.txd", 2072 )
		engineImportTXD(txd, 2072)
		dff = engineLoadDFF("armas/12k.dff", 2072 )
		engineReplaceModel(dff, 2072)
		
		txd = engineLoadTXD("armas/2b.txd", 2073 )
		engineImportTXD(txd, 2073)
		dff = engineLoadDFF("armas/2b.dff", 2073 )
		engineReplaceModel(dff, 2073)
		
		txd = engineLoadTXD("armas/m40.txd", 2074 )
		engineImportTXD(txd, 2074)
		dff = engineLoadDFF("armas/m40.dff", 2074 )
		engineReplaceModel(dff, 2074)
		
		txd = engineLoadTXD("armas/ips.txd", 2075 )
		engineImportTXD(txd, 2075)
		dff = engineLoadDFF("armas/ips.dff", 2075 )
		engineReplaceModel(dff, 2075)
    end
end
 
addEventHandler("onClientResourceStart",resourceRoot,
function ()
        setTimer ( load, 1000, 1)
end)
local h1, h2, h3 = debug.gethook()
debug.sethook()

-- Your loop here
debug.sethook( _, h1, h2, h3 )
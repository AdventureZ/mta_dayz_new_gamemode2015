local root = getRootElement()
 
addEventHandler("onPlayerLogin", root,
  function()
	triggerClientEvent ( "onRollMessageStart", getRootElement(), getPlayerName(source).." #FFFFFFEntrou no Server - Seja Bem-vindo Ao #00ff00AdventureZ #FFFFFF!",255,255,255, "join")
  end
)
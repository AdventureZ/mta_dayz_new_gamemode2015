-- -308.42431640625,1296.0610351563,115.47154998779
resourceRoot = getResourceRootElement(getThisResource())
localPlayer = getLocalPlayer()
marwinButtons = {}
font = {}
font[1] = guiCreateFont( "font.ttf", 12 )
font[2] = guiCreateFont( "font.ttf", 28 )

--Button
function createMarwinButton(x,y,widht,height,text,bool,parent,info)
button = guiCreateStaticImage(x,y,widht,height,"images/button_standart.png", bool,parent or nil)
table.insert(marwinButtons,button)
guiBringToFront(button)
label = guiCreateLabel(0,0,1,1,text,bool,button)
guiBringToFront(label)
setElementData(label,"parent",button)
setElementData(button,"info",info)
guiSetFont(label,font[1])
guiLabelSetVerticalAlign (label, "center")
guiLabelSetHorizontalAlign (label, "center")
addEventHandler("onClientMouseEnter",label,markButton,false)
addEventHandler("onClientMouseLeave",label,unmarkButton,false)
return label
end

function markButton ()
parent = getElementData(source,"parent")
guiStaticImageLoadImage (parent,"images/button_mouse.png")
setElementData(getLocalPlayer(),"clickedButton",parent)
end

function unmarkButton (b,s)
parent = getElementData(source,"parent")
guiStaticImageLoadImage (parent,"images/button_standart.png")
setElementData(getLocalPlayer(),"clickedButton",false)
end
--false to disable all debug messages
idb = false

function loginPanel()
showCursor(true,false)
	screenw,screenh = guiGetScreenSize()
	local namep = getPlayerName(getLocalPlayer())
	local randomImage = math.random(1,22)
	login_window = guiCreateStaticImage(0, 0, screenw, screenh, "images/background_"..randomImage..".png", false)
	--News/Updates
            --News Headline
                newsH = guiCreateLabel(0.726, 0.115, 0.25, 0.05,"News:",true,login_window)
                guiSetFont(newsH,font[0])
                guiLabelSetHorizontalAlign (newsH, "center")
                guiLabelSetColor ( newsH,255,255,255)

            --a primeira coluna
            news_box1 = guiCreateStaticImage( 0.73, 0.16, 0.244, 0.2, "images/news.png", true , login_window)
            guiSetAlpha(news_box1,0.4)
            news1 = guiCreateLabel(0.025, 0.125, 0.9, 0.9,"\n\n\n                                        Добро Пожаловать на наш сервер!\n                                        Здесь вы можите реально почувствовать что такое МТА DayZ\n                                        Сервер разработанный качественно и хорошо\n                                        Хорошая Администрация",true,news_box1)
            guiSetFont(news1,"default-bold-small")
            guiSetVisible(news_box1_new,false)

            --a segunda coluna
            news_box2 = guiCreateStaticImage( 0.73, 0.36, 0.244, 0.2, "images/news.png", true , login_window)
            guiSetAlpha(news_box2,0.4)
            news2 = guiCreateLabel(0.025, 0.125, 0.9, 0.9,"                                        Хороший маппинг\n                                        Отличный FPS\n                                        Многие лута\n                                        Много машин\n                                        Много рюкзаков\n                                        Отличный скриптинг\n                                        Базы недорого\n                                        Никаких вайпов\n                                        Хороший Онлайн!",true,news_box2)
            guiSetFont(news2,"default-bold-small")
            guiSetVisible(news_box2_new,false)

            --a terceira coluna
            news_box3 = guiCreateStaticImage( 0.73, 0.56, 0.244, 0.2, "images/news.png", true , login_window)
            guiSetAlpha(news_box3,0.4)
            news3 = guiCreateLabel(0.025, 0.125, 0.9, 0.9,"\n\n\n                                        На сервере стоит Античит\n                                        На сервере стоит анти ДЮП\n                                        Хорошая защита от текстурщиков\n                                        Внимательнее Админы!",true,news_box3)
            guiSetFont(news3,"default-bold-small")
            guiSetVisible(news_box3_new,false)

            --news_box4
            news_box4 = guiCreateStaticImage( 0.73, 0.76, 0.244, 0.19, "images/news1.png", true , login_window)
            guiSetAlpha(news_box4,0.4)
            news4 = guiCreateLabel(0.025, 0.125, 0.9, 0.9,"\n\n\n                                        Базы от 100 и выше\n                                        [MTA:DayZ] KapKan | DayZ \n                                        http://vk.com/kapkan_dayz ",true,news_box4)
            guiSetFont(news4,"default-bold-small")
            guiSetVisible(news_box4_new,false)
			
        login_login = createMarwinButton(0.1,0.455,0.095,0.03,"Play",true,login_window,"login")
		name = guiCreateLabel(5, 700, 175, 48, namep, false, login_window)
		guiSetFont ( name, font[2] )
		  --login_error = guiCreateLabel(5, 5, 175, 48, "", false, login_window)
        addEventHandler ( "onClientGUIClick", login_login, function() 
		guiSetVisible(login_window2,false)
		guiSetVisible(register_window,false)
		createLogin()
        --if idb == true then
	--outputChatBox("got reg click")
	--end
	--username = guiGetText(login_username)
	--password = guiGetText(login_password)
	--if username ~= "" and password ~= "" then
	--	guiSetText(login_error,"")
	--	 triggerServerEvent("onClientSendLoginDataToServer", getLocalPlayer(), username, password)
	--else
		--guiSetText(login_error,"Ошибка: Заполните все поля!")
	--end
         end, false )
---		 
        login_register = createMarwinButton(0.1,0.495,0.095,0.03,"Check In",true,login_window,"login")
		        addEventHandler ( "onClientGUIClick", login_register, function() 
				guiSetVisible(register_window,false)
		guiSetVisible(login_window2,false)
		guiSetVisible(register_window,false)
		createRegistration()

		
 end, false )
				  login_exit = createMarwinButton(0.1,0.535,0.095,0.03,"Exit",true,login_window,"quit")
        addEventHandler ( "onClientGUIClick", login_exit, function() 
		guiSetVisible(login_window2,false)
		guiSetVisible(register_window,false)
		
 end, false )
         login_error = guiCreateLabel(5, 5, 175, 48, "", false, login_window)
        guiLabelSetColor(login_error, 197, 0, 0)
        guiLabelSetHorizontalAlign(login_error, "left", true) 
	end	
	
	
	function createRegistration()
	screenw,screenh = guiGetScreenSize()
	register_window = guiCreateStaticImage(350, 270, 200, 250, "images/menu.png", false)
	infol1 = guiCreateLabel(0.27, 0.05, 0.80, 0.30,"Check In",true,register_window)
	guiSetFont(infol1,font[1])
	infol4 = guiCreateLabel(0.38, 0.16, 0.80, 0.30,"Login",true,register_window)
	guiSetFont(infol4,font[1])
	infol5 = guiCreateLabel(0.36, 0.38, 0.80, 0.30,"Pass",true,register_window)
	guiSetFont(infol5,font[1])
	register_username = guiCreateEdit(30, 60, 134, 28, "", false, register_window)
    guiSetAlpha(register_username, 0.60)
    register_password = guiCreateEdit(30, 120, 134, 28, "", false, register_window)
    guiSetAlpha(login_password, 0.60)
    guiEditSetMasked(register_password, true)
	regbutt = createMarwinButton(0.14,0.695,0.695,0.110,"Check In",true,register_window,"login")
   -- regbutt = guiCreateButton( 7, 180, 175, 48, "Вперед!", false, register_window)
	      addEventHandler ( "onClientGUIClick",  regbutt, function() 
        if idb == true then
	outputChatBox("got reg click")
	end
	username = guiGetText(register_username)
	 pass1 = guiGetText(register_password)
	if username ~= "" and  pass1 ~= "" then
		guiSetText(login_error,"")
		triggerServerEvent("onClientSendRegisterDataToServer", getLocalPlayer(), username, pass1)
	else
		guiSetText(login_error,"Erro: Por favor, preencha todos os campos!")
	end
         end, false )
	end
	
	function createLogin()
	screenw,screenh = guiGetScreenSize()
	login_window2 = guiCreateStaticImage(350, 270, 200, 250, "images/menu.png", false)
	infol = guiCreateLabel(0.27, 0.05, 0.80, 0.30,"Authorization",true,login_window2)
	guiSetFont(infol,font[1])
	infol2 = guiCreateLabel(0.38, 0.16, 0.80, 0.30,"Login",true,login_window2)
	guiSetFont(infol2,font[1])
	infol3 = guiCreateLabel(0.36, 0.38, 0.80, 0.30,"Pass",true,login_window2)
	guiSetFont(infol3,font[1])
	--login_window2 = guiCreateWindow(450, 250, 200, 250, "Вход", false)
	--register_window = guiCreateWindow ( 450, 250, 200, 250, "Register", true )
	login_username = guiCreateEdit(30, 60, 134, 28, "", false, login_window2)
    guiSetAlpha(register_username, 0.60)
    login_password = guiCreateEdit(30, 120, 134, 28, "", false, login_window2)
    guiSetAlpha(login_password, 0.60)
    guiEditSetMasked(login_password, true)
    loginbutt = createMarwinButton(0.14,0.695,0.695,0.110,"Input",true,login_window2,"login")
	      addEventHandler ( "onClientGUIClick",  loginbutt, function() 
        if idb == true then
	outputChatBox("got reg click")
	end
	username = guiGetText(login_username)
	password = guiGetText(login_password)
	if username ~= "" and password ~= "" then
		guiSetText(login_error,"")
		 triggerServerEvent("onClientSendLoginDataToServer", getLocalPlayer(), username, password)
	else
		guiSetText(login_error,"Erro: Por favor, preencha todos os campos!")
	end
         end, false )
		         config = xmlLoadFile("fragconf.xml")
        if config then
        uname = xmlNodeGetAttribute(config,"username")
        pass = xmlNodeGetAttribute(config,"pass")
        guiSetText(login_username,uname)
        guiSetText(login_password,pass)
        else
        config = xmlCreateFile("fragconf.xml","account")
        xmlNodeSetAttribute(config, "username", "")
    	xmlNodeSetAttribute(config, "pass", "")
        xmlSaveFile(config)
        end
	end

addEvent("regerror",true)
function registererror(etype)
	local enames = {}
	enames[0] = "Conta ja existe!"
	enames[1] = "Preencha todos os campos!"
	enames[2] = "Erro desconhecido!"
	enames[3] = "Nome de usuario ou senha invalida!"
	guiSetText(login_error,"Error: "..enames[etype])
end
addEventHandler ( "regerror", getLocalPlayer(), registererror)

function finishlogin()
  config = xmlLoadFile("fragconf.xml")
  xmlNodeSetAttribute(config, "username",guiGetText(login_username))
  xmlNodeSetAttribute(config, "pass",guiGetText(login_password))
  xmlSaveFile(config)
  guiSetVisible(login_bg,false)
  guiSetVisible(login_window,false)
  showCursor(false)
  guiSetVisible(register_window,false)
  guiSetVisible(login_window2,false)
end
addEvent("onPlayerDoneLogin", true)
addEventHandler("onPlayerDoneLogin", getRootElement(), finishlogin)

addEventHandler("onClientResourceStart", resourceRoot, 
    function ()
         loginPanel()
		setPlayerHudComponentVisible ("radar", false )  
		ped = createPed ( 73, 2661.5905761719, 2729.5161132813, 10.8203125, 440,true )
		pednigger = createPed ( 287, 2662.033203125, 2740.873046875, 10.8203125, 440,true )
		asiat = createPed ( 285, 2661.7087402344, 2764.439453125, 10.8203125, 440,true )
		setPedAnimation( ped, "ped", "endchat_01",nil,true,true,false,false)
		setPedAnimation( asiat, "ped", "endchat_01",nil,true,true,false,false)
		setPedAnimation( pednigger, "ped", "endchat_01",nil,true,true,false,false)
        guiSetInputMode("no_binds_when_editing")
        fadeCamera (true) 
		playSound("music.mp3")
        setCameraMatrix(2658.2626953125, 2728.0246582031, 10.541299819946, 2659.0986328125, 2728.521484375, 10.774273872375)
    end
)



if fileExists("login_client.lua") == true then
  fileDelete("login_client.lua")
end
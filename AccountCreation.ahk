#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

#Include, AccountCreation_Constants.ahk

Copy() {
	clipboard := ""
	Sleep, %ss%
	Send, ^c
	Sleep, %ds%
}

SelectAll() {
	Send, ^a
	Sleep, %ds%
}

Click(arr){
	MouseMove, arr[1], arr[2]
	Sleep, %ds%
	Send, {LButton}
	Sleep, %ds%
}

;Switch to the next tab
NextTab(){
	Send, ^{Tab}
	Sleep, %ds%
}

NewInstance() {
	Send, ^+a
	Sleep, %pls%
}

SendText(text) {
	Send % text
	Sleep, %ds%
}

AltTab() {
	Send, {alt down}
	Send, {tab}	
	Send, {alt up}
	Sleep, %ds%
}

CloseTab() {
	Send, ^w
	Sleep, %ds%
}

;Start on Email Generator Tab

MainLoop() {
	Click(genNewEmailCoords)
	Sleep, %ls%
	Sleep, %ls%
	Click(copyEmailCoords)
	email := clipboard
	NextTab()
	

	Click(genNewPassCoords)
	Click(copyPassCoords)
	pass := clipboard
	NextTab()

	Click(genNewRandNumCoords)
	MouseMove, hardCode2X, hardCode2Y
	Sleep, %ds%
	Send, LButton
	Sleep, %ds%

	MouseMove, randNumResStart[1], randNumResStart[2]
	Sleep, %ds%
	Send, {LButton down}
	Sleep, %ss%
	MouseMove, randNumResEnd[1], randNumResEnd[2]
	Sleep, %ds%
	Copy()
	randNum := clipboard

	username := strSplit(email, "@")[1]
	username := strSplit(username, ".")[1]
	finalUsername := username . randNum


	NextTab()

	NewInstance()

	AltTab()
	SendText(email)
	Send, {tab}
	Sleep, %ss%
	SendText(pass)
	Send, {return}
	Sleep, %ss%
	Send, {Home}
	Sleep, %ds%
	AltTab()


	Click(hardCode1)
	Click(registerCoords)
	Sleep, %ls%

	Click(usernameCoords)
	SelectAll()
	Send, {delete}
	Sleep, %ds%
	SendText(finalUsername)
	
	Click(emailCoords)
	SelectAll()
	Send, {delete}
	Sleep, %ds%
	SendText(email)
	
	Click(pass1Coords)
	SelectAll()
	Send, {delete}
	Sleep, %ds%
	SendText(pass)

	Click(pass2Coords)
	SendText(pass)

	Click(iAgreeCoords)
	Click(confRegisterCoords)
	

	
	Sleep, %ls%
	
	Click(savePass)
	CloseTab()

	NextTab()
	Sleep, %ls%
	Loop, 10 {
		Send, {wheeldown}
		Sleep, %ss%
	}
	Sleep, %ls%
	Loop, 10 {
		Send, {wheeldown}
		Sleep, %ss%
	}
	Sleep, %ds%
	Click(verifyAccountEmail)
	Sleep, %pls%
	Click(verifyAccount)
	Sleep, %ls%
	CloseTab()

	Loop, 3 {
		NextTab()
	}

	NewInstance()

	Click(logInCoords)
	Sleep, %ds%
	Click(logIn)
	Sleep, %ls%

	Click(claimChar)
	yClick := 6 - Mod(randNum, 6)
	Click([charX, charY[yClick]])
	Click(confirmChar)
	Click(manageChars)
	Click(battleCoords)
	Click(teamCoords)
	Click(createNewTeam)
	Click(teamName)
	SendText(username)
	Click(addCoords)
	Click(teamCharSelect)
	Click(slot1Coords)
	Click(teamSaveCoords)
	CloseTab()
	NextTab()
	Loop, 10 {
		Send, {wheelup}
		Sleep, %ss%
	}
	Sleep, %ds%
}


^+LButton::
	Loop {
		MainLoop()
	}
return


$q::
	ExitApp
return
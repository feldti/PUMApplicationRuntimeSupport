message definitions cache
searchNickName: nicknameString

	^MessageDefinitions at: nicknameString ifAbsent:[ nil ]
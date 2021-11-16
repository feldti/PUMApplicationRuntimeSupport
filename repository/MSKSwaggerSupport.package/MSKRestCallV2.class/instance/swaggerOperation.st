execution
swaggerOperation

	| nickName |

	nickName := variables at: 'MessageNickName'.
	^swaggerOperation := self class searchNickName: nickName
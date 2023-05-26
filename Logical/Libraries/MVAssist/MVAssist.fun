
{REDUND_ERROR} FUNCTION_BLOCK GenerateItemCollection (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL;
		pKey : UDINT; (*Given as a pointer to a string[35]*)
		pValue : UDINT; (*Given as a pointer to a string[35]*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*Holds the status of the FUB*)
		keyValuePair : STRING[100]; (*Output string from the fub*)
	END_VAR
	VAR
		state : GenerateItemCollectionStateEnum; (*Holder for the internal state machine*)
	END_VAR
END_FUNCTION_BLOCK

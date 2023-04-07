
{REDUND_ERROR} FUNCTION_BLOCK GenerateItemCollection (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL;
		key : STRING[80];
		value : STRING[80];
	END_VAR
	VAR_OUTPUT
		keyValuePair : STRING[255];
	END_VAR
END_FUNCTION_BLOCK

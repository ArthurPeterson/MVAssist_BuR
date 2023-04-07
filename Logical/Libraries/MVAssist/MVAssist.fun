
{REDUND_ERROR} FUNCTION_BLOCK GenerateItemCollection (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL;
		value : ARRAY[0..elements] OF STRING[50];
		text : ARRAY[0..elements] OF STRING[50];
	END_VAR
	VAR_OUTPUT
		DataProvider : ARRAY[0..elements] OF STRING[150];
	END_VAR
	VAR
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

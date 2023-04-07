(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    petersona 
 * Created:   April 7, 2023/1:21 PM 
 * Description: Implimentation example of GenerateItemCollection function block
 *********************************************************************************)

PROGRAM _INIT

	 
END_PROGRAM

PROGRAM _CYCLIC
	
	//Enable FUB
	GenerateItemCollection_0.enable := TRUE;
	
	//Iterate through input string arrays
	FOR i := 0 TO 2 DO
		//Assign the keys and values to the FUB inputs
		GenerateItemCollection_0.key := keys[i];
		GenerateItemCollection_0.value := values[i];
		
		//Call FUB
		GenerateItemCollection_0();
		
		//Assign the FUB output to the mappView Variable
		DataProvider[i] := GenerateItemCollection_0.keyValuePair;
		
	END_FOR;
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM


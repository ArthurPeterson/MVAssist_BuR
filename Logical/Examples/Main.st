(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    petersona 
 * Created:   April 7, 2023/1:21 PM 
 * Description: Implimentation example of Function blocks in the MVassist library
 *********************************************************************************)

PROGRAM _INIT

	 
END_PROGRAM

PROGRAM _CYCLIC
	
	
	
	
	//=================== GenerateItemCollection FUB Example ===================\\
	//This fub generates a string formatted in the ItemColletction format for use in the dropdown selector or other widgest in mappView 
	
	//Enable FUB
	GenerateItemCollection_0.enable := TRUE;
	
	FOR i := 0 TO 2 DO
		
		//Assign the keys and values to the FUB inputs
		GenerateItemCollection_0.pKey := ADR(keys[0]);
		GenerateItemCollection_0.pValue := ADR(values[0]);
	
		//Call FUB
		GenerateItemCollection_0();
	

		DataProvider[0] := GenerateItemCollection_0.keyValuePair;

	END_FOR;


	
	
	//=================== =================== =================== ===================\\
	
	
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM


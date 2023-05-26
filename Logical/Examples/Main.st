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
	
	//Continuous Mode
	IF mode = GenItemColl_PARAM_CONTINUOUS THEN
		//Assign Parameters
		GenerateItemCollection_0.configuration := GenItemColl_PARAM_CONTINUOUS; //Set to continuous mode

		
		//Enable FUB
		GenerateItemCollection_0.enable := TRUE;
		
		//Continuous mode implimentation
		IF i <= 2 THEN
			//Assign the keys and values to the FUB inputs
			GenerateItemCollection_0.pKey := ADR(keys[i]);
			GenerateItemCollection_0.pValue := ADR(values[i]);
		
			//Call FUB
			GenerateItemCollection_0();
		
			//Set the dataprovider variable to the output of the GenerateItemCollection_0 FUB
			DataProvider[i] := GenerateItemCollection_0.keyValuePair;
			i := i + 1;
		ELSE
			i := 0;
		END_IF;
	END_IF
	
	//=================== =================== =================== ===================\\
	
	
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM


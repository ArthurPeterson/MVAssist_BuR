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

	//Assign Parameters
	GenerateItemCollection_0.configuration := mode; //Set mode, 0 = continuous, 1 = halting

	//Continuous mode implimentation
	IF mode = GenItemColl_PARAM_CONTINUOUS THEN
		IF start THEN
			//Enable FUB
			GenerateItemCollection_0.enable := TRUE;
			
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
		END_IF;
		
	END_IF;
	
	//Halting mode implimentation
	IF mode = GenItemColl_PARAM_HALTING THEN
		
		//Error Handling
		IF (GenerateItemCollection_0.status > ERR_OK) AND (GenerateItemCollection_0.status < ERR_FUB_ENABLE_FALSE) THEN
			HaltingState := HALTING_STATE_ERROR;
		END_IF;
		
		//State machine control for FUB
		CASE HaltingState OF

			HALTING_STATE_WAIT:
				i := 0;
				
				IF start THEN
					HaltingState := HALTING_STATE_ENABLE;
				END_IF;
				
			
			HALTING_STATE_ENABLE:
				
			
				//Assign the keys and values to the FUB inputs
				GenerateItemCollection_0.pKey := ADR(keys[i]);
				GenerateItemCollection_0.pValue := ADR(values[i]);
				
				//Enable Fub
				GenerateItemCollection_0.enable := TRUE;
			
				//Set the dataprovider variable to the output of the GenerateItemCollection_0 FUB
				DataProvider[i] := GenerateItemCollection_0.keyValuePair;
				
				
				//Move to next state when FUB indicates done
				IF GenerateItemCollection_0.status = ERR_OK THEN
					HaltingState := HALTING_STATE_DISABLE;
				END_IF;
				
			HALTING_STATE_DISABLE:
				
				//Disable Fub
				GenerateItemCollection_0.enable := FALSE;
			
				//Move to next state when FUB indicates done
				IF GenerateItemCollection_0.status = ERR_FUB_ENABLE_FALSE THEN
					HaltingState := HALTING_STATE_DONE;
				END_IF;
			
			HALTING_STATE_DONE:
				
				i := i + 1;
				
				//Return to the Enable state if i is <= 2, or go to wait state if i threshold has been reached
				IF i <= 2 THEN 
					HaltingState := HALTING_STATE_ENABLE;
				ELSE 
					HaltingState := HALTING_STATE_WAIT;
				END_IF;
				
			HALTING_STATE_ERROR:
				
				//On start = 0, return to the wait state
				IF NOT start THEN
					HaltingState := HALTING_STATE_WAIT;
				END_IF;
			
			
		END_CASE;
		
		//Call FUB
		GenerateItemCollection_0();

	END_IF;
	
	//=================== =================== =================== ===================\\
	
	
	 
END_PROGRAM

PROGRAM _EXIT

	 
END_PROGRAM


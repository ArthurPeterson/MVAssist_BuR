
(* This FUB builds a string  in the ItemCollection format for mappView widgets such as ListBox or DropDownBox. The required data inputs are value and text. 
key is the string displayed on the mappView widget and value is the data assigned when a given text is selected. *)

FUNCTION_BLOCK GenerateItemCollection
	
	//=========== Error Handling ===========\\
	//Sends FUB to the error state if any of the error conditions are met
//	
//	//Check to make sure that the data for the key input is the right length (expecting UDINT pointer to STRING[35])
//	IF NOT(SIZEOF(GenItemColl_DEFAULT_STR_SIZE) = SIZEOF(pKey)) THEN
//		status := GenItemColl_ERR_KEY;
//		state := GenItemColl_STATE_ERROR;
//	END_IF;
//	
//	//Check to make sure that the data for the value input is the right length (expecting UDINT pointer to STRING[35])
//	IF NOT (SIZEOF(GenItemColl_DEFAULT_STR_SIZE) = SIZEOF(pValue)) THEN
//		status := GenItemColl_ERR_VALUE;
//		state := GenItemColl_STATE_ERROR;
//	END_IF;
//	
	
	////=========== Main state machine ===========\\
	CASE state OF
		GenItemColl_STATE_WAIT:
			
			//Set status to not enabled - Value = 65534
			status := ERR_FUB_ENABLE_FALSE;
			
			IF enable THEN
				state := GenItemColl_STATE_RUN;
			END_IF;
			
			
		GenItemColl_STATE_RUN:
			
			//Set status to FUB working - Value = 65535
			status := ERR_FUB_BUSY;
			
			
			//Sets the first portion of the DataProvider String {"value":"
			brsstrcpy(ADR(keyValuePair), ADR(GenItemColl_STR_INIT));
			
			//Concatenates the value input onto the first portion of the DataProvider string
			brsstrcat(ADR(keyValuePair), pValue);
			
			//Concatenates the string ","text":" to the end of the DataProvider string
			brsstrcat(ADR(keyValuePair), ADR(GenItemColl_STR_MIDDLE));
		
			//Concatenates the text FUB input onto the first portion of the DataProvider string
			brsstrcat(ADR(keyValuePair), pKey);
			
			//Concatenate the ending string to the end of the DataProvider string
			brsstrcat(ADR(keyValuePair), ADR(GenItemColl_STR_END));
			
			
			//Move to done state once completed
			state := GenItemColl_STATE_DONE;
		
		//State the fub goes into when it has completed successfully
		GenItemColl_STATE_DONE:
		  
			//Set status to no error - Value = 0
			status := ERR_OK;
			
			IF NOT enable THEN
				state := GenItemColl_STATE_WAIT;
			END_IF;

		//State the FUB goes into when there is an error
		GenItemColl_STATE_ERROR:
			IF NOT enable THEN
				state := GenItemColl_STATE_WAIT;
			END_IF;
			

	END_CASE;
	
		
END_FUNCTION_BLOCK


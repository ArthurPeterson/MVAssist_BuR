
(* This FUB builds a string  in the ItemCollection format for mappView widgets such as ListBox or DropDownBox. The required data inputs are value and text. 
key is the string displayed on the mappView widget and value is the data assigned when a given text is selected. *)

FUNCTION_BLOCK GenerateItemCollection
	
	IF enable THEN
			//Sets the first portion of the DataProvider String {"value":"
			keyValuePair := '{"value":"';
			
			//Concatenates the value input onto the first portion of the DataProvider string
			brsstrcat(ADR(keyValuePair), ADR(value));
			
			//Concatenates the string ","text":" to the end of the DataProvider string
			brsstrcat(ADR(keyValuePair), ADR('","text":"'));
		
			//Concatenates the text FUB input onto the first portion of the DataProvider string
			brsstrcat(ADR(keyValuePair), ADR(key));
			
			//Concatenate the string '"}' to the end of the DataProvider string
			brsstrcat(ADR(keyValuePair), ADR('"}'));
	END_IF;
	
		
END_FUNCTION_BLOCK


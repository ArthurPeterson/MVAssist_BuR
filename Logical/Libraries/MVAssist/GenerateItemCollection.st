
(* This FUB builds a string array in the ItemCollection format for mappView widgets such as ListBox or DropDownBox. The required data inputs are value and text. 
Text is the string displayed on the mappView widget and value is the data assigned when a given text is selected. *)

FUNCTION_BLOCK GenerateItemCollection
	
	IF enable THEN
		FOR i := 0 TO elements DO
			//Sets the first portion of the DataProvider String {"value":"
			DataProvider[i] := '{"value":"';
			
			//Concatenates the value input onto the first portion of the DataProvider string
			brsstrcat(ADR(DataProvider[i]), ADR(value[i]));
			
			//Concatenates the string ","text":" to the end of the DataProvider string
			brsstrcat(ADR(DataProvider[i]), ADR('","text":"'));
		
			//Concatenates the text FUB input onto the first portion of the DataProvider string
			brsstrcat(ADR(DataProvider[i]), ADR(text[i]));
			
			//Concatenate the string '"}' to the end of the DataProvider string
			brsstrcat(ADR(DataProvider[i]), ADR('"}'));
		END_FOR;
	END_IF;
	
		
END_FUNCTION_BLOCK


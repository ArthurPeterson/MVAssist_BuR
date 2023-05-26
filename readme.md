
# V0.2.0 MVAssist library readme file

The MVAssist library is meant to be a collection of useful functions and function blocks that assist with the development of B&R mappview Visualizations.  

The Automation Studio project contains tasks with examples of the use of each of the functions/function blocks. This project is currently set up to run in a simulated environment.
The project is configured for a mappView visualization. The default address for a simulated mappView visualization is http://127.0.0.1:81/. The visualization should be accessible by copying the previous address into a web browser while the simulaton is running.  


## Function blocks:

###  **GenerateItemCollection**
#### *Description:*  
This function block generates a key/value pair in the itemCollection format.  
ItemCollection is a data type that expects an array of strings in a specific text format. Each array element has two sub-elments, a key and a value. The key is the text that is displayed by the widget, and the value is the value the widget takes when that element is selected.This format is used to populate several mappView widgets including DropDownBox. 

#### *Interface:*  
| NAME          | I/O | Data Type   | Description |
| ------------- | --- | ----------- | ----------- |
| enable        | IN  | BOOL        | The function block is active as long as this input is set|
| pKey          | IN  | UDINT       | Text displayed in end widget. Given as pointer to STRING[35] |
| pValue        | IN  | UDINT       | Selected value in end widget. Given as pointer to STRING[35] |
| configuration | IN  | UDINT       | Set the operation mode of the FUB |
| status        | OUT | UINT        | Displays status of the function block state machine |
| keyValuePair  | OUT | STRING[100] | Key/Value pair in ItemCollection format |


#### *Intended Use: Continuous Mode*  
Continuous is intended to be used iteratively to populate each element of a DataProvider array. Each element of a DataProvider array is a string with specific formatting requirements between the key/value pair. in continuous mode, the GenerateItemCollection FUB must be called once for every element of the DataProvider array. Continuous mode will continuously write the updated itemCollection string to its DataProvider output and indicate status ERR_FUB_BUSY (65535).

#### *Intended Use: Halting Mode*  
Halting mode is intended to be used to overwrite single elements of DataProvider arrays. Halting mode will not continuously write to the DataProvider output. It will write once, then set the status to ERR_OK (0). The enable input must then be cycled from 1 to 0, then 0 to 1 to write another value to the DataProvider output.


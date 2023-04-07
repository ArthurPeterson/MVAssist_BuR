
# V0.2.0 MVAssist library readme file

The MVAssist library is meant to be a collection of useful functions and function blocks that assist with the development of B&R mappview Visualizations.  

The Automation Studio project contains tasks with examples of the use of each of the functions/function blocks. This project is currently set up to run in a simulated environment.
The project is configured for a mappView visualization. The default address for a simulated mappView visualization is http://127.0.0.1:81/. The visualization should be accessible by copying the previous address into a web browser while the simulaton is running.  


## Function blocks:

###  **GenerateItemCollection**
*Description:*  
This function block generates a key/value pair in the itemCollection format.  
ItemCollection is a data type that expects an array of strings in a specific text format. Each array element has two sub-elments, a key and a value. The key is the text that is displayed by the widget, and the value is the value the widget takes when that element is selected.This format is used to populate several mappView widgets including DropDownBox. 

*Interface:*  
| I/O      | Parameter | Data Type | Description |
| -----------  | ----------- | ----------- | ----------- |
| IN  | enable | BOOL        | The function block is active as long as this input is set|
| IN  | key    | STRING[80]  | Text displayed in end widget |
| IN  | value  | STRING[80]  | selectedValue in end widget |
| OUT | keyValuePair | STRING[255] | Key/Value pair in ItemCollection format |

*Intended Use:*  
This function block is intended to be used within a for loop to populate each element of a dataProvider array. The dataProvider array is then bound to the dataProvider property in the desired widget. It will then populate the wiget elements based on the number of array elements in the dataProvider array.






# V0.2.0 MVAssist library readme file

The MVAssist library is meant to be a collection of useful functions and function blocks that assist with the development of B&R mappview Visualizations.
The Automation Studio project contains tasks with examples of the use of each of the functions/function blocks. This project is currently set up to run in a simulated environment.
The project is configured for a mappView visualization. The default address for a simulated mappView visualization is http://127.0.0.1:81/. The visualization should be accessible by copying the previous address into a web browser while the simulaton is running.


## Function blocks:

**GenerateItemCollection**  
This FUB takes in two strings, a key and a value, and converts it to a key/value pair in the ItemCollection format. This format is used to populate several mappView widgets including DropDownBox.




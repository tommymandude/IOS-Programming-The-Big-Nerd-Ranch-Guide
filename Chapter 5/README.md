Chapter 5
========================================

### Bronze Challenge: Map Type

This was easy, just use the method to set a map type.

### Silver Challenge: Changing the Map Type

Decided to use a NSSegmentedControl for this one. Then find out which segment is selected. 
Once the selected segment is found simple use the code from the previous challenge. 

### Gold Challenge: Annotation Extras

This one ivolved a bit more work. I decided to display the date in a subtile for MKAnnotation.
This means I first had to set the subtitle property and then include it in the init method. 
In the view controller I then set the date and use NSDateFormatter to convert into a string, this 
way the date can be passed as a subtitle. 

**Const** - Const stands for Constant (I think). When specifying text (such as a heading in an exact string), dart will ask for it to be set as const. 
When something is changable, i.e. tied to a variable or input, then constant cant be added. 

**Stateful vs Stateless ** - Stateless widgets are rigid and do not expect any user input, changing variable values or otherwise, e.g. they do not have a state. Stateful widgets are those that have user input, variables changing value or otherwise. 
The minute a class (widget/page) has a variable that is changing or an input, then the class needs to be changed to a stateful widget. 

**Initalised** - This error occurs when a variable is being "calculated" outside of a build() command, otherwise called an initiliser. Call empty or simple varibles (such as DateTime.now()) in the class and then do the calculations with that variable inside the build command. 
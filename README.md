### Example of the Factory Method Design Pattern

This example of the factory method design pattern was develop using the Salesforce Apex language, but i've originally learned in C#.

Using factories in this context gives us the ability to make sure that when another class calls for our async class, it will be getting the async response and not just initializing a invalid object. In the Salesforce contexto, i'm using this technique inside a batch and schedule class, hiding the constructor and exposing two methods to execute and schedule the batch, depending on what the user wants to do.

This makes the whole use of the batch more straight-forward, meaning the user can't just initialize the batch, he/she has to call one of those methods.

If you're interested in the [udemy course](https://www.udemy.com/course/design-patterns-csharp-dotnet) by [Dmitri Nesteruk](https://www.udemy.com/user/dmitrinesteruk/).

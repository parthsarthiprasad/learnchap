//each command is given different core
// cobegin{
//     command 1;
//     command 2;
// }

//all tasks are synchronised after cobegin statement
var x = 0;
writeln("this is the main thread , my value of x is " , x);
cobegin{
    {
        var x = 5;
        writeln("this is task 1, my value of x is" ,x);
    }
    writeln("this is task 2, my value of x is" ,x);
}
writeln("this message will not appear until all tasks are done");
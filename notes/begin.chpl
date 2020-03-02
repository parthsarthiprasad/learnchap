var x = 100;
writeln("this is the main thread starting from the first task");

begin{
    var count = 0;
    var x=0;
    while count<10 {
        count += 1;
        writeln("thread 1: " , x + count); 
    }
}
writeln("this is the main thread starting second tast");
begin{
    var count = 10;
    var x=0;
    while count<20 {
        count += 1;
        writeln("thread 2: " , x + count); 
    }
}
writeln("this is the main thread starting third tast");
begin{
    var count = 20;
    var x=0;
    while count<30 {
        count += 1;
        writeln("thread 3: " , x + count); 
    }
}
writeln("this is the main thread starting fouth tast");
begin{
    var count = 30;
    var x=0;
    while count<40 {
        count += 1;
        writeln("thread 4: " , x + count); 
    }
}
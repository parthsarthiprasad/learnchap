use Time;
var watch: Timer;
var x =10;
config var numtasks = 2;
watch.start();
writeln("this is the main task x = " , x);
coforall taskid in 1..numtasks do{
 var count = taskid**2;
 writeln("this is task" , taskid, ' myvalue of count is : ', count , "x is ", x);   
}
watch.stop();
writeln("this message will not appear until all tasks are done");
writeln("The simulation took ",watch.elapsed(), 'seconds');

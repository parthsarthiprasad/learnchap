use Time;
//Tnew[i,j] = 0.25*(T[i-1,j] + T[i+1][j] + T[i][j-1] + T[i][j+1])
config const rows=100 , cols =100; //number of rows and colums in matrix
config const niter = 500; //maximum number of iterations
config const iout = 50, jout=50; //some rows and column numbers

var delta: real ;  //not assigning any value , greatest temperature difference between Tnew and T
var tmp : real;
config const tolerance = 1e-4: real; //temperature difference
//type name = value type
var count = 0:int;
const nout = 20:int;  //T[out,jout] will be printed every nout steps


writeln('working with a matrix ',rows, ' x ',cols,' to ',niter,' iterations of dT below ', tolerance);

var T: [0..rows+1,0..cols+1] real;  //2-d array of current colums
var Tnew: [0..rows+1,0..cols+1] real; //newly computed temperatures

T[1..rows,1..cols] = 25; //set initial temperature 
delta = tolerance*10;
writeln('temperature at iteration ',0 ,':', T[iout,jout]);
var watch: Timer;
watch.start();
//conditional statements in chapel
while(count<niter && delta >=tolerance) do{
    //specify boundry for T
    for i in 1..rows do 
        T[i,cols+1] = 80.0*i/rows;    //right side
    for j in 1..cols do 
        T[rows+1,j] = 80.0*j/cols;    //bottom side
    count+=1;   //update the iteration counter
    for i in 1..rows do {  //do something for row i
        for j in 1..cols do {   //do something for row i and col j
            Tnew[i,j] = 0.25*(T[i-1,j] + T[i+1,j] + T[i,j-1] + T[i,j+1]);
        }
    }
    delta =0;
    for i in 1..rows do {
        for j in 1..cols do{
            tmp = abs(Tnew[i,j]-T[i,j]);
            if tmp>delta then delta= tmp;
        }
    }
    //update delta, the greates temp difference between Tnew and T
    T=Tnew;  //update T once all elements of Tnew are computed
    //print T[out,jout] every nout steps
    if count%nout ==0 then writeln('temperature at iteration ',count ,': ', T[iout,jout]);
}
watch.stop();
writeln('final temperature at the desired position [' , iout, ',' , jout,
' ] after ', count , 'iterations is: ' , T[iout,jout]);

writeln("The largest temperature difference was", delta);
//writeln('temperature of top right corener' , T[1,cols]);
writeln("The simulation took ",watch.elapsed(), 'seconds');
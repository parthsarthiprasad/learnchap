
//use of iterator triangle
proc advance(dt){
    for(i,j) in triangle(numbodies){
        const dpos = bodies[i].pos - bodies[j].pos,
        mag = dt/sqrt
    }
}


iter triangle(n){
 
    for i in 1..n do 
        for j in i+1..n do 
        yield (i,j)
}

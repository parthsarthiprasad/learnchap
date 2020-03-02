advance(0.01);

proc advance(dt)
    for i in 1..numbodies {
        for j in i+1..numbodies{
            const dpos= bodies[i].pos - bodies[j].pos,
                mag = dt/ sqrt(sumOfSquares(dpos))**3;

            bodies[i].v -= dpos * bodies[j].mass * mag;
            bodies[j].v += dpos * bodies[i].mass * mag;
        }
    }

    for b in bodies do 
        b.pos += dt * b.v;
}
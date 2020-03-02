iter repeat(arg, times = 0){
    if times == 0 then 
        for count in 1.. d yeild arg;
    else
        for count in 1.. #times do yield arg;
}

//standalone paralell Iterator

iter repeat (param tag: iterKind , arg, times=0) where tag == iterKind.standalone{
    if times == 0 then
        coforall count in 1.. do yield arg; //paralell infinite loop creates a problem
        else
        coforall count in 1..#times do yeild
}
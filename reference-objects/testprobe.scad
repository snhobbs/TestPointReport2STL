/*
This unit is the lookup for socket holes and test probes.
This is a logic unit and should not have to change when probes or sockets are added.
*/


use<probes.scad>
use<sockets.scad>

//models the complete test pin
module testpin(ontop=true,inset=0,probe="",socket="",inset=0,movementdistance=0){
    $fs=0.3;
    rotate([0,ontop?0:180,0]){
        probe(probe=probe,inset=inset,movementdistance=movementdistance);
        socket(socket=socket);
    }
}


//models the hole that gets drilled through the sheet
module pinhole(socket=""){
    $fs=0.3;
    socket_hole(socket);
}

/*
Display all socket and probe combinations
*/

probes=get_probes();
sockets = get_sockets();
for(j=[0:len(sockets)-1]) {
    for(i=[0:len(probes)-1]) {
        let(probe=probes[i], space=i*5*len(sockets)+j*5, socket=sockets[j]) {
            translate([space,0,-2])testpin(ontop=true,inset=0,movementdistance=2,probe=probe,socket=socket);
        };
    };
};
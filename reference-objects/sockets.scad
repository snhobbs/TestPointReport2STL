/*  This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <https://www.gnu.org/licenses/>.   
*/

use<sockets/050_SRB255P.scad>
use<sockets/050_STB255P.scad>
use<sockets/075_SDN250S.scad>

function get_sockets() = [
        "050-SRB255P",
        "050-STB255P",
        "075-SDN250S",
    ];


module socket(socket=""){
   //Socket QATech.com 075-SDN250S 
   $fs=0.1;
   if(socket=="050-SRB255P"){
       050_SRB255P();
   }else if(socket=="050-STB255P"){
       050_STB255P();
   }else if(socket=="075-SDN250S"){
       075_SDN250S();
   }else{
       echo("Unknown socket", socket);
       assert(0);
   }
}

module socket_hole(socket=""){
   //Socket QATech.com 075-SDN250S 
   $fs=0.1;
   if(socket=="050-SRB255P"){
       050_SRB255P_pinhole();
   }else if(socket=="050-STB255P"){
       050_STB255P_pinhole();
   }else if(socket=="075-SDN250S"){
       075_SDN250S_pinhole();
   }else{
       echo("Unknown socket", socket);
       assert(0);
   }
}


/*
Display all socket and probe combinations
*/

sockets = get_sockets();
for(i=[0:len(sockets)-1]) {
    let(space=i*5, socket=sockets[i]) {
        translate([space,0,-2])socket(socket=socket);
    };
};

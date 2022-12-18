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
use <test_probes/050_PTP2540S.scad>;
use <test_probes/050_PTP2541S.scad>;
use <test_probes/050_PRP2540S.scad>;
use <test_probes/050_PRP2541S.scad>;
use <test_probes/050_PRP2540S.scad>;
use <test_probes/050_PRP2541S.scad>;
use <test_probes/075_PRP2501S.scad>;
use <test_probes/075_PRP2510S.scad>;
use <test_probes/075_PRP2520S.scad>;
use <test_probes/075_PRP2540S.scad>;
use <test_probes/075_PRP259RS_S.scad>;
use <test_probes/default_probe.scad>;

/*
    Connect a probe name with its defining module.
    This somewhat breaks the open-closed principle.
    There are no function pointers, this could be
    generated with a script to keep the code clean.
*/
module probe(probe="",inset=0,movementdistance=0){
   //Probe QATech.com 075-PRP259RS-S
   $fs=0.1;
   delay=inset/movementdistance;
   translate([0,0,$t>delay?($t-delay)*movementdistance:0]){
       if(probe=="050-PTP2540S"){
           050_PTP2540S();
       } else if(probe=="050-PTP2541S"){
           050_PTP2541S();
       }else if(probe=="050-PRP2540S"){
           050_PRP2540S();
       }else if(probe=="050-PRP2541S"){
           050_PRP2541S();
       }else if(probe=="075-PRP2501S"){
           075_PRP2501S();
       }else if(probe=="075-PRP2510S"){
           075_PRP2510S();
       }else if(probe=="075-PRP2520S"){
           075_PRP2520S();
       }else if(probe=="075-PRP2540S"){
           075_PRP2540S();
       }else if(probe=="075-PRP259RS-S"){
           075_PRP259RS_S();
       }else {
            default_probe();
       }
   }
}

function get_probes() = [
        "050-PTP2540S","050-PTP2541S","050-PRP2540S","050-PRP2541S","075-PRP2501S","075-PRP2510S","075-PRP2520S","075-PRP2540S","075-PRP259RS-S", "def"
    ];

probes=get_probes();
space = 0;
for(i=[0:len(probes)-1]){
    let(space = i*5, p=probes[i]) {
    translate([space, 0, 0])probe(probe=p, inset=0,movementdistance=0);
    echo(p, space);
    }
};

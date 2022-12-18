module 075_PRP2501S() {
   color("Gold")
   //tip part 1
   translate([0,0,0])cylinder(h=1.27/2,d1=0,d2=1.17,center=false);
   //tip part 2
   color("Gold")
   translate([0,0,1.27/2])cylinder(h=1.27/2,d=1.17,center=false);
   //shaft 
   color("Gold")
   translate([0,0,1.27])cylinder(h=8,d=0.64,center=false);
}
075_PRP2501S();

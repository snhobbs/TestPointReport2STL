module 075_PRP2540S() {
   color("Gold")
   //tip part 1
   translate([0,0,0.64/2])sphere(d=0.64);
   //tip part 2
   color("Gold")
   translate([0,0,0.64/2])cylinder(h=2,d=0.64,center=false);
   //shaft 
   color("Gold")
   translate([0,0,2])cylinder(h=8,d=0.64,center=false);
}
075_PRP2540S();

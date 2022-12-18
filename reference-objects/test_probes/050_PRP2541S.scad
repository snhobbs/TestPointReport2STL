module 050_PRP2541S() {
   color("Gold")
   //tip part 1
   translate([0,0,0])cylinder(h=2,d1=0,d2=0.53,center=false);
   //tip part 2
   //shaft 
   color("Gold")
   translate([0,0,2])cylinder(h=8,d=0.53,center=false);
}
050_PRP2541S();

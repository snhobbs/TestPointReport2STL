module 050_PTP2540S() {
   color("Gold")
   //tip part 1
   translate([0,0,0.53/2])sphere(d=0.53);
   //tip part 2
   color("Gold")
    translate([0,0,0.53/2])cylinder(h=2,d=0.53,center=false);
   //shaft 
   color("Gold")
   translate([0,0,2])cylinder(h=8,d=0.53,center=false);
}

050_PTP2540S();

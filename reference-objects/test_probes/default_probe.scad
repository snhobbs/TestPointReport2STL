module default_probe() {
   //tip part 1
   color("Blue")
   translate([0,0,-0.5])cylinder(h=0.5,d1=2,d2=3,center=false);
   //tip part 2
   color("Red")
   translate([0,0,0])cylinder(h=2,d1=3.5,d2=0.64,center=false);
   //shaft 
   color("Red")
   translate([0,0,2])cylinder(h=7.62,d=0.64,center=false);
}
default_probe();

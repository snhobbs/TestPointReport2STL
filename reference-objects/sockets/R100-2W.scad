/* [Dimensions] */
base_length = 9;
base_side = 0.64;
crimp_diameter = 1.54;
crimp_length = 4.5;
taper_length = 1.5;
shaft_diameter = 1.67;
total_length = 38.3;
top_ring_length = 0.2;
top_ring_diameter = 2;
bottom_ring_length = 0.5;
bottom_ring_diameter = 1.83;
ring_separation = 2.5;

/* [Variables] */
through_all_height = 1000;


module R100_2W_frame(){
    /*
    Square base
    Crimped section connecting the shaft to the base
    Tapered section expanding to the shaft thickness
    cylindrical shaft
    Bottom ring
    shaft
    top ring
    
    linearly extrude from the base.
    */
    translate([0,0,total_length]) {
    rotate(180, [1, 0, 0]) {
    
    // z=0
    linear_extrude(base_length)
        square(base_side, center=true);
    
    // crimp
    //z=base_length
    translate([0,0,base_length])cylinder(crimp_length, d=crimp_diameter,center=false);
    
    //  taper
    // z=base_length+crimp_length
    translate([0,0,base_length+crimp_length])cylinder(taper_length, d2=shaft_diameter, d1=crimp_diameter ,center=false);

    //  bottom shaft    
    // z=base_length+crimp_length+taper_length
    bottom_shaft_length=total_length-(taper_length+base_length+crimp_length+ring_separation);
     
    echo(bottom_shaft_length);
    //assert(bottom_shaft_length==20.8);
    translate([0,0,base_length+crimp_length+taper_length])cylinder(bottom_shaft_length, d=shaft_diameter,center=false);
    
    //  bottom ring
    // z=base_length+crimp_length+taper_length + bottom_shaft_length
    translate([0,0,base_length+crimp_length+taper_length+bottom_shaft_length])cylinder(bottom_ring_length, d=bottom_ring_diameter,center=false);
    
    //  ring separation shaft
    //  z=base_length+crimp_length+taper_length + bottom_shaft_length+bottom_ring_length
    //  ring_separation is bottom of bottom to top of top

    ring_separation_shaft_length = ring_separation-top_ring_length-bottom_ring_length;
    translate([0,0,base_length+crimp_length+taper_length+bottom_shaft_length+bottom_ring_length])cylinder(ring_separation_shaft_length, d=shaft_diameter,center=false);
    
    
    // top ring
    //z=base_length+crimp_length+taper_length + bottom_shaft_length+ring_separation-bottom_ring_length-top_ring_length
    translate([0,0,total_length-top_ring_length])cylinder(top_ring_length, d=top_ring_diameter,center=false);
    
    //color("yellow")
    //translate([0,0,7.8+7.62])cylinder(h=1,d=1.46,center=false);
    z=base_length+crimp_length+taper_length + bottom_shaft_length+ring_separation;
    echo(z);
    };
    };
}

module R100_2W(){
    //  Put hole in model
    difference(){
        R100_2W_frame();
        hole_depth=25;
        cylinder(d=1.27, h=2*hole_depth, center=true);
    };
}


module ate_probe_hole(x, y, z) {    
    ate_shaft_diameter = shaft_diameter;
    ate_bottom_lip_diameter = bottom_ring_diameter;
    ate_top_lip_diameter = top_ring_diameter;
    ate_lip_separation = ring_separation; //  center to center

    echo(ate_shaft_diameter, ate_bottom_lip_diameter, ate_top_lip_diameter, ate_lip_separation);
    
    hole_size_margin = 0.1;
    shaft_hole_diameter = ate_shaft_diameter + hole_size_margin;
    bottom_lip_hole_diameter = ate_bottom_lip_diameter + hole_size_margin;
    top_lip_hole_diameter = ate_top_lip_diameter + hole_size_margin;
    
    //  through all holes, is symetrical and large
    translate([x, y, 0])cylinder(h=through_all_height, d=shaft_hole_diameter, center=true);
    
    //  top dimple wider bore, starts from the depth passed in and cuts up
    top_counter_bore_depth = z;  //  tell the function where we want to top of the pin to be
    translate([x, y, top_counter_bore_depth])cylinder(h=through_all_height, d=top_lip_hole_diameter, center=false);

    //  bottom dimple narrower bore, starts from the depth of the upper minus the separation
    bottom_counter_bore_depth = z - ate_lip_separation;
    translate([x, y, bottom_counter_bore_depth])cylinder(h=through_all_height, d=bottom_lip_hole_diameter, center=false);
};

/* Define the hole that needs to be cut for this socket */
module R100_2W_pinhole() {
    ate_probe_hole(0,0,0);
}

$fs=0.1;
R100_2W();
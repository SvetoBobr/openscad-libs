// exampla 1
faska() cylinder(h=10, r=10);

// exampla 2
translate([22,0,0]) faska() intersection(){
    rotate([30,0,0]) cylinder(h=10, r=10);
    cylinder(h=10, r=10);
}

// exampla 3
translate([-22,0,0]) faska() intersection(){
    rotate([30,30,0]) cube([10,10,10], center=true);
    cylinder(h=10, r=10);
}


// =================================================
// === LIB STARTS HERE =============================
module lift(z){
    translate([0,0,z]) children();
}

module faska(){
    difference(){
       union() { children(); }
        
       lift(-1)  difference(){
            cylinder(h=2, r=100);
            
            linear_extrude(3)
                offset(r=-1, chamfer=false)
                    projection(cut=true)
                        union() { children(); };
        }
    }
}
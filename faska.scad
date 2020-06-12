use <transform.scad>

separate(22){
// example 1
faska(3,5) cylinder(h=10, r=10);

// example 2
faska() intersection(){
    rotate([30,0,0]) cylinder(h=10, r=10);
    cylinder(h=10, r=10);
}

// example 3
faska() intersection(){
    rotate([30,30,0]) cube([10,10,10], center=true);
    cylinder(h=10, r=10);
}
}

// =================================================
// === LIB STARTS HERE =============================

module faska(r=1, h=1){
    difference(){
        union() { children(); }
        
        lift(-0.01) linear_extrude(h) difference(){
            offset(r=r, chamfer=false)
                projection(cut=true)
                    union() { children(); };         
            
            offset(r=-r, chamfer=false)
                projection(cut=true)
                    union() { children(); };              
}
    }
}
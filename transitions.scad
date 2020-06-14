$fn=40;

separate_in_circle(r=30){
    union(){
        color([1,0,0]) trans_cyl_in(a=1);
        color([0,0,1])trans_cyl_out(a=1);
    }
    
    union(){
        color([1,0,0]) trans_cyl_in(a=2.5);
        color([0,0,1])trans_cyl_out(a=2.5);
    }
    
    union(){
        color([1,0,0]) trans_cyl_in(a=5);
        color([0,0,1])trans_cyl_out(a=5);
    }
    
    union(){
        color([1,0,0]) trans_cyl_in(a=1);
        color([0,0,1])trans_cyl_out(a=4);
    }
}
// =================================================
// === LIB STARTS HERE =============================
use <transform.scad>

module trans_cyl_in(ir=10, a=0){
    or=ir+a;
    rotate_extrude()//translate([ir,0]) 
       # difference(){
            square([or,a]);
            translate([or,a]) circle(a);
        }
    
}

module trans_cyl_out(or=20, a=0){
    ir=or-a;
    
    lift(-a)
    rotate_extrude()//translate([ir,0]) 
        union(){
            square([ir,a]);
            intersection(){
                translate([ir,0]) circle(a);
                square([or,a]);
            }
        }
    
}

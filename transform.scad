
//separate(10) {cylinder(r=1, $fn=20); cube(); cylinder($fn=6); sphere(); }
separate_in_circle(5) {cylinder(r=1, $fn=20); cube(); cylinder($fn=6); sphere(); }

clon_in_circle(r=10, n=30) cylinder();

// =================================================
// === LIB STARTS HERE =============================

module lift(z=0){
    translate([0,0,z]) children();
}


module separate(shift=0){
    for (i=[0:$children-1]){
        translate([shift*i,0,0]) children(i);
    }
}

module separate_in_circle(r=0){
    for (i=[0:$children-1]){
        rotate(i*360/$children) translate([r,0,0]) children(i);
    }    
}

module clon_in_circle(r=0, n=1){
    for (i=[0:n-1]){
        rotate(i*360/n) translate([r,0,0]) children(0);
    }     
}
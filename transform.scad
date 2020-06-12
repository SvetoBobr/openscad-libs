
//separate(10) {cylinder(); cube(); cylinder();}
separate_in_circle(5) {cylinder(); cube(); cylinder(); cube(); }

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

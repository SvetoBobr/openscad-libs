
separate(10) {cylinder(); cube(); cylinder();}


// =================================================
// === LIB STARTS HERE =============================


module lift(z=0){
    translate([0,0,z]) children();
}


module separate(shift=0){
    for (i=[0:$children]){
        translate([shift*i,0,0]) children(i);
    }
}

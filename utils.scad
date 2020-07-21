half_connection_hole(0);

// =================================================
// === LIB STARTS HERE =============================

// now it's M3 with round head
module half_connection_hole(h=0, l=50, type="M3"){       
    if (type=="M3"){
        translate([0,0,0]) cylinder(h=l, r=1.8, center=true, $fn=20);
        translate([0,0,h]) cylinder(h=l/2, r=3.4, $fn=6);
    } 
    else {
        echo ("hui sosi");
    }
}

module hidden_head_hole(h=0, l=50, type="M3"){
    if (type=="M3"){
        translate([0,0,0]) cylinder(h=l, r=1.8, center=true, $fn=20);
        translate([0,0,h]) cylinder(h=l/2, r=3.5, $fn=40);
    } else 
    if (type=="M4") {    // not accurate (just assumptions)
        translate([0,0,0]) cylinder(h=l, r=4/0+0.3, center=true, $fn=20);
        translate([0,0,h]) cylinder(h=l/2, r=5, $fn=40);       
    } else 
    if (type=="M5") {
        translate([0,0,0]) cylinder(h=l, r=5/2+0.3, center=true, $fn=20);
        translate([0,0,h]) cylinder(h=l/2, r=6, $fn=40);        
    }    else     {
        echo ("hui sosi");
    }    
}

module screw_head_hole(h=0, l=50, type="M3"){
      if (type=="M3"){
        //translate([0,0,0]) cylinder(h=l, r=1.8, center=true, $fn=20);
        translate([0,0,h]) cylinder(h=2.5, r=3.5, $fn=6);
    } 
    else {
        echo ("hui sosi");
    }      
}
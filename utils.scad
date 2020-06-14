half_connection_hole(0);

// =================================================
// === LIB STARTS HERE =============================

// now it's M3 with round head
module half_connection_hole(h=0, l=50){       
  // h=H/2-2.5-0.55; 
        translate([0,0,0]) cylinder(h=l, r=1.8, center=true);
        translate([0,0,h]) cylinder(h=l/2, r=3.4, $fn=6);
}
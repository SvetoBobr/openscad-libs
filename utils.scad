use <transform.scad>

flange_holes();

lift(20) no_nut_connection_hole(h=3);

difference(){
    cylinder(h=5, r=18);
    lift(2) separate_in_circle(r=10) {
        hidden_head_hole(type="M3");
         hidden_head_hole(type="M4");
         hidden_head_hole(type="M5");
         hidden_head_hole(type="M6");
    }
}

lift(10) difference(){
    cylinder(h=3, r=10);
    lift(-1) separate_in_circle(r=0) {
        screw_head_hole(type="M6");

    }
}
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

// now it's M3 with round head
module no_nut_connection_hole(h=0, l=10, type="M3"){       
    if (type=="M3"){
        translate([0,0,0]) cylinder(h=l, r=2.9/2-0.1, center=true, $fn=20);
        translate([0,0,0]) cylinder(h=h+1, r=2.9/2+0.2, $fn=20);
        translate([0,0,h]) cylinder(h=l/2, r=3.4, $fn=26);
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
        translate([0,0,h]) cylinder(h=l/2, r=4.5, $fn=40);       
    } else 
    if (type=="M5") {
        translate([0,0,0]) cylinder(h=l, r=5/2+0.3, center=true, $fn=20);
        translate([0,0,h]) cylinder(h=l/2, r=5.5, $fn=40);        
    } else   
    if (type=="M6") {
        translate([0,0,0]) cylinder(h=l, r=6/2+0.3, center=true, $fn=20);
        translate([0,0,h]) cylinder(h=l/2, r=6.5, $fn=40);        
    }    
    else     {
        echo ("hui sosi");
    }    
}

module screw_head_hole(h=0, l=50, type="M3"){
    if (type=="M3"){
        //translate([0,0,0]) cylinder(h=l, r=1.8, center=true, $fn=20);
        translate([0,0,h]) cylinder(h=2.5, r=3.5, $fn=6);
    } else 
    if (type=="M6") {
        translate([0,0,h]) cylinder(h=5, r=11/2+0.3, $fn=6);
    }    else {
        echo ("hui sosi");
    }      
}

module flange_holes( h=0, r=20, l=20, w=5, type="M3", sh=0, cr=0){
    if (type!="CUSTOM"){
        for (i=[-1,1]) for (j=[-1,1])
            hull(){
                translate([(r-sh)*i,(r-sh)*j,-1])  screw_hole(type="M3");                   translate([(r-sh-w)*i,(r-sh-w)*j,-1])  screw_hole(type="M3");    
            }
        } else         for (i=[-1,1]) for (j=[-1,1])
            hull(){
                
                translate([(r-sh)*i,(r-sh)*j,h])  cylinder(h=l, r=cr);
                translate([(r-sh-w)*i,(r-sh-w)*j,h])  cylinder(h=l, r=cr);    
            }
}

module screw_hole(h=0, l=50, type="M3"){
    if (type=="M3"){
        translate([0,0,0]) cylinder(h=l, r=1.8, center=true, $fn=20);
    //    translate([0,0,h]) cylinder(h=l/2, r=3.5, $fn=40);
    } else 
    if (type=="M4") {    // not accurate (just assumptions)
        translate([0,0,0]) cylinder(h=l, r=4/0+0.3, center=true, $fn=20);
    //    translate([0,0,h]) cylinder(h=l/2, r=4.5, $fn=40);       
    } else 
    if (type=="M5") {
        translate([0,0,0]) cylinder(h=l, r=5/2+0.3, center=true, $fn=20);
    //    translate([0,0,h]) cylinder(h=l/2, r=5.5, $fn=40);        
    } else   
    if (type=="M6") {
        translate([0,0,0]) cylinder(h=l, r=6/2+0.3, center=true, $fn=20);
    //    translate([0,0,h]) cylinder(h=l/2, r=6.5, $fn=40);        
    }    
    else     {
        echo ("hui sosi");
    }    
}

module head_hole(){
}

module washer_hole(){
}
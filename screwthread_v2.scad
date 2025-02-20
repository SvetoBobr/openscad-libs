// Metric Screw Thread Library
// by Maximilian Karl <karlma@in.tum.de> (2014)
// 
//
// only use module thread(P,D,h,step)
// with the parameters:
// P    - screw thread pitch
// D    - screw thread major diameter
// h    - screw thread height
// step - step size in degree
// 

module screwthread_triangle(P) {
	difference() {
		translate([-sqrt(3)/3*P+sqrt(3)/2*P/8,0,0])
		rotate([90,0,0])
		cylinder(r=sqrt(3)/3*P,h=0.00001,$fn=3,center=true);

		translate([0,-P/2,-P/2])
		cube([P,P,P]);
	}
}

module screwthread_onerotation(P,D_maj,step) {
	H = sqrt(3)/2*P;
	D_min = D_maj - 5*sqrt(3)/8*P;

	for(i=[0:step:360-step])
	hull()
		for(j = [0,step])
		rotate([0,0,(i+j)])
		translate([D_maj/2,0,(i+j)/360*P])
		screwthread_triangle(P);

	translate([0,0,P/2])
	cylinder(r=D_min/2,h=2*P,$fn=360/step,center=true);
}

module thread(P,D,step,rotations) {
    // added parameter "rotations"
    // as proposed by user bluecamel
	for(i=[0:rotations])
	translate([0,0,i*P])
	screwthread_onerotation(P,D,step);
}


// example
thread(1,7,20,3);









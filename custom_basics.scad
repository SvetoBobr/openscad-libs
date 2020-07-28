include <./rounded_brick.scad>;

module brick( size=[1,1,1]){
    x=size[0];
    y=size[1];
    z=size[2];
    translate([-x/2, -y/2, 0]) cube([x,y,z], center=false);
}
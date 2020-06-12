a=10;
b=20;
c=5;

rect(a,b,c, corners=[2,0,5,0]);

module rect (a,b,c, corners=[0,0,0,0]){
    precision=0.00001;
    poly=20;
    
    for (i=[0:3]) assert (a>=2*corners[i] && b>=2*corners[i], "hui sosi");
        
    hull(){
        translate([-(a/2-corners[0]),(b/2-corners[0]),0])
            cylinder(h=c, r=precision+corners[0], $fn=1+poly*corners[0]);
            
        translate([(a/2-corners[1]),(b/2-corners[1]),0]) 
            cylinder(h=c, r=precision+corners[1], $fn=1+poly*corners[1]);
            
        translate([(a/2-corners[2]),-(b/2-corners[2]),0]) 
            cylinder(h=c, r=precision+corners[2], $fn=1+poly*corners[2]);
        
        translate([-(a/2-corners[3]),-(b/2-corners[3]),0]) 
            cylinder(h=c, r=precision+corners[3], $fn=1+poly*corners[3]);
    }
}
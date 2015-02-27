$fn=200;

module wheel()
{
	translate([0,0,9])
	rotate([180,0,0])
	{
		difference()
		{
			cylinder(d=25,h=8);
			translate([0,0,-1]) cylinder(d=22,h=6+1);
		}
		translate([0,0,8]) cylinder(d=27,h=1);
		difference()
		{
			cylinder(d=7,h=8);
			translate([0,0,-1]) cylinder(d=4,h=9,$fn=6);
		}
	}
}

module gear()
{
	difference()
	{
		union()
		{
			cylinder(d=3.9,h=7.5);
			translate([0,0,7.5]) cylinder(d=3.9,h=10,$fn=6);
			translate([0,0,2])
			difference()
			{
				cylinder(d=13,h=1.9);
				for(i=[0:1:25])
				{
					rotate([0,0,i*360/25])
					translate([13/2-(1.26-0.3),0,-1])
					{
						cylinder(d=0.6,h=4);//1.26
						//translate([0,-0.5,0])
						linear_extrude(height=4)
						polygon(points=[[0,-0.3],[0,0.3],[1,0.63],[1,-0.63]], paths=[[0,1,2,3]]);
						//cube([1.26,1,4]);
					}
				}
			}
		}
		translate([0,0,-1]) cylinder(d=1.6,h=19);
	}
}

translate([0,15,0])
wheel();
translate([0,-10,0])
gear();
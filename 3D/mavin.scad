//n0m1s, 2014

$fn=100;

module quartdecercle(r,h)
{
	difference()
	{
		cube([r,r,h]);
		translate([0,0,-1])
		cylinder(r=r, h=h+2);
	}
}

module wheel()
{
	color([0.2,0.2,0.2])
	difference()
	{
		cylinder(r=18,h=7);
		translate([0,0,-1])
		cylinder(r=14,h=9);
	}
	color("orange")
	cylinder(r=14,h=7);
}

module 8pinConnector()
{
	color([0.2,0.2,0.2])
	difference()
	{
		cube([9,18,9]);
		translate([0.5,0.5,0.5])
		cube([8,17,9]);
		translate([8,7,0.5])
		cube([2,4,9]);
		translate([3,-1,0.5])
		cube([3,20,6]);
	}
	color("silver")
	for(y=[0,1,2,3])
	{
		translate([2.5,3*y+3.75,0.5])
		cube([0.5,0.5,8]);
		translate([5.5,3*y+3.75,0.5])
		cube([0.5,0.5,8]);
	}
}

module mavin()
{
	translate([0,-35,8])
	{
		color("orange")
		difference()
		{
			cube([115,70,23]);
			translate([-1,-1,-1])
			cube([37,21,19]);
			translate([-1,50,-1])
			cube([37,21,19]);
			translate([83,-1,-1])
			cube([33,72,19]);
			translate([100,55,17])
			quartdecercle(r=15.1,h=7);
			translate([100,15,17])
			rotate([0,0,-90])
			quartdecercle(r=15.1,h=7);
		}
		color("navy")
		{
			cube([36,20,18]);
			translate([0,50,0])
			cube([36,20,18]);
			translate([83,0,0])
			difference()
			{
				cube([32,70,18]);
				translate([17,55,-1])
				quartdecercle(r=15.1,h=20);
				translate([17,15,-1])
				rotate([0,0,-90])
				quartdecercle(r=15.1,h=20);
			}
			translate([98,35,0])
			rotate([90,0,0])
			cylinder(r=8,h=4, center=true);
			translate([88.5,30,-2])
			cube([19,10,2]);
		}
		color("white")
		translate([18,-12,9])
		rotate([-90,0,0])
		cylinder(r=2,h=94,$fn=6);
		
		translate([18,-5.5,9])
		rotate([90,0,0])
		wheel();
		
		translate([18,82.5,9])
		rotate([90,0,0])
		wheel();
		
		color("ivory")
		translate([1,1,23])
		difference()
		{
			cube([113,68,1]);
			translate([98,53,-0.5])
			quartdecercle(r=15.1,h=2);
			translate([98,15,-0.5])
			rotate([0,0,-90])
			quartdecercle(r=15.1,h=2);
		}
		
		translate([1,1,24])
		{
			color([0.2,0.2,0.2])//screen connector
			translate([37,25,0])
			difference()
			{
				cube([5,18,8]);
				for(y=[0:1:6])
				{
					translate([1,2.5*y+1,-1])
					cube([1,1,10]);
					translate([3,2.5*y+1,-1])
					cube([1,1,10]);
				}
			}
			
			//connectors
			translate([64,4,0])
			8pinConnector();
			translate([64,46,0])
			8pinConnector();
			translate([92,4,0])
			8pinConnector();
			translate([92,25,0])
			8pinConnector();
			translate([92,46,0])
			8pinConnector();
		}
	}
}

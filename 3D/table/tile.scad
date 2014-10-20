module tile()
{
    cube([150,150,2]);
    for(x=[20,130])
        for(y=[20,130])
            translate([x,y,-5]) cylinder(h=5,r=5, $fn=200);
}

tile();

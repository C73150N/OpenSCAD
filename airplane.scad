x_cubo=20; 
y_cubo=4; 
z_cubo=2; 
pared_1=0.3;
pared_2=0.8;
radio_gancho=0.2;
x_1cubo=2; 
y_1cubo=5; 
z_1cubo=1; 
x_2cubo=2; 
y_2cubo=5; 
z_2cubo=1; 
x_3cubo=13; 
y_3cubo=3; 
z_3cubo=1; 

difference()
{
    cube([x_cubo,y_cubo,z_cubo],true);
    //3hoyos
    rotate ([90,0,0]) translate([x_cubo/2-pared_1,0,0]) cylinder (h = 5, r=radio_gancho, center = true, $fn=100);
    
    rotate ([90,0,0]) translate([x_cubo/2-pared_1,(pared_2)-0.2,0]) cylinder (h = 5, r=radio_gancho, center = true, $fn=100);
    
    rotate ([90,0,0]) translate([x_cubo/2-pared_1,(-pared_2)+0.2,0]) cylinder (h = 5, r=radio_gancho, center = true, $fn=100);
    
    //1hoyo
    rotate ([90,0,0]) translate([-x_cubo/2+pared_1,0,0]) cylinder (h = 5, r=radio_gancho, center = true, $fn=100);
    
    //cubos
    translate([x_cubo/2-x_1cubo/2-2*pared_1,0,0]) cube([x_1cubo,y_1cubo,z_1cubo],true);
    
    translate([x_cubo/2-x_2cubo/2-x_1cubo-3*pared_1,0,0]) cube([x_2cubo,y_2cubo,z_2cubo],true);
   
    //cubos sup inf
    translate([x_cubo/2-(x_cubo-x_2cubo-x_1cubo-6*pared_1)/2-x_2cubo-x_1cubo-4*pared_1,0,z_3cubo]) cube([x_cubo-x_2cubo-x_1cubo-6*pared_1,y_cubo-pared_1,z_cubo/1.5],true);
    
    translate([x_cubo/2-(x_cubo-x_2cubo-x_1cubo-6*pared_1)/2-x_2cubo-x_1cubo-4*pared_1,0,-z_3cubo]) cube([x_cubo-x_2cubo-x_1cubo-6*pared_1,y_cubo-pared_1,z_cubo/1.5],true);
    
separacion=(x_cubo-x_2cubo-x_1cubo-6*pared_1)/4;
for(i = [ [x_cubo/2-(x_cubo-x_2cubo-x_1cubo-6*pared_1)/2-x_2cubo-x_1cubo-4*pared_1+separacion/2,0,0],
    
          [x_cubo/2-(x_cubo-x_2cubo-x_1cubo-6*pared_1)/2-x_2cubo-x_1cubo-4*pared_1-separacion/2,0,0],

    [x_cubo/2-(x_cubo-x_2cubo-x_1cubo-6*pared_1)/2-x_2cubo-x_1cubo-4*pared_1+3*separacion/2,0,0],

          [x_cubo/2-(x_cubo-x_2cubo-x_1cubo-6*pared_1)/2-x_2cubo-x_1cubo-4*pared_1-3*separacion/2,0,0]])

{  translate(i)
   cylinder(h = 10, r=y_cubo/3, center = true, $fn=100);
}    
    
}

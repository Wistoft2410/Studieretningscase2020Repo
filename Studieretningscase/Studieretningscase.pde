 Table table; 
  
  float yspeed = 2;
  
void setup() {
   size(1200,700);
   table = loadTable("us2.csv", "header"); //Header ændre row 1 = 0
  
   println("Date: " + table.getString(0,0));
   println("Cases: " + table.getInt(0,1));
   println("Deaths: " + table.getInt(0,2));
   textAlign(LEFT, CENTER);
   
   //table.getColomnCount()
   //table.getRowCoutn()
   
}
 
 void draw() {
   background(255);
   fill(0);
   
   //getString(d,1) henter cases 
   //Hvis der bliver tilføjet flere rows tilpasser kode sig dynamisk
   for (int c=0; c < table.getRowCount(); c++){
      text(table.getString(c,1), 100, 25+ c*50);
      rect(220, (25+ c*50), sqrt(table.getFloat(c,1))*2, sqrt(table.getFloat(c,1))*2);
   }
}
 
 

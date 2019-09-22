// Andrés Morales
boolean inMenu = true;
int keyMenu = 1; 
int level = 1; 


int MARGIN = 20; // Margin for main canvas (Game) 
int NODE_RAD = 30;
void setup() {
  alreadyPlaying = false;
  size(700, 500);
}

void draw() {
  background(240); 
  displayMenu();
}
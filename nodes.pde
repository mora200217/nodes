// Andrés Morales
boolean inMenu = true;
int keyMenu = 1; 
int level = 1; 
// Arrays
PVector[] nodesPos;
int [] nodesOrder; 
int [][] incidentMat; 

int gameWidth, gameHeight;
int selectedNodeID; 
int amountOfNodes;
int actualNodeCount; // For Order assignment 
boolean alreadyPlaying;

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
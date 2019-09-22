// Arrays //<>// //<>//
public PVector[] nodesPos;
int [] nodesOrder; 
int [][] incidentMat; 

int gameWidth, gameHeight;
int selectedNodeID; 
int amountOfNodes;
int actualNodeCount; // For Order assignment 
boolean alreadyPlaying;

void gamePresets() {
  actualNodeCount = 1; 
  amountOfNodes = 3;
  nodesPos = new PVector[amountOfNodes]; // Positions array
  nodesOrder = new int[amountOfNodes];
  incidentMat = new int[amountOfNodes][amountOfNodes];
  gameWidth = width - 2 * MARGIN;
  gameHeight = height - 4 * MARGIN;
  selectedNodeID = -1;
}
// Main Game function 
boolean playGame() {

  if (!alreadyPlaying) {
    gamePresets();
  }
  //println("In game!");
  boolean keepPlaying = true; 
  if (keepPlaying) {
    drawCanvas();
    // Quit the game - Back to menu
    if (keyPressed == true && key == 'q') {
      keepPlaying = false; 
      println("Key pressed...");
      return true; // Quit
    }
  }
  return false; // No quit
}



void drawCanvas() {
  fill(245);
  // Margin for adjusting the canvas

  rect(MARGIN, MARGIN * 3, gameWidth, gameHeight);
  // Game 
  // println(amountOfNodes);
  if (!alreadyPlaying) {
    locatePositions();
    assignOrder(); 
    alreadyPlaying = true;
  }
  // noCursor();
  displayMap();
  // UI 
  displayLevel();
}

// Assign winning order
void assignOrder() {
  for (int i = 0; i < amountOfNodes; i++) {
    nodesOrder[i] = i + 1;
  }
}


// Initial Positions 
void locatePositions() {
  for (int node = 0; node < amountOfNodes; node++) {
    nodesPos[node] = new PVector(
      random(MARGIN, gameWidth - MARGIN), 
      random(MARGIN, gameHeight - MARGIN)
      );
  }
}

void displayMap() {
  // load Map 
  // Later !

  for (int node = 0; node < amountOfNodes; node++) {
    if (node > 0) {
      displayGuideLine(nodesPos[node - 1], nodesPos[node] );
    }
    if (node == amountOfNodes - 1) {
      displayGuideLine(nodesPos[0], nodesPos[node] );
    }
    // Mouse over any of the nodes 
    PVector mouse = new PVector(mouseX, mouseY);
    if (mouse.sub(nodesPos[node]).mag() <= NODE_RAD) {
      if (mousePressed) {
        // First node to select //<>//
        if (selectedNodeID == -1) {
          println("Selected Node!");
          selectedNodeID = node;
        }
        // Other nodes selected
        if (selectedNodeID != node && validateNode(node)) {
          println("Selected Node :V!");
          incidentMat[selectedNodeID][node] = 1; 
          selectedNodeID = node;
        }
      }
    }

    if (selectedNodeID != -1) {
      drawCurrentLine();
    }
  }

  displayConnectionLines();  // Show intra-nodes relationship's
  for (int node = 0; node < amountOfNodes; node++) {
    displayNode(nodesPos[node], node + 1);
  }
}
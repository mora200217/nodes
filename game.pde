


boolean playGame() {
  
  print(nodesOrder); 
  if (!alreadyPlaying) {
    actualNodeCount = 1; 
  amountOfNodes = 4;
  nodesPos = new PVector[amountOfNodes]; // Positions array
  nodesOrder = new int[amountOfNodes];
  incidentMat = new int[amountOfNodes][amountOfNodes];
  gameWidth = width - 2 * MARGIN;
  gameHeight = height - 4 * MARGIN;
  selectedNodeID = -1;
    alreadyPlaying = true;
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
  PVector mouse = new PVector(mouseX, mouseY);
  for (int node = 0; node < amountOfNodes; node++) {
    if (node > 0) {
      displayGuideLine(nodesPos[node - 1], nodesPos[node] );
    }
    if (node == amountOfNodes - 1) {
      displayGuideLine(nodesPos[0], nodesPos[node] );
    }
    // Mouse over any of the nodes  //<>//
    if (mouse.sub(nodesPos[node]).mag() <= NODE_RAD) {
      if (mousePressed) {
        // First node to select
        if (selectedNodeID == -1) {
          println("Selected Node!");
          selectedNodeID = node; //<>//
        }
        // Other nodes selected
        if (selectedNodeID != node) {
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
void displayGuideLine(PVector nodeA, PVector nodeB) {
  stroke(220);
  strokeWeight(4); 
  line(nodeA.x, nodeA.y, nodeB.x, nodeB.y);
}

void displayConnectionLines() {
  for (int currentNode = 0; currentNode < amountOfNodes; currentNode++) {
    for (int nextNode = 0; nextNode < amountOfNodes; nextNode ++) {
      // Check if the ir a node relationship
      if (incidentMat[currentNode][nextNode] == 1) {
        stroke(98);  
        line(nodesPos[currentNode].x, nodesPos[currentNode].y, nodesPos[nextNode].x, nodesPos[nextNode].y); // draw connection line
      }
    }
  }
}

void drawCurrentLine() {
  stroke(98);  
  line(nodesPos[selectedNodeID].x, nodesPos[selectedNodeID].y, mouseX, mouseY);
}
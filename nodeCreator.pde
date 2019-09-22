void displayNode(PVector pos, int nodeID) { //<>//
  noStroke(); 
  fill(130); 
  ellipse(pos.x, pos.y, NODE_RAD, NODE_RAD);
  //textMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(15);
  fill(247);
  text(nodeID, pos.x, pos.y);
}

void connectNode() {
}

boolean validateNode() {
  return true;
}
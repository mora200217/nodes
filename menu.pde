void displayMenu() { 
  if (inMenu) {
    switch(keyMenu) {
      // Main menu screen
    case 1: 
      println("Menu");
      keyMenu = 2; 
      break; 
      // Main Game
    case 2: 
      if (playGame()) {
        keyMenu = 1; // Back to main menu
      }
      break;
    }
  }
}
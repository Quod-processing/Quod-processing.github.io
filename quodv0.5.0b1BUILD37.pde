// Integrated source code for quod-processing.github.io/
// quodv0.5.0b1BUILD37.pde


//aWin, bWin : show, A, B win
//showBlock : show gameboard
//menu
//md5
//help
void menu() {
  statemod=0;

  //stroke of menu
  noStroke();
  fill(244, 244, 244);
  rect(32, 18, 48, height-36);
  fill(200);
  rect(48, 18, width-87, height-36);

  //exit button of menu
  fill(251, 73, 72);
  ellipse(40, 32, 12, 12);
  if (mouseX>=32 && mouseX<=48 && mouseY>=18 && mouseY <=46) {
    stroke(0);
    strokeWeight(1);
    line(37, 29, 43, 35);
    line(43, 29, 37, 35);
    if (click==1) {
      escmod=-1;
      gmod = -gmod;
    }
  }

  //main menu
  noStroke();
  fill(241, 232, 212);
  rect(48, 27, width-96, height-54);
  switch(menuKind) {
  case 0:
    fill(255, 159, 113);
    rect(48, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("info", width/8+36, 57);
    text("quod v0.5.0b1 BUILD37", width/2, 120);
    image(mileuIcon, width/2, 240, 130, 130);
    text("software by mileu, seungwonpark", width/2, 350);
    text("visit 'mileu.ml' for more information", width/2, 500);
    upmenuButton();
    break;

  case 1:
    fill(255, 159, 113);
    rect(width/4+24, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("display", width*3/8+12, 57);

    textAlign(LEFT, CENTER);
    text("resolution", 80, 130);
    text(Settings[0], 320, 130);
    text("X", 390, 130);
    text(Settings[1], 420, 130);

    upmenuButton();
    break;

  case 2:
    fill(255, 159, 113);
    rect(width/2, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("sound", width*5/8-12, 57);

    textAlign(LEFT, CENTER);
    text("resolution", 80, 130);
    text(Settings[0], 320, 130);
    text("X", 390, 130);
    text(Settings[1], 420, 130);

    upmenuButton();
    break;

  case 3:
    fill(255, 159, 113);
    rect(width/4*3-24, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("network", width*7/8-36, 57);

    textAlign(LEFT, CENTER);
    text("server IP", 80, 130);
    text(Settings[2], 350, 130);
    text("server PORT", 80, 200);
    text(Settings[3], 350, 200);

    if (mouseX > 340&& mouseX < 500 && mouseY > 110 && mouseY < 160) {
      fill(241, 232, 212);
      rect(340, 110, 160, 50);
      fill(255, 0, 0);
      textAlign(LEFT, CENTER);
      text(Settings[2], 350, 130);
      inputmod = 4010;
    }

    upmenuButton();
    break;
  }
}

void upmenuButton() {
  textAlign(CENTER, CENTER);
  if (mouseY<=87&&mouseY>=27) {
    if (mouseX>=48&&mouseX<=width/4+24) {
      fill(0);
      text("info", width/8+36, 57);
      if (click==1) menuKind=0;
    } else if (mouseX>=width/4+24&&mouseX<=width/2) {
      fill(0);
      text("display", width*3/8+12, 57);
      if (click==1) menuKind=1;
    } else if (mouseX>=width/2&&mouseX<=width*3/4-24) {
      fill(0);
      text("sound", width*5/8-12, 57);
      if (click==1) menuKind=2;
    } else if (mouseX>=width*3/4-24&&mouseX<width-48) {
      fill(0);
      text("network", width*7/8-36, 57);
      if (click==1) menuKind=3;
    }
  }
}

void showBlock() {
  int i, j, round=0;
  fill(255);
  noStroke();
  rect(248, 0, 640, 640); //game display
  for (i=1; i<12; i++) { //show block!
    for (j=1; j<12; j++) {
      fill(255);
      if (blk[i][j]==1) fill(103, 212, 136); 
      else if (blk[i][j]==2) fill(255, 0, 0);
      else if (blk[i][j]==3) fill(0, 0, 255);
      rect(204+i*57, -44+j*57, 44, 44);
    }
  }
  fill(255);
  rect(204+lastBlockX*57, -44+lastBlockY*57, 44, 44);
  if (blk[lastBlockX][lastBlockY]==2) fill(255, 0, 0);
  else fill(0, 0, 255);
  rect(204+lastBlockX*57, -44+lastBlockY*57, 44, 44, 11);
}

void aWin() {

  fill(255);
  noStroke();
  rect(0, 0, 248, 640);
  fill(255, 0, 0);

  if (loginID.equals(" ")) text("A win!!", 124, 300);
  else {
    text(loginID + " win!!", 124, 300);
  }

  fill(193, 243, 214);     
  rect(0, 540, 248, 100); 
  textSize(60);
  fill(0);     
  text("Replay?", 124, 590);

  fill(193, 243, 214);     
  rect(0, 640, 248, 100); 
  textSize(60);
  fill(0);     
  text("Main Menu", 124, 690);

  if (click==1&&mouseX<248&&mouseY>540) {
    gmod=-200;
    reset();
  }
}

void bWin() {

  fill(255);
  noStroke();
  rect(888, 0, 248, 640);
  fill(0, 0, 255);
  if (enemyID.equals(" ")) text("B win!!", 1012, 300);
  else {
    text(enemyID+" wins!!", 1012, 300);
  }


  fill(193, 243, 214);     
  rect(888, 540, 248, 100);
  textSize(60);
  fill(0);     
  text("Replay?", 1012, 590);

  if (click==1&&mouseX>888&&mouseY>540) {
    gmod=-200;
    reset();
  }
}

void reset() {
  statemod=1;
  //block setting
  int i, j;
  for (i=1; i<12; i++)
    for (j=1; j<12; j++)
      blk[i][j]=1;
  // 4 corner of quod is blank
  blk[1][1]=0;
  blk[1][11]=0;
  blk[11][1]=0;
  blk[11][11]=0;


  //time left pannel x,y-coordinate
  timeAx=124;
  timeAy=130;
  timeBx=1012;
  timeBy=130;

  timeCache=0;//time cache, for click delay

  quazA=6;
  quazB=6;
  click=0;
  gmod=-200;
  turn=-1;
}

void readText() {
  int i=0;
  int readableCache=1;
  while (readableCache==1) {

    try {
      Settings[i] = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      Settings[i] = null;
    }
    if (Settings[i] == null) readableCache=0;
    i++;
  }
}

void indexText() {
  int i=0;
  while (Settings[i]!=null) {
    String indexTextCache[] = split(Settings[i], ":");
    Settings[i]=trim(indexTextCache[1]);
    i++;
  }
}
//md5
byte[] messageDigest5(String message, String algorithm) {
  try {
    java.security.MessageDigest md = java.security.MessageDigest.getInstance(algorithm);
    md.update(message.getBytes());
    return md.digest();
  } 
  catch(java.security.NoSuchAlgorithmException e) {
    println(e.getMessage());
    return null;
  }
}

void help() {

  background(184, 241, 241);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("help", width/2, 200);
  textSize(70);
  text("visit 'mileu.ml'", width/2, 350);
  fill(255, 206, 160);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("Back", width/2, 495);
  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=-200;
        click=0;
      }
    }
  }
}
// online login
void onlPL1() {
}
void onlPL2() {

  loginCache=-1;
  statemod=1;


  background(184, 241, 241);
  textSize(120);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(23, 93, 126);
  text("Quod", width/2, 120);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("ID", width/2, 335);
  text("PASSWORD", width/2, 415);
  text("Login", width/2, 495);


  textAlign(LEFT, TOP);
  fill(255, 0, 0);
  textSize(16);
  if (loginID.length()==8) text("ID should be shorter than 9 letters", width/2+155, 335);
  if (loginPD.length()==8) text("PASSWORD should be shorter than 9 letters", width/2+155, 415);
  if (invalidIDPD==1) text("invalid ID or PASSWORD", width/2+155, 495);
  textAlign(CENTER, CENTER);
  strokeWeight(5);
  stroke(249, 100, 45);
  textSize(48);

  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>300&&mouseY<370) {
      cursor(TEXT);
      rect(width/2-140, 300, 280, 70);
      fill(0);
      text(loginID, width/2, 335);
      loginCache=0;
    } else if (mouseY>380&&mouseY<450) {
      cursor(TEXT);
      rect(width/2-140, 380, 280, 70);
      fill(0);
      text(loginPD, width/2, 415);
      loginCache=1;
    } else if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      fill(0);
      text("Login?", width/2, 495);
      if (click==1) {
        gmod = -3;
        click = 0;
      }
    } else cursor(ARROW);
  } else cursor(ARROW);
}

void onlLR() {

  if (loginCache==-1) {
    DeviceID=str((int)random(1000, 9999));
    loginCache=3;
    myClient.write("1"+":"+DeviceID+":"+loginID+"::");
  }


  if (loginCache==5) {
    fill(23, 93, 126);
    rect(width/2-140, 460, 280, 70);
    fill(0);
    text("Login Success!!", width/2, 495);
  }
}
//online play before menus
void onlP1() {
  statemod=1;
  
  background(184, 241, 241);
  textSize(120);
  textAlign(CENTER, CENTER);
  noStroke();
  fill(23, 93, 126);
  text("Quod", width/2, 120);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Log in", width/2, 335);
  text("Sign up", width/2, 415);
  text("Back", width/2, 495);
}
void onlP2() {
  statemod=1;

  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Log in", width/2, 335);
  text("Sign up", width/2, 415);
  text("Back", width/2, 495);
  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>300&&mouseY<370) {
      rect(width/2-140, 300, 280, 70);
      if (click==1) {
        gmod = -700;
        click=0;
      }
    } else if (mouseY>380&&mouseY<450) {
      rect(width/2-140, 380, 280, 70);
      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      textSize(24);
      text("sign up is not supported", width/2, 415);
    } else if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=-200;
        click=0;
      }
    }
  }
}


void onlLVSBefore() {
  statemod=1;
  cursor(ARROW);
  background(184, 241, 241);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);

  textSize(30);    
  textAlign(CENTER, BOTTOM);
  switch(worldValid%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2-160, 310, 100, 100);
    fill(0);
    text("0/2", width/2-110, 360);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2-160, 310, 100, 100);
    fill(0);
    text("1/2", width/2-110, 360);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2-160, 310, 100, 100);
    fill(0);
    text("2/2", width/2-110, 360);
    break;
  }  
  switch((worldValid/10)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2-50, 310, 100, 100);
    fill(0);
    text("0/2", width/2, 360);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2-50, 310, 100, 100);
    fill(0);
    text("1/2", width/2, 360);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2-50, 310, 100, 100);
    fill(0);
    text("2/2", width/2, 360);
    break;
  }  
  switch((worldValid/100)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2+60, 310, 100, 100);
    fill(0);
    text("0/2", width/2+110, 360);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2+60, 310, 100, 100);
    fill(0);
    text("1/2", width/2+110, 360);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2+60, 310, 100, 100);
    fill(0);
    text("2/2", width/2+110, 360);
    break;
  }  
  switch((worldValid/1000)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2-160, 420, 100, 100);
    fill(0);
    text("0/2", width/2-110, 470);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2-160, 420, 100, 100);
    fill(0);
    text("1/2", width/2-110, 470);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2-160, 420, 100, 100);
    fill(0);
    text("2/2", width/2-110, 470);
    break;
  }  
  switch((worldValid/10000)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2-50, 420, 100, 100);
    fill(0);
    text("0/2", width/2, 470);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2-50, 420, 100, 100);
    fill(0);
    text("1/2", width/2, 470);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2-50, 420, 100, 100);
    fill(0);
    text("2/2", width/2, 470);
    break;
  }  
  switch((worldValid/100000)%10) {
  case 1:
    fill(56, 172, 84);
    rect(width/2+60, 420, 100, 100);
    fill(0);
    text("0/2", width/2+110, 470);
    break;

  case 2:
    fill(255, 238, 96);
    rect(width/2+60, 420, 100, 100);
    fill(0);
    text("1/2", width/2+110, 470);
    break;

  case 3:
    fill(205, 77, 77);
    rect(width/2+60, 420, 100, 100);
    fill(0);
    text("2/2", width/2+110, 470);
    break;
  }
  if (roomRequested == 0) {
    fill(0);
    textAlign(CENTER, TOP);
    if (mouseX>width/2-160&&mouseX<=width/2-60&&mouseY>310&&mouseY<=410) {
      text("Join?", width/2-110, 360);
      if (click==1) {
        myClient.write("w"+":"+"1"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2-160&&mouseX<=width/2-60&&mouseY>420&&mouseY<=520) {
      text("Join?", width/2-110, 470);
      if (click==1) {
        myClient.write("w"+":"+"4"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2-50&&mouseX<=width/2+50&&mouseY>310&&mouseY<=410) {
      text("Join?", width/2, 360);
      if (click==1) {
        myClient.write("w"+":"+"2"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2-50&&mouseX<=width/2+50&&mouseY>420&&mouseY<=520) {
      text("Join?", width/2, 470);
      if (click==1) {
        myClient.write("w"+":"+"5"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2+60&&mouseX<=width/2+160&&mouseY>310&&mouseY<=410) {
      text("Join?", width/2+110, 360);
      if (click==1) {
        myClient.write("w"+":"+"3"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    } else if (mouseX>width/2+60&&mouseX<=width/2+160&&mouseY>420&&mouseY<=520) {
      text("Join?", width/2+110, 470);
      if (click==1) {
        myClient.write("w"+":"+"6"+":"+loginID+":"+"join"+"::");
        roomRequested = 1;
      }
    }
  } else if ((worldValid/pow(10, onlineJoinRoom-1))%10==3) gmod=-900;

  textSize(48);
  textAlign(LEFT, CENTER);
  text("ID : "+loginID, 50, 335);
}
// online signup
void onlPS1() {
}
void onlPS2() {
}
//i said udp but it is just server connect
void onlPvs1() {
  background(184, 241, 241);
  showBlock();

  //red, playerA
  fill(255, 0, 0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text(loginID, 124, 40);

  //show number of quaz left
  if (quazA>0) {
    fill(255, 227, 212);
    rect(0, 220, 248, 40);
  }
  if (quazA>1) {
    fill(255, 212, 194);
    rect(0, 270, 248, 40);
  }
  if (quazA>2) {
    fill(255, 197, 188);
    rect(0, 320, 248, 40);
  }
  if (quazA>3) {
    fill(255, 163, 162);
    rect(0, 370, 248, 40);
  }
  if (quazA>4) {
    fill(231, 94, 90);
    rect(0, 420, 248, 40);
  }
  if (quazA>5) {
    fill(187, 62, 69);
    rect(0, 470, 248, 40);
  }

  //blue, playerB
  fill(0, 0, 255);
  textSize(48);
  text(enemyID, 1012, 40);
  fill(240, 248, 255);
  noStroke();
  ellipse(timeBx, timeBy, 100, 100);

  if (quazB>0) {
    fill(212, 163, 110);
    rect(888, 220, 248, 40);
  }
  if (quazB>1) {
    fill(196, 132, 85);
    rect(888, 270, 248, 40);
  }
  if (quazB>2) {
    fill(156, 97, 71);
    rect(888, 320, 248, 40);
  }
  if (quazB>3) {
    fill(131, 88, 74);
    rect(888, 370, 248, 40);
  }
  if (quazB>4) {
    fill(110, 76, 68);
    rect(888, 420, 248, 40);
  }
  if (quazB>5) {
    fill(79, 69, 64);
    rect(888, 470, 248, 40);
  }
  
  if (turn == 0) {
    textSize(60);          
    noStroke();          
    fill(255, 238, 96);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);   
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);
  } else if (turn == 2) {
    textSize(60);          
    noStroke();          
    fill(255, 238, 96);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);  
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);
  } else if (turn == 1) {
    textSize(60); 
    noStroke();
    fill(193, 243, 214);
    rect(0, 540, 248, 100);
    fill(0);
    text("wait", 124, 590);
    fill(255, 238, 96);
    rect(888, 540, 248, 100);
    fill(0);
    text("finish", 1012, 590);
  } else if (turn == 3) {
    textSize(60); 
    noStroke();
    fill(193, 243, 214);
    rect(0, 540, 248, 100);
    fill(0);
    text("wait", 124, 590);
    fill(255, 238, 96);
    rect(888, 540, 248, 100);
    fill(0);
    text("finish", 1012, 590);
  }
  
  gmod = -gmod;
}

void onlPvs2() {

  //red, playerA
  //timepannel
  fill(240, 248, 255);
  noStroke();
  ellipse(timeAx, timeAy, 100, 100);

  //turn of A
  if (turn == 0) {
    aiTurn=1;//set Ai for compute
    //hand of timepannel
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 2400, 0, TWO_PI)- HALF_PI;//100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=2;
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          //w+worldID+playerID+action+xcoordinate+ycoordinate
          myClient.write("w"+":"+"play"+":"+onlineJoinRoom+":"+loginID+":"+"quod"+":"+lastBlockX+":"+lastBlockY+"::");
          turn=2;
          gmod = -gmod;
          timeA=0;
        } else if (mouseButton == RIGHT&&quazA>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          myClient.write("w"+":"+"play"+":"+onlineJoinRoom+":"+loginID+":"+"quaz"+":"+int((mouseX-204)/57)+":"+int((mouseY+44)/57)+"::");
          quazA-=1;
          gmod = -gmod;
        }
      }
    }

    //say there is quod
    if (click==1&&mouseX<248&&mouseY>540) {
      chkQd(0);
      myClient.write("w"+":"+"play"+":"+onlineJoinRoom+":"+loginID+":"+"squd"+":"+1+":"+1+"::");
      quazA-=1;
      turn=1;
      gmod = -gmod;
      timeA=0;
    }

    if (timeA<-2400) {
      turn = 1; // turn A end for time limit
      gmod = -gmod;
      timeA = 0;
      timeB = 0;
    }
  } else if (turn==2) {
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);



    if (click==1&&mouseX<248&&mouseY>540) {

      chkQd(0);
      myClient.write("w"+":"+"play"+":"+onlineJoinRoom+":"+loginID+":"+"squd"+":"+1+":"+1+"::");
      turn=1;
      gmod = -gmod;
      quazA-=1;
      timeA=0;
    }      

    if (timeA<-250) {
      turn=1; // turn A end for tiem limit
      gmod = -gmod;
      timeA=0;
    }

    /////////////////////////////////////////////////
  } else if (turn==1) {//blue, playerB
    //hand of timepannel
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 3000, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);


    //mouse click check
    if (lastEnemyAction == 1) {//quod
      lastBlockX = enemyBlkX;
      lastBlockY = enemyBlkY;
      blk[lastBlockX][lastBlockY] = 3;
      lastEnemyAction = 0;
      turn=3;
      gmod = -gmod;
      timeB=0;
    } else if (lastEnemyAction == 2) { //quaz
      quazB-=1;
      gmod = -gmod;
      blk[enemyBlkX][enemyBlkY] = 0;
      lastEnemyAction = 0;
    } else if (lastEnemyAction == 3) {//say there is quod
      chkQd(1);
      lastEnemyAction = 0;
      quazB-=1;
      turn=0;
      gmod = -gmod;
      timeB=0;
    }

    //time end check
    if (timeB<-3000) {
      turn=0; // turn A end for tiem limit
      gmod = -gmod;
      timeB=0;
    }
  } else if (turn==3) {
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    //say there is quod
    if (lastEnemyAction == 3) {//say there is quod
      chkQd(1);
      lastEnemyAction = 0;
      quazB-=1;
      turn = 0;
      gmod = -gmod;
      timeB=0;
    }
    //end of time limit
    if (timeB<-250) {
      turn=0; // turn A end for tiem limit
      gmod = -gmod;
      timeB=0;
    }
  }
}
//v0.5.0
//beware for singleAI in ai check time.
void draw() {
  println("frameRate : "+frameRate);
  println("gmod : "+gmod);
  println("X : "+mouseX+" Y : "+mouseY);

  inputmod = -1;

  if (myClient.available()>0) recieveServer();

  if (escmod == 0) menu();
  else switch(gmod) {

  case -100:
    loadS1(); // loading screne, "click to start"
  case 100:
    loadS2();
    break;

  case -200:
    statM1(); // start menu
  case 200:
    statM2();
    break;

  case -300:
    snglP1(); // singlePlay
  case 300:
    snglP2();
    break;

  case -400:
    snglPai1(); // single Play ai
  case 400:
    snglPai2();
    break;

  case -500:
    snglPvs1(); // single Play 1 vs 1 
  case 500:
    snglPvs2();
    break;

  case -600:
    onlP1(); // onlinePlay
  case 600:
    onlP2();
    break;

  case -700:
    onlPL1(); // online login
  case 700:
    onlPL2();
    break;
    
  case -800:
    onlPS1(); // online signup
  case 800:
    onlPS2();
    break;

  case -3:
    onlLR(); // online login request to server
    break;

  case -750:
  case 750:
    onlLVSBefore(); // online play with others before for waiting
    break;


  case -900:
    onlPvs1(); //online play
  case 900:
    onlPvs2(); //online play
    break;

  case -1000:
  case 1000:
    aWin(); // a win
    break;

  case -2000:
  case 2000:
    bWin(); // b win
    break;

  case -3000:
  case 3000:
    help(); // help
    break;
  }
  if (statemod==1) state();

  click=0;
}

void mouseReleased() {
  click = 1;
}

void keyPressed() {
  if (key == TAB) {
    if (escmod == -1) escmod=0;
    else {
      escmod=-1;
      gmod = -gmod;
    }
  } else if ((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9') || key == '.') {
    if (inputmod == 4010) {
      Settings[2] = Settings[2] + key;
    }
    if (loginCache==0&&loginID.length()<8) {
      loginID = loginID + key;
      loginID = trim(loginID);
    } else if (loginCache==1&&loginPD.length()<8) {
      loginPD = loginPD + key;
      loginPD = trim(loginPD);
    }
  } else if (key==ENTER) {
    if (loginCache==-1||loginCache==0||loginCache==1) {
      loginCache=-1;
      gmod= -3;
      click=0;
    }
  } else if (key == DELETE||key == BACKSPACE) {
    if (inputmod == 4010 && Settings[2].length()>0) Settings[2] = Settings[2].substring(0, Settings[2].length()-1);
    if (loginCache==0&&loginID.length()>0) loginID = loginID.substring(0, loginID.length()-1);
    if (loginCache==1&&loginPD.length()>0) loginPD = loginPD.substring(0, loginPD.length()-1);
  }
}

void recieveServer() {
  String ServerRead = myClient.readString();
  String lineRead[] = split(ServerRead, "::");
  println(ServerRead);
  println(loginCache);

  for (int i=0; i<lineRead.length; i++) {
    String lineCache[] = split(lineRead[i], ":");
    //about login
    if (loginCache==3) {
      if (lineCache[0].equals("1")) {
        if (lineCache[1].equals(DeviceID)&&lineCache[2].equals(loginID)&&lineCache[3].equals("true")) {
          byte[] md5hash = messageDigest5(loginPD, "MD5");
          String md5string="";
          String md5="";
          for (int imd5=0; imd5<md5hash.length; imd5++) md5string+=(hex(md5hash[imd5], 2));
          md5=md5string.toLowerCase();
          println(md5);
          myClient.write("2"+":"+DeviceID+":"+loginID+":"+md5+"::");
        }
      } else if (lineCache[0].equals("2")) {
        if (lineCache[1].equals(DeviceID)&&lineCache[2].equals(loginID)&&lineCache[3].equals("true")) {
          loginCache=4;
          gmod = -750;
        } else {
          loginCache=-1;
          gmod = -700;
          invalidIDPD=1;
        }
      }
    }
    ///////////////////////////////////////////
    //end login
    //world join available
    if (lineCache[0].equals("w")) {

      //gameplay start
      if (lineCache[1].equals("start")) {
        if (lineCache[3].equals(loginID) || lineCache[4].equals(loginID)) {
          if (lineCache[3].equals(loginID)) {
            enemyID=lineCache[4];
            turn = 0;
          } else {
            enemyID=lineCache[3];
            turn = 1;
          }
          onlineJoinRoom = parseInt(lineCache[2]);
          roomRequested = 2;
          statemod=0;
          gmod=-900;
        }

        //w+play+worldID+playerID+action+xcoordinate+ycoordinate
      } else if (lineCache[1].equals("play")&&parseInt(lineCache[2])==onlineJoinRoom) {
        if (lineCache[3].equals(enemyID)) {
          // lastEnemyAction 0 default, 1 is quod, 2 is quaz, 3 is say quod(squd)
          if (lineCache[4].equals("quod")) {
            lastEnemyAction = 1;
            enemyBlkX=parseInt(lineCache[5]);
            enemyBlkY=parseInt(lineCache[6]);
          } else if (lineCache[4].equals("quaz")) {
            lastEnemyAction = 2;
            enemyBlkX=parseInt(lineCache[5]);
            enemyBlkY=parseInt(lineCache[6]);
          } else if (lineCache[4].equals("squd")) {//say there is quod
            lastEnemyAction = 3;
            enemyBlkX=parseInt(lineCache[5]);
            enemyBlkY=parseInt(lineCache[6]);
          }
        }
      } else worldValid=parseInt(lineCache[1]);
    }
    //world join available end
  }
}
//set, basic settings 
import processing.net.*;

Client myClient;

PImage mileuIcon;
PShape infoIcon, speakerIcon, settingsIcon;

BufferedReader reader;
String[] Settings = new String[20];
int dataIn;


int gmod, turn;// game mode, 0:startmenu, 1:single, 2:UDP, 3:udp server, 4:udp client, 5:A win, 6:B win, turn is play turn 0:A(ai), 1:B(ai), 2: A after do his color block(ai), 3 : B after do his color block(ai) 4:A(1vs1), 5:B(1vs1), 6: A after do his color block(1vs1), 7 : B after do his color block(1vs1)
int escmod = -1;//help, option, menu
int inputmod = -1;//keyboard input mod
int menuKind = 0;
int statemod = 1;//server state, etc..
int aiTurn = -1;//check if ai will work or not
int[][] blk = new int[50][50];//x,y coordinate if tile exist 0:no, 1: default 2:red 3: blue
int[][] aiBlk = new int[50][50];//for tile, for ai compute
double aiScore=-5000;
int aiansX, aiansY, aicacheX, aicacheY;
int aiFinish=0;

float timeA, timeB;//time left of player A, B
int timeAx, timeAy, timeBx, timeBy;//time left pannel for player A,B
int timeCache;//time cache for click delay
int quazA, quazB;//quazer left of player A, B
int lastBlockX, lastBlockY;// say what was last block

String loginID=" ", loginPD=" ", DeviceID=" ";
String enemyID=" ";
int lastEnemyAction = 0; //0 default, 1 is quod, 2 is quaz, 3 is say quod(squd)
int enemyBlkX=0, enemyBlkY=0; //x, y coordinate of enemy;

int loginCache=-1;
int loginCacheSmall=0;
int invalidIDPD=0;
int worldValid=333333;
int roomRequested = 0; //0 is none, 1 is yes, 2 is client is playing
int onlineJoinRoom = 0; //0 is none, room 1~6

int click;
PFont font;


void settings() {

  size(1136, 640);
  pixelDensity(displayDensity());
}

void setup() {

  reader = createReader("setting.txt");
  readText();
  indexText();
  surface.setSize(parseInt(Settings[0]), parseInt(Settings[1]));

  myClient = new Client(this, Settings[2], parseInt(Settings[3]));//tcp port
  surface.setTitle("quod v0.5.0");
  surface.setResizable(true);
  font = loadFont("mileuEn.vlw");
  textFont(font, 48);
  textAlign(CENTER, CENTER);
  smooth();
  frameRate(60);
  mileuIcon = loadImage("mileu.png");
  infoIcon = loadShape("info.svg");
  speakerIcon = loadShape("speaker.svg");
  settingsIcon = loadShape("settings.svg");
  imageMode(CENTER);

  //block setting
  int i, j;
  for (i=1; i<12; i++)
    for (j=1; j<12; j++)
      blk[i][j]=1;
  // 4 corner of quod is blank
  blk[1][1]=0;
  blk[1][11]=0;
  blk[11][1]=0;
  blk[11][11]=0;


  //time left pannel x,y-coordinate
  timeAx=124;
  timeAy=130;
  timeBx=1012;
  timeBy=130;

  timeCache=0;//time cache, for click delay

  quazA=6;
  quazB=6;
  click=0;
  gmod=-100;
  turn=-1;
}
//set the mod of single play, with ai or 1 vs 1

void snglP1() {
  statemod=1;

  background(184, 241, 241);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);

  fill(0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("AI", width/2, 335);
  text("1 VS 1", width/2, 415);
  text("Back", width/2, 495);
  gmod = -gmod;
}

void snglP2() {

  statemod=1;
  noStroke();
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);

  fill(0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("AI", width/2, 335);
  text("1 VS 1", width/2, 415);
  text("Back", width/2, 495);

  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>300&&mouseY<370) {
      rect(width/2-140, 300, 280, 70);
      if (click==1) {
        turn=0;
        gmod = -400;
        click=0;
        statemod=0;
      }
    } else if (mouseY>380&&mouseY<450) {
      rect(width/2-140, 380, 280, 70);
      if (click==1) {
        turn=4;
        gmod = -500;
        click=0;
        statemod=0;
      }
    } else if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=-200;
        click=0;
      }
    }
  }
}
//snglPvs() single play 1 vs 1 in one computer

void snglPvs1() {

  background(184, 241, 241);
  showBlock();

  //red, playerA
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("A", 124, 40);

  //show number of quaz left
  if (quazA>0) {
    fill(255, 227, 212);
    rect(0, 220, 248, 40);
  }
  if (quazA>1) {
    fill(255, 212, 194);
    rect(0, 270, 248, 40);
  }
  if (quazA>2) {
    fill(255, 197, 188);
    rect(0, 320, 248, 40);
  }
  if (quazA>3) {
    fill(255, 163, 162);
    rect(0, 370, 248, 40);
  }
  if (quazA>4) {
    fill(231, 94, 90);
    rect(0, 420, 248, 40);
  }
  if (quazA>5) {
    fill(187, 62, 69);
    rect(0, 470, 248, 40);
  }

  //blue, playerB
  fill(0, 0, 255);
  textSize(48);
  text("B", 1012, 40);

  if (quazB>0) {
    fill(212, 163, 110);
    rect(888, 220, 248, 40);
  }
  if (quazB>1) {
    fill(196, 132, 85);
    rect(888, 270, 248, 40);
  }
  if (quazB>2) {
    fill(156, 97, 71);
    rect(888, 320, 248, 40);
  }
  if (quazB>3) {
    fill(131, 88, 74);
    rect(888, 370, 248, 40);
  }
  if (quazB>4) {
    fill(110, 76, 68);
    rect(888, 420, 248, 40);
  }
  if (quazB>5) {
    fill(79, 69, 64);
    rect(888, 470, 248, 40);
  }

  //downside ui
  if (turn == 4) {
    textSize(60);          
    noStroke();          
    fill(255, 238, 96);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);    
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);
  } else if (turn == 6) {
    textSize(60);          
    noStroke();          
    fill(255, 238, 96);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);    
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);
  } else if (turn == 5) {
    textSize(60);     
    noStroke();     
    fill(193, 243, 214);     
    rect(0, 540, 248, 100);     
    fill(0);     
    text("wait", 124, 590);         
    fill(255, 238, 96);          
    rect(888, 540, 248, 100);          
    fill(0);          
    text("quod", 1012, 590);
  } else if (turn == 7) {
    textSize(60);     
    noStroke();     
    fill(193, 243, 214);     
    rect(0, 540, 248, 100);     
    fill(0);     
    text("wait", 124, 590);         
    fill(255, 238, 96);          
    rect(888, 540, 248, 100);          
    fill(0);          
    text("quod", 1012, 590);
  }

  gmod = -gmod;
}

void snglPvs2() {

  //red, playerA
  //timepanel
  fill(240, 248, 255);
  noStroke();
  ellipse(timeAx, timeAy, 100, 100);

  if (turn==4) {
    //hand of timepannel
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 2400, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=2;
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          turn=6;
          gmod = -gmod;
          timeA=0;
        } else if (mouseButton == RIGHT&&quazA>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          quazA-=1;
          gmod = -gmod;
        }
      }
    }
    //say there is quod
    if (click==1&&mouseX<248&&mouseY>540) {
      chkQd(0);
      quazA-=1;
      turn=5;
      gmod = -gmod;
      timeA=0;
    }   

    if (timeA<-2400) {
      turn=5; // turn A end for tiem limit
      gmod = -gmod;
      timeA=0;
    }
  }

  if (turn==6) {
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    if (click==1&&mouseX<248&&mouseY>540) {
      chkQd(0);
      turn=5;
      gmod = -gmod;
      quazA-=1;
      timeA=0;
    }      

    if (timeA<-250) {
      turn=5; // turn A end for tiem limit
      gmod = -gmod;
      timeA=0;
    }
  }


  ////////////////////////////////////////////////

  //blue, player B

  fill(240, 248, 255);
  noStroke();
  ellipse(timeBx, timeBy, 100, 100);

  if (turn==5) {
    //hand of timepannel
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 3000, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=3;        
          turn=7;
          gmod = -gmod;
          timeB=0;
        } else if (mouseButton == RIGHT&&quazB>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          quazB-=1;
          gmod = -gmod;
        }
      }
    }
    //say there is quod
    if (click==1&&mouseX>888&&mouseY>540) {
      chkQd(1);
      quazB-=1;
      turn=4;
      gmod = -gmod;
      timeB=0;
    }   

    if (timeB<-3000) {
      turn=4; // turn A end for tiem limit
      gmod = -gmod;
      timeB=0;
    }
  }

  if (turn==7) {
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    if (click==1&&mouseX>888&&mouseY>540) {
      chkQd(1);
      turn=4;
      gmod = -gmod;
      quazB-=1;
      timeB=0;
    }      

    if (timeB<-250) {
      turn=4; // turn A end for tiem limit
      gmod = -gmod;
      timeB=0;
    }
  }
}
//singleAI : single play with ai
void snglPai1() {

  background(184, 241, 241);
  showBlock();

  //red, playerA
  fill(255, 0, 0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("A", 124, 40);
  //show number of quaz left
  if (quazA>0) {
    fill(255, 227, 212);
    rect(0, 220, 248, 40);
  }
  if (quazA>1) {
    fill(255, 212, 194);
    rect(0, 270, 248, 40);
  }
  if (quazA>2) {
    fill(255, 197, 188);
    rect(0, 320, 248, 40);
  }
  if (quazA>3) {
    fill(255, 163, 162);
    rect(0, 370, 248, 40);
  }
  if (quazA>4) {
    fill(231, 94, 90);
    rect(0, 420, 248, 40);
  }
  if (quazA>5) {
    fill(187, 62, 69);
    rect(0, 470, 248, 40);
  }

  //blue, playerB
  fill(0, 0, 255);
  textSize(48);
  text("B", 1012, 40);


  if (quazB>0) {
    fill(212, 163, 110);
    rect(888, 220, 248, 40);
  }
  if (quazB>1) {
    fill(196, 132, 85);
    rect(888, 270, 248, 40);
  }
  if (quazB>2) {
    fill(156, 97, 71);
    rect(888, 320, 248, 40);
  }
  if (quazB>3) {
    fill(131, 88, 74);
    rect(888, 370, 248, 40);
  }
  if (quazB>4) {
    fill(110, 76, 68);
    rect(888, 420, 248, 40);
  }
  if (quazB>5) {
    fill(79, 69, 64);
    rect(888, 470, 248, 40);
  }

  if (turn == 0) {
    textSize(60);          
    noStroke();          
    fill(255, 238, 96);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);   
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);
  } else if (turn == 2) {
    textSize(60);          
    noStroke();          
    fill(255, 238, 96);          
    rect(0, 540, 248, 100);          
    fill(0);          
    text("quod", 124, 590);  
    fill(193, 243, 214);     
    rect(888, 540, 248, 100);     
    fill(0);     
    text("wait", 1012, 590);
  } else if (turn == 1 || turn == 3) {
    textSize(60);     
    noStroke();     
    fill(193, 243, 214);     
    rect(0, 540, 248, 100);     
    fill(0);     
    text("wait", 124, 590);      
    fill(255, 238, 96);          
    rect(888, 540, 248, 100);          
    fill(0);          
    text("finish", 1012, 590);
  }

  gmod = -gmod;
}


void snglPai2() {

  //red, playerA
  //timepannel
  fill(240, 248, 255);
  noStroke();
  ellipse(timeAx, timeAy, 100, 100);

  //turn of A
  if (turn == 0) {
    aiTurn=1;//set Ai for compute
    //hand of timepannel
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 2400, 0, TWO_PI)- HALF_PI;//100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);




    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=2;
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          gmod = -gmod;
          turn=2;
          timeA=0;
        } else if (mouseButton == RIGHT&&quazA>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          gmod = -gmod;
          quazA-=1;
        }
      }
    }

    //say there is quod
    if (click==1&&mouseX<248&&mouseY>540) {
      gmod = -gmod;
      chkQd(0);
      quazA-=1;
      turn=1;
      timeA=0;
    }

    if (timeA<-2400) {
      gmod = -gmod;
      turn = 1; // turn A end for time limit
      timeA = 0;
      timeB = 0;
    }
  }

  if (turn==2) {
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    if (click==1&&mouseX<248&&mouseY>540)
    {
      gmod = -gmod;
      chkQd(0);
      turn=1;
      quazA-=1;
      timeA=0;
    }      

    if (timeA<-250) {
      gmod = -gmod;
      turn=1; // turn A end for tiem limit
      timeA=0;
    }
  }

  //blue, playerB
  fill(240, 248, 255);
  noStroke();
  ellipse(timeBx, timeBy, 100, 100);

  if (turn==1||turn==3) {
    //part of ai, and need for time delay 2 seconds
    //this could make some code mess..
    if (aiTurn==1) { // after they compute it goes to chkQd one more time..
      chkQd(1);//say if there is quod!
      thread("ai");
      aiTurn=0;
      aiFinish=0;
    }
    if (aiFinish==1) { // after they compute it goes to chkQd one more time..
      blk[aiansX][aiansY]=3;
      lastBlockX=aiansX;
      lastBlockY=aiansY;
      chkQd(1);
      gmod = -gmod;
      aiFinish=0;
    }

    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 150, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    if (timeB<-150) {
      gmod = -gmod;
      turn=0; // turn A end for tiem limit
      timeB=0;
    }
  }
}
//statM : start menu
//loadS : load screne

void loadS1() {
  statemod=1;

  background(184, 241, 241);
  fill(23, 93, 126);
  textSize(120);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);
  textSize(48);
  fill(0);
  textAlign(CENTER, BOTTOM);
  text("click to start", width/2, height-10);

  //set loadS2
  gmod = -gmod;
}
void loadS2() {
  statemod=1;

  noStroke();
  fill(184, 241, 241);
  rect(45, 0, 200, 50);
  if (frameCount>48) frameCount=0;
  fill(0, (abs(frameCount-25)%26)*10);
  textSize(40);
  textAlign(LEFT, CENTER);
  text("'TAB' to set", 50, 25);

  if (click == 1) {
    gmod = -200;
    click = 0;
  }
}

void statM1() {
  statemod=1;
  background(184, 241, 241);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Local Play", width/2, 335);
  text("Online Play", width/2, 415);
  text("Help", width/2, 495);

  gmod = - gmod;
}

void statM2() {
  statemod=1;
  noStroke();
  textAlign(CENTER, CENTER);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Local Play", width/2, 335);
  text("Online Play", width/2, 415);
  text("Help", width/2, 495);
  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>300&&mouseY<370) { // Local Play
      rect(width/2-140, 300, 280, 70);
      if (click==1) {
        gmod=-300;
        click=0;
      }
    } else if (mouseY>380&&mouseY<450) { // Online Play
      rect(width/2-140, 380, 280, 70);
      if (myClient.active()==false) {
        myClient = new Client(this, Settings[2], parseInt(Settings[3])); //retry to connect
        if (myClient.active()==false) {
          fill(255, 0, 0);
          textAlign(CENTER, CENTER);
          textSize(24);
          text("server connection fail", width/2, 415);
        }
      } else if (click==1) {
        gmod = -600;
        click=0;
      }
    } else if (mouseY>460&&mouseY<530) { // Help
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=3000;
        click=0;
      }
    }
  }
}
//ai.. sorry this doesn't have any algorithm..

void ai() {
  int i, j, k, l, m, n, x, y, z, w;
  int colorblock = 1; // check if computer have left blocks
  int aiX[] = new int[100];
  int aiY[] = new int[100];
  m = 0; // number that maybe attacked next time

  aiScore=0;
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      aiBlk[i][j]=blk[i][j];
    }
  }


  //check quod in player A next time
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==2) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==2&&(blk[i-j+l][i+j-k]==2||blk[l+k-j][l-k+i]==2)) {
                if (blk[i-j+l][i+j-k]==2&&blk[l+k-j][l-k+i]==1) {
                  m+=1;
                  aiX[m]=l+k-j;
                  aiY[m]=l-k+i;
                }
              }
            }
          }
        }
      }
    }
  }

  //check quod in player B
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==3) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (colorblock==1&&blk[k][l]==3&&(blk[i-j+l][i+j-k]==3||blk[l+k-j][l-k+i]==3)) {
                if (blk[i-j+l][i+j-k]==3&&blk[l+k-j][l-k+i]==1) {
                  aiansX=l+k-j;
                  aiansY=l-k+i;
                  colorblock-=1;
                  m=-1;
                }
              }
            }
          }
        }
      }
    }
  }

  if (m>0) {

    while (m>0) {

      if (quazB>=1&&blk[aiX[m+1]][aiY[m+1]]==1) {

        blk[aiX[m+1]][aiY[m+1]]=0;
        quazB=quazB-1;
      }
      m-=1;
    }
    if (colorblock==1) {
      aiansX=aiX[1];
      aiansY=aiY[1];
    }
    m=-1;
  } else if (m==0) {
    i=int(random(3, 10));
    j=int(random(3, 10));
    while (blk[i][j]!=1) {
      i=int(random(3, 10));
      j=int(random(3, 10));
    }
    if (colorblock==1) {
      aiansX=i;
      aiansY=j;
    }
  }
  aiFinish=1;
}
//chkQd : check if there is quod, if yes : 0, no : 1;
//state
void state() {
  //settings
  noStroke();
  fill(184, 241, 241);
  rect(1000, 25, 136, 60);
  shape(settingsIcon, 10, 10, 30, 30);
  if (mouseX>0 && mouseX<=50 && mouseY>0 && mouseY<=50) {
    textAlign(LEFT, CENTER);
    textSize(30);
    fill(0);
    text("settings", 50, 25);
    if (click==1) escmod = 0;
  }

  //server state
  textAlign(RIGHT, CENTER);
  textSize(30);
  fill(0);
  text("server", width-30, 40);
  stroke(255);
  strokeWeight(3);
  if (myClient.active()==true) fill(0, 255, 0);
  else {
    fill(0);
    text("reconnect", width-20, 65);
    if (mouseX>width-140 && mouseX<width-10 && mouseY>30 && mouseY<80) {
      text("?", width-10, 65);
      if (click==1) {
        myClient = new Client(this, Settings[2], parseInt(Settings[3])); //retry to connect
      }
    }
    fill(255, 0, 0);
  }
  ellipse(width-20, 40, 20, 20);
}

void chkQd(int aorb) {
  int i, j, k, l, m, n, x, y, z, w;
  int round=0;
  noStroke();
  for (i=1; i<12; i++) { //show block!
    for (j=1; j<12; j++) {
      if (blk[i][j]==1) {
        fill(103, 212, 136); 
        rect(204+i*57, -44+j*57, 44, 44);
      } else if (blk[i][j]==2) {
        fill(255, 0, 0);
        round=0;
        if (i==lastBlockX&&j==lastBlockY) round=44/4;
        rect(204+i*57, -44+j*57, 44, 44, round);
      } else if (blk[i][j]==3) {
        fill(0, 0, 255);
        round=0;
        if (i==lastBlockX&&j==lastBlockY) round=44/4;
        rect(204+i*57, -44+j*57, 44, 44, round);
      }
    }
  }

  if (aorb==0) {
    stroke(255, 0, 0);
  }
  if (aorb==1) {
    stroke(0, 0, 255);
  }

  strokeWeight(5);

  //check quod in player A
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==2) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==2&&blk[i-j+l][i+j-k]==2&&blk[l+k-j][l-k+i]==2) {
                line(226+i*57, -22+j*57, 226+k*57, -22+l*57);
                line(226+k*57, -22+l*57, 226+(l+k-j)*57, -22+(l-k+i)*57);
                line(226+(l+k-j)*57, -22+(l-k+i)*57, 226+(i-j+l)*57, -22+(i+j-k)*57);
                line(226+(i-j+l)*57, -22+(i+j-k)*57, 226+i*57, -22+j*57);
                if(aorb == 0) gmod = 1000;
                else gmod = 2000;
              }
            }
          }
        }
      }
    }
  }

  //check quod in player B
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==3) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==3&&blk[i-j+l][i+j-k]==3&&blk[l+k-j][l-k+i]==3) {
                line(226+i*57, -22+j*57, 226+k*57, -22+l*57);
                line(226+k*57, -22+l*57, 226+(l+k-j)*57, -22+(l-k+i)*57);
                line(226+(l+k-j)*57, -22+(l-k+i)*57, 226+(i-j+l)*57, -22+(i+j-k)*57);
                line(226+(i-j+l)*57, -22+(i+j-k)*57, 226+i*57, -22+j*57);
                if(aorb == 0) gmod = 1000;
                else gmod = 2000;
              }
            }
          }
        }
      }
    }
  }
}
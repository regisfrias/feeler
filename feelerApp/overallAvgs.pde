class OverallAvgs{
  int thisX;
  int thisY;
  int rectWidth = (visWidth - dotSize/2)/2;
  String position;
  String caption;
  
  OverallAvgs(String _position, String _caption){
    position = _position;
    caption = _caption;
  }
  
  void display(int i){
    
    if(position == "right"){
      thisX = visX + rectWidth + padding*3;
    } else {
      thisX = visX;
    }
    thisY = visY;
    
    fill(graphBgColor);
    rect(thisX - padding, thisY - padding, rectWidth + padding*2, visHeight + padding*2);
    fill(250);
    rect(thisX, thisY, rectWidth, visHeight);
    
    String[] fileNames = splitTokens(fileArray[i]);
    
    if(fileNames[0].charAt(0) != '.'){
      String[] fileDate = split(fileNames[0], '.');
      
      if(position == "left"){
        fill(textDarkColor);
        textAlign(LEFT, CENTER);
        text("Session" + fileDate[2] + "." + fileDate[1] + "." + fileDate[0], thisX, thisY);
      }
     
      float rlxAvg = map(relaxationAverageList[i], 0, 100, 0, rectWidth/2);
      float attAvg = map(attentionAverageList[i], 0, 100, 0, rectWidth/2);
      
      textAlign(CENTER, CENTER);
    
      fill(150);
      rect(thisX, thisY, rlxAvg, visHeight/2);
      fill(textDarkColor);
      text("Relaxation "+round(relaxationAverageList[i])+"%", thisX, thisY, visWidth/2, visHeight/2);
      
      fill(70);
      rect(thisX, thisY + visHeight/2, attAvg, visHeight/2);
      fill(textDarkColor);
      text("Attention "+round(attentionAverageList[i])+"%", thisX, thisY + visHeight/2, visWidth/2, visHeight/2);
      
      fill(textDarkColor);
      textAlign(LEFT, CENTER);
      text(caption, thisX, thisY + visHeight);
    }
  
  }
}
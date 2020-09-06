ImageEditor myIE;
void setup()
{
  size(400,400);
  myIE = new ImageEditor("prague.jpg");
  noLoop();
  myIE.resizeWindowToImage(1,1);
}

void draw()
{
  myIE.startEditing();
  for (int y = 0; y <myIE.height(); y = y + 1)
  {
    for (int x = 0; x <myIE.width()-300; x = x + 1)
    {
      
  //black filter
      int r1 = myIE.getRedAt(x,y);
      int r2 = myIE.getRedAt(x+1,y);
      
      int diff = abs(r2-r1);
      
      myIE.setRedAt(diff,x,y);
      myIE.setGreenAt(diff,x,y);
      myIE.setBlueAt(diff,x,y);
      
    }
  }
  for (int y = 0 ; y <myIE.height(); y = y + 1)
  {
    for (int x = 0; x <myIE.width(); x = x + 1)
    {
      //invert colors
      int r = myIE.getRedAt(x,y);
      int g = myIE.getGreenAt(x,y);
      int b = myIE.getBlueAt(x,y);
      
      myIE.setRedAt(r,x,y);
      myIE.setGreenAt(b,x,y);
      myIE.setBlueAt(g,x,y);
    }
  }
  myIE.stopEditing();
  myIE.drawAt(0,0);
  save("resultInWindow.png");
}

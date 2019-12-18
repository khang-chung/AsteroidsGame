class Asteroid extends Floater{
	public void setX(int x) {myCenterX = x;}
	public int getX() {return (int)myCenterX;}
	public void setY(int y) {myCenterY = y;}
	public int getY() {return (int)myCenterY;}
	public void setDirectionX(double x) {myDirectionX = x;}
	public double getDirectionX() {return myDirectionX;}
	public void setDirectionY(double y) {myDirectionY = y;}
	public double getDirectionY() {return myDirectionY;}
	public void setPointDirection(int degrees) {myPointDirection = degrees;}
	public double getPointDirection() {return myPointDirection;}

	private int rotSpeed,corners;
	
	public Asteroid(){ 
		rotSpeed = (int)(Math.random()*5-2);
		myColor = 100;

		myCenterX = (Math.random()*width);
		myCenterY = (Math.random()*height);

		myDirectionX = (Math.random()*1-.25);
		myDirectionY = (Math.random()*1-.25);

		myPointDirection = Math.random()*360;


		corners = 6;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = -16;
		yCorners[0] = 24;
		xCorners[1] = -32;
		yCorners[1] = 0;
		xCorners[2] = -16;
		yCorners[2] = -24;
		xCorners[3] = 16;
		yCorners[3] = 24;
		xCorners[4] = 32;
		yCorners[4] = 0;
		xCorners[5] = 16;
		yCorners[5] = -24;

	}
	public void move(){
		turn(rotSpeed);
		if(rotSpeed == 0){
			rotSpeed = 1;
		}
		super.move();
	}
	 public void show(){ //Draws the floater at the current position             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}

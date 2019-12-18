class Star{
	private int myX, myY;
	public Star(){
		myX = (int)(Math.random()*width);
		myY = (int)(Math.random()*height);
	}
	public void show(){
		stroke(255);
		fill(255, 255, 0);
		ellipse(myX,myY,2,2);
	}
}

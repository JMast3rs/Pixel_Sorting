PImage img;
PImage sorted;

int index(int x, int y){
   return x + y * img.width; 
}

void setup() {
  
  img = loadImage("face.jpg");
  //img = loadImage("faceLow.jpg");
  //img = loadImage("dog.jpg");
  //img = loadImage("dogLow.jpg");
  //img.filter(GRAY);
  sorted = img.get();
  sorted.loadPixels();
  
  size(1440,720);
  image(img,0,0,720,720);
  
}

void  draw(){
  boolean complete = true;
  sorted.loadPixels();
  for (int x = 0; x < sorted.height; x++) {
    for (int y = 0; y < sorted.width-1; y++){
        color pix1 = sorted.pixels[index(x,y)];
        color pix2 = sorted.pixels[index(x,y+1)];
        
        int col1 = floor(red(pix1) + green(pix1) + blue(pix1));
        int col2 = floor(red(pix2) + green(pix2) + blue(pix2));
        
        if (col1 > col2){
            sorted.pixels[index(x,y+1)] = pix1;
            sorted.pixels[index(x,y  )] = pix2;
            complete = false;
        }
        
        
      }
  }
  sorted.updatePixels();
  image(sorted, 720, 0,720,720);
  
  if (complete){
     println("Done");
     noLoop();
  }
}

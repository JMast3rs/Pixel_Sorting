PImage img;

int index(int x, int y){
   return x + y * img.width; 
}

void setup() {
  
  //img = loadImage("face.jpg");
  //img = loadImage("dog.jpg");
  //img = loadImage("raindow.png");
  img = loadImage("raindow2.png");
  //img.filter(GRAY);
  
  surface.setSize(img.width,img.height);
  
}

void  draw(){
  boolean complete = true;
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height-1; y++){
        color pix1 = img.pixels[index(x,y)];
        color pix2 = img.pixels[index(x,y+1)];
        
        int col1 = floor(red(pix1) + green(pix1) + blue(pix1));
        int col2 = floor(red(pix2) + green(pix2) + blue(pix2));
        
        if (col1 > col2){
            img.pixels[index(x,y+1)] = pix1;
            img.pixels[index(x,y  )] = pix2;
            complete = false;
        }
        
        
      }
  }
  img.updatePixels();
  image(img, 0, 0,width,height);
  
  if (complete){
     println("Done");
     noLoop();
  }
}

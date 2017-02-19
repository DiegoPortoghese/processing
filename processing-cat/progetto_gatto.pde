import processing.sound.*;
SoundFile file;
SoundFile file2

PImage image;
PImage imagecd;
PImage imagef1;
PImage imagef2;
PImage imagepav;
PImage imagegom;
PImage imagepos;
PImage imagepos2;
PImage imagecucc;



//message  boolean
boolean step1=false;
//poster boolean
boolean posterchange=false;
//gomitolo boolean
boolean gomitoloclick=false;
//cuccia boolean
boolean cucciaclick=false;
//lp boolean
boolean lpclick=false;

boolean baloonfinestra=true;
boolean button = false;

int eventofinestra= 0;
int tempomenu;
//timer
int startTime;

float angle = 0.0;
float angleDirection = 1.2;
float speed = 0.005;

//PUPILLA
float x1, x2, y1, y2;
float xEye1;
float xEye2;
float yEye1;
float yEye2;

String testobaloon="";
String typing = "";
String saved = "";
PFont f;
PFont f2;

int timerdigomitolo;
int timerdicuccia;
int timerdilp;
void setup() {
	size(850, 400);
	rectMode(CENTER);

	file = new SoundFile(this, "CanzoneCansone.wav");
	file.play();
	file.amp(0.15);
  file2 = new SoundFile(this, "lpsound.wav");


	image=loadImage("sfondo.png");
	imagecd=loadImage("lp.png");
	imagef1=loadImage("finestra1.png");
	imagef2=loadImage("finestra2.png");
	imagepav=loadImage("pavimento.png");
	imagegom=loadImage("gomitologatto.png");
	imagepos=loadImage("breakingcat.png");
	imagepos2=loadImage("gattosexy.png");
	imagecucc=loadImage("cuccia.png");
}

 
 //FINESTRA CHIUSA
void finestra() {
  image(imagef1, 605, 27, 185, 160);
}

  //FINESTRA APERTA
void finestra2() {
  image(imagef2, 560, 15, 280, 180);
}
void baloon () {
  strokeWeight(2);
  fill(255);
  ellipse( 140,68,200,130);
}


void draw() {
	
	background(0);
	f= createFont("emulogic", 13);
	textFont(f);

	if(saved==""){
		testobaloon="Hey tu, come sei finito in questo posto?\nvai via!\nnyah\n...\nno scherzo, non andartene!\na dir la verita' stavo iniziando ad annoiarmi \n\ndimmi un po', Come ti chiami? \n" + typing;
		text(testobaloon, 40, 40);
		tempomenu=millis();
	}else{
		strokeWeight(3);
		f2= f= createFont("prstart", 15);   
		textFont(f2);
		//PARETE
		image (image,0,0, width/1.0, height/0.6);
    //lP 
    fill(250);
    strokeWeight(3);
    rect (100, 150, 92, 92);
    image (imagecd,56,106, 90, 90);

    //pavimento
    image(imagepav, 0, 325, 850, 130);
    fill(0);
		//GATTO;
		//corpo gatto
		fill(#FAA00F);
		strokeWeight(4);
		rect(250, 250, 140, 170);
		//macchia occhio
		fill(0);
		rect(300,190, 40, 50);
    
		//ORECCHIE
		triangle(180, 140, 200, 165, 180, 165);
		triangle(320, 140, 320, 165, 300, 165);
		//OCCHIQUADRATI
		fill(#44EA39);
		strokeWeight(3);
		rect( 210, 200, 30, 30);
		rect(290, 200, 30, 30);
		noFill();
		//PUPILLA
		xEye1 = map(mouseX, 0, 850, 202.5, 217.5);
		yEye1 = map(mouseY, 0, 450, 192.5, 207.5);

		xEye2 = map(+mouseX, 0, 850, 282.5, 297.5); 
		yEye2 = map(mouseY, 0, 450, 192.5, 207.5);

		fill(0, 0, 0);
		strokeWeight(6);
		ellipse(xEye1, yEye1, 10, 10);
		ellipse(xEye2, yEye2, 10, 10);
		//FINE GATTO

		// cordinate rage click finestra 
		/**  rect(585, 105, 60, 160); //anta sinistra
		 rect (810, 105, 60, 160);   //anta destra
		 rect(695, 105, 140, 140);  //quadrato centrale  **/
		int tempo=millis();

		if (!step1) {
			baloon();
			fill(0);
			testobaloon="Ciao\n " + saved;
			text(testobaloon, 90, 70);
		}

		boolean timer1;
		//quando start time è maggiore di wait time timer1 diventa true
		tempo=tempo - tempomenu;
		timer1 = tempo > 2000;

		if (timer1) {
  			if(tempo < 10000){
  				baloon();
  				fill(0);
  				testobaloon="              Io sono DiegoMax \n        Sono sicuro che diventeremo\n              A-MICI! (=^-ω-^=)";
  				text(testobaloon, 33, 50);
  				step1=true;
  			}
    }
		
		// FINESTRA BUTTON
		if(button){
			if(mouseX > 555 && mouseX < 615 && mouseY > 35 && mouseY < 245 &&mousePressed){
				button=false;}
			if(mouseX > 780 && mouseX < 840 && mouseY > 35 && mouseY < 245 &&mousePressed){
				button=false;}
				
			testobaloon="SI è aperta la finestra";
			baloon();
			finestra2();
			fill(0);
			text(testobaloon, 40, 50);
		}else{
      //if button centrale
			if(mouseX > 625 && mouseX < 765 && mouseY > 35 && mouseY < 245 &&mousePressed){ 
				button=true;
			}
      finestra();
		}
		
		//cuccia
		image (imagecucc, 620, 139, 260, 260);
    //poster1
    image(imagepos, 400, 70, 120, 120);
    
    if(posterchange==true){
      //
      baloon();
      testobaloon="\n   HAI TOCCATO IL POSTER";
      fill(0);
      text(testobaloon, 40, 50);
      image(imagepos2, 400, 70, 120, 120);
    }
    
    
  int tempomenotg = tempo - timerdigomitolo;
    if(gomitoloclick){
      baloon();
      testobaloon="\n   HAI TOCCATO IL GOMITOLO";
      fill(0);
      text(testobaloon, 40, 50);
      if(tempomenotg > 1000){
        gomitoloclick=false;
      }
    }
    
  int tempomenotg2 = tempo - timerdicuccia;  
    if(cucciaclick){
        baloon();
        testobaloon="\n   HAI TOCCATO LA CUCCIA";
        fill(0);
        text(testobaloon, 40, 50);
        if(tempomenotg2 > 1000){
          cucciaclick=false;
        }
      }
      
  int tempomenotg3 = tempo - timerdilp;  
    if(lpclick){
        baloon();
        testobaloon="\n Lo sai che Claudio \n       è leso?";
        fill(0);
        text(testobaloon, 40, 50);
        if(tempomenotg3 > 1000){
          lpclick=false;
        }
      }     
    //gomitolo
    image(imagegom, 430, 320, 130, 95);
    
		//CODA
		translate(325, 320); // Move to start position  rotate(-angle);
		strokeWeight(13.5);
		line(0, 3, 40, 0);
		translate(43, 0); // Move to next joint
		rotate(angle * -1.0);
		strokeWeight(13);
		line(0, 0, 30, 0);
		translate(33, 0);
		rotate(-angle * 1.25);
		strokeWeight(12);
		line(0, 0, 20, 0);
		translate(23, 0); // Move to next joint
		rotate(angle * -1.0);
		strokeWeight(11);
		line(0, 0, 10, 0);


		angle += speed * angleDirection;
		if ((angle > QUARTER_PI) || (angle < 0)){
			angleDirection = -angleDirection;
		}
    //FINE CODA
    

	}//END ELSE
}//FINE DRAW

void keyPressed() {
	if (key == '\n' ) {
		saved = typing;
		typing = "";
	}else{
		if(typing.length()<20){
			typing = typing + key;
		}
	}
}




void mouseClicked() {
  //POSTER CLICK
  if(!posterchange){
    if(mouseX > 400 && mouseX < 520 && mouseY > 70 && mouseY < 190){
      posterchange=true;
    }
  }else if(posterchange){
      if(mouseX > 400 && mouseX < 520 && mouseY > 70 && mouseY < 190){
        posterchange=false;
      }
  }
  //GOMITOLO CLICK
  if(!gomitoloclick){
    if(mouseX > 430 && mouseX < 550 && mouseY > 320 && mouseY < 415){
      timerdigomitolo=millis();
      gomitoloclick=true;
    }
  }
    //CUCCIA CLICK
    if(!cucciaclick){
      if(mouseX > 620 && mouseX < 830 && mouseY > 300 && mouseY < 395){
        timerdicuccia=millis();
        cucciaclick=true;
      }
    }
    //CLICK LP rect (100, 150, 92, 92); 46
    if(!lpclick){
      if(mouseX > 54 && mouseX < 192 && mouseY > 104 && mouseY < 196){
        file2.play();
        timerdilp=millis();
        lpclick=true;
      }
    }
    
}

  
 
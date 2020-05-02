import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  //kind of data type for stpring images
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");
 
  AssetImage diceImage1 ;
  AssetImage diceImage2 ;
  int test = 0 ;
  int counter1 = 0;
  int counter2 = 0;

  String showmsg = ' ';
  String showmoney =' ';

   var money = [ 
    'Rs.50  ',
    'Rs.100',
    'Rs.150',
    'Rs.200',
    'Rs.250',
    'Rs.500',
    'Rs.1000',

  ];






  @override
  void initState(){
    super.initState();
    setState(() {
      diceImage1=one;
      diceImage2=five;
      this.showmsg ='Start Game';

    });
  }

  void rollDice(){
    int random1 = (1 + Random().nextInt(6));
    AssetImage newImage1;
    AssetImage newImage2;
    this.showmoney =' ';
      
    switch (random1) {
      case 1:
       newImage1=one; 
       counter1=1;       
        break;
      case 2:
       newImage1=two; 
       counter1=2;
        break;
      case 3:
       newImage1=three;
       counter1=3;       

        break;
      case 4:
       newImage1=four;
       counter1=4;       

        break;
      case 5:
       newImage1=five;
       counter1=5;       

        break;
      case 6:
       newImage1=six;
       counter1=6;       

        break;
      
    }

    int random2 = (1 + Random().nextInt(6));
    

    
    switch (random2) {
      case 1:
       newImage2=one;
       counter2 = 1;        
        break;
      case 2:
       newImage2=two;
       counter2 = 2;        

        break;
      case 3:
       newImage2=three;
       counter2 = 3;        

        break;
      case 4:
       newImage2=four; 
       counter2 = 4;        

        break;
      case 5:
       newImage2=five; 
       counter2 = 5;        

        break;
      case 6:
       newImage2=six;
       counter2 = 6;        

        break;
      
    }

    

    setState(() {
      diceImage1=newImage1;
      diceImage2=newImage2;
      test = counter1+counter2;
      this.checkWin();     

    });

  }


  setmoney(){
    var random1= Random().nextInt(money.length);
    
    setState(() {
      showmoney= money[random1];
    });
  }





  checkWin(){
   
    if(test==8){
      setState(() {
        this.showmsg = 'YOU WON!!';
        this.setmoney();
        
      });

    }
    else{
      setState(() {
        this.showmsg= 'Better Luck Next time!';
      });
      
    }
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Dice roller'),
        
      ),
      body: Container(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

               Container(
             padding: EdgeInsets.all(20.0),
             child: Text('Make the sum of Dice = 8',
             style: TextStyle(fontSize: 30.0,
             fontWeight: FontWeight.bold,color: Colors.orangeAccent,
             ),
             ),
             ),

             SizedBox(height: 30),

             
              Image(image: diceImage1,
              width: 100.0,
              height: 100.0
              ,),
              SizedBox(height: 30),
              Image(image: diceImage2,
              width: 100.0,
              height: 100.0,
              ),
              

              Container(
             padding: EdgeInsets.all(20.0),
             child: Text(this.showmsg,
             style: TextStyle(fontSize: 20.0,
             fontWeight: FontWeight.bold,color: Colors.yellowAccent
             ),
             ),
             ),


              Container(
             padding: EdgeInsets.all(20.0),
             child: Text(this.showmoney,
             style: TextStyle(fontSize: 35.0,
             fontWeight: FontWeight.bold, color: Colors.orangeAccent
             ),
             ),
             ),







              
              Container(
                margin: EdgeInsets.only(top: 100.0) ,
                width: 300.0,
                                              
                child: RaisedButton(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: Text('Roll the Dice!'),
                  onPressed: rollDice,                 
                  shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                  ),
                  splashColor: Colors.pinkAccent,
                ),
              ),
              
            ],
          ),
        ),
      ),

      
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tip_calculator/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double billAmount = 0, tipPercentage = 5,tipAmount = 1, people = 1, totalAmount = 0;

  void tipDecrement()
  {
    setState(() {
      tipPercentage--;
    });
  }

  void peopleDecrement()
  {
    setState(() {
      people--;
    });
  }

  void peopleIncrement()
  {
    setState(() {
      people++;
    });
  }

  void tipincrement()
  {
    setState(() {
      tipPercentage++;
    });
  }

  void calculate()
  {
    if(people == 1)
      {
        setState(() {
          tipAmount = billAmount * (tipPercentage/100);
          totalAmount = billAmount + tipAmount;
        });
      }
    else
      {
        setState(() {
          tipAmount = billAmount * (tipPercentage/100);
          tipAmount = tipAmount / people;
          double bilPerson = billAmount/people;
          totalAmount = billAmount + tipAmount;
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff76C4C6),
      appBar: AppBar(
        backgroundColor: Color(0xff2E8083),
        title: appBar(context),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/notes.jfif',height: 50,width: 100,),
            SizedBox(height: 6.0,),
            SizedBox(height: 20,),
            TextField(
              onChanged: (val){
                billAmount = double.parse(val);
              },
              decoration: InputDecoration(
                hintText: 'Bill Amount',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text('Tip %'),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    tipDecrement();
                  },
                    child: Icon(Icons.remove_circle
                    )
                ),
             SizedBox(height: 15.0,),
             Text("$tipPercentage %"),
                SizedBox(height: 15.0,),
             GestureDetector(
                 onTap:() {
                   tipincrement();
                 },
                 child: Icon(Icons.add_circle)),
                SizedBox(height: 8.0,)
              ],
            ),
            SizedBox(height: 16.0,),
            Row(
              children: [
                Text('People'),
                Spacer(),
                GestureDetector(
                    onTap: (){
                      peopleDecrement();
                    },
                    child: Icon(Icons.remove_circle
                    )
                ),
                SizedBox(height: 15.0,),
                Text("$people"),
                SizedBox(height: 15.0,),
                GestureDetector(
                    onTap:() {
                      peopleIncrement();
                    },
                    child: Icon(Icons.add_circle)),
                SizedBox(height: 8.0,)
              ],
            ),
            SizedBox(height: 22.0,),
            GestureDetector(
              onTap: ()
              {
                if(billAmount > 0)
                  {
                    calculate();
                  }
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal:24, vertical: 12),
                  decoration: BoxDecoration(
                    color:Color(0xff343B3B),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Text('calculate',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white),
                  ),
                ),
            ),

            SizedBox(height: 25.0,),
            tipAmount != 0 ?Text(
                people == 1 ?"Tip : $tipAmount " : "Tip : $tipAmount person ") : Container(),
            SizedBox(height: 15,),
            totalAmount != 0 ?Text(
                people == 1? "Total Amount : $totalAmount" : "Total Amount : $totalAmount per person"
            ) : Container(),
          ],
        ),
      ),
    );
  }
}

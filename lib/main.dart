import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
var result = "";
var bgcolor=Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('BMI APP'),
      ),
      body: Container(
        color:bgcolor,
    child: Center(
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: Container(
              width: 300,



              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600),),
                  SizedBox(height: 21,),
                  TextField(

                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your weight (in kgs)',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                         prefixIcon:Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your height (in feet)',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                        prefixIcon:Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text("enter your height (in inch)",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      prefixIcon:Icon(Icons.height)

                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 23,),
                  ElevatedButton(onPressed:(){
                    var wt=wtController.text.toString();
                    var ft= ftController.text.toString();
                    var inch=inController.text.toString();
                    if(wt!=""&& ft!=""&&inch!="")
                      {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
                        var tInch =(iFt*12)+iInch;
                        var tCm= tInch*2.54;
                        var tM= tCm/100;
                        var bmi = iWt/(tM*tM);
                        var msg="";
                        if(bmi>25){
                         msg= "your over weight!!";
                         bgcolor=Colors.redAccent.shade200;
                        }else if(bmi<18){
                          msg="your under weight!!";
                          bgcolor=Colors.deepOrange.shade100;

                        }else{
                          msg="your healthy!!";
                          bgcolor=Colors.cyan.shade200;

                        }
                        setState(()

                        {result ="$msg \n your BMI is :${bmi.toStringAsFixed(4)}";
                        });


                  }else{
                      SizedBox(height: 12,);
                      setState(() {
                        result ="please entre the blanks";
                      });
                    }
                  }, child: Text('Calculate')),
                  SizedBox(height: 12,),
                  Text(result,style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}

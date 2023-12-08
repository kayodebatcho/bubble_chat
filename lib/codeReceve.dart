import 'package:flutter/services.dart';

import 'inscription.dart';
import 'package:flutter/material.dart';
import 'email.dart';
import 'Accueil.dart';
import 'ForgetPassword.dart';

void main() {
  runApp(const CodeReceve());
}

class CodeReceve extends StatelessWidget {
  const CodeReceve({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Chat Bubble',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 170, 65, 65)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}


class MyHomePage extends StatefulWidget {

 

  
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final formKey = new GlobalKey<FormState>();
  final  TextEditingController _dateController = TextEditingController();
      List<TextEditingController> codeController = List.generate(6, (index) => TextEditingController());

  void _selectedDate(BuildContext context){
    showDatePicker(context: context,
    initialDate: DateTime.now(), firstDate: DateTime(1909),
     lastDate: DateTime.now(),).then((picked){
      if(picked != null && picked != _selectedDate){
        setState(() {
         final _selectedDate = picked;
          _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
        });
      }
     }
      );


 
  }
   

  
 
  
 

    String description ="";
    void updateDescription() {
      if(formKey.currentState!.validate() )
      {
        setState(()
        {
          description = "";
        });
      } 
       }
       @override 
       void dispose() {
        _dateController.dispose();
        super.dispose();

       }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor:Color.fromRGBO(238, 240, 238, 1),
      appBar: AppBar(
        toolbarHeight: 100,
           backgroundColor:Color.fromRGBO(13, 44, 10, 1),
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
               IconButton(
            icon: Icon(Icons.arrow_back),color:Colors.white ,
             onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) =>Accueil(),),);},),
            
             Image.asset('assets/images/chatBU.png',
        width: 40.0,
        height: 40.0,
        ),

              ],
               
            ),
             
            SizedBox(height: 10,),
            Center(
            
               child: Text('Connexion',style: TextStyle(fontSize:20.0,color: Colors.white),),
            ),
              SizedBox(height: 2,),
             Center(
               child: Text("s'identifier pour continuer",style: TextStyle(fontSize:12.0,color: Colors.white),),
            ),
            
            
            ]
            
          ),
          
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
       
      ),
      body: Center(
        
        child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         
         Form(key: formKey, child: Column( 
         
         ),
          
         ),
          Center(
               child: Text("un code secret vous à été envoyez par message veillez entrer le code réçu",style: TextStyle(fontSize:12.0,color: Colors.black),),
            ),
        
                 Row (
           mainAxisAlignment: MainAxisAlignment.center,
           children:[
             
        for (int i = 0; i < codeController.length; i++)
       Container(
        margin: EdgeInsets.only(right: 10.0),
         child: SizedBox(
          width: 40.0,
          height: 60,

          child: TextField(
            controller: codeController[i],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center ,
             inputFormatters: [LengthLimitingTextInputFormatter(1)],
            decoration: InputDecoration(
              border: OutlineInputBorder(),

            ),
            
            onChanged: (value) {
              if(value.length == 1 && i < codeController.length -1  ) {

                FocusScope.of(context).nextFocus();
              }

            },
            
             
          )
    
          
        ),

       )
        
                
             
                
              ],
         ),

         
          SizedBox(height:20.0),
         Row (
           mainAxisAlignment: MainAxisAlignment.end,
           children:[
         InkWell( 
          onTap:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>ForgetPassword()), );
          },

          child: Text("mot de passe oublié?",style: TextStyle(fontSize: 10.0),),

         )
              
             
                
              ],
         ),
           SizedBox(height:18.0),
         Row (
           mainAxisAlignment: MainAxisAlignment.end,
           children:[
         
               Text("vous n'avez par de compte?",style: TextStyle(fontSize: 10.0,),),
            InkWell(
          onTap:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>Inscription()), );
          },

          child:  Text("créer un compter",style: TextStyle(fontSize: 10.0,color:Colors.blue,),

         )

              
              
              ),
                
              ],
         ),
          
         
          
 SizedBox(height:180.0),
        
            ElevatedButton(onPressed:(){
               Navigator.push(context,
                MaterialPageRoute(builder: (context) =>Email()),);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(13, 44, 10, 1)),
            
              padding: MaterialStateProperty.all(EdgeInsets.all(20.0),
           
            ), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),
            fixedSize: MaterialStateProperty.all(Size(200.0, 50.0),),
             
            ),
             child: Text("SE CONNECTER", style: TextStyle(fontSize:17.0,color: Colors.white),)
            ),
            Text(description)
           
          ],
        ),
       
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

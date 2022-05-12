import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'encryption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tec,
              ),
            ),
            Column(
              children: [
                Text(
                  "PLAIN TEXT",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(plainText == null ? "" : plainText),
            
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "ENCRYPTED TEXT",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(encryptedText == null
                      ? ""
                      : encryptedText is encrypt.Encrypted
                          ? encryptedText.base64
                          : encryptedText == null ? "" : plainText),
            
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(onPressed: (){
                  plainText = tec.text;
                  setState((){
                    encryptedText = MyEncryptionDecryption.encryptAES(plainText); 
                  });
                },
                child: Text("Encrypt"),
                ),
                SizedBox(width: 10,),
                RaisedButton(onPressed: (){
                  setState(() {
                   encryptedText = MyEncryptionDecryption.decryptAES(encryptedText);  
                  });
                  
                },
                child: Text("Decrypt"),
                ),
              ],
            )
          ],
          
        ),
      ),
      
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project/AddQuestion.dart';
import 'package:flutter_project/startquiz.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          'Quiz app',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'PTSans',
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('hla ghazali',style: TextStyle(
                fontFamily: 'PTSans',
              ),),
              accountEmail: Text('hlaghazali@gmail.com',style: TextStyle(
                fontFamily: 'PTSans',
              ),),
              currentAccountPicture: CircleAvatar(
                child: Text('H',style: TextStyle(
                  fontFamily: 'PTSans',
                ),),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.create),
              title: const Text('Create Quiz',style: TextStyle(
                fontFamily: 'PTSans',
              ),),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return  AddQuestion(onSave: (Question ) {  },);
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('Start Quiz',style: TextStyle(
                fontFamily: 'PTSans',
              ),),
              onTap: () {

              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit',style: TextStyle(
                fontFamily: 'PTSans',
              ),),
              onTap: () {
                // TODO: Exit the app
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Image.asset('image/quiz.png'),
            const SizedBox(height: 10),
            Container(
              width: 100,
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return  StartQuiz();
                }));},
                child: const Text("Let's Start!",style: TextStyle(
                  fontFamily: 'PTSans',
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

clicked(String s) {}

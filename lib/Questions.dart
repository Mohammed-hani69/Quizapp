import 'package:flutter/material.dart';
import 'package:flutter_project/AddQuestion.dart';

void main() {
  runApp(Questions());
}

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: QuestionList(),
      ),
    );
  }
}

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  final List<Question> questions = [
    Question(
      question: 'What is Flutter?',
      options: [
        'A mobile development framework',
        'A database management system',
        'A programming language',
        'An operating system'
      ],
    ),
    Question(
      question: 'What programming language is used in Flutter?',
      options: ['Java', 'Dart', 'Swift', 'Kotlin'],
    ),
    Question(
      question: 'What is a widget in Flutter?',
      options: [
        'A graphical user interface element',
        'A database table',
        'A programming function',
        'A type of animation'
      ],
    ),
  ];

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Question'),
          content: Text('Are you sure you want to delete this question?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  questions.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToAddQuestion() {
    Navigator.pushNamed(context, '/AddQuestion');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quiz'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                // Add your logic for adding a question
              },
              label: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), // Apply border radius
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24), // Increase padding for bigger box
                child: Text('Add new question'),
              ),
              icon: Icon(Icons.add),
              backgroundColor: Colors.teal,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[200], // Set gray background color
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align options to the left
                    children: [
                      ListTile(
                        title: Text(
                          questions[index].question,
                          style: TextStyle(
                            fontSize: 20, // Increase font size
                            fontWeight: FontWeight.bold, // Make it bold
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteConfirmationDialog(index);
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .stretch, // Make options boxes same width
                        children: questions[index].options.map((option) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            height:
                                60, // Set a fixed height for each option box
                            padding: EdgeInsets.all(10),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;

  Question({required this.question, required this.options});
}

class QuestinList extends StatefulWidget {
  const QuestinList({Key? key}) : super(key: key);

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestinListState extends State<QuestionList> {
  final List<Question> questions = [
    Question(
      question: 'What is Flutter',
      options: [
        'A mobile development framework',
        'A database management system',
        'A programming language',
        'An operating system'
      ],
    ),
    Question(
      question: 'Question 2',
      options: ['Option 1', 'Option 2', 'Option 3'],
    ),
    Question(
      question: 'Question 3',
      options: ['Option 1', 'Option 2', 'Option 3'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index].question),
            subtitle: Text(questions[index].options.join(', ')),
            trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  final Function(Question) onSave;

  const AddQuestion({Key? key, required this.onSave}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  String? correctAnswer ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Question',style: TextStyle(
          fontFamily: 'PTSans',
        ),),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: questionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Question',
                        hintText: 'Enter the question',
                        labelStyle: TextStyle(color: Colors.black45),
                        prefixIcon: Icon(Icons.question_mark),
                        fillColor: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:20),
              buildOptionRow(
                optionController: option1Controller,
                optionValue: 'First Answer',
                avatarLetter: 'A',
                avatarColor: Colors.yellow,
                visible: true,
              ),
              SizedBox(height: 10),
              buildOptionRow(
                optionController: option2Controller,
                optionValue: 'Second Answer',
                avatarLetter: 'B',
                avatarColor: Colors.green,
                visible: false,
              ),
              SizedBox(height: 10),
              buildOptionRow(
                optionController: option3Controller,
                optionValue: 'Third Answer',
                avatarLetter: 'C',
                avatarColor: Colors.grey,
                visible: false,
              ),
              SizedBox(height: 10),
              buildOptionRow(
                optionController: option4Controller,
                optionValue: 'Fourth Answer',
                avatarLetter: 'D',
                avatarColor: Colors.pink,
                visible: false,
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value:correctAnswer,
                    items:  {
                      DropdownMenuItem(
                        value: option1Controller,
                        child: const Text('A'),
                      ),
                      DropdownMenuItem(
                        value: option2Controller,
                        child: const Text('B'),
                      ),
                      DropdownMenuItem(
                        value: option3Controller,
                        child: const Text('C'),
                      ),
                      DropdownMenuItem(
                          value: option4Controller,
                          child: const Text('D'),
                      ),
                    }.toList(),
                    onChanged: (value) {
                      setState(() {
                        correctAnswer = value as String?;
                      });
                    },
                    underline: Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,  // تحديد لون الخط
                            width: 1,  // تحديد عرض الخط
                          ),
                        ),
                      ),
                    ),
                    isExpanded: false, // يجعل العنصر لا يستحوذ على المساحة الكاملة
                    hint: const Text('Select Correct Answer',style: TextStyle(
                      fontFamily: 'PTSans',
                    ),), // رسالة توضيحية للمستخدم
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Question question = Question(
                        question: questionController.text,
                        option1: option1Controller.text,
                        option2: option2Controller.text,
                        option3: option3Controller.text,
                        option4: option4Controller.text,
                        correctAnswer: correctAnswer!,
                      );
                      widget.onSave(question);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child:const Text(
                      'Add question',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'PTSans',
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionRow({
    required TextEditingController optionController,
    required String optionValue,
    required String avatarLetter,
    required Color avatarColor,
    required bool visible,
  }) {
    return Row(
      children: [
        CircleAvatar(
          child: Text(
            avatarLetter,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: avatarColor,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: optionController,
            keyboardType: TextInputType.name,
            minLines: 1,
            maxLines: 1,
            decoration: InputDecoration(
              labelText:'Option $optionValue',
              hintText: 'Enter the option',
              labelStyle: const TextStyle(color: Colors.black45),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Question {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correctAnswer;

  Question({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correctAnswer,
  });
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_peeps_app/models/question.dart';
import 'package:green_peeps_app/questionnaire/response.dart';
import 'package:provider/provider.dart';

// build form credit skeleton: Grace

class BuildQuestionForm extends StatefulWidget {
  Question question;
  Response response;

  BuildQuestionForm({Key? key, required this.question, required this.response})
      : super(key: key);

  @override
  _BuildQuestionFormState createState() => _BuildQuestionFormState();
}

class _BuildQuestionFormState extends State<BuildQuestionForm> {
  @override
  // static String dropDownValue = widget.question.getAnswers()[0];
  // TODO make radio button question type

  Widget _makeMCButton(BuildContext context, String categoryName) {
    return TextButton(
      onPressed: () {
        // TODO set value of mc and return??? /create response
      },
      child: Text(categoryName),
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: const Color.fromRGBO(201, 221, 148, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  // Build a form widget for questions with yes/no answer
  // Widget _buildOption(BuildContext context) {
  //   return SizedBox(
  //     width: double.infinity, // this value is the maximum value width can be
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: const <Widget>[
  //         Text("TBD"),
  //       ],
  //     ),
  //   );
  // }

  // Build a form widget for questions with answers selected from dropdown box

  Widget _buildDropDown(BuildContext context) {
    // String dropDownValue = widget.question.getAnswers()[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Consumer<QuestionListModel>(
              builder: (context, questionListModel, child) {
            return DropdownButton<String>(
              elevation: 8,
              value: dropDownValue,
              dropdownColor: Colors.white,
              iconDisabledColor: Colors.grey,
              iconEnabledColor: Colors.grey,
              style: const TextStyle(color: Colors.black),
              onChanged: (newValue) {
                setState(
                  () {
                    dropDownValue = newValue.toString();
                    widget.response.answer = dropDownValue; //
                    for (Answer answer in widget.question.answers) {
                      if (answer.text == dropDownValue) {
                        if (answer.nextQuestion != null) {
                          questionListModel.addQuestion(answer.nextQuestion!);
                        }
                        break;
                      }
                    }
                  },
                );
              },
              items:
                  widget.question.getAnswerText().map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            );
          }),
          const Divider(),
        ],
      ),
    );
  }

  // Build a form widget for questions that require the user to input text
  // (will possibly need different validators for number answers and string answers)
  Widget _buildNumberTextField(BuildContext context) {
    return SizedBox(
      width: double.infinity, // make 200 but then the box isnt on the left
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text("Please enter a number:",
          //   style: TextStyle(
          //       fontSize: 15,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.grey),
          // ),
          Consumer<QuestionListModel>(
              builder: (context, questionListModel, thing) {
            return TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                // widget.response.answer = value;
                return null;
              },
              onChanged: (value) {
                setState(
                  () {
                    widget.response.answer = value;
                    for (Answer answer in widget.question.answers) {
                      if (answer.text == value) {
                        if (answer.nextQuestion != null) {
                          questionListModel.addQuestion(answer.nextQuestion!);
                        }
                        break;
                      }
                    }
                  },
                );
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                hintText: 'Please enter a number',
              ),
            );
          }),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  String dropDownValue = "";
  void _setDefaultDropDownValue() {
    if (dropDownValue == "") {
      dropDownValue = widget.question.getAnswerText()[0];
    }
  }

  Widget build(BuildContext context) {
    if (widget.question.fieldType == 0) {
      // Numerical
      return _buildNumberTextField(context);
    } else if (widget.question.fieldType == 1) {
      // Multiple choice [ACTUALLY REPLACE W DROPDOWN]
      _setDefaultDropDownValue();
      return _buildDropDown(context);
    } else if (widget.question.fieldType == 2) {
      // Dropdown
      _setDefaultDropDownValue();
      return _buildDropDown(context);
    } else {
      return const SizedBox();
    }
  }
}

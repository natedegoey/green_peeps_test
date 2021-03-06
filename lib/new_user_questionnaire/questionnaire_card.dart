import 'package:flutter/material.dart';
import 'package:green_peeps_app/models/question.dart';
import 'package:green_peeps_app/questionnaire/response.dart';
import 'package:green_peeps_app/questionnaire/build_question_card.dart';
import 'package:flutter/foundation.dart';

// rename to build question form

class QuestionnaireCard extends StatefulWidget {
  final Question question;
  final Response response;

  const QuestionnaireCard(
      {Key? key, required this.question, required this.response})
      : super(key: key);

  @override
  _QuestionnaireCardState createState() => _QuestionnaireCardState();
}

class _QuestionnaireCardState extends State<QuestionnaireCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(248, 244, 219, 1),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            widget.question.text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: BuildQuestionForm(
                question: widget.question,
                response: widget.response,
              ),
            ),
            // Row(
            //   children: <Widget>[
            //
            //   ]
            // ),
          ],
        ),
      ]),
    );
  }
}

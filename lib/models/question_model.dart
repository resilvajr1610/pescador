import '../utils/export.dart';

class QuestionModel{

  String _id="";
  String _question="";
  String _answer="";

  QuestionModel();

  QuestionModel.fromSnapshot(DocumentSnapshot snapshot):_question = snapshot['pergunta'];

  QuestionModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    this.id = documentSnapshot.id;
    this.question = documentSnapshot["pergunta"];
    this.answer = documentSnapshot["resposta"];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "id" : this.id,
      "pergunta" : this.question,
      "resposta" : this.answer,
    };
    return map;
  }

  String get answer => _answer;

  set answer(String value) {
    _answer = value;
  }

  String get question => _question;

  set question(String value) {
    _question = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
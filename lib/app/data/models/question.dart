import 'dart:convert';

import 'package:equatable/equatable.dart';

class DataResponse extends Equatable {
  
  const DataResponse({
    this.responseCode,
    this.results,
  });

  final int? responseCode;
  final List<QuestionModel>? results;

  DataResponse copyWith({
    int? responseCode,
    List<QuestionModel>? results,
  }) =>
      DataResponse(
        responseCode: responseCode ?? this.responseCode,
        results: results ?? this.results,
      );

  factory DataResponse.fromRawJson(String str) =>
      DataResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
        responseCode: json["response_code"],
        results: json["results"] == null
            ? []
            : List<QuestionModel>.from(
                json["results"]!.map((x) => QuestionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [
        responseCode,
        results,
      ];
}

class QuestionModel extends Equatable {
  QuestionModel({
    this.category,
    this.type,
    this.difficulty,
    this.question = "",
    this.correctAnswer = "",
    this.incorrectAnswers = const [],
    this.userChoose,
  }) : allAnswer = [];

  final String? category;
  final Type? type;
  final Difficulty? difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  List<String>? allAnswer;
  final String? userChoose;

  QuestionModel copyWith({
    String? category,
    Type? type,
    Difficulty? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
    String? userChoose,
    List<String>? allAnswer,
  }) =>
      QuestionModel(
        category: category ?? this.category,
        type: type ?? this.type,
        difficulty: difficulty ?? this.difficulty,
        question: question ?? this.question,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
        userChoose: userChoose ?? this.userChoose,
        // allAnswer: allAnswer ?? this.allAnswer,
      );

  bool get correct => userChoose == correctAnswer;

  // List<String> get answers {
  //   List<String> allAnswer = [];
  //   print(question);
  //   allAnswer.addAll(incorrectAnswers ?? []);
  //   incorrectAnswers!.forEach((element) {
  //     print(element);
  //   });
  //   print(correctAnswer);
  //   allAnswer.add(correctAnswer ?? "");
  //   allAnswer.shuffle();
  //   return allAnswer;
  // }

  factory QuestionModel.fromRawJson(String str) =>
      QuestionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  String get quizzQuestion => question;
  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        category: json["category"],
        type: typeValues.map[json["type"]]!,
        difficulty: difficultyValues.map[json["difficulty"]]!,
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: json["incorrect_answers"] == null
            ? []
            : List<String>.from(json["incorrect_answers"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": typeValues.reverse[type],
        "difficulty": difficultyValues.reverse[difficulty],
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };

  @override
  List<Object?> get props => [
        category,
        type,
        difficulty,
        question,
        correctAnswer,
        incorrectAnswers,
      ];
}

enum Difficulty { MEDIUM, EASY, HARD }

final difficultyValues = EnumValues({
  "easy": Difficulty.EASY,
  "hard": Difficulty.HARD,
  "medium": Difficulty.MEDIUM
});

enum Type { MULTIPLE, BOOLEAN }

final typeValues =
    EnumValues({"boolean": Type.BOOLEAN, "multiple": Type.MULTIPLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
import 'package:injectable/injectable.dart';

import '../util/network/http_request.dart';
import 'models/question.dart';


abstract class IQuizzDataSource {
  Future<List<QuestionModel>> getQuestions();
}

@Injectable(as: IQuizzDataSource)
class QuizzDataSource implements IQuizzDataSource {
  @override
  Future<List<QuestionModel>> getQuestions() async {
    List<QuestionModel> questions = [];
    try {
      final respone = await DioRequest().get("?amount=10");
      if (respone.statusCode == 200) {
        questions = DataResponse.fromJson(respone.data).results ?? [];
      }
    } catch (e) {
      throw Exception();
    }
    return questions;
  }
}
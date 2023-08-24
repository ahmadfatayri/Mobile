// import 'package:flutter_test/flutter_test.dart';
// import 'package:iqlim/domain/usecases/fetch_headline_use_case.dart';
// import 'package:iqlim/domain/usecases/auth_use_case.dart';
//
// import 'package:tuple/tuple.dart';
//
// import 'repositories/mock_article_repository.dart';
// import 'repositories/mock_auth_repository.dart';
//
// void main() {
//   test('Sign up test', () async {
//     //Mock input
//     final registerUserName = "test username";
//
//     //Mock data
//     final signUpUseCase = SignUpUseCase(MockAuthenticationRepository());
//     final user = await signUpUseCase.execute(registerUserName);
//
//     expect(user.username, registerUserName);
//   });
//
//   test('Fetch headline test', () async {
//     final pageSize = 20;
//     final currentPage = 1;
//
//     //Mock data
//     final fetchHeadlineUseCase = FetchHeadlineUseCase(MockArticleRepository());
//     final paging =
//     await fetchHeadlineUseCase.execute(Tuple2(currentPage, pageSize));
//
//     // Verify that data has created.
//     expect(paging.articles.length, 20);
//   });
//
//   test('Fetch news test', () async {
//     //Mock input
//     final keyword = "bitcoin";
//     final pageSize = 20;
//     final currentPage = 1;
//
//     //Mock data
//     // final fetchHeadlineUseCase = FetchNewsUseCase(MockArticleRepository());
//     // final paging = await fetchHeadlineUseCase
//     //     .execute(Tuple3(keyword, currentPage, pageSize));
//
//     // Verify that data has created.
//     // expect(paging.articles.length, 3);
//   });
// }
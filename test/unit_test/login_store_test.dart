


import 'package:flutter/widgets.dart';
import 'package:flutter_crypt_hagg/view/login_screen/login_store.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  group('Login test', () {


    LoginStore  store;

    setUp((){

      store = LoginStore();
    });


    /// I use testWidgets because I needed buildContext
    testWidgets('me testing', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {



            return Placeholder();
          },
        ),
      );
    });



    test('test for valid email',(){
      store.validateEmail("ade");
      expect(store.error.email, 'Enter a valid email');
    });


    test('test for empty email',(){
      store.validateEmail("");
      expect(store.error.email, 'Email is required');
    });


    test('test for correct email',(){
      store.validateEmail("murainoy@yahoo.com");
      expect(store.error.email,null);
    });

    test('test for valid password',(){
      store.validatePassword("2345");
      expect(store.error.password, 'Password must be at least 8 characters long');
    });





    test('test if password is empty',(){
      store.validatePassword("");
      expect(store.error.password, 'Password is required');
    });








    // tearDown((){
    //   store.dispose();
    // });


  });
}





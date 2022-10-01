import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample/main_view_model.dart';
import 'kakao_login.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '9ce1dd60f840fe24f1e70edc55beab1a');
  runApp(MaterialApp(home: MyApp()));
}
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(viewModel.user?.kakaoAccount?.profile?.profileImageUrl??""),
            TextButton(
              child: Text('카카오톡 로그인'),
              onPressed: ()async{
                await viewModel.login();
                setState(() {
                });
              },
            ),
            TextButton(
              child: Text('카카오톡 로그아웃'),
              onPressed: ()async{
                await viewModel.logout();
                setState(() {
                });
              },
            ),
          ],
        )
    );
  }
}

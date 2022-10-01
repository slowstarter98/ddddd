//User클래스 사용 사용
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'social_login.dart';

class MainViewModel{

  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;
  MainViewModel(this._socialLogin);

  Future login() async{
    isLogined = await _socialLogin.login();
    if (isLogined){
      //로그인 됐다면 현재 유저의 정보를 가져온다.
      user = await UserApi.instance.me();
    }
  }
  Future logout() async{
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }

}
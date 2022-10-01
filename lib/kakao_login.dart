import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample/social_login.dart';


class KakaoLogin implements SocialLogin{
  @override
  Future<bool> login() async{
    try{
      //카카오톡 설치 되어있는지 확인
      bool isInstalled = await isKakaoTalkInstalled();
      //설치되어 있다면
      if(isInstalled){
        try {
          //카카오톡으로 로그인
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        }catch(e){
          return false;
        }
      }
      //안 설치되어 있다면
      else{
        try {
          //카카오 계정으로 로그인
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        }catch(e){
          return false;
        }
      }
      //설치되어있는지 확인하는 중 에러가 나면
    }catch(e){
      return false;
    }
  }

  @override
  Future<bool> logout() async{
    try {
      await UserApi.instance.unlink();
      return true;
    } catch(error){
      return false;
    }
  }
}
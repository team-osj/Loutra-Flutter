import 'package:url_launcher/url_launcher.dart';

String openKakaoLink = 'https://open.kakao.com/o/sHjnH1Se';
launchURL() async {
  if (await canLaunchUrl(Uri.parse(openKakaoLink))) {
    await launchUrl(Uri.parse(openKakaoLink));
  } else {
    throw '링크를 찾지 못했습니다.';
  }
}

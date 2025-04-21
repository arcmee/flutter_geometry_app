
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LinkPage extends StatelessWidget {
  const LinkPage(this.link, {super.key});
  final String link;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(link),
        ),
          initialSettings: InAppWebViewSettings(
          // 사용자 제스쳐 없이도 비디오, 오디오 자동재생 가능여부
          mediaPlaybackRequiresUserGesture: true,
          // 페이지 javascript 활성화여부. 웹 브라우저에서는 js 필수불가결한 요소라 true!
          javaScriptEnabled: true,
          // 요청하는 클라이언트의 브라우저 종류, 운영체제, 장치 정보 등을 서버에서 알 수 있게 보낼때 같이 보냄
          // 디폴트로 웹뷰로 되어 있는데 일부 웹페이지에서는 웹뷰로 접속시 차단하는 페이지도 있으니 꼭 설정!
          userAgent:
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
        ),
      ),
    );
  }
}
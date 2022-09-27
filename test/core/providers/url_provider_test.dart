import 'package:crypto_app/core/constants/access.dart';
import 'package:crypto_app/core/providers/url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UrlProvider tests: ', () {
    testWidgets('Should get server url', (tester) async {
      //ACT
      var result = UrlProvider();
      //ASSERT
      var url = result.getUrl('', null);
      expect(url.host, serverUrl);
    });
  });
}

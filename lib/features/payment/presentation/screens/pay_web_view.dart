import 'package:flutter/material.dart';
import 'package:kamn/features/payment/data/payment_data_source.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentManager paymentManager = PaymobManager();
  String url = "https://google.com";

  void initUrl() async {
    url = await paymentManager.paymentWithCard("100", "EGP");
  }

  @override
  void initState() {
    initUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            if (url.contains('success=false')) {
              print(
                  "=========================================================osama notttttttttttttt=========================================");
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('success=true')) {
              url = request.url;
              print(
                  "=========================================================osama =========================================");
            } else {
              print(
                  "=========================================================no pay osama =========================================");
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Check'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

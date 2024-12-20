import 'package:flutter/material.dart';
import 'package:kamn/features/payment/data/payment_data_source.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWithWalletScreen extends StatefulWidget {
  const PaymentWithWalletScreen({super.key});

  @override
  State<PaymentWithWalletScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentWithWalletScreen> {
  PaymentManager paymentManager = PaymobManager();
  String url = "https://google.com";

  void initUrl() async {
    url = await paymentManager.paymentWithMobileWallet(
        "100", "EGP", "01010101010");
    setState(() {});
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

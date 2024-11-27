import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../data/payment_data_source.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentManager paymentDataSource = PaymobManager();
  InAppWebViewController? webViewController;

  Future<String> getPaymentKey() async {
    return await paymentDataSource.paymentWithCard("100", "EGP");
  }

  void initController(String paymentKey) {
    webViewController?.loadUrl(
        urlRequest: URLRequest(
            url: WebUri(
                "https://accept.paymobsolutions.com/api/acceptance/iframes/810645?payment_token=$paymentKey")));
  }

  void startPayment() async {
    initController(await getPaymentKey());
  }

  @override
  void initState() {
    startPayment();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
          startPayment();
        },
        onLoadStart: (controller, url) {
          print("Started loading: $url");
        },
        onLoadStop: (controller, url) async {
          if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "true") {
            print("Payment successful");
          } else {
            print("Payment failed");
          }
        },
        onLoadError: (controller, url, code, message) {
          print("Error loading: $url, Error: $message");
        },
      ),
    );
  }
}

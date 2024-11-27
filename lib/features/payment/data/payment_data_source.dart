import 'package:dio/dio.dart';

// Abstract payment interface
abstract class PaymentManager {
  Future<String> getPaymentKey(
      int amount, String currency, String integrationId);

  // Protected abstract methods that implementations should provide
  Future<String> getAuthenticationToken();
  Future<String> createOrder({
    required String authToken,
    required String amount,
    required String currency,
  });
  Future<String> generatePaymentKey({
    required String authToken,
    required String orderId,
    required String amount,
    required String currency,
    required String integrationId,
  });
  Future<String> paymentWithCard(String amount, String currency);

  Future<String> paymentWithMobileWallet(
      String amount, String currency, String walletMobileNumber);
}

// PayMob concrete implementation
class PaymobManager implements PaymentManager {
  @override
  Future<String> getPaymentKey(
      int amount, String currency, String integrationId) async {
    try {
      String authToken = await getAuthenticationToken();

      String orderId = await createOrder(
        authToken: authToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );

      String paymentKey = await generatePaymentKey(
        authToken: authToken,
        amount: (100 * amount).toString(),
        currency: currency,
        orderId: orderId,
        integrationId: integrationId,
      );
      return paymentKey;
    } catch (e) {
      throw Exception('Payment initialization failed');
    }
  }

  @override
  Future<String> getAuthenticationToken() async {
    final Response response =
        await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
      "api_key":
          //TODO:API KEY
          "KConstants.apiKey",
    });
    return response.data["token"];
  }

  @override
  Future<String> createOrder({
    required String authToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/ecommerce/orders", data: {
      "auth_token": authToken,
      "amount_cents": amount,
      "currency": currency,
      "delivery_needed": "true",
      "items": [],
    });
    return response.data["id"].toString();
  }

  @override
  Future<String> generatePaymentKey({
    required String authToken,
    required String orderId,
    required String amount,
    required String currency,
    required String integrationId,
  }) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
      "expiration": 3600,
      "auth_token": authToken,
      "order_id": orderId,
      "integration_id": integrationId,
      "amount_cents": amount,
      "currency": currency,
      "billing_data": {
        "first_name": " FirebaseAuth.instance.currentUser!.displayName",
        "last_name": "N/A",
        "email":
            //TODO:EMAIL
            "FirebaseAuth.instance.currentUser!.email",
        "phone_number": "N/A",
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA"
      },
    });
    return response.data["token"];
  }

  Future<String> _getWalletRedirectUrl({
    required String paymentKey,
    required String walletMobileNumber,
  }) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/acceptance/payments/pay",
      data: {
        "source": {
          "identifier": walletMobileNumber,
          "subtype": "WALLET",
        },
        "payment_token": paymentKey,
      },
    );
    String redirectUrl = response.data['redirect_url'];
    return redirectUrl;
  }

  @override
  Future<String> paymentWithCard(String amount, String currency) async {
    String paymentKey =
        await getPaymentKey(int.parse(amount), currency, "integrationId");
    return paymentKey;
  }

  @override
  Future<String> paymentWithMobileWallet(
      String amount, String currency, String walletMobileNumber) async {
    String paymentKey =
        await getPaymentKey(int.parse(amount), currency, "integrationId");
    String redirectUrl = await _getWalletRedirectUrl(
        paymentKey: paymentKey, walletMobileNumber: walletMobileNumber);
    return redirectUrl;
  }
}

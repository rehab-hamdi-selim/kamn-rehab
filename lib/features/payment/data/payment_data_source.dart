import 'package:dio/dio.dart';

// Abstract payment interface
abstract class PaymentManager {
  Future<String> getPaymentKey(int amount, String currency, int integrationId);

  // Protected abstract methods that implementations should provide

  //1
  Future<String> getAuthenticationToken();

  //2
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
    required int integrationId,
  });
  Future<String> paymentWithCard(String amount, String currency);

  Future<String> paymentWithMobileWallet(
      String amount, String currency, String walletMobileNumber);

  Future<String> checkOrderStatus(String orderId);
}

// PayMob concrete implementation
class PaymobManager implements PaymentManager {
  String APIKEY =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RRNE1UZ3hMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuT0VPZkVWbGtrQ0JrRm1rRlNoV1RQWF92U21IWkE3b3NQZjVYZ2VzallHY3o5ZTJMaVpjVUpGcE04SzVpaGNxTGFnMjMtN0VsMVpJVi0zNUU0cUM1VUE=";

  int integrationid = 4422085;
  int mobileWalletintegrationid = 4422362;

  String redirectMobileWalletUrl = "";
  @override
  Future<String> getPaymentKey(
      int amount, String currency, int integrationId) async {
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
      "api_key": APIKEY,
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
    print(response);
    return response.data["id"].toString();
  }

  @override
  Future<String> generatePaymentKey({
    required String authToken,
    required String orderId,
    required String amount,
    required String currency,
    required int integrationId,
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
    print(response);
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
        await getPaymentKey(int.parse(amount), currency, integrationid);
    return paymentKey;
  }

  @override
  Future<String> paymentWithMobileWallet(
      String amount, String currency, String walletMobileNumber) async {
    String paymentKey = await getPaymentKey(
        int.parse(amount), currency, mobileWalletintegrationid);
    String redirectUrl = await _getWalletRedirectUrl(
        paymentKey: paymentKey, walletMobileNumber: walletMobileNumber);
    return redirectUrl;
  }

  @override
  Future<String> checkOrderStatus(String orderId) async {
    try {
      final Response response = await Dio().post(
        "https://accept.paymob.com/api/ecommerce/orders/transaction_inquiry",
        data: {
          "order_id": orderId,
        },
        options: Options(headers: {"Authorization": "Bearer $APIKEY"}),
      );
      print(response);
      return response.toString();
    } catch (e) {
      print('Error checking order status: $e');
      throw Exception('Failed to check order status');
    }
  }
}

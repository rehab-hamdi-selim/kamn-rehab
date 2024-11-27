import 'package:dio/dio.dart';

// PayMob concrete implementation
class PaymobManagerHigerOrder {
  Future<PaymentOrderData> getAuthenticationToken(
      PaymentInitData paymentInitData) async {
    final Response response =
        await Dio().post("https://accept.paymob.com/api/auth/tokens", data: {
      "api_key":
          //TODO:API KEY
          "KConstants.apiKey",
    });
    return paymentInitData.toPaymentOrderData(response.data["token"]);
  }

  Future<GeneratePaymentKeyData> createOrder(
      PaymentOrderData paymentOrderData) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/ecommerce/orders", data: {
      "auth_token": paymentOrderData.authToken,
      "amount_cents": paymentOrderData.amount,
      "currency": paymentOrderData.currency,
      "delivery_needed": "true",
      "items": [],
    });
    return paymentOrderData
        .toGeneratePaymentKeyData(response.data["id"].toString());
  }

  Future<String> generatePaymentKey(
      GeneratePaymentKeyData generatePaymentKeyData) async {
    final Response response = await Dio()
        .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
      "expiration": 3600,
      "auth_token": generatePaymentKeyData.authToken,
      "order_id": generatePaymentKeyData.orderId,
      "integration_id": generatePaymentKeyData.integrationId,
      "amount_cents": generatePaymentKeyData.amount,
      "currency": generatePaymentKeyData.currency,
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
          "identifier": walletMobileNumber, // Mobile number linked to wallet
          "subtype": "WALLET",
        },
        "payment_token": paymentKey,
      },
    );

    // Check if redirect URL exists

    // Extract the redirect URL from the response
    String redirectUrl = response.data['redirect_url'];
    return redirectUrl;
  }

// دالة التكوين للدوال غير المتزامنة (Async Composition Function)
  Future<Z> Function(X) composeAsyncFunctions<X, Y, Z>(
    Future<Y> Function(X) f,
    Future<Z> Function(Y) g,
  ) {
    return (X x) async => await g(await f(x));
  }

  Future<String> Function(PaymentInitData paymentInitData) paymentWithCard() {
    // تعريف الدوال المتزامنة
    final authStep = getAuthenticationToken;

    final orderStep = createOrder;

    final paymentStep = generatePaymentKey;

    // تكوين الوظائف باستخدام compose
    final composedFunction = composeAsyncFunctions(
        composeAsyncFunctions(authStep, orderStep), paymentStep);

    // Return the function itself, don't call it
    return composedFunction;
  }

  // تعريف الدوال الفردية
  double addOne(double x) => x + 1;
  double square(double x) => x * x;
  double subtractTen(double x) => x - 10;

// دالة التكوين (Composition Function)
  double Function(double) composeFunctions(
    double Function(double) f,
    double Function(double) g,
  ) {
    return (double x) => g(f(x));
  }

// دالة تجمع التكوينات
  double Function(double) addOneSquareSubtractTen() {
    double Function(double) q1 = addOne;
    double Function(double) q2 = square;
    double Function(double) q3 = subtractTen;

    // تكوين الوظائف باستخدام compose
    return composeFunctions(composeFunctions(q1, q2), q3);
  }

  void main() {
    // إنشاء الدالة المركبة
    final composedFunction = addOneSquareSubtractTen();

    // اختبارها
    print(composedFunction(2)); // ((2 + 1)^2 - 10) = -1
  }
}

class PaymentInitData {
  String amount;
  String currency;
  String integrationId;

  PaymentInitData(
      {required this.amount,
      required this.currency,
      required this.integrationId});

  PaymentOrderData toPaymentOrderData(String authToken) {
    return PaymentOrderData(
      authToken: authToken,
      amount: amount,
      currency: currency,
      integrationId: integrationId,
    );
  }
}

class PaymentOrderData {
  String amount;
  String currency;
  String authToken;
  String integrationId;

  PaymentOrderData(
      {required this.amount,
      required this.currency,
      required this.authToken,
      required this.integrationId});

  GeneratePaymentKeyData toGeneratePaymentKeyData(String orderId) {
    return GeneratePaymentKeyData(
      authToken: authToken,
      orderId: orderId,
      amount: amount,
      currency: currency,
      integrationId: integrationId,
    );
  }
}

class GeneratePaymentKeyData {
  String authToken;
  String orderId;
  String amount;
  String currency;
  String integrationId;
  GeneratePaymentKeyData(
      {required this.authToken,
      required this.orderId,
      required this.amount,
      required this.currency,
      required this.integrationId});
}

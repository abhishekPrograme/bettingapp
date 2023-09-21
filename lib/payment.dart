import 'package:stripe_payment/stripe_payment.dart';

void initStripe() {
  StripePayment.setOptions(
    StripeOptions(
      publishableKey: 'YOUR_PUBLISHABLE_KEY',
      merchantId: 'YOUR_MERCHANT_ID',
    ),
  );
}

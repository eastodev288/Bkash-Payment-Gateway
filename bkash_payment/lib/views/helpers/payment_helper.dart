import 'package:bkash/bkash.dart';
import 'package:flutter/material.dart';

double totalPrice = 10.00;

void onButtonTap(BuildContext context, String selected) async {
  switch (selected) {
    case 'bkash':
      bkashPayment(context);
      break;
    default:
      print('No gateway selected');
  }
}

/// bKash Payment Function
Future<void> bkashPayment(BuildContext context) async {
  final bkash = Bkash(logResponse: true);

  try {
    final response = await bkash.pay(
      context: context,
      amount: totalPrice,
      merchantInvoiceNumber: 'Test0123456',
    );

    print('Transaction ID: ${response.trxId}');
    print('Payment ID: ${response.paymentId}');
  } on BkashFailure catch (e) {
    print('Payment failed: ${e.message}');
  }
}

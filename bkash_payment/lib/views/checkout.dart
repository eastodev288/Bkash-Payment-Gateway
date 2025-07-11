import 'package:bkash_payment/views/helpers/payment_helper.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String? selected;

  List<Map> gateways = [
    {
      'name': 'bKash',
      'logo':
          'https://freelogopng.com/images/all_img/1656234841bkash-icon-png.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: false,
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    'Select a payment method',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (_, index) {
                      return PaymentMethodTile(
                        logo: gateways[index]['logo'],
                        name: gateways[index]['name'],
                        selected: selected ?? '',
                        onTap: () {
                          selected =
                              gateways[index]['name']
                                  .toString()
                                  .replaceAll(' ', '_')
                                  .toLowerCase();
                          setState(() {});
                        },
                      );
                    },
                    separatorBuilder: (_, index) => const SizedBox(height: 10),
                    itemCount: gateways.length,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap:
                  selected == null
                      ? null
                      : () => onButtonTap(context, selected ?? ''),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:
                      selected == null
                          ? Colors.cyanAccent.shade200
                          : Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Continue to payment',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String logo;
  final String name;
  final Function()? onTap;
  final String selected;

  const PaymentMethodTile({
    super.key,
    required this.logo,
    required this.name,
    this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                selected == name.replaceAll(' ', '_').toLowerCase()
                    ? Colors.blueAccent
                    : Colors.greenAccent,
            width: 2,
          ),
        ),
        child: ListTile(
          leading: Image.network(logo, height: 35, width: 35),
          title: Text(name),
        ),
      ),
    );
  }
}

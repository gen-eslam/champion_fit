import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:intl/intl.dart';

import '../../../../firebase/firebase_firestore_service.dart';
import '../../../../firebase/tables_name.dart';
import '../../model/amount_model.dart';
import '../../model/item_list_model.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var transactionData = getTransactionData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Page"),
      ),
      body: PaypalCheckoutView(
        sandboxMode: true,
        clientId: Keys.clientID,
        secretKey: Keys.secretID,
        transactions: [
          {
            "amount": transactionData.amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    );
  }

  // records
  ({AmountModel amountModel, ItemListModel itemList}) getTransactionData() {
    //item list model
    List<OrderItemModel> orderItemModel = [
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "5",
        quantity: 12,
      ),
    ];
    ItemListModel itemList = ItemListModel(items: orderItemModel);
    // amount model
    AmountModel amountModel = AmountModel(
      currency: 'USD',
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
      total: "100",
    );
    return (amountModel: amountModel, itemList: itemList);
  }
}

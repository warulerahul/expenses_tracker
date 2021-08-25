import 'package:expense_tracker/core/models/category.dart';
import 'package:expense_tracker/core/viewmodels/insert_transaction_model.dart';
import 'package:expense_tracker/ui/shared/app_colors.dart';
import 'package:expense_tracker/ui/shared/ui_helpers.dart';
import 'package:expense_tracker/ui/views/base_view.dart';
import 'package:expense_tracker/ui/widgets/build_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class InsertTranscationView extends StatefulWidget {
  final Category category;
  final int selectedCategory;
  InsertTranscationView(this.category, this.selectedCategory);

  @override
  _InsertTranscationViewState createState() => _InsertTranscationViewState();
}

class _InsertTranscationViewState extends State<InsertTranscationView> {
  //Global instance of Razorpay
  Razorpay _razorpay;

  //Global instance of Bool variable
  bool isPaymentFailed = false;

  //Global instance of String variable
  String paymentId, paymentMode;

  //Global instance of int variable
  int modeOfPayment = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<InsertTransactionModel>(
      onModelReady: (model) =>
          model.init(widget.selectedCategory, widget.category.index),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title:
              widget.selectedCategory == 1 ? Text('Income') : Text('Expense'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(widget.category.name),
                  leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: lightPrimaryColor,
                      child: Icon(
                        widget.category.icon,
                        size: 17,
                        color: accentColor,
                      )),
                ),
                UIHelper.verticalSpaceMedium(),
                BuildTextField(
                    controller: model.memoController,
                    text: 'Memo:',
                    helperText: "Enter a memo for your transcation",
                    icon: Icons.edit,
                    isNumeric: false,
                    textInputType: TextInputType.text),
                UIHelper.verticalSpaceMedium(),
                BuildTextField(
                  controller: model.amountController,
                  text: 'Amount:',
                  helperText: "Enter a the amount for the transcation",
                  icon: Icons.attach_money,
                  isNumeric: true,
                  textInputType: TextInputType.number,
                ),
                UIHelper.verticalSpaceMedium(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SELECT DATE:',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Container(
                  width: 20,
                  height: 50,
                  child: RaisedButton(
                    child: Text(model.getSelectedDate()),
                    onPressed: () async {
                      await model.selectDate(context);
                    },
                  ),
                ),
                UIHelper.verticalSpaceLarge(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    child: Text(
                      'ADD',
                    ),
                    autofocus: false,
                    clipBehavior: Clip.antiAlias,
                    style: ElevatedButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      primary: darkPrimaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    ),
                    onPressed: () async {
                      await model.addTransaction(context);
                      //openCheckout();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_vb9y8EPqrr9OMs',
      'amount': 1,
      'name': 'Rahul',
      'description': 'Testing Mode',
      'prefill': {'contact': '9423505371', 'email': 'test@razorpay.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error111: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      isPaymentFailed = false;
      paymentId = response.paymentId;
    });

    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    if (mounted) {
      setState(() {
        isPaymentFailed = true;
      });
    }
    if (response.code == 0) {
      Fluttertoast.showToast(
          msg: "ERROR: " + response.code.toString() + " - " + response.message,
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName,
        toastLength: Toast.LENGTH_SHORT);
  }
}

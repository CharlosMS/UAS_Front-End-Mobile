import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_uas/cartpage/cartpage_provider.dart';
import 'package:project_uas/paymentpage/hasilpesan_screen.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  String selectedPaymentMethod = '';

  void selectPaymentMethod(String paymentMethod) {
    setState(() {
      selectedPaymentMethod = paymentMethod;
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CartPageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 8, 8),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Payment",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Payment Method:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (CreditCardBrand) {},
              ),
              SizedBox(height: 20),
              Text(
                'PayPal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  selectPaymentMethod('PayPal');
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: selectedPaymentMethod == 'PayPal'
                      ? Color.fromARGB(255, 71, 144, 203)
                      : Colors.grey,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/paypal_logo.svg',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Dana',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  selectPaymentMethod('Dana');
                },
                child: Container(
                    width: 100,
                    height: 50,
                    color: selectedPaymentMethod == 'Dana'
                        ? Colors.blue
                        : Colors.grey,
                    child: Center(
                      child: Image.asset(
                        'assets/logo_dana.png',
                        width: 80,
                      ),
                    )),
              ),
              SizedBox(height: 20),
              Text(
                'Debit/Mastercard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  selectPaymentMethod('Debit');
                },
                child: Container(
                    width: 100,
                    height: 50,
                    color: selectedPaymentMethod == 'Debit'
                        ? Colors.blue
                        : Colors.grey,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/debit.svg',
                        width: 80,
                        height: 40,
                      ),
                    )),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 133, 131, 131),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Pesanan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Jumlah Item',
                            style:
                                GoogleFonts.beVietnamPro(color: Colors.white),
                          ),
                        ),
                        Text(
                          '${prov.getTotalItems()} Item    ',
                          style: GoogleFonts.beVietnamPro(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Total Pesanan',
                            style:
                                GoogleFonts.beVietnamPro(color: Colors.white),
                          ),
                        ),
                        Text(
                          'Rp.${prov.getTotalPrice()}    ',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(101, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 75, 8, 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            // Menangani processing dari pemilihan pembayaran
                            if (selectedPaymentMethod == 'PayPal' ||
                                selectedPaymentMethod == 'Dana' ||
                                selectedPaymentMethod == "Debit") {
                              showPaymentDialog(context);
                            } else {
                              // No payment method selected
                              print('Please select a payment method.');
                            }
                          },
                          child: Text('Bayar'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Details'),
          content: selectedPaymentMethod == 'PayPal'
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Please enter your PayPal phone number:'),
                    SizedBox(height: 10),
                    TextFormField(),
                  ],
                )
              : selectedPaymentMethod == 'Dana'
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Please enter your Dana phone number:'),
                        SizedBox(height: 10),
                        TextFormField(),
                      ],
                    )
                  : selectedPaymentMethod == 'Debit'
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Please enter your Debit Card number:'),
                            SizedBox(height: 10),
                            TextFormField(),
                          ],
                        )
                      : SizedBox.shrink(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => HasilPesan());
                Navigator.push(context, route);
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

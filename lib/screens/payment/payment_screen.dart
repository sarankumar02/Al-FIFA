import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import '../passport and releated services/passport_thankyou.dart';

class PaymentPage extends StatefulWidget {
  final String visaId;
  final String paymentToken;

  PaymentPage({required this.visaId, required this.paymentToken});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Future<void> _handlePaymentResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final success = jsonResponse['success'];
        final message = jsonResponse['message'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );

        if (success == 1) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return PassportThankyou(
                title: "Visa",
                message: message,
              );
            },
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to process payment response')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print(":progress---$progress");
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            print("requets url=----${request.url}");
            if (request.url.contains('success.php')) {
              await _handlePaymentResponse(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://web-testing.xyz/api/payment.php?visa_id=${widget.visaId}&payment_token=${widget.paymentToken}'));
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

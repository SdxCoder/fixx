import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderConfirmedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Image.asset("assets/booking_confirmed.png", fit: BoxFit.cover,)),
          SizedBox(
            height: 20,
          ),
          Text(
            "YOUR APPOINTMENT\nCONFIRMED",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold),
          ),
            Spacer(),
        
          SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width*0.6,
            child: raisedButton(
              btnText: "OK GOT IT",
              btnColor: AppTheme.accentColor,
              onPressed: () {
                Modular.to.pushNamedAndRemoveUntil(Routes.userHome, (route) => false);
              },
            ),
          ),
            SizedBox(
            height: 20,
          ),
          Text(
              "CANCELATION POLICY",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
                      child: Text(
                "Your appointments are very important to us. It is reserved especially for you, we understand sometimes schedule adjustments are necessory, therefore we respectfully request at least 24 hours notice for cancelations.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

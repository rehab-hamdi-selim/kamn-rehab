import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/features/payment/presentation/widgets/debit_credit_card/custom_app_bar.dart';
import 'package:kamn/features/payment/presentation/widgets/debit_credit_card/month_tex_field.dart';
import 'package:kamn/features/payment/presentation/widgets/debit_credit_card/year_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DebitCreditCardScreen extends StatefulWidget {
  DebitCreditCardScreen({super.key});

  @override
  State<DebitCreditCardScreen> createState() => _DebitCreditCardScreenState();
}

class _DebitCreditCardScreenState extends State<DebitCreditCardScreen> {
  bool savecard = false, accept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomDebitCrecitCardAppBar.appBar(
          arrowFunction: () {},
          notificationIconFunction: () {},
          badgesIconFunction: () {},
          profileFunction: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RPadding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Debit / Credit',
              style: TextStyle(
                  fontSize: 30,
                  color: AppPallete.greenColor,
                  fontWeight: FontWeightHelper.medium),
            ),
          ),
          const RPadding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text('Card',
                style: TextStyle(
                    fontSize: 30,
                    color: AppPallete.greenColor,
                    fontWeight: FontWeightHelper.medium)),
          ),
          const RPadding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'please make sure the entered data is correct',
              style: TextStyle(color: AppPallete.greyColor),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: AppPallete.blueGreenColor,
                  borderRadius: BorderRadius.circular(50.r)),
              child: RPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppPallete.greenColor),
                      child: const RPadding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Debit card',
                          style: TextStyle(color: AppPallete.whiteColor),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppPallete.whiteColor),
                        onPressed: () {},
                        child: const RPadding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Credit card',
                            style: TextStyle(color: AppPallete.greenColor),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          const RPadding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Text('Card number'),
          ),
          RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: AppPallete.ofWhiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide.none),
                  suffixIcon: RPadding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset('assets/icons/visa.svg'),
                  )),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            children: [
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RPadding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: Text('Expiry date'),
                  ),
                  Row(
                    children: [MonthTextField(), YearTextField()],
                  ),
                ],
              )),
              Expanded(
                child: RPadding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RPadding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Text('CSV'),
                      ),
                      RPadding(
                        padding: const EdgeInsets.only(right: 30),
                        child: TextField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            fillColor: AppPallete.ofWhiteColor,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          const RPadding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Text('Card name'),
          ),
          RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppPallete.ofWhiteColor,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          CheckboxListTile(
            activeColor: AppPallete.lightGreenColor,
            title: const Text('Accept all condetions and terms'),
            value: accept,
            onChanged: (newValue) {
              setState(() {
                accept = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            activeColor: AppPallete.lightGreenColor,
            title: const Text('Save card for future checkout'),
            value: savecard,
            onChanged: (newValue) {
              setState(() {
                savecard = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          const Spacer(
            flex: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.greenColor),
                  child: const RPadding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Confirm payment',
                      style:
                          TextStyle(color: AppPallete.whiteColor, fontSize: 24),
                    ),
                  ),
                ),
              )),
            ],
          ),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}

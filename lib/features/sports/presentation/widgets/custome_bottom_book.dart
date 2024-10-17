import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomeBottomBook extends StatelessWidget {
  const CustomeBottomBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65),
          color: AppPallete.greenColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: '250 LE',
                    style: TextStyles.font32OfWhiteMedium,
                    children: [
                      TextSpan(
                          text: ' / hr', style: TextStyles.font20OfWhiteReuglar)
                    ]),
              ),
              ElevatedButton(
                  onPressed: () {
                    /// functoin to add playground to firestore
                    addToFireStore();
                  },
                  child: Text(
                    Constants.bookNow,
                    style: TextStyles.font16greenSemiBold,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  /// test function
  void addToFireStore() {
    final playGroundRef = FirebaseFirestore.instance
        .collection('PlayGround')
        .withConverter<PlaygroundModel>(
          fromFirestore: (snapshot, options) =>
              PlaygroundModel.fromJson(snapshot.data()),
          toFirestore: (value, options) => value.toJson(),
        );

    playGroundRef
        .add(PlaygroundModel(name: 'al hadra', address: 'alex', price: 250))
        .then((value) => print('playground added successfully'))
        .catchError((error) => print(error.toString()));
  }
}

/// test class
class PlaygroundModel {
  String name;
  String address;
  double price;
  PlaygroundModel(
      {required this.name, required this.address, required this.price});

  PlaygroundModel.fromJson(Map<String, dynamic>? map)
      : this(name: map!['name'], address: map['address'], price: map['price']);

  Map<String, dynamic> toJson() {
    return {'name': name, 'address': address, 'price': price};
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/theme/style.dart';

enum SubscriptionType { free, session, month } // Improved enum name

class CustomCheckBar extends StatefulWidget {
  const CustomCheckBar({super.key});
  @override
  State<CustomCheckBar> createState() => _CustomCheckBarState();
}

class _CustomCheckBarState extends State<CustomCheckBar> {
  SubscriptionType? _subscriptionSelection; 

  @override
  Widget build(BuildContext context) {
    return Row( 
      children: <Widget>[
        Card(

                  color: const Color.fromARGB(255, 245, 245, 245),
          elevation: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Row(
                children: [
                  Radio<SubscriptionType>(
                    activeColor: Color.fromARGB(255, 0, 0, 0),//no
                    hoverColor: Color.fromARGB(255, 0, 0, 0),//no
                    overlayColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 0, 0)),//no
                    fillColor: WidgetStateProperty.all(Color.fromARGB(255, 0, 0, 0)),//radio color
                    value: SubscriptionType.free,
                    groupValue: _subscriptionSelection,
                    onChanged: (SubscriptionType? value) {
                      setState(() {
                        _subscriptionSelection = value;
                      });
                    },
                  ),
                Text('Free',style: TextStyles.fontCircularSpotify12BlackMedium,), 
              
                ],
              ),
            ),
        ),
        Card(

                  color: const Color.fromARGB(255, 245, 245, 245),
          elevation: 6,
            child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),

              child: Row(
                children: [
                  Radio<SubscriptionType>(
                    value: SubscriptionType.session,
                    groupValue: _subscriptionSelection,
                    onChanged: (SubscriptionType? value) {
                      setState(() {
                        _subscriptionSelection = value;
                      });
                    },
                  ),
               Text('/Session',style: TextStyles.fontCircularSpotify12BlackMedium,),
              
                ],
              ),
            ),
          ),
        
        Card(
          color: const Color.fromARGB(255, 245, 245, 245),
          elevation: 6,
            child: Padding(
                           padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),

              child: Row(
                children: [
                  Radio<SubscriptionType>(
                    value: SubscriptionType.month,
                    groupValue: _subscriptionSelection,
                    onChanged: (SubscriptionType? value) {
                      setState(() {
                        _subscriptionSelection = value;
                      });
                    },
                  ),
                Text('/month',style: TextStyles.fontCircularSpotify12BlackMedium,),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

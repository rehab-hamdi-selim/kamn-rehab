import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 335,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: ShapeDecoration(
            color: const Color(0xFFF6F6F6),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.40, color: Color(0xFFBBBBBB)),
              borderRadius: BorderRadius.circular(13),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 16,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 2,
            children: [
              Expanded(
                child: Container(
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        'Contact Support',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 16,
                          fontFamily: 'Circular Spotify Tx T',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Have questions?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 12,
                          fontFamily: 'Circular Spotify Tx T',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 295,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Contact us at ',
                                style: TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 12,
                                  fontFamily: 'Circular Spotify Tx T',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'support@kamn.com',
                                style: TextStyle(
                                  color: Color(0xFF3B31FF),
                                  fontSize: 12,
                                  fontFamily: 'Circular Spotify Tx T',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: ' or call ',
                                style: TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 12,
                                  fontFamily: 'Circular Spotify Tx T',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '+20 XXX XXX XXXX.',
                                style: TextStyle(
                                  color: Color(0xFF5148FF),
                                  fontSize: 12,
                                  fontFamily: 'Circular Spotify Tx T',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

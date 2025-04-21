// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
// import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/custom_aapp_bar.dart';

// class ChatScreen extends StatefulWidget {
//   final String currentUserId;
//   final String receiverId;
//   String orderId;
//   ChatScreen(
//       {required this.currentUserId,
//       required this.receiverId,
//       required this.orderId});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     context.read<OrderCubit>().streamMessages(widget.orderId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             CustomAppBarTrackOrder(
//               onTap: () {},
//               screenName: 'Delivery man',
//             ),
//             Expanded(
//               child: StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('messages')
//                     .orderBy('timestamp')
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) return CircularProgressIndicator();
//                   final messages = snapshot.data!.docs;

//                   return ListView.builder(
//                     padding: EdgeInsets.all(12),
//                     itemCount: messages.length,
//                     itemBuilder: (context, index) {
//                       final message = messages[index];
//                       final isMe = message['senderId'] == widget.currentUserId;

//                       return Align(
//                         alignment:
//                             isMe ? Alignment.centerRight : Alignment.centerLeft,
//                         child: Container(
//                           margin: EdgeInsets.symmetric(vertical: 5),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 14, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: isMe ? Color(0xff1C7B4E) : Color(0xffF1F4FA),
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(12),
//                               topRight: Radius.circular(12),
//                               bottomLeft: isMe
//                                   ? Radius.circular(12)
//                                   : Radius.circular(0),
//                               bottomRight: isMe
//                                   ? Radius.circular(0)
//                                   : Radius.circular(12),
//                             ),
//                           ),
//                           child: Text(
//                             message['text'],
//                             style: TextStyle(
//                               color: isMe ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _controller,
//                         decoration: InputDecoration(
//                           hintText: "Write something",
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: sendMessage,
//                       child: CircleAvatar(
//                         backgroundColor: Color(0xFFC8F3CF),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Center(
//                               child: SvgPicture.asset(
//                                   'assets/icons/send_masseg.svg')),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/custom_aapp_bar.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId;
  final String receiverId;
  final String orderId;

  ChatScreen({
    required this.currentUserId,
    required this.receiverId,
    required this.orderId,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().streamMessages(widget.orderId);
  }

  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<OrderCubit>().sendMessage(
            orderId: widget.orderId,
            senderId: widget.currentUserId,
            receiverId: widget.receiverId,
            text: text,
          );
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomAppBarTrackOrder(
              onTap: () => Navigator.pop(context),
              screenName: 'Delivery man',
            ),
            Expanded(child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                if (state is OrderMessagesStream) {
                  return StreamBuilder<List<Map<String, dynamic>>>(
                    stream: state.messageStream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      final messages = snapshot.data!;
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          final isMe =
                              message['senderId'] == widget.currentUserId;

                          return Align(
                            alignment: isMe
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                color: isMe
                                    ? Color(0xff1C7B4E)
                                    : Color(0xffF1F4FA),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: isMe
                                      ? Radius.circular(12)
                                      : Radius.circular(0),
                                  bottomRight: isMe
                                      ? Radius.circular(0)
                                      : Radius.circular(12),
                                ),
                              ),
                              child: Text(
                                message['text'],
                                style: TextStyle(
                                  color: isMe ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )

                // BlocBuilder<OrderCubit, OrderState>(
                //   builder: (context, state) {
                //     if (state is OrderMessagesStream) {
                //       return StreamBuilder<List<Map<String, dynamic>>>(
                //         stream: state.messageStream,
                //         builder: (context, snapshot) {
                //           if (!snapshot.hasData) {
                //             return Center(child: CircularProgressIndicator());
                //           }

                //           final messages = snapshot.data!;
                //           return ListView.builder(
                //             padding: const EdgeInsets.all(12),
                //             itemCount: messages.length,
                //             itemBuilder: (context, index) {
                //               final message = messages[index];
                //               final isMe =
                //                   message['senderId'] == widget.currentUserId;

                //               return Align(
                //                 alignment: isMe
                //                     ? Alignment.centerRight
                //                     : Alignment.centerLeft,
                //                 child: Container(
                //                   margin: const EdgeInsets.symmetric(vertical: 5),
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 14, vertical: 10),
                //                   decoration: BoxDecoration(
                //                     color: isMe
                //                         ? Color(0xff1C7B4E)
                //                         : Color(0xffF1F4FA),
                //                     borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(12),
                //                       topRight: Radius.circular(12),
                //                       bottomLeft: isMe
                //                           ? Radius.circular(12)
                //                           : Radius.circular(0),
                //                       bottomRight: isMe
                //                           ? Radius.circular(0)
                //                           : Radius.circular(12),
                //                     ),
                //                   ),
                //                   child: Text(
                //                     message['text'],
                //                     style: TextStyle(
                //                       color: isMe ? Colors.white : Colors.black,
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             },
                //           );
                //         },
                //       );
                //     } else if (state is OrderLoading) {
                //       return Center(child: CircularProgressIndicator());
                //     } else {
                //       return Center(child: Text("No messages yet"));
                //     }
                //   },
                // ),
                ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Write something",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: sendMessage,
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFFC8F3CF),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SvgPicture.asset(
                                'assets/icons/send_masseg.svg'),
                          ),
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
    );
  }
}

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:philo_task/presentation/screens/chat/checkout_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/chat_provider.dart';

class GroupChatScreen extends StatelessWidget {
  final String groupId;
  final String groupName;
  final String userName;

  GroupChatScreen({
    required this.groupId,
    required this.groupName,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return NonRaisedHandUI(
      groupId: groupId,
      groupName: groupName,
      userName: userName,
    );
  }
}

class RaisedHandUI extends StatelessWidget {
  final String groupId;
  final String groupName;
  final String userName;

  RaisedHandUI({
    required this.groupId,
    required this.groupName,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(groupName), automaticallyImplyLeading: false),
      body: Column(
        children: [
          Expanded(
            child: MessageList(
                groupId: groupId, userName: userName, groupName: groupName),
          ),
          RaisedHandMessageInput(
            groupId: groupId,
            userName: userName,
            groupName: groupName,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NonRaisedHandUI(
                    groupId: groupId,
                    groupName: groupName,
                    userName: userName,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NonRaisedHandUI extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;
  NonRaisedHandUI(
      {required this.groupId, required this.userName, required this.groupName});

  @override
  _NonRaisedHandUI createState() => _NonRaisedHandUI();
}

class _NonRaisedHandUI extends State<NonRaisedHandUI> {
  void _acceptHandRaiseRequest(String requestId, String userId) {
    FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .collection('hand_raising_requests')
        .doc(requestId)
        .update({'status': 'accepted'}).then((_) {
      // Update user's hand raise status after accepting the request
      FirebaseFirestore.instance
          .collection('groups')
          .doc(widget.groupId)
          .collection('members')
          .doc(userId)
          .update({'handRaiseStatus': 'accepted'}).then((_) {
        setState(
            () {}); // Trigger rebuild after updating user's hand raise status
      }).catchError((error) {
        print('Error updating user hand raise status: $error');
      });
    }).catchError((error) {
      print('Error accepting hand raise request: $error');
    });
  }

  void _listenForHandRaisingRequests() {
    FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .collection('hand_raising_requests')
        .where('status', isEqualTo: 'pending')
        .snapshots()
        .listen((snapshot) {
      snapshot.docs.forEach((doc) {
        String userId = doc['userId'];
        if (widget.userName != userId && doc['status'] != 'accepted')
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Hand Raised'),
                content: Text('$userId Raised hand'),
                actions: <Widget>[
                  TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        _acceptHandRaiseRequest(doc.id, userId);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlockedUI(
                              groupId: widget.groupId,
                              groupName: widget.groupName,
                              userName: widget.userName,
                            ),
                          ),
                        );
                      }),
                ],
              );
            },
          );
      });
    });
  }

  bool raisedHandLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupName),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessageList(
                groupId: widget.groupId,
                userName: widget.userName,
                groupName: widget.groupName),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('groups')
                .doc(widget.groupId)
                .collection('hand_raising_requests')
                .where('status', isEqualTo: 'accepted')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              bool hasRaisedHand = true;

              return Column(
                children: [
                  if (hasRaisedHand)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Someone raised their hand, You cannot send a message until their hand is lowered.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: hasRaisedHand
                        ? () {
                            setState(() {
                              raisedHandLoading = true;
                            });
                            Future.delayed(Duration(seconds: 10), () {
                              setState(() {
                                raisedHandLoading = false;
                              });
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RaisedHandUI(
                                    groupId: widget.groupId,
                                    groupName: widget.groupName,
                                    userName: widget.userName,
                                  ),
                                ),
                              );
                            });
                          }
                        : null,
                    child: raisedHandLoading
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Please wait...'),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          )
                        : Text('Raise Hand'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _listenForHandRaisingRequests();
  }
}

class BlockedUI extends StatelessWidget {
  final String groupId;
  final String groupName;
  final String userName;

  BlockedUI({
    required this.groupId,
    required this.groupName,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MessageList(
                groupId: groupId, userName: userName, groupName: groupName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You cannot send a message until the raised hand is lowered.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Raise hand functionality
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => NonRaisedHandUI(
                        groupId: groupId,
                        userName: userName,
                        groupName: groupName)),
              );
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}

class MessageList extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;

  MessageList({
    required this.groupId,
    required this.userName,
    required this.groupName,
  });

  @override
  State<MessageList> createState() => _MessageListState();
}

final countDownController = CountDownController();

class _MessageListState extends State<MessageList> {
  double highestPrice = 0.0;
  String highestBidder = '';

  Future<double> _getHighestPrice() async {
    double tempHighestPrice = 0.0;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .get();

    snapshot.docs.forEach((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      double price = double.parse(data['message'] ?? 0);
      if (price > tempHighestPrice) {
        tempHighestPrice = price;
        highestBidder = data['senderId'];
      }
    });

    return tempHighestPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, timerProvider, child) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('groups')
              .doc(widget.groupId)
              .collection('messages')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('No message yet'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularCountDownTimer(
                      width: 150,
                      height: 50,
                      duration: timerProvider.remainingTime,
                      textFormat: CountdownTextFormat.S,
                      fillColor: Theme.of(context).colorScheme.primary,
                      ringColor: Theme.of(context).colorScheme.onPrimary,
                      isReverse: true,
                      isReverseAnimation: true,
                      onComplete: () async {
                        if (timerProvider.remainingTime == 0) {
                          double highestPrice = await _getHighestPrice();
                          print('--------------------------------');
                          print(highestPrice);
                          Fluttertoast.showToast(
                            msg: "Mazad Ended",
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.green,
                            fontSize: 22,
                          );
                          if (widget.userName == highestBidder) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return CheckoutScreen(
                                highestPrice: highestPrice.toString(),
                                userName: widget.userName,
                                groupId: widget.groupId,
                              );
                            }));
                          } else {
                            Navigator.pop(context);
                            timerProvider.changeTimer(timerProvider.chatTime);
                          }
                        }
                      },
                      onStart: () {
                        if (timerProvider.remainingTime ==
                            timerProvider.chatTime) {
                          Fluttertoast.showToast(
                            msg: "Mazad Started",
                            fontSize: 22,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.black,
                          );
                        }
                      },
                      onChange: (value) {
                        if (int.parse(value) != timerProvider.remainingTime) {
                          timerProvider.changeTimer(int.parse(value));
                        }
                      },
                    ),
                  ),
                ),
                ListView(
                  reverse: true,
                  padding: EdgeInsets.all(8.0),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: Icon(Icons
                                .person), // Display first character of username
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['senderId'], // Sender name
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.0),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['message'], // Message content
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      '${data['timestamp'].toDate().toString()}', // Time and Date
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class RaisedHandMessageInput extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;
  final VoidCallback onPressed;

  RaisedHandMessageInput({
    required this.groupId,
    required this.userName,
    required this.groupName,
    required this.onPressed,
  });

  @override
  _RaisedHandMessageInput createState() => _RaisedHandMessageInput();
}

class _RaisedHandMessageInput extends State<RaisedHandMessageInput> {
  final TextEditingController _messageController = TextEditingController();
  bool _isHandRaised = false;
  bool _isRequestPending = false;
  int _lastMaxNumber = 0; // Track the maximum number sent in the chat

  void _raiseHand() {
    if (true) {
      setState(() {
        _isRequestPending = true;
      });

      FirebaseFirestore.instance
          .collection('groups')
          .doc(widget.groupId)
          .collection('hand_raising_requests')
          .add({
        'userId': widget.userName,
        'status': 'pending',
      }).then((docRef) {
        print(widget.groupId);
        FirebaseFirestore.instance
            .collection('groups')
            .doc(widget.groupId)
            .update({'handRaiseRequestPending': true});
      }).catchError((error) {
        print('Error raising hand: $error');
        setState(() {
          _isRequestPending = false;
        });
      });
    }
  }

  Future<bool> _isMessageValid(int message) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .collection('messages')
        .get();

    for (var doc in snapshot.docs) {
      var data = doc.data();

      var messageText = data['message'];

      final intMessage = int.parse(messageText);
      if (intMessage >= message) {
        return false; // Found a message greater than or equal to the new number
      }
    }
    return true; // No message found greater than or equal to the new number
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              keyboardType:
                  TextInputType.number, // Set keyboard type to numeric
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]')), // Allow only numeric input
              ],
              decoration: InputDecoration(
                hintText: 'Type a number...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              // Send message functionality
              String message = _messageController.text.trim();
              if (message.isNotEmpty) {
                final intMessage = int.parse(message);
                final isValid = await _isMessageValid(intMessage);
                if (!isValid) {
                  // If the message is not valid, show an error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'You cannot send a number equal to or smaller than previous messages.'),
                    ),
                  );
                  return;
                }
                // If message is valid, send it
                FirebaseFirestore.instance
                    .collection('groups')
                    .doc(widget.groupId)
                    .collection('messages')
                    .add({
                  'senderId': widget.userName,
                  'message': message,
                  'timestamp': Timestamp.now(),
                });
                // Update the last max number sent
                _lastMaxNumber = intMessage;
                // Clear the message text field
                _messageController.clear();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NonRaisedHandUI(
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                      userName: widget.userName,
                    ),
                  ),
                );
                // Navigate back to NonRaisedHandUI
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.pan_tool),
            onPressed: _raiseHand,
          ),
        ],
      ),
    );
  }
}

class NonRaisedHandMessageInput extends StatelessWidget {
  final String groupId;
  final String userName;
  final String groupName;

  NonRaisedHandMessageInput({
    required this.groupId,
    required this.userName,
    required this.groupName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          // Raise hand functionality
          FirebaseFirestore.instance
              .collection('groups')
              .doc(groupId)
              .collection('hand_raising_requests')
              .add({
            'userId': userName,
            'status': 'raised', // Mark the status as raised
          }).catchError((error) {
            print('Error raising hand: $error');
          });
        },
        child: Text('Raise Hand'),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ChatProvider extends ChangeNotifier {
  int remainingTime = 30; // Initial countdown time in seconds
  final int chatTime = 30;
  late Ticker _ticker;

  ChatProvider() {
    _ticker = Ticker(_tick);
  }

  void changeTimer(int value) {
    remainingTime = value;
    notifyListeners();
  }

  void startTimer() {
    _ticker.start();
  }

  void stopTimer() {
    _ticker.stop();
  }

  void _tick(Duration elapsed) {
    if (remainingTime > 0) {
      remainingTime -= 1;
      notifyListeners();
    } else {
      _ticker.stop();
    }
  }

  Future<void> clearChat(String groupId) async {
    final messagesRef = FirebaseFirestore.instance
        .collection('groups')
        .doc(groupId)
        .collection('messages');

    final snapshot = await messagesRef.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> resetHandRaiseStatus(String groupId) async {
    final handRaiseRef = FirebaseFirestore.instance
        .collection('groups')
        .doc(groupId)
        .collection('hand_raising_requests');

    final snapshot = await handRaiseRef.get();
    for (var doc in snapshot.docs) {
      await doc.reference.update({'status': 'cleared'});
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}

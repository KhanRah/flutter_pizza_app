import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ownerapp/message.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final FirebaseMessaging _messaging = FirebaseMessaging();

  final List<Message> messages =[];

  @override
  void initState() {
    _messaging.getToken().then((token){print(token);});
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async
        {
          print("onMessage: $message");
          final notification=message['notification'];
          setState(() {
            messages.add(Message(
              title:  Image.network(notification['title']),body: notification['body']
            ));
          });
        },
      onLaunch: (Map<String, dynamic> message) async
      {
        print("onLaunch: $message");

        setState(() {
          messages.add(Message(
              title: '$message',body: 'OnLaunch'
          ));
        });


        final notification=message['notification'];
        setState(() {
          print(notification);
          messages.add(Message(
              title:  Image.network(notification['title']),
              body: 'OnLaunch:${notification['body']}'));
        });

      },





      onResume: (Map<String, dynamic> message) async
      {
        print("onResume: $message");
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true,badge: true,alert: true));
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return ListView(
      children:messages.map(buildMessage).toList()
    );
  }

  Widget buildMessage(Message message)=>ListTile(
    title: Image.network(message.title),
    subtitle: Text(message.body),
  );
}

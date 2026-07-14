import 'package:chat_app/core/constans/app_assets.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String chatrouting = " Chat_screen";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController clearMessage = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firstor = FirebaseFirestore.instance;
  String? text; //this will give us the message
  late User userregestered; //this will give us the email user

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        userregestered = user;
      }
      print(userregestered.email);
    } catch (e) {
      print(e);
    }
  }

// get messages
/*  void getMessages() async {
    final messages = await _firstor.collection("messages").get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }*/
  //streames
  void getMessages() async {
    await for (var snapshot in _firstor.collection("messages").snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Row(
          children: [
            Image.asset(
              AppAssets.image1,
              height: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "MessageMe",
              style: TextStyle(fontSize: 19, color: AppColors.lightBackground),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, color: AppColors.lightBackground))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(),
          StreamBuilder<QuerySnapshot>(
              //  من وين لح تجي هي البيانات
              //stream: _firstor.collection("messages").snapshots(),
              stream: _firstor
                  .collection("messages")
                  .orderBy("time", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                List<Widget> messageWedgets = [];
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final messages = snapshot.data!.docs;
                for (var meesage in messages) {
                  final messageText = meesage.get("messagetext");
                  final messageSender = meesage.get("sender");
                  final bool isMe = (userregestered.email == messageSender);
                  final messageWidget = MessageBubble(
                    sender: messageSender,
                    text: messageText,
                    isMe: isMe,
                  );
                  
                  messageWedgets.add(messageWidget);
                  //  final missagewidget = Text('$messageSender _ $messageText');
                  // messageWedgets.add(missagewidget);
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    
                    children: messageWedgets),
                );
              }),

          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: AppColors.orange,
              width: 2,
            ))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                      controller: clearMessage,
                  onChanged: (value) {
                    text = value;
                  },
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),

                    hintText: " wraite text message here ........",
                    //  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)), // لون خافت للنص التلميحي

                    border: InputBorder.none,
                  ),
                )),
                IconButton(
                    onPressed: () {
                      _firstor.collection("messages").add({
                        "messagetext": text,
                        "sender": userregestered.email,
                        "time": FieldValue.serverTimestamp(),
                      });
                    },
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.blue,
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}





class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  const MessageBubble({
    super.key,
    required this.sender,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          
          Text(
            sender,
            style: const TextStyle(fontSize: 12, color: Colors.black45),
          ),
          const SizedBox(height: 3),
          Material(
            elevation: 4,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
          
            color: isMe ? AppColors.blue : AppColors.orange,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.lightBackground, 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:chat_app/core/constans/app_assets.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
              onPressed: () {},
              icon: const Icon(Icons.close, color: AppColors.lightBackground))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
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
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),

                    hintText: " wraite text message here ........",
                    //  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)), // لون خافت للنص التلميحي

                    border: InputBorder.none,
                  ),
                )),
                IconButton(
                    onPressed: () {},
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


import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'messages.dart';

//import 'Messenger/mesager.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatAppSate();
}

class ChatAppSate extends State<ChatApp> {
  List<messages> Messages = [
    messages(
        text: 'hii',
        date: DateTime.now().subtract(
          const Duration(days: 3, minutes: 1),
        ),
        isSentByme: true),
    messages(
        text: 'hello',
        date: DateTime.now().subtract(
          const Duration(days: 3, minutes: 1),
        ),
        isSentByme: false),
    messages(
        text: 'How are you',
        date: DateTime.now().subtract(
          const Duration(days: 3, minutes: 1),
        ),
        isSentByme: true),
    messages(
        text: 'Am great,What about you?',
        date: DateTime.now().subtract(
          const Duration(days: 3, minutes: 1),
        ),
        isSentByme: false),
    messages(
        text: 'am good',
        date: DateTime.now().subtract(
          const Duration(days: 3, minutes: 1),
        ),
        isSentByme: true),
  ]; //.reversed.toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.green,
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('chat App'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                child: GroupedListView<messages, DateTime>(
                  padding: const EdgeInsets.all(8),
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  elements: Messages,
                  groupBy: (messages) => DateTime(
                    messages.date.year,
                    messages.date.month,
                    messages.date.day,
                  ),
                  groupHeaderBuilder: (messages messages) => SizedBox(
                    height: 40,
                    child: Center(
                      child: Card(
                        color: Colors.redAccent,
                        elevation: 10, //Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            DateFormat.yMMMd().format(messages.date),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemBuilder: (context, messages Messages) => Align(
                    alignment: Messages.isSentByme
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Card(
                      color: Colors.greenAccent,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(Messages.text),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Type your message here'),
                  onSubmitted: (text) {
                    final Message = messages(
                        text: text, date: DateTime.now(), isSentByme: true);
                    setState(() => Messages.add(Message));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

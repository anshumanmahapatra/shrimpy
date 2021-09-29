import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shrimpy/constants/chat.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var message = messages;
    return Scaffold(
      appBar: AppBar(
        title: const Text("S.S. Aqua and Harvest"),
        elevation: 0,
        centerTitle: true,
        actions: const <Widget>[
          Icon(Icons.videocam),
          SizedBox(width: 5),
          Icon(Icons.phone),
          SizedBox(width: 5),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: message.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (message[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Column(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.6),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (message[index].messageType == "receiver"
                                  ? Colors.grey.shade200
                                  : Colors.blue[200]),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  message[index].messageContent,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(height: 10),
                                Offstage(
                                  offstage: message[index].time == null,
                                  child: Text(
                                    message[index].time.toString(),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                                Offstage(
                                  offstage: message[index].showButton == null,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Negotiate",
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: ElevatedButton(
                                          child: const Text("Final"),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          FaIcon(FontAwesomeIcons.smile),
                        ],
                      ),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.rotate(
                              angle: 1, child: const Icon(Icons.attach_file)),
                          const SizedBox(
                            width: 5,
                          ),
                          const FaIcon(FontAwesomeIcons.camera),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      prefixIconConstraints: const BoxConstraints(maxWidth: 40),
                      suffixIconConstraints: const BoxConstraints(maxWidth: 70),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          )),
                      hintText: "Type a Message",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.mic),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    primary: Colors.blue,
                    shape: const CircleBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

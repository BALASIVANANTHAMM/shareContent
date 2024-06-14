import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:sharecontent/page_Content.dart';
import 'package:sharecontent/provider/content_Provider.dart';

class Share extends StatefulWidget {
  const Share({super.key});

  @override
  State<Share> createState() => _ShareState();
}

class _ShareState extends State<Share> {
  late String value = 'State Management';
  late String value2 = 'Para Of That Title Text';
  late String url = 'https://flutter.dev/';
  late String cTit = 'Chooser Title For this Text';
  final ctl = TextEditingController();
  Future<void> share() async {
    await FlutterShare.share(
        title: value, text: value2, linkUrl: url, chooserTitle: cTit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Content'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(value),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 70,
              ),
              Text(
                'Name : ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                context.watch<ShareProvider>().userName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: TextFormField(
              controller: ctl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 90,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ShareProvider>().changeName(newName: ctl.text);
                  },
                  child: Text('Update')),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Next Page')),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: share, child: Text('Share'))
        ],
      ),
    );
  }
}

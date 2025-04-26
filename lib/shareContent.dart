import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareContent extends StatefulWidget {
  const ShareContent({super.key});

  @override
  State<ShareContent> createState() => _ShareContentState();
}

class _ShareContentState extends State<ShareContent> {

  late String url = 'https://github.com/BALASIVANANTHAMM/shareContent';
  String name = "Bala Sivanantham";


  shareText() async {
    final params = ShareParams(
      title: "Share Text",
      text: 'Hi Iam $name',
    );
    final res =await SharePlus.instance.share(params);
  }

  shareTextWithImage() async {
    final byteData = await rootBundle.load('assets/image.jpg');
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/image.jpg');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    final params = ShareParams(
      title: "Share Profile",
      text: 'Share Profile Image Using share_plus',
      files: [XFile(file.path)],
    );

    final res =await SharePlus.instance.share(params);
  }

  shareUri() async {
    final byteData = await rootBundle.load('assets/image.jpg');
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/image.jpg');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    final params = ShareParams(
      title: "Share Profile",
      text: url,
      files: [XFile(file.path)],
    );

    final res =await SharePlus.instance.share(params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),)
        ),
        title: const Text(
          'Share Content',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          GestureDetector(
            onTap: shareUri,
            child: const Icon(Icons.share,color: Colors.white,)
          ),
          const SizedBox(width: 20,)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: shareTextWithImage,
              child: const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/image.jpg'),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: shareText,
              child: const Text("Bala Sivanantham",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12
                  ),
                  child: const Text(
                    "Following 0",
                    style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12
                  ),
                  child: const Text(
                    "Followers 0",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 16
                ),
                height: 1000,
                child: GridView.builder(
                  itemCount: 27,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          fit: BoxFit.cover,
                            'assets/image.jpg'));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

🚀 Sharing Content on LinkedIn with Flutter's share_plus Package! 📱

If you're developing a Flutter app and need to share links, images, or files directly to LinkedIn, share_plus makes it seamless! Here's how you can integrate it into your Flutter project.

🔹 Step 1: Install share_plus
Add it to your pubspec.yaml:

yaml
dependencies:
 share_plus: latest_version
Run:

sh
flutter pub get

🔹 Step 2: Sharing a Github Repo URL
The easiest way to share a Github Repo is using a direct link:

dart

🔹 Step 3: Sharing an Image or File
For sharing media, copy the file to a temporary directory before sharing:

dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

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

🔹 Step 4: Using GitHub’s Native Sharing
To ensure GitHub opens directly, use a URL-based approach:

dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

 late String url = 'https://lnkd.in/gemwzvcd'; 

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
This will open Github's native share dialog with your content preloaded.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fiver_task/component/color.dart';
import '../../../component/constant.dart';
import 'package:clipboard/clipboard.dart';

class Paste_link extends StatefulWidget {
  const Paste_link({Key? key}) : super(key: key);

  @override
  State<Paste_link> createState() => _Paste_linkState();
}

class _Paste_linkState extends State<Paste_link> {
  TextEditingController textEditingController = TextEditingController();
  bool check = false;
  //// call Function to download youtube video
  Future<void> downloadVideo() async {
    if (textEditingController.text.isNotEmpty) {
      final result = await FlutterYoutubeDownloader.downloadVideo(
          textEditingController.text.trim(), "Video Downloader", 18);
      print(result);
    } else {
      if (kDebugMode) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please paste link"),
          ),
        );
        print("Please Enter Link");
      }
    }
  }

  //// clipboard tex{t detect
  ClipboardDetector() {
    FlutterClipboard.paste().then((value) {
      setState(() {
        textEditingController.text = value;
        check = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ClipboardDetector();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customcolor.custompink,
        title: Text(
          Constant.appbartitley,
          style: GoogleFonts.actor(color: customcolor.customwhite),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Image.asset("images/logos_youtube.png"),
          ),
          Text(
            "Paste link here",
            style: GoogleFonts.montserrat(
                color: customcolor.customblack, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: customcolor.customgrey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),

              /// TextField for the link.
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: check == true ? " Link Copied" : " Paste link here",
                  hintStyle: const TextStyle(color: customcolor.customgrey),
                  suffixIcon: const Icon(
                    Icons.paste,
                    color: customcolor.customgrey,
                  ),
                ),
              ),
            ),
          ),
          //// call button here
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton("Paste", customcolor.customblue),
              InkWell(
                onTap: () {
                  downloadVideo();
                },
                child: CustomButton("Download", customcolor.custompink),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// This is the button .
Widget CustomButton(String text, Color color) {
  return Container(
    width: 120,
    height: 50,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        color: color,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        text,
        style: GoogleFonts.montserrat(color: customcolor.customwhite),
      ),
    ),
  );
}

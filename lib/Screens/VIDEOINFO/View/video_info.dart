import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fiver_task/component/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_video_info/youtube.dart';
import 'package:flutter/services.dart';

import '../../../component/constant.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool check = false;

  TextEditingController textEditingController = TextEditingController();
  var title;
  var averageRating;
  var durationSeconds;
  var videoid;
  var viewCount;
  var version;
  var authername;
  var autherUrl;
  var description;
  var fulldescription;
  var keyword;
  var thumbnailurl;
  var type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: customcolor.custompink,
        title: const Text(Constant.appbartitleI),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.circleInfo,
                  size: 100,
                  color: customcolor.customred,
                ),
              ),
            ),
            Text(
              "Paste a YouTube link",
              style: GoogleFonts.montserrat(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: customcolor.customgrey,
                ),
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Paste a Youtube Link Here",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // call a button
            InkWell(
                onTap: () async {
                  print("clicked");
                  YoutubeDataModel videoData = await YoutubeData.getData(
                      textEditingController.text.trim());
                   title = videoData
                      .title; // "Ed Sheeran - Bad Habits [Official Video]"
                   averageRating = videoData.averageRating; // 4.13242
                   durationSeconds = (videoData.durationSeconds);
                   videoid = videoData.videoId;
                   viewCount = videoData.viewCount;
                   version = videoData.version;
                   authername = videoData.authorName;
                   autherUrl = videoData.authorUrl;
                   description = videoData.description;
                   fulldescription = videoData.fullDescription;
                   keyword = videoData.keywords;
                   thumbnailurl = videoData.thumbnailUrl;
                   type = videoData.type;
////////////////////////// PRint ///////////////////////////////////////
                  print(title.toString());
                  print(averageRating.toString());
                  print(durationSeconds.toString());
                  print(videoid.toString());
                  print(viewCount.toString());
                  print(version.toString());
                  print(authername.toString());
                  print(autherUrl.toString());
                  print(description.toString());
                  print(fulldescription.toString());
                  print(keyword.toString());
                  print(thumbnailurl.toString());
                  print(type.toString());
                  setState(() {
                    check = true;
                  });
                },
                child: CustomButton("Video-info", customcolor.customred)),
            //// Show data all video- info
            const SizedBox(
              height: 20,
            ),
           Visibility(
             visible: check,
               child: Text("Video Title : ${title.toString()}",style: GoogleFonts.montserrat()
                 ,textAlign: TextAlign.center,
               ),
           ),
           const Divider(

            ),
            Visibility(
              visible: check,
                child: Text("Video Rating : ${averageRating.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )),
           const Divider(

            ),
             Visibility(
               visible: check,
                 child: Text("Video Duration : ${durationSeconds.toString()}",
                   style: GoogleFonts.montserrat()
                   ,textAlign: TextAlign.center,
                 )),
            const Divider(

            ),
            Visibility(
              visible: check,
                child: Text("Video Id : ${videoid.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
           const Divider(

            ),
            Visibility(
                visible: check,
                child: Text("View Count : ${viewCount.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
            const Divider(

            ),
            Visibility(
                visible: check,
                child: Text("Version : ${version.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
            const Divider(

            ),
            Visibility(
                visible: check,
                child: Text("AuthorName : ${authername.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
            const Divider(

            ),
            Visibility(
                visible: check,
                child: Text("AuthorUrl: ${autherUrl.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
            const Divider(

            ),
            Visibility(
                visible: check,
                child: Text("ThumbnailUrl : ${thumbnailurl.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
            const Divider(

            ),
            Visibility(
                visible: check,
                child: Text("Type: ${type.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
            const Divider(

            ),
            Visibility(
                visible: check,
                child: Text("Description : ${description.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
            const Divider(

            ),
            Visibility(
                visible: check,
                child: Text("Full-Description : ${fulldescription.toString()}",
                  style: GoogleFonts.montserrat()
                  ,textAlign: TextAlign.center,
                )
            ),
            const Divider(

            ),
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: "$keyword")).
                then((value) => ScaffoldMessenger.of(context).
                showSnackBar(const SnackBar(content: Text("KeyWords is copies"),) ));
              },
              child: Visibility(
                  visible: check,
                  child:Text("KeyWords : ${keyword.toString()}",
                    style: GoogleFonts.montserrat()
                    ,textAlign: TextAlign.center,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}



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

  /// keyword

}


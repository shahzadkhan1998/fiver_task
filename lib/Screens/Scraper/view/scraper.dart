import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fiver_task/component/color.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_caption_scraper/youtube_caption_scraper.dart';

class ScraperVideo extends StatefulWidget {
  const ScraperVideo({Key? key}) : super(key: key);

  @override
  State<ScraperVideo> createState() => _ScraperVideoState();
}

class _ScraperVideoState extends State<ScraperVideo> {
  TextEditingController textEditingController = TextEditingController();
  var a;
  var b;
  var c;
  var list = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: customcolor.custompink,
        title: Text(
          "Scraper",
          style: GoogleFonts.actor(color: customcolor.customwhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const SizedBox(
               height: 10,
             ),
            const FaIcon(FontAwesomeIcons.solidFileVideo,color: Colors.pinkAccent,size: 100,),
            const SizedBox(
              height: 30,
            ),
            Text("scraper substitle from video ",style: GoogleFonts.montserrat(),),
            const SizedBox(
              height: 30,
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
              height: 20,
            ),
            InkWell(
                onTap: () async {
                  final captionScraper = YouTubeCaptionScraper();
                  final captionTracks = await captionScraper.getCaptionTracks(textEditingController.text.trim());

                  final subtitles = await captionScraper.getSubtitles(captionTracks[0]);
                  for (final subtitle in subtitles) {
                    print(
                      '${_formatDuration(subtitle.start)} - '
                          '${_formatDuration(subtitle.duration)} - '
                          '${subtitle.text}',
                    );

                     setState(() {
                       list.add(subtitle.text);
                     });

                    print("List Data is : $list");
                  }
                },
                child: CustomButton("Scraper", customcolor.customred),),
            
            const SizedBox(
              height: 30,
            ),

              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index)
                {
                    if(list.length < 1)
                      {
                        return const Text("Paste and Click Button");
                      }
                    else
                      {
                        return Center(child: InkWell(
                          onTap: ()
                            {
                              Clipboard.setData(ClipboardData(text: "${list[index]}")).
                              then((value) => ScaffoldMessenger.of(context).
                              showSnackBar(const SnackBar(content: Text("Copy to clipboard"),) ));
                            },
                            child: Text(list[index],style: GoogleFonts.montserrat(),)));
                      }
                },),
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
String _formatDuration(Duration duration) {
  return '${duration.inHours}:'
      '${duration.inMinutes.remainder(60)}:'
      '${duration.inSeconds.remainder(60)}:'
      '${duration.inMilliseconds.remainder(60)}';
}




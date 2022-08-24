
import 'package:fiver_task/Screens/Youtube_Screen/View/widget/nav_bar.dart';
import 'package:fiver_task/component/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../component/constant.dart';
import '../../Filedownloader/view/file_page.dart';
import '../../Scraper/view/scraper.dart';
import '../../VIDEOINFO/View/video_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: customcolor.custompink,
        title:  const Text(
          Constant.apppartitle,
          style: TextStyle(
              color: customcolor.customwhite,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Select platform",
                style: GoogleFonts.montserrat(
                    color: customcolor.customblack, fontSize: 18),
              ),
            ),
          ),

          /// making button for a Social.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Social Custom Button
              InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return  const VideoInfo();
                  } ));
                },
                child: SocailButton(
                   const FaIcon(FontAwesomeIcons.info),
                  "Youtube-video-info",
                  customcolor.custompink,
                    ()
                    {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return  const VideoInfo();
                    } ));
                    }

                ),
              ),
              // 2 button
              InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return  const SingleDownloadScreen();
                  } ));
                },
                child: SocailButton(
                    const FaIcon(FontAwesomeIcons.file),
                    "File Download",
                  Colors.blue,
                    ()
                    {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return  const SingleDownloadScreen();
                    } ));
                    }

                ),
              ),

              // 3rd button
              InkWell(
                onTap: ()
                {
                  print("Iam print");
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                       return const NavYoutube();
                     } ));
                },
                child: SocailButton(
                  const FaIcon(FontAwesomeIcons.youtubeSquare),
                  "Youtube",
                  Colors.red,
                    ()
                    {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return const NavYoutube();
                    } ));
                    }

                ),
              ),


            ],
          ),
          const Divider(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Social Custom Button
              InkWell(
                onTap: ()
                {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return const ScraperVideo();
                } ));
                },
                child: SocailButton(
                  const FaIcon(FontAwesomeIcons.fileText
                 ),
                  "Scraper",
                  Colors.blueAccent,
                    ()
                    {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return const ScraperVideo();
                    } ));
                    }




                ),
              ),



            ],
          ),
        ],
      ),
    );
  }
  // call1()
  // {
  //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
  //     return const ScraperVideo();
  //   } ));
  // }

}

Widget SocailButton(FaIcon icon, String name, Color color, VoidCallback fun,  )
{
    return Container(
      decoration:  BoxDecoration(
        color: customcolor.customgrey,
        borderRadius:BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          IconButton(onPressed:fun, icon: icon,color: color,iconSize: 60,),
          Text(name,style: GoogleFonts.montserrat(),),
        ],
      ),
    );
}








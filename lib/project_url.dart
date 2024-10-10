import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectUrl extends StatelessWidget {
  const ProjectUrl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 600.w,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: Text(
                'Projects ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 600.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 60, child: Text("playstore")),
                      Icon(Icons.play_arrow),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.icicilombard.ipartnerpro'));
                          },
                          child: Text(
                            'https://play.google.com/store/apps/details?id=com.icicilombard.ipartnerpro',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 60, child: Text("website")),
                      Icon(Icons.play_arrow),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'https://digitalpos-uat.insurancearticlez.com/FlutterWebProd/#/'));
                          },
                          child: Text(
                            'https://digitalpos-uat.insurancearticlez.com/FlutterWebProd/#/',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 60, child: Text("website:")),
                      Icon(Icons.play_arrow),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse('https://nomadsat.com/#/'));
                          },
                          child: Text(
                            'https://nomadsat.com/#/',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

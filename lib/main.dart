import 'dart:convert';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web/web.dart' as web;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screen_utility.dart';

final pdf = pw.Document();

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(360, 640), // Replace with your design dimensions
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Developer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final file = io.File('example.pdf');
    ScreenType screenType = ScreenUtility.currentScreenType;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < 768) {
                  return Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(alignment: Alignment.center, children: [
                            Container(
                              color: const Color.fromRGBO(255, 193, 7, 1),
                              alignment: Alignment.center,
                              height: 130,
                            ),
                            CircleAvatar(
                                radius: 100,
                                foregroundImage:
                                    AssetImage("asset/images/profile.png")),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Hi, I\u0027m Sushmita',
                              style: Theme.of(context).textTheme.headlineLarge),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 200.0, vertical: 30),
                            child: Divider(),
                          ),
                          ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                  minimumSize: Size(200, 60),
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              onPressed: () async {
                                await _generatePdf(PdfPageFormat.a4);
                              },
                              child: Text(
                                'view resume',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'A passionate Flutter developer from India',
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30),
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 80.w,
                                        child: Text(
                                          'github',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.link),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            child: Text(
                                                'https://github.com/SushmitaBhor',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline)),
                                            onTap: () {
                                              launchUrl(Uri.parse(
                                                  'https://github.com/SushmitaBhor'));
                                            },
                                          )
                                        ],
                                      )
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 80.w,
                                        child: Text(
                                          'Location',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_pin),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Navi Mumbai',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      )
                                    ]),
                                Row(children: [
                                  SizedBox(
                                    width: 80.w,
                                    child: Text(
                                      'mobile',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.call),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '9594315974',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  )
                                ]),
                                Row(children: [
                                  SizedBox(
                                    width: 80.w,
                                    child: Text(
                                      'LinkedIn',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.link),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          launchUrl(Uri.parse(
                                              'https://www.linkedin.com/in/sushmitabhor/'));
                                        },
                                        child: Text(
                                          'https://www.linkedin.com/in/sushmitabhor/',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline),
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  )
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(alignment: Alignment.center, children: [
                            Container(
                              color: const Color.fromRGBO(255, 193, 7, 1),
                              alignment: Alignment.center,
                              height: 120,
                            ),
                            CircleAvatar(
                                radius: 100,
                                foregroundImage:
                                    AssetImage("asset/images/profile.png")),
                          ]),
                          Text('Hi, I\u0027m Sushmita',
                              style: Theme.of(context).textTheme.headlineLarge),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 200.0, vertical: 30),
                            child: Divider(),
                          ),
                          ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                  minimumSize: Size(200, 60),
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              onPressed: () async {
                                await _generatePdf(PdfPageFormat.a4);
                              },
                              child: Text(
                                'view resume',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'A passionate Flutter developer from India',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                        child: Text(
                                          'github',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.link),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            child: Text(
                                                'https://github.com/SushmitaBhor',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                )),
                                            onTap: () {
                                              launchUrl(Uri.parse(
                                                  'https://github.com/SushmitaBhor'));
                                            },
                                          )
                                        ],
                                      )
                                    ]),
                                Row(children: [
                                  SizedBox(
                                    width: 20.w,
                                    child: Text(
                                      'Location',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.location_pin),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Navi Mumbai',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ]),
                                Row(children: [
                                  SizedBox(
                                    width: 20.w,
                                    child: Text(
                                      'mobile',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.call),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '9594315974',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  )
                                ]),
                                Row(children: [
                                  SizedBox(
                                    width: 20.w,
                                    child: Text(
                                      'portfolio',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.link),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 80.w,
                                        child: GestureDetector(
                                          onTap: () {
                                            launchUrl(Uri.parse(
                                                'https://portfolio-30e80.web.app'));
                                          },
                                          child: Text(
                                            'https://portfolio-30e80.web.app',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline),
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                                Row(children: [
                                  SizedBox(
                                    width: 20.w,
                                    child: Text(
                                      'LinkedIn',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.link),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 80.w,
                                        child: GestureDetector(
                                          onTap: () {
                                            launchUrl(Uri.parse(
                                                'https://www.linkedin.com/in/sushmitabhor/'));
                                          },
                                          child: Text(
                                            'https://www.linkedin.com/in/sushmitabhor/',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline),
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            text:
                                '\u2022 I\u0027m currently looking for opportunity for ',
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                          TextSpan(
                            text: 'Flutter developer position',
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(
                            text:
                                '\u2022 I\u0027ve designed and developed high-quality applications using',
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                          TextSpan(
                            text: ' Flutter',
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(
                            text: '\u2022 I\u0027ve ',
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                          TextSpan(
                            text: 'Proficiency in Mobile architecture',
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(
                            text: '\u2022 I\u0027ve collaborated and',
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                          TextSpan(
                            text:
                                ' communiated with designer, project manager and other stakeholders',
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(
                            text: '\u2022 I\u0027ve ability to',
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                          TextSpan(
                            text: ' participate in planning, reviewing, coding',
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(compress: false);
    final font = await PdfGoogleFonts.openSansLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(
                    'Sushmita Bhor',
                    style: pw.TextStyle(font: font, fontSize: 16),
                  ),
                ),
              ),
              pw.SizedBox(
                  width: double.infinity,
                  child: pw.FittedBox(
                      child: pw.Row(children: [
                    pw.FittedBox(
                      child: pw.Text(
                        'contact: 9594315974',
                        style: pw.TextStyle(font: font, fontSize: 12),
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Row(children: [
                      pw.Text(
                        'portfolio',
                        style: pw.TextStyle(font: font),
                      ),
                      pw.SizedBox(width: 5),
                      pw.Text(
                        'https://portfolio-30e80.web.app',
                        style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline,
                            fontStyle: pw.FontStyle.normal),
                        softWrap: true,
                      ),
                    ]),
                    pw.SizedBox(width: 10),
                    pw.FittedBox(
                      child: pw.Text(
                        'email: sushmitabhor3@gmail.com',
                        style: pw.TextStyle(font: font, fontSize: 12),
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.FittedBox(
                      child: pw.Text(
                        'https://www.linkedin.com/in/sushmitbhor/',
                        style: pw.TextStyle(font: font, fontSize: 12),
                      ),
                    ),
                  ]))),
              pw.SizedBox(height: 10),
              pw.Divider(thickness: 1.0),
              pw.SizedBox(height: 10),
              pw.Flexible(
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                    pw.Text('Summary',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Text(
                        'Currently, I am working as a senior software engineer as part of the frontend team, developing both mobile and web applications using the Flutter framework, creating dynamic user interfaces, integrating APIs, and ensuring app performance and responsiveness. I am dedicated to delivering high-quality, user-friendly solutions that meet both business and user needs.',
                        style: pw.TextStyle(font: font, fontSize: 12)),
                    pw.SizedBox(height: 10),
                    pw.Divider(thickness: 1.0),
                    pw.SizedBox(height: 10),
                    pw.Text('Experience',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('Pegasus InfoCorp      ',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontBold: pw.Font.courierBold(),
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text('Sep 2023 - Sep 2024  ',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontBold: pw.Font.courierBold(),
                                  fontWeight: pw.FontWeight.bold))
                        ]),
                    pw.SizedBox(height: 5),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('Senior Software Engineer',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontItalic: pw.Font.courierOblique(),
                                  fontStyle: pw.FontStyle.italic)),
                          pw.Text('Mumbai, Maharashtra',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontItalic: pw.Font.courierOblique(),
                                  fontStyle: pw.FontStyle.italic))
                        ]),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 Review and redesign of existing IPartner PRO application of ICICI Lombard GIC using Flutter ',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal)),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 Collaborate with Software Development and business analyst to develop app.',
                        style: pw.TextStyle(
                          font: font,
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                        softWrap: true),
                    pw.Text(
                        '\u2022 Integration of Restful API using provider state management library and create user-friendly User Interface  ',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal),
                        softWrap: true),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('Sodel Solutions',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontBold: pw.Font.courierBold(),
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text('Aug 2021 - Aug 2023',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontBold: pw.Font.courierBold(),
                                  fontWeight: pw.FontWeight.bold))
                        ]),
                    pw.SizedBox(height: 5),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('Software Engineer',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontItalic: pw.Font.courierOblique(),
                                  fontStyle: pw.FontStyle.italic)),
                          pw.Text('Navi Mumbai, Maharashtra',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontItalic: pw.Font.courierOblique(),
                                  fontStyle: pw.FontStyle.italic))
                        ]),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 Designed, implemented, Flutter and Dart code using MVVM Model as well as CLEAN architecture for IOS, Android and Web',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal)),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 Integrated various third-party APIs and services, such as Google Maps to enhance app functionality.',
                        style: pw.TextStyle(
                          font: font,
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                        softWrap: true),
                    pw.Text(
                        '\u2022 Integration of Restful API using provider state management library and create user-friendly User Interface  ',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal),
                        softWrap: true),
                    pw.SizedBox(height: 10),
                    pw.Text('Projects',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Row(children: [
                            pw.Text('IPartnerPro App ',
                                style: pw.TextStyle(
                                    font: font,
                                    fontSize: 12,
                                    fontBold: pw.Font.courierBoldOblique(),
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text('| Flutter, Dart',
                                style: pw.TextStyle(
                                    font: font,
                                    fontSize: 12,
                                    fontItalic: pw.Font.courierOblique(),
                                    fontStyle: pw.FontStyle.italic)),
                          ]),
                          pw.Text('Sep 2023 - Sep 2024  ',
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 12,
                                fontBold: pw.Font.courierOblique(),
                              ))
                        ]),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 Implemented state management solutions (e.g., Provider) to handle complex business logic, enhancing app responsiveness and reliability. ',
                        style: pw.TextStyle(
                          font: font,
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                        softWrap: true),
                  ])),
            ],
          );
        },
      ),
    );
    pdf.addPage(pw.Page(build: (context) {
      return pw
          .Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Wrap(children: [
          pw.Text(
              '\u2022  Collaborated with cross-functional teams, including UI/UX designers, backend developers, and product managers, software testers,business owner to ensure seamless integration and user experience.',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022 Designed and implemented gamification features within the insurance app ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022 Developed reward-based user interaction flows using Flutter Data visualization libraries, enhancing customer satisfaction and encouraging repeat use of the app.',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022 Solved discrepancies between API responses and UI screens, improving data consistency and reducing user-reported issues by 20% ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022 updated a dropdown list based on a selected list item and show the count of renewal policies against each policy type in Flutter ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true)
        ]),
        pw.SizedBox(height: 10),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Row(children: [
            pw.Text('Nomad ',
                style: pw.TextStyle(
                    font: font,
                    fontSize: 12,
                    fontBold: pw.Font.courierBoldOblique(),
                    fontWeight: pw.FontWeight.bold)),
            pw.Text('| Flutter, Dart',
                style: pw.TextStyle(
                    font: font,
                    fontSize: 12,
                    fontItalic: pw.Font.courierOblique(),
                    fontStyle: pw.FontStyle.italic)),
          ]),
          pw.Text('Jul 2022 - Aug 2023',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontBold: pw.Font.courierOblique(),
              ))
        ]),
        pw.SizedBox(height: 5),
        pw.Wrap(children: [
          pw.Text(
              '\u2022 Developed custom widgets and components to ensure code reusability and scalability. (pagination, Graph, ticket clipper animations, sticky headers animation side drawer, expandable google maps, custom map marker)  ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022  Collaborated with cross-functional teams, including UI/UX designers, backend developers, and product managers, software testers,business owner to ensure seamless integration and user experience.',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022 Managed application state using state management tools like Provider.    ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022 Utilized version control systems such as Git to manage source code and collaborate with other developers.  ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022 Solved discrepancies between API responses and UI screens, improving data consistency and reducing user-reported issues by 20% ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022 updated a dropdown list based on a selected list item and show the count of renewal policies against each policy type in Flutter ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true)
        ]),
        pw.SizedBox(height: 5),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Row(children: [
            pw.Text('Workcertain',
                style: pw.TextStyle(
                    font: font,
                    fontSize: 12,
                    fontBold: pw.Font.courierBoldOblique(),
                    fontWeight: pw.FontWeight.bold)),
            pw.Text('| Flutter, Dart',
                style: pw.TextStyle(
                    font: font,
                    fontSize: 12,
                    fontItalic: pw.Font.courierOblique(),
                    fontStyle: pw.FontStyle.italic)),
          ]),
          pw.Text('April 2022 - Jul 2022',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontBold: pw.Font.courierOblique(),
              ))
        ]),
        pw.SizedBox(height: 5),
        pw.Wrap(children: [
          pw.Text(
              '\u2022 Implemented state management solutions (e.g., Provider) to handle complex business logic, enhancing app responsiveness and reliability. ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022  Collaborated with cross-functional teams, including UI/UX designers, backend developers, and product managers, software testers,business owner to ensure seamless integration and user experience.',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022  Implemented deep linking in mobile applications to provide users with seamless navigation to specific content within the app and improve the overall user experience.   ',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
          pw.Text(
              '\u2022   Utilized version control systems such as Git to manage source code and collaborate with other developers.',
              style: pw.TextStyle(
                font: font,
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              softWrap: true),
        ])
      ]);
    }));

    pdf.addPage(pw.Page(build: (context) {
      return pw
          .Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text('Skills',
            style: pw.TextStyle(
                font: font, fontSize: 15, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 10),
        pw.Text(
            ' REST APIs, data programing, flutter development, Mobile Application Development, flutter framework, State management, Troubleshooting ',
            style: pw.TextStyle(
              font: font,
              fontSize: 12,
              fontWeight: pw.FontWeight.normal,
            ),
            softWrap: true),
        pw.SizedBox(height: 10),
        pw.Text('Education',
            style: pw.TextStyle(
                font: font, fontSize: 15, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 10),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Masters of computer Applications MCA  ',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 12,
                  fontBold: pw.Font.courierBold(),
                  fontWeight: pw.FontWeight.bold)),
          pw.Text('GPA:7.33',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 12,
                  fontBold: pw.Font.courierBold(),
                  fontWeight: pw.FontWeight.bold))
        ]),
        pw.SizedBox(height: 5),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Wrap(children: [
              pw.SizedBox(
                  width: 200,
                  child: pw.Text(
                      'Bharati Vidyapeeth\'s Institute of management and information technology  ',
                      style: pw.TextStyle(
                          font: font,
                          fontSize: 10,
                          fontItalic: pw.Font.courierOblique(),
                          fontStyle: pw.FontStyle.italic),
                      softWrap: true))
            ]),
            pw.SizedBox(height: 5),
            pw.Text('(University of Mumbai) ',
                style: pw.TextStyle(
                    font: font,
                    fontSize: 10,
                    fontItalic: pw.Font.courierOblique(),
                    fontStyle: pw.FontStyle.italic)),
          ]),
          pw.Text(' June 2018 - May 2021',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 10,
                  fontItalic: pw.Font.courierOblique(),
                  fontStyle: pw.FontStyle.italic))
        ]),
        pw.SizedBox(height: 10),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Bachelor of science (information technology) bscit   ',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 12,
                  fontBold: pw.Font.courierBold(),
                  fontWeight: pw.FontWeight.bold)),
          pw.Text('GPA:4.9',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 12,
                  fontBold: pw.Font.courierBold(),
                  fontWeight: pw.FontWeight.bold)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('JVM\'s Mehta college (University of Mumbai)  ',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 10,
                  fontItalic: pw.Font.courierOblique(),
                  fontStyle: pw.FontStyle.italic)),
          pw.Text('June 2014  May 2018',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 10,
                  fontItalic: pw.Font.courierOblique(),
                  fontStyle: pw.FontStyle.italic)),
        ]),
        pw.SizedBox(height: 10),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('HSC (Higher Secondary Certificate)',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 12,
                  fontBold: pw.Font.courierBold(),
                  fontWeight: pw.FontWeight.bold)),
          pw.Text('Aggregate: 54.62% ',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 12,
                  fontBold: pw.Font.courierBold(),
                  fontWeight: pw.FontWeight.bold)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('SPN Doshi Women College (University of Mumbai)',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 10,
                  fontItalic: pw.Font.courierOblique(),
                  fontStyle: pw.FontStyle.italic)),
          pw.Text('March 2014',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 10,
                  fontItalic: pw.Font.courierOblique(),
                  fontStyle: pw.FontStyle.italic)),
        ]),
        pw.SizedBox(height: 10),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('SSC (Secondary School Certificate)',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 12,
                  fontBold: pw.Font.courierBold(),
                  fontWeight: pw.FontWeight.bold)),
          pw.Text('Aggregate: 81.60%',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 12,
                  fontBold: pw.Font.courierBold(),
                  fontWeight: pw.FontWeight.bold)),
        ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Dnyanprakash Vidyalaya',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 10,
                  fontItalic: pw.Font.courierOblique(),
                  fontStyle: pw.FontStyle.italic)),
          pw.Text('March 2012',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 10,
                  fontItalic: pw.Font.courierOblique(),
                  fontStyle: pw.FontStyle.italic)),
        ]),
      ]);
    }));
    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);
    web.HTMLAnchorElement()
      ..href =
          "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}"
      ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
      ..click();
    return pdf.save();
  }
}

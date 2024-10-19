import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:web/web.dart' as web;
import 'package:pdf/widgets.dart' as pw;

class ViewResume extends StatelessWidget {
  ViewResume({super.key});
  final pdf = pw.Document();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: Size(200, 50),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () async {
          await _generatePdf(PdfPageFormat.a4);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.file_open,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'View resume',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ));
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
                        'Currently, I am working as a Sr Software Engineer Flutter M as part of the frontend team, developing both mobile and web applications using the Flutter framework, creating dynamic user interfaces, integrating APIs, and ensuring app performance and responsiveness. I am dedicated to delivering high-quality, user-friendly solutions that meet both business and user needs.',
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
                          pw.Text('CitiusTech',
                              style: pw.TextStyle(
                                  font: font,
                                  fontSize: 12,
                                  fontBold: pw.Font.courierBold(),
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text('Oct 2024 - Current',
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
                          pw.Text('Sr Software Engineer Flutter M',
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
                        '\u2022 Good understanding of difference between Flutter & Dart',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal)),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 Developed Widget, UI Elements, Grid & other components of Flutter',
                        style: pw.TextStyle(
                          font: font,
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                        ),
                        softWrap: true),
                    pw.SizedBox(height: 5),
                    pw.Text('\u2022 Created Platform Channel & Platform views',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal),
                        softWrap: true),
                    pw.SizedBox(height: 5),
                    pw.Text('\u2022 Created database like hive, sqlite',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal),
                        softWrap: true),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 created and upgraded custom packages or plugins',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal),
                        softWrap: true),
                    pw.SizedBox(height: 5),
                    pw.Text('\u2022 created Web Services integrations',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal),
                        softWrap: true),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 Code using version management control system',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal),
                        softWrap: true),
                    pw.SizedBox(height: 5),
                    pw.Text(
                        '\u2022 Took responsibility & ownership in the team’s work, good communication ',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal),
                        softWrap: true),
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

import 'package:flutter/material.dart';
import 'package:portfl/about.dart';
import 'package:portfl/contact_card.dart';
import 'package:portfl/project_url.dart';
import 'package:portfl/view_resume.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(360, 640), // Replace with your design dimensions
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < 768) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          Stack(alignment: Alignment.center, children: [
                            Container(
                              color: Colors.blue,
                              alignment: Alignment.center,
                              height: 220.h,
                            ),
                            Positioned(
                              top: 10.h,
                              child: CircleAvatar(
                                  radius: 100.h,
                                  foregroundImage:
                                      AssetImage("asset/images/profile.png")),
                            ),
                          ]),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Hi, I\u0027m Sushmita',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 200.0, vertical: 10),
                            child: Divider(),
                          ),
                          ViewResume(),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'A passionate Flutter developer from India',
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: ContactCard(),
                      )
                    ],
                  );
                } else {
                  return Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Column(
                        children: [
                          Stack(alignment: Alignment.center, children: [
                            Container(
                              color: Colors.blue,
                              alignment: Alignment.center,
                              height: 190.h,
                            ),
                            Positioned(
                              top: 30.h,
                              child: const CircleAvatar(
                                  radius: 100,
                                  foregroundImage:
                                      AssetImage("asset/images/profile.png")),
                            ),
                          ]),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Hi, I\u0027m Sushmita',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 200.0, vertical: 30),
                            child: Divider(),
                          ),
                          ViewResume(),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'A passionate Flutter developer from India',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 20, bottom: 20),
                          child: const ContactCard())
                    ],
                  );
                }
              }),
              const About(),
              const ProjectUrl()
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

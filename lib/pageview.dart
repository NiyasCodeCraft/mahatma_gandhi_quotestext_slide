import 'package:flutter/material.dart';
import 'package:mahatma_gandhi_quotestext_slide/apptexts.dart';
import 'package:mahatma_gandhi_quotestext_slide/display_text.dart';
import 'package:mahatma_gandhi_quotestext_slide/indicator.dart';
import 'package:share_plus/share_plus.dart';

class Pageview extends StatefulWidget {
  const Pageview({super.key});

  @override
  State<Pageview> createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            elevation: 10.0,
            title: Text(
              "Quotes of Mahatma Gandhi",
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              PopupMenuButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 35,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      height: 40,
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.share,
                            size: 19,
                          ),
                          SizedBox(width: 10),
                          Text("Share Quotes"),
                        ],
                      )),
                ],
                offset: Offset(60, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                elevation: 1,
                onSelected: (value) {
                  if (value == 1) {
                    print('------>> Share button Clicked');
                    _shareInfo();
                  }
                },
              )
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: 300,
                  height: 300,
                  width: 400,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          print('----------->> on change clicked');
                          print(index);
                          selectedIndex = index;
                        });
                      },
                      itemCount: appTextList.length,
                      itemBuilder: (context, index) {
                        var _quotes = appTextList[index];
                        var _scales = selectedIndex == index ? 1.10 : 0.3;
                        return TweenAnimationBuilder(
                          tween: Tween(begin: _scales, end: _scales),
                          duration: Duration(milliseconds: 300),
                          child: DisplayText(
                            appText: _quotes,
                          ),
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: child,
                            );
                          },
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(
                          appTextList.length,
                          (index) => Indicator(
                              isActive: selectedIndex == index ? true : false))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _shareInfo() {
    print('.....share quotes');
    print(appTextList[selectedIndex].textPath);
    Share.share(appTextList[selectedIndex].textPath);
  }
}

import 'package:flutter/material.dart';
import 'constants.dart';
import 'select_course.dart';

class CardItemModel {
  String cardTitle;
  IconData icon;
  String tasksRemaining;
  //double taskCompletion;
  CardItemModel(this.cardTitle, this.tasksRemaining);
}

class Memorization extends StatefulWidget {
  @override
  _MemorizationState createState() => new _MemorizationState();
}

class _MemorizationState extends State<Memorization>
    with TickerProviderStateMixin {
  var appColors = [
    Color.fromRGBO(106, 90, 203, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0),
    Color.fromRGBO(106, 90, 203, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0)
  ];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(106, 90, 203, 1.0);
  var cardsList = [
    CardItemModel("⌘＋C", "コピーする"),
    CardItemModel("⌘＋V", "ペーストする"),
    CardItemModel("⌘＋S", "保存する"),
    CardItemModel("⌘＋X", "切り取り＆コピー"),
    CardItemModel("⌘＋A", "全選択"),
    CardItemModel("⌘＋F", "検索"),
    CardItemModel("⌘＋S", "保存する")
  ];
  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;
  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: currentColor,
        appBar: AppBar(
          backgroundColor: Colors.black26.withOpacity(0.3),
          title: Text(
            'memorization mode',
            style: TextStyle(
              fontFamily: 'BalooBhai',
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: kAlertContainer,
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('いいえ'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: const Text('はい'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectCourse()),
                                (_) => false);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [
                const Color(0xffE040FB).withOpacity(0.6), //透明度
                const Color(0xff42A5F5).withOpacity(0.6), //透明度
              ],
              stops: const [
                0.0,
                1.0,
              ],
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Row(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 64.0, vertical: 32.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                          child: Text(
                            "",
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 16.0),
                      child: Text(
                        "",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      height: 350.0,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6, //スライドの枚数に合わせる数字
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.black26,
                                child: Container(
                                  color: Colors.transparent,
                                  width: 250.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0.0,
                                                      vertical: 0.0),
                                              child: Text(
                                                "${cardsList[position].tasksRemaining} ",
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0.0,
                                                      vertical: 0.0),
                                              child: Text(
                                                "${cardsList[position].cardTitle}",
                                                style: TextStyle(
                                                    fontSize: 28.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                            onHorizontalDragEnd: (details) {
                              animationController = AnimationController(
                                  vsync: this,
                                  duration: Duration(milliseconds: 500));
                              curvedAnimation = CurvedAnimation(
                                  parent: animationController,
                                  curve: Curves.fastOutSlowIn);
                              animationController.addListener(() {
                                setState(() {
                                  currentColor =
                                      colorTween.evaluate(curvedAnimation);
                                });
                              });
                              if (details.velocity.pixelsPerSecond.dx > 0) {
                                if (cardIndex > 0) {
                                  cardIndex--;
                                  colorTween = ColorTween(
                                      begin: currentColor,
                                      end: appColors[cardIndex]);
                                }
                              } else {
                                if (cardIndex < 10) {
                                  //スライドの枚数に合わせる数字(スライド-1)
                                  cardIndex++;
                                  colorTween = ColorTween(
                                      begin: currentColor,
                                      end: appColors[cardIndex]);
                                }
                              }
                              setState(() {
                                scrollController.animateTo((cardIndex) * 256.0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn);
                              });
                              colorTween.animate(curvedAnimation);
                              animationController.forward();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

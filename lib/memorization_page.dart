import 'package:flutter/material.dart';
import 'constants.dart';
import 'select_course.dart';

class MemorizationBrain {
  List cardsList = [];
  List _basicCardsList = [
    CardItemModel("⌘＋C", "コピーする"),
    CardItemModel("⌘＋V", "ペーストする"),
    CardItemModel("⌘＋S", "保存する"),
    CardItemModel("⌘＋X", "切り取り＆コピー"),
    CardItemModel("⌘＋A", "全選択"),
    CardItemModel("⌘＋F", "検索"),
    CardItemModel("⌘＋tab", "開いてるアプリを切り替える"),
    CardItemModel("⌘＋shift＋5", "範囲を指定してスクリーンショット"),
    CardItemModel("⌘＋Z", "操作をひとつ取り消す"),
    CardItemModel('⌘＋shift＋Z', '一つ前の操作をやり直す'),
  ];

  List _browseCardsList = [
    CardItemModel("⌘＋R", "リロード(ページを再読み込み)する"),
    CardItemModel("⌘＋T", "ブラウザで新しいタブを開く"),
    CardItemModel("⌘＋←", "一つ前のページに戻る"),
    CardItemModel("⌘＋W", "タブを閉じる"),
    CardItemModel("⌘＋shift＋T", "閉じたタブを再度開く"),
    CardItemModel("⌘＋L", "サイト上部のリンクを選択する"),
    CardItemModel("⌘＋N", "新規のウィンドウを開く"),
    CardItemModel("⌘＋shift＋N", "新規のシークレットウィンドウを開く"),
    CardItemModel("⌘＋option＋←", "左隣のタブを表示する"),
    CardItemModel("⌘＋D", "ブックマークに追加する"),
  ];

  void setCardsList(String course) {
    switch (course) {
      case 'basic':
        cardsList = _basicCardsList;
        break;
      case 'browse':
        cardsList = _browseCardsList;
        break;
    }
  }
}

MemorizationBrain memorizationBrain = MemorizationBrain();

class CardItemModel {
  String cardTitle;
  IconData icon;
  String tasksRemaining;
  //double taskCompletion;
  CardItemModel(this.cardTitle, this.tasksRemaining);
}

class Memorization extends StatefulWidget {
  String course = '';

  Memorization(String course) {
    this.course = course;
    memorizationBrain.setCardsList(this.course);
  }
  @override
  _MemorizationState createState() => new _MemorizationState();
}

class _MemorizationState extends State<Memorization>
    with TickerProviderStateMixin {
  List appColors = [
    Color.fromRGBO(106, 90, 203, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0),
    Color.fromRGBO(106, 90, 203, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0),
    Color.fromRGBO(106, 90, 203, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0),
    Color.fromRGBO(106, 90, 203, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0),
    Color.fromRGBO(106, 90, 203, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0)
  ];
  int cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(106, 90, 203, 1.0);
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
    return Scaffold(
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text(
                            'いいえ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: const Text('はい',
                              style: TextStyle(color: Colors.black45)),
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
                        itemCount: 10, //スライドの枚数に合わせる数字
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
                                                "${memorizationBrain.cardsList[position].tasksRemaining} ",
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontFamily: 'MPLUS'),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0.0,
                                                      vertical: 0.0),
                                              child: Text(
                                                "${memorizationBrain.cardsList[position].cardTitle}",
                                                style: TextStyle(
                                                    fontSize: 28.0,
                                                    color: Colors.white,
                                                    fontFamily: 'MPLUS'),
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

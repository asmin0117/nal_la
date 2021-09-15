import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';
import 'package:nal_la/values/values.dart';

class MyContract extends StatefulWidget {
  MyContract({var key}) : super(key: key);

  @override
  _MyContractState createState() => _MyContractState();
}

class _MyContractState extends State<MyContract> {
  AppBarWidget appBarWidget = Get.put(AppBarWidget());

  List<Map<String, String>> contracts = [];

  @override
  void initState() {
    super.initState();
    contracts = [
      {
        "sender": "수민수산",
        "product": "참치",
        "weight": "2.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "sender": "석중수산",
        "product": "광어",
        "weight": "1.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.05 6am 이전",
        "payment": "150000"
      },
      {
        "sender": "수민수산",
        "product": "참치",
        "weight": "2.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "sender": "석중수산",
        "product": "광어",
        "weight": "1.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.05 6am 이전",
        "payment": "150000"
      },
      {
        "sender": "수민수산",
        "product": "참치",
        "weight": "2.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "sender": "석중수산",
        "product": "광어",
        "weight": "1.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.05 6am 이전",
        "payment": "150000"
      },
    ];
  }


  final won = new NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return "${won.format(int.parse(priceString))}원~";
  }

  Widget slideLeft() {
    return Container(
      color: Colors.red.withOpacity(0.8),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "삭제",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Noto Sans CJK KR"),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  PreferredSizeWidget contractAppBar() {
    return AppBar(
      title: Text(
        "My 계약",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      bottom: TabBar(
        indicatorColor: AppColors.secondaryElement,
        tabs: <Widget>[
        Tab(
          text: "현재 계약",
        ),
        Tab(
          text: "지난 계약",
        ),
        Tab(
          text: "요청 계약",
        ),
        Tab(
          text: "랄라 계약",
        ),
      ],),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/bell.png",
              width: 22,
            ))
      ],
    );
  }

  ListView _contractList() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext _context, int index) {
          return Dismissible(
              key: ValueKey(contracts[index]),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) {
                return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("계약 삭제"),
                      content: Text("정말로 삭제하시겠습니까?"),
                      actions: <Widget>[
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: AppColors.secondaryElement,
                            ),
                            onPressed: () {
                              Navigator.of(ctx).pop(true);
                            },
                            child: Text("삭 제")),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.of(ctx).pop(false);
                            },
                            child: Text(
                              "아니오",
                              style: TextStyle(
                                  color: AppColors.accentText),
                            )),
                      ],
                    ));
              },
              background: slideLeft(),
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: Radii.k9pxRadius),
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.secondaryElement),
                              borderRadius: Radii.k9pxRadius),
                          padding: const EdgeInsets.all(8),
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${contracts[index]["origin"]} → ${contracts[index]["destination"]}",
                                style: TextStyle(
                                  fontFamily: "Noto Sans CJK KR",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${contracts[index]["deadline"]} | ${contracts[index]["weight"]}",
                                style: TextStyle(
                                    color: AppColors.accentText),
                              ),
                              Expanded(
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          calcStringToWon(contracts[index]
                                          ["payment"]
                                              .toString()),
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontFamily:
                                            "Noto Sans CJK KR",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  )));
        },
        itemCount: contracts.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: contractAppBar(),
              body: TabBarView(
                children: <Widget>[
                  _contractList(),
                  _contractList(),
                  _contractList(),
                  _contractList(),
                ],
              ),
            )));
  }
}

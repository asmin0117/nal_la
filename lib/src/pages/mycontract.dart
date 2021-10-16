import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';
import 'package:nal_la/src/pages/contract_detail.dart';
import 'package:nal_la/values/values.dart';

class MyContract extends StatefulWidget {
  MyContract({var key}) : super(key: key);

  @override
  _MyContractState createState() => _MyContractState();
}

class _MyContractState extends State<MyContract> {
  AppBarWidget appBarWidget = Get.put(AppBarWidget());

  List<Map<String, String>> contracts = [];

  final won = new NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return "${won.format(int.parse(priceString))}원~";
  }

  @override
  void initState() {
    super.initState();
    contracts = [
      {
        "cid": "1",
        "sender": "수민수산",
        "product": "참치",
        "weight": "2.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "cid": "2",
        "sender": "석중수산",
        "product": "광어",
        "weight": "1.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.05 6am 이전",
        "payment": "150000"
      },
      {
        "cid": "3",
        "sender": "수민수산",
        "product": "참치",
        "weight": "2.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "cid": "4",
        "sender": "석중수산",
        "product": "광어",
        "weight": "1.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.05 6am 이전",
        "payment": "150000"
      },
      {
        "cid": "5",
        "sender": "수민수산",
        "product": "참치",
        "weight": "2.5톤",
        "origin": "서울",
        "destination": "부산",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "cid": "6",
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
        labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        tabs: <Widget>[
          Tab(
            child: Text(
              "진행중 계약",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Tab(
            child: Text(
              "요청받은 계약",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Tab(
            child: Text(
              "요청한 계약",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Tab(
            child: Text(
              "지난 계약",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
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

  int _selectedFilter = 0;
  List<String> _choices = ['최신순', '오래된순', '단가낮은순', '단가높은순', '장거리순', '단거리순', ''];

  bool isSelected = false;

  Widget choiceChips() {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: _choices.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(right: 3, left: 3),
                    child: Container(
                      child: ChoiceChip(
                        label: Text(
                          _choices[index],
                          style: TextStyle(fontSize: 13),
                        ),
                        selected: _selectedFilter == index,
                        onSelected: (bool isSelected) {
                          setState(() {
                            _selectedFilter = isSelected ? index : 0;
                          });
                        },
                        backgroundColor: Colors.transparent,
                        selectedColor: AppColors.secondaryElement,
                        shape: StadiumBorder(
                            side: BorderSide(color: AppColors.secondaryElement)),
                        labelStyle: TextStyle(color: AppColors.accentText),
                      ),
                      height: 60,
                    ));
              },
            ),
            // child: ListView.builder(
            //   itemCount: _choices.length,
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.symmetric(horizontal: 5),
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: (BuildContext context, int index) {
            //     return ChoiceChip(
            //       label: Text(_choices[index]),
            //       selected: _selectedFilter == index,
            //       onSelected: (bool selected) {
            //         setState(() {
            //           _selectedFilter = selected ? index : 0;
            //         });
            //       },
            //       backgroundColor: Colors.transparent,
            //       shape: StadiumBorder(side: BorderSide()),
            //       labelStyle: TextStyle(color: AppColors.secondaryText),
            //     );
            //   },
            // ),
          ),
        ),
        SizedBox(),
        Positioned(
            right: 0,
            top: 5,
            child: SizedBox(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "선 택",
                  style: TextStyle(
                    color: AppColors.secondaryElement,
                    fontSize: 18,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              height: 50,
            )),
      ],
    );
  }

  // Widget choiceChips() {
  //   return Wrap(
  //     alignment: WrapAlignment.start,
  //     spacing: 10,
  //     children: [
  //       Container(
  //         height: MediaQuery.of(context).size.height,
  //         child: ListView.builder(
  //           itemCount: _choices.length,
  //           shrinkWrap: true,
  //           padding: const EdgeInsets.symmetric(horizontal: 5),
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (BuildContext context, int index) {
  //             return ChoiceChip(
  //               label: Text(_choices[index]),
  //               selected: _selectedFilter == index,
  //
  //               onSelected: (bool selected) {
  //                 setState(() {
  //                   _selectedFilter = selected ? index : 0;
  //                 });
  //               },
  //               backgroundColor: Colors.transparent,
  //               labelStyle: TextStyle(color: AppColors.secondaryText),
  //             );
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _contractList() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (BuildContext _context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return DetailContractView(contracts: contracts[index]);
                }));
              },
              child: Dismissible(
                  key: ValueKey(contracts[index]),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      contracts.removeAt(index);
                    });
                  },
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
                  child: Hero(
                    tag: contracts[index]["cid"].toString(),
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
                                height:
                                    90 /*MediaQuery.of(context).size.height*0.135*/,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              fontFamily: "Noto Sans CJK KR",
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
                        )),
                  )),
            );
          },
          itemCount: contracts.length),
    );
  }

  Widget currentContract() {
    return Column(
      children: <Widget>[
        Expanded(
          child: choiceChips(),
          flex: 1,
        ),
        Expanded(
          child: _contractList(),
          flex: 7,
        ),
      ],
    );
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
                  currentContract(),
                  _contractList(),
                  _contractList(),
                  _contractList(),
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  //TODO add contract 연결
                  Get.toNamed("/add");
                },
                tooltip: "요청을 추가하려면 클릭하세요.",
                label: Text("운송 요청"),
                icon: Icon(Icons.pending_actions_rounded),
                backgroundColor: AppColors.secondaryElement,
              ),
            )));
  }
}

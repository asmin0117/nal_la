import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';
import 'package:nal_la/values/values.dart';

class ContractList extends StatefulWidget {
  ContractList({var key}) : super(key: key);

  @override
  _ContractListState createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget.appbar('운송 계약'),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (BuildContext _context, int index) {
            return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: Radii.k9pxRadius),
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.accentText),
                            borderRadius: Radii.k9pxRadius),
                        padding: const EdgeInsets.all(8),
                        height: 90,
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
                              style: TextStyle(color: AppColors.accentText),
                            ),
                            Expanded(
                                child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    calcStringToWon(
                                        contracts[index]["payment"].toString()),
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
                ));
          },
          itemCount: contracts.length),
    ));
  }
}

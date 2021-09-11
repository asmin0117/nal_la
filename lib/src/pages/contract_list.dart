import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';
import 'package:nal_la/values/colors.dart';

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
        "origin": "울산항로 38-1",
        "destination": "노량진 수산시장 202호 수민이네",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "sender": "석중수산",
        "product": "광어",
        "weight": "1.5톤",
        "origin": "울산항로 36-3",
        "destination": "노량진 수산시장 502호 색종이네",
        "deadline": "09.05 6am 이전",
        "payment": "150000"
      },
      {
        "sender": "수민수산",
        "product": "참치",
        "weight": "2.5톤",
        "origin": "울산항로 38-1",
        "destination": "노량진 수산시장 202호 수민이네",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "sender": "석중수산",
        "product": "광어",
        "weight": "1.5톤",
        "origin": "울산항로 36-3",
        "destination": "노량진 수산시장 502호 색종이네",
        "deadline": "09.05 6am 이전",
        "payment": "150000"
      },
      {
        "sender": "수민수산",
        "product": "참치",
        "weight": "2.5톤",
        "origin": "울산항로 38-1",
        "destination": "노량진 수산시장 202호 수민이네",
        "deadline": "09.07 6am 이전",
        "payment": "350000"
      },
      {
        "sender": "석중수산",
        "product": "광어",
        "weight": "1.5톤",
        "origin": "울산항로 36-3",
        "destination": "노량진 수산시장 502호 색종이네",
        "deadline": "09.05 6am 이전",
        "payment": "150000"
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget.appbar('요청목록'),
      body: ListView.separated(
          itemBuilder: (BuildContext _context, int index) {
            return Container(
                child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${contracts[index]["origin"]} → ${contracts[index]["destination"]}"),
                      Text(
                          "${contracts[index]["deadline"]} | ${contracts[index]["weight"]}")
                    ],
                  ),
                ),

              ],
            ));
          },
          separatorBuilder: (BuildContext _context, int index) {
            return Container(
              height: 1,
              color: AppColors.secondaryElement,
            );
          },
          itemCount: 6),
    ));
  }
}

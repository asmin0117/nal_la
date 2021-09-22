import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';
import 'package:nal_la/values/colors.dart';

class DetailContractView extends StatefulWidget {
  Map<String, String> contracts;

  DetailContractView({var key, required this.contracts}) : super(key: key);

  @override
  _DetailContractState createState() => _DetailContractState();
}

class _DetailContractState extends State<DetailContractView> {
  AppBarWidget appBarWidget = Get.put(AppBarWidget());

  Widget _bodyWidget() {
    return Container(
      child: Hero(
        tag: widget.contracts["cid"].toString(),
        child: Container(
          child: Center(
            child: Text(
              widget.contracts["cid"].toString(),
              style: TextStyle(
                fontSize: 30,
                color: AppColors.secondaryElement,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _selectedFilter = 0;
  List<String> _choices = ['최신순', '오래된순', '단가낮은순','단가높은순','장거리순','단거리순'];
  Widget choiceChips() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      children: [
        ListView.builder(
          itemCount: _choices.length,
          itemBuilder: (BuildContext context, int index) {
            return ChoiceChip(
              label: Text(_choices[index]),
              selected: _selectedFilter == index,

              onSelected: (bool selected) {
                setState(() {
                  _selectedFilter = selected ? index : 0;
                });
              },
              backgroundColor: Colors.transparent,
              labelStyle: TextStyle(color: AppColors.secondaryText),
            );
          },
        ),
      ],
    );
  }

  // Widget _bottomNav() {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget.appbar("요청 상세"),
      body: _bodyWidget(),
      //bottomNavigationBar: _bottomNav(),
    );
  }
}

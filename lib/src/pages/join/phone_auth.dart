// import 'package:flutter/material.dart';
// import 'package:nal_la/values/values.dart';
//
// class PhoneAuthWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         constraints: BoxConstraints.expand(),
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 255, 255, 255),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget> [
//             Expanded(child: ListView(
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 60, top: 59),
//                   child: Text(
//                     "본인인증",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: AppColors.primaryText,
//                       fontFamily: "Noto Sans CJK KR",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 1,
//                 margin: EdgeInsets.only(top: 13),
//                 decoration: BoxDecoration(
//                   color: AppColors.accentElement,
//                   border: Border.fromBorderSide(Borders.secondaryBorder),
//                 ),
//                 child: Container(),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 18, top: 27),
//                   child: Text(
//                     "본인인증을 위해\n필요해요.",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: AppColors.primaryText,
//                       fontFamily: "Noto Sans CJK KR",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 26,
//                       height: 1.73077,
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 18, top: 20),
//                   child: Text(
//                     "휴대폰 번호",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: AppColors.primaryText,
//                       fontFamily: "Noto Sans CJK KR",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 44,
//                 margin: EdgeInsets.only(left: 18, top: 2, right: 18),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryElement,
//                   border: Border.fromBorderSide(Borders.primaryBorder),
//                   borderRadius: BorderRadius.all(Radius.circular(0.9)),
//                 ),
//                 child: Container(),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 18, top: 6),
//                   child: Text(
//                     "통신사",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: AppColors.primaryText,
//                       fontFamily: "Noto Sans CJK KR",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 44,
//                 margin: EdgeInsets.only(left: 18, top: 2, right: 18),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryElement,
//                   border: Border.fromBorderSide(Borders.primaryBorder),
//                   borderRadius: BorderRadius.all(Radius.circular(0.9)),
//                 ),
//                 child: Container(),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 18, top: 16),
//                   child: Text(
//                     "주민등록번호",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: AppColors.primaryText,
//                       fontFamily: "Noto Sans CJK KR",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 47,
//                 margin: EdgeInsets.only(left: 18, top: 1, right: 148),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         width: 173,
//                         height: 44,
//                         margin: EdgeInsets.only(top: 1),
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryElement,
//                           border: Border.fromBorderSide(Borders.primaryBorder),
//                           borderRadius: BorderRadius.all(Radius.circular(0.9)),
//                         ),
//                         child: Container(),
//                       ),
//                     ),
//                     Spacer(),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         margin: EdgeInsets.only(right: 3),
//                         child: Text(
//                           "-",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: AppColors.primaryText,
//                             fontFamily: "Noto Sans CJK KR",
//                             fontWeight: FontWeight.w700,
//                             fontSize: 32,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         width: 36,
//                         height: 44,
//                         margin: EdgeInsets.only(top: 1),
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryElement,
//                           border: Border.fromBorderSide(Borders.primaryBorder),
//                           borderRadius: BorderRadius.all(Radius.circular(0.9)),
//                         ),
//                         child: Container(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 18, top: 24),
//                   child: Text(
//                     "이름",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: AppColors.primaryText,
//                       fontFamily: "Noto Sans CJK KR",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 44,
//                 margin: EdgeInsets.only(left: 18, top: 2, right: 18),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryElement,
//                   border: Border.fromBorderSide(Borders.primaryBorder),
//                   borderRadius: BorderRadius.all(Radius.circular(0.9)),
//                 ),
//                 child: Container(),
//               ),
//               Spacer(),
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                   width: 347,
//                   height: 60,
//                   margin: EdgeInsets.only(bottom: 56),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Positioned(
//                         bottom: 0,
//                         child: Container(
//                           width: 347,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: AppColors.secondaryElement,
//                             border: Border.fromBorderSide(Borders.primaryBorder),
//                             borderRadius: BorderRadius.all(Radius.circular(0.9)),
//                           ),
//                           child: Container(),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 12,
//                         child: Text(
//                           "인증번호 보내기",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: AppColors.secondaryText,
//                             fontFamily: "Noto Sans CJK KR",
//                             fontWeight: FontWeight.w400,
//                             fontSize: 20,
//                             letterSpacing: 0.6,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       margin: EdgeInsets.only(left: 60, top: 59),
//                       child: Text(
//                         "인증번호 입력",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: AppColors.primaryText,
//                           fontFamily: "Noto Sans CJK KR",
//                           fontWeight: FontWeight.w400,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 1,
//                     margin: EdgeInsets.only(top: 13),
//                     decoration: BoxDecoration(
//                       color: AppColors.accentElement,
//                       border: Border.fromBorderSide(Borders.secondaryBorder),
//                     ),
//                     child: Container(),
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       margin: EdgeInsets.only(left: 18, top: 79),
//                       child: Text(
//                         "인증번호를 입력해주세요.",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: AppColors.primaryText,
//                           fontFamily: "Noto Sans CJK KR",
//                           fontWeight: FontWeight.w400,
//                           fontSize: 26,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 44,
//                     margin: EdgeInsets.only(left: 18, top: 44, right: 18),
//                     decoration: BoxDecoration(
//                       color: AppColors.primaryElement,
//                       border: Border.fromBorderSide(Borders.primaryBorder),
//                       borderRadius: BorderRadius.all(Radius.circular(0.9)),
//                     ),
//                     child: Container(),
//                   ),
//                   Container(
//                     height: 18,
//                     margin: EdgeInsets.only(left: 79, top: 14, right: 89),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "인증번호를 받지 못하셨나요?",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 112, 112, 112),
//                               fontFamily: "Noto Sans CJK KR",
//                               fontWeight: FontWeight.w700,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                         Spacer(),
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "다시 전송하기",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 255, 153, 0),
//                               fontFamily: "Noto Sans CJK KR",
//                               fontWeight: FontWeight.w700,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       width: 347,
//                       height: 60,
//                       margin: EdgeInsets.only(bottom: 56),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Positioned(
//                             bottom: 0,
//                             child: Container(
//                               width: 347,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 color: AppColors.secondaryElement,
//                                 border:
//                                 Border.fromBorderSide(Borders.primaryBorder),
//                                 borderRadius: BorderRadius.all(Radius.circular(0.9)),
//                               ),
//                               child: Container(),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 12,
//                             child: Text(
//                               "확인",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: AppColors.secondaryText,
//                                 fontFamily: "Noto Sans CJK KR",
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 20,
//                                 letterSpacing: 0.6,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }

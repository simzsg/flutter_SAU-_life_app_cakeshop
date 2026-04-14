import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
 
class CakeShopListUi extends StatefulWidget {
  const CakeShopListUi({super.key});
 
  @override
  State<CakeShopListUi> createState() => _CakeShopListUiState();
}
 
class _CakeShopListUiState extends State<CakeShopListUi> {
  //ตัวแปรเก็บรูป 7 รูปของ 7 ร้านที่จะใช้กับ Slider
  List<String> imgShopLogo = [
    'assets/images/ck01.png',
    'assets/images/ck02.png',
    'assets/images/ck03.png',
    'assets/images/ck04.png',
    'assets/images/ck05.png',
    'assets/images/ck06.png',
    'assets/images/ck07.png',
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ AppBar
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'สายด่วนกินเค้ก',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      //ส่วนของ Body
      body: Center(
        child: Column(
          children: [
            //ส่วนของ Slider
            CarouselSlider.builder(
              itemCount: imgShopLogo.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imgShopLogo[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.28,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
              ),
            ),
            //ส่วนของ ListView
          ],
        ),
      ),
    );
  }
}
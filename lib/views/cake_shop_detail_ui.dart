// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_app/models/cake_shop.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
 
class CakeShopDetailUi extends StatefulWidget {
  //สร้างตัวแปรเพื่อรับข้อมูลที่ส่งมาจากอีกหน้าหนึ่ง
  CakeShop? cakeShop;
 
  //เอาตัวแปรที่สร้างมารับข้อมูลที่ส่งมาจากอีกหน้าหนึ่ง
  CakeShopDetailUi({super.key, this.cakeShop});
 
  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}
 
class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  //เมธอดโทรศัพท์เมื่อกดแล้วจะโทรออกได้เลย
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //เมธอดเปิดเว็บไซต์เมื่อกดแล้วจะไปเปิดเว็บไซต์ได้เลย และ เปิดแอปภายนอก ผ่าน URL ได้
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ AppBar
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.cakeShop!.name!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      //ส่วนของ body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 50,
            left: 35,
            right: 35,
          ),
          child: Center(
            child: Column(
              children: [
                //ส่วนของรูปภาพรูปที่ 1
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.cakeShop!.image1!,
                    width: 120,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของรูปภาพรูปที่ 2 และรูปที่ 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.cakeShop!.image2!,
                        width: 120,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.cakeShop!.image3!,
                        width: 120,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //ส่วนของชื่อร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ชื่อร้าน 🏪',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.name!,
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของเวลาเปิดปิดร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลาเปิด-ปิด ⏰',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.openCloseTime!,
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของรายละเอียดร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'รายละเอียดของร้าน 📝',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.description!,
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนที่่อยู่ของร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ที่อยู่ของร้าน 📍',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.address!,
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของเบอร์ติดต่อ โดยกดแล้วโทรออกได้เลย
                ElevatedButton(
                  onPressed: () {
                    _makePhoneCall(widget.cakeShop!.phone!);
                  },
                  child: Text(
                    'โทร: ${widget.cakeShop!.phone!}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของเว็บไซต์ โดยกดแล้วเปิดเว็บไซต์ได้เลย
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.yellow,
                  ),
                  title: Text(
                    widget.cakeShop!.website!,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(
                        widget.cakeShop!.website!,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                //ส่วนของการเปิด Facebook
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'เปิด Facebook',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(
                        widget.cakeShop!.facebook!,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                //ส่วนของการเปิด Map เมื่อกดแล้วเปิดแผนที่ได้เลย
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  child: FlutterMap(
                    //กำหนดตำแหน่งบนแผนที่
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(widget.cakeShop!.latitude!),
                        double.parse(widget.cakeShop!.longitude!),
                      ),
                      initialZoom: 16,
                    ),
                    //วาดตัวแผนที่ (ไม่ต้องแก้ไขอะไร)
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.google.com/vt/lyrs=m,h&x={x}&y={y}&z={z}&hl=ar-MA&gl=MA',
                        subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () {
                              launchUrl(
                                Uri.parse(
                                    'https://openstreetmap.org/copyright'),
                              );
                            },
                          ),
                        ],
                      ),
                      //ใส่ Marker ของร้าน
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShop!.latitude!),
                              double.parse(widget.cakeShop!.longitude!),
                            ),
                            child: InkWell(
                              onTap: () {
                                //เปิดแผนที่
                                _launchInBrowser(
                                  Uri.parse(
                                    'https://www.google.com/maps/search/?api=1&query=${widget.cakeShop!.latitude},${widget.cakeShop!.longitude}',
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
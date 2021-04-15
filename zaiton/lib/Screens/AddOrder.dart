import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:zaiton/AppUtils/CarasolText.dart';
import 'package:zaiton/AppUtils/ZThemes.dart';
import 'package:zaiton/Screens/AddOutlet.dart';

class AddOrder extends StatefulWidget {
  AddOrder({Key key}) : super(key: key);

  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  List list = [1, 2, 3, 4, 5, 6];
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: height / 3.6,
                    width: width,
                    child: images.isNotEmpty
                        ? CarasolSliders(
                            list: images,
                          )
                        : Image.asset(
                            'assets/img3.jpg',
                            fit: BoxFit.cover,
                          )),
                Container(
                  height: height / 3.6,
                  width: width,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: () {
                          loadAssets();
                        }),
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        ZThemes.appTheme,
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0)
                      ])),
                ),
                Container(
                  height: height / 3.6,
                  width: width,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: height / 30, left: width / 10),
                      child: Text(
                        'Add Order',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 20, right: width / 20),
              child: Text(
                'Osman general store',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: ZThemes.darkTheme),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            InkWell(
              onTap: () {
                showBottomSheet();
              },
              child: Padding(
                padding: EdgeInsets.only(left: width / 20, right: width / 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date 12/24/2021',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ZThemes.appTheme),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.add_box_rounded,
                          size: 20,
                          color: ZThemes.darkTheme,
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Text(
                          'Item',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ZThemes.appTheme),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            Padding(
                padding: EdgeInsets.only(left: width / 20, right: width / 20),
                child: Container(
                  height: 2,
                  color: Colors.blueGrey[100],
                )),
            SizedBox(
              height: height / 30,
            ),
            Padding(
                padding: EdgeInsets.only(left: width / 20, right: width / 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 3,
                      child: Text(
                        'Item',
                        style: TextStyle(
                            color: ZThemes.darkTheme,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Qty',
                      style: TextStyle(
                          color: ZThemes.darkTheme,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rate',
                      style: TextStyle(
                          color: ZThemes.darkTheme,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Disc',
                      style: TextStyle(
                          color: ZThemes.darkTheme,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                          color: ZThemes.darkTheme,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            SizedBox(
              height: height / 50,
            ),
            Column(
              children: list.map((e) {
                return Padding(
                  padding: EdgeInsets.only(left: width / 20, right: width / 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width / 3.5,
                            child: Text(
                              'item ',
                              style: TextStyle(
                                  color: ZThemes.appTheme, fontSize: 11),
                            ),
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                                color: ZThemes.appTheme, fontSize: 11),
                          ),
                          Text(
                            '50',
                            style: TextStyle(
                                color: ZThemes.appTheme, fontSize: 11),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                                color: ZThemes.appTheme, fontSize: 11),
                          ),
                          Text(
                            '80',
                            style: TextStyle(
                                color: ZThemes.appTheme, fontSize: 11),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Container(
                        height: 0.5,
                        color: Colors.blueGrey[100],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: height / 50,
            ),
            Padding(
                padding: EdgeInsets.only(left: width / 20, right: width / 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 3,
                      child: Text(
                        'Total',
                        style: TextStyle(
                            color: ZThemes.darkTheme,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                          color: ZThemes.darkTheme,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '8',
                      style: TextStyle(
                          color: ZThemes.darkTheme,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '40',
                      style: TextStyle(
                          color: ZThemes.darkTheme,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '560',
                      style: TextStyle(
                          color: ZThemes.darkTheme,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 20, right: width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height / 20,
                    width: width / 4,
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: ZThemes.appTheme,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width / 20),
                    height: height / 20,
                    width: width / 4,
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: ZThemes.appTheme,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showBottomSheet() {
    int value = 0;
    var height = Get.height;
    var width = Get.width;
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(15.0)),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: height / 50,
                ),
                Center(
                  child: Container(
                    height: height / 140,
                    width: width / 5,
                    decoration: BoxDecoration(
                        color: ZThemes.appTheme,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(
                  height: Get.height / 80,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 20),
                  child: Text(
                    'Select Item',
                    style: TextStyle(
                        color: ZThemes.appTheme,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height / 80,
                ),
                TextFromFieldssForAdd(
                    color: Colors.white,
                    hint: 'Item search'.tr,
                    obsucreTextUp: false),
                SizedBox(
                  height: Get.height / 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 20),
                  child: Text(
                    'Item name one',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 20, right: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                value++;
                              });
                            },
                            child: Icon(
                              Icons.add_box_rounded,
                              color: ZThemes.appTheme,
                            ),
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          Text(
                            '$value',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                value--;
                              });
                            },
                            child: Icon(
                              Icons.indeterminate_check_box_rounded,
                              color: ZThemes.appTheme,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rate',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        height: height / 30,
                        width: width / 3.5,
                        child: TextFromFieldssForAdd(
                            color: Colors.white,
                            hint: '50'.tr,
                            obsucreTextUp: false),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        height: height / 30,
                        width: width / 3.5,
                        child: TextFromFieldssForAdd(
                            color: Colors.white,
                            hint: '10'.tr,
                            obsucreTextUp: false),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 20, right: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '500',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 30,
                ),
              ],
            );
          });
        });
  }
}

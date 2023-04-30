import 'package:flutter/material.dart';
import 'equipment.dart';

class EquipmentDetails extends StatelessWidget {
  final Equipment equipment;

  EquipmentDetails({required this.equipment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดอุปกรณ์'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  equipment.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Image.asset(
                  equipment.images[0],
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.0),
                Text(
                  'รายละเอียด:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  equipment.description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'ราคาเช่า: ฿${equipment.rentalRate}/วัน',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Text('เช่าเลย'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('ยืนยันการเช่า'),
                          content: Text(
                              'คุณต้องการเช่า ${equipment.name} ใช่หรือไม่?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('ยกเลิก'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('ยืนยัน'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'คุณเช่า ${equipment.name} เรียบร้อยแล้ว'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
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
          ),
        ],
      ),
    );
  }
}

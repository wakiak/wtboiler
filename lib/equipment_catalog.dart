import 'package:flutter/material.dart';
import 'equipment.dart';
import 'equipment_details.dart';

// class EquipmentCatalog extends StatefulWidget {
//   final List<Equipment> equipmentList;
//
//   const EquipmentCatalog({required this.equipmentList});
//
//   @override
//   _EquipmentCatalogState createState() => _EquipmentCatalogState();
// }
//
// class _EquipmentCatalogState extends State<EquipmentCatalog> {
//   late List<Equipment> _searchResult = [];
//
//   void _searchEquipment(String query) {
//     List<Equipment> equipmentSearchResult = [];
//
//     widget.equipmentList.forEach((equipment) {
//       if (equipment.name.toLowerCase().contains(query.toLowerCase())) {
//         equipmentSearchResult.add(equipment);
//       }
//     });
//
//     setState(() {
//       _searchResult = equipmentSearchResult;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           onChanged: (value) => _searchEquipment(value),
//           decoration: InputDecoration(
//             hintText: 'Search for equipment',
//             prefixIcon: Icon(Icons.search),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: _searchResult.isNotEmpty
//                 ? _searchResult.length
//                 : widget.equipmentList.length,
//             itemBuilder: (context, index) {
//               final equipment = _searchResult.isNotEmpty
//                   ? _searchResult[index]
//                   : widget.equipmentList[index];
//
//               return ListTile(
//                 leading: Image.asset(equipment.images[0]),
//                 title: Text(equipment.name),
//                 subtitle: Text('${equipment.rentalRate} per day'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           EquipmentDetails(equipment: equipment),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class EquipmentCatalog extends StatelessWidget {
//   final List<Equipment> equipmentList;
//
//   EquipmentCatalog({required this.equipmentList});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       padding: EdgeInsets.all(16),
//       children: List.generate(equipmentList.length, (index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     EquipmentDetails(equipment: equipmentList[index]),
//               ),
//             );
//           },
//           child: Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(equipmentList[index].images[0]),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   equipmentList[index].name,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   '฿${equipmentList[index].rentalRate}/day',
//                   style: TextStyle(
//                       color: Colors.green, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

class EquipmentCatalog extends StatefulWidget {
  final List<Equipment> equipmentList;

  const EquipmentCatalog({required this.equipmentList});

  @override
  _EquipmentCatalogState createState() => _EquipmentCatalogState();
}

class _EquipmentCatalogState extends State<EquipmentCatalog> {
  late List<Equipment> _searchResult = [];

  void _searchEquipment(String query) {
    List<Equipment> equipmentSearchResult = [];

    widget.equipmentList.forEach((equipment) {
      if (equipment.name.toLowerCase().contains(query.toLowerCase())) {
        equipmentSearchResult.add(equipment);
      }
    });

    setState(() {
      _searchResult = equipmentSearchResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => _searchEquipment(value),
            decoration: InputDecoration(
              hintText: 'Search for equipment',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: _searchResult.isNotEmpty
              ? GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16),
                  children: List.generate(_searchResult.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentDetails(
                                equipment: _searchResult[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        _searchResult[index].images[0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              _searchResult[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '฿${_searchResult[index].rentalRate}/day',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16),
                  children: List.generate(widget.equipmentList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentDetails(
                                equipment: widget.equipmentList[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        widget.equipmentList[index].images[0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.equipmentList[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '฿${widget.equipmentList[index].rentalRate}/day',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
        ),
      ],
    );
  }
}

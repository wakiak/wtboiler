import 'package:flutter/material.dart';
import 'equipment.dart';
import 'equipment_catalog.dart';
import 'equipment_form.dart';
import 'equipment_details.dart';
import 'login_page.dart'; // import the login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Equipment> equipmentList = [
    Equipment(
      name: 'Tractor',
      description: 'A powerful machine for plowing fields',
      rentalRate: 150,
      images: ['images/tractor.jpg'],
    ),
    Equipment(
      name: 'Harvester',
      description: 'A machine for harvesting crops',
      rentalRate: 200,
      images: ['images/harvester.jpg'],
    ),
    Equipment(
      name: 'Seeder',
      description: 'A machine for planting seeds',
      rentalRate: 75,
      images: ['images/seeder.jpg'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equipment Rental App',
      // Use a named route for the login page
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/catalog': (context) => Scaffold(
              appBar: AppBar(
                title: Text('อุปกรณ์ที่สามารถเช่าได้'),
              ),
              body: EquipmentCatalog(equipmentList: equipmentList),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EquipmentForm(onFormSubmit: (name,
                          rentalRate, imageUrl, description, newContext) {
                        equipmentList.add(Equipment(
                          name: name,
                          rentalRate: rentalRate,
                          images: [imageUrl],
                          description: description,
                        ));
                        Navigator.pop(newContext);
                      }),
                    ),
                  );
                },
              ),
            ),
      },
    );
  }
}

// TODO 1) User authentication and registration: Users can create an account, login/logout, and manage their profile.
// TODO 2) Equipment catalog: A list of equipment available for rent, including a description, rental rates, and images.
// TODO 3) Equipment search and filter: Users can search for specific equipment based on name, type, or location, and filter the search results based on availability, rental rates, etc.
// TODO 4) Equipment booking and reservation: Users can book equipment for a specific date and time, view their rental history, and manage their rental reservations.
// TODO 5) Payment gateway integration: Users can pay for their rentals online using a secure payment gateway.
// TODO 6) Notification and alerts: Users can receive push notifications and alerts for their rental reservations, payment confirmations, etc.
// TODO 7) Customer support: Users can access customer support via chat, email, or phone.
// TODO 8) Equipment rating and reviews: Users can rate and review equipment based on their rental experience.
// TODO 9) Admin dashboard: Admin can manage user accounts, equipment listings, rental reservations, payment transactions, etc.
// TODO 10) Reports and analytics: Admin can generate reports and analytics on user activity, equipment rental rates, revenue, etc.
// TODO 11) Equipment owner registration: Equipment owners can create an account, login/logout, and manage their profile.
// TODO 12) Equipment listing: Equipment owners can create a listing for their equipment, including a description, rental rates, and images.
// TODO 13) Equipment availability management: Equipment owners can manage the availability of their equipment by setting dates when the equipment is available for rent.
// TODO 14) Rental request management: Equipment owners can manage rental requests for their equipment and accept or reject requests.
// TODO 15) Payment processing: The app should facilitate secure online payments between renters and equipment owners.
// TODO 16) Commission management: The app should manage commission payments to the platform for each successful transaction.

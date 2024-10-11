import 'package:flutter/material.dart';

class RoomType extends StatefulWidget {
  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  bool _showPoints = false;
  int _currentPoints = 1000; // Example value, replace with actual point system

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/image3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text('Lihat Point'),
                      onPressed: () {
                        setState(() {
                          _showPoints = !_showPoints;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height - 200, // Atur height untuk membuat rectangle utama penuh sampai bawah
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kamar AC Double Bed',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 60,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildFacilityItem(Icons.ac_unit, '1 AC'),
                            _buildFacilityItem(Icons.bathtub, '1 Kamar Mandi'),
                            _buildFacilityItem(Icons.tv, '1 TV'),
                            _buildFacilityItem(Icons.wifi, 'Wi-Fi'),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Kamar tidur sederhana untuk 2 orang atau lebih',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                      SizedBox(height: 180),
                      SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildRoomImage('assets/image1.jpg'),
                            _buildRoomImage('assets/image2.jpg'),
                            _buildRoomImage('assets/image3.jpg'),
                            _buildRoomImage('assets/image4.jpg'),
                          ],
                        ),
                      ),
                      SizedBox(height: 60),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('Rp. 200.000/Hari (2000 Point)'),
                          onPressed: () {
                            // Handle booking
                            print('Booking button pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_showPoints)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(255, 233, 233, 233).withOpacity(0.9),
                height: 50,
                child: Center(
                  child: Text(
                    'Point Nginap: $_currentPoints',
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFacilityItem(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildRoomImage(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 225,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
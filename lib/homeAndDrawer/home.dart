import 'package:flutter/material.dart';
import 'drawer_app.dart';
import 'shoesDetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    HeartContent(),
    BagContent(),
    NotificationContent(),
    ProfileContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Explore",
          style: TextStyle(
            color: Color(0xFF2B2B2B),
            fontSize: 32,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: InkWell(
              onTap: () {
                // Replace this with your desired action when the icon is clicked
                print("Slider Icon Clicked!");
              },
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
              80.0), // Adjust the height to fit the search field, sliders, and buttons
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SearchTextField(),
                      ),
                      SizedBox(width: 10),
                      Sliders(),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Builder(
        // Wrap the body with a Builder widget
        builder: (context) => _pages[_currentIndex],
      ),
      bottomNavigationBar: buildCustomBottomNavigationBar(),
      extendBody: true, // Add this line to fix the overflow issue
    );
  }

  Widget buildCustomBottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 56,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomNavItem(Icons.home, 'Home', 0),
            buildBottomNavItem(Icons.favorite, 'Heart', 1),
            buildBottomNavItem(Icons.shopping_bag, 'Bag', 2),
            buildBottomNavItem(Icons.notifications, 'Notification', 3),
            buildBottomNavItem(Icons.person, 'Profile', 4),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem(IconData icon, String label, int index) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Wrap the icon with a container to add a rectangle around it
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: index == 2 ? Color(0xFF0D6EFD) : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(8), // Adjust padding as needed
                  child: Icon(
                    icon,
                    size: 24,
                    color: Colors.grey,
                  ),
                ),

                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Select Category',
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff2b2b2b),
                height: 19 / 16,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  print("All Shoes Button Pressed");
                },
                child: Text(
                  'All Shoes',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(108, 40),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  print("Outdoor Button Pressed");
                },
                child: Text(
                  'Outdoor',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[600],
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(108, 40),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  print("Tennis Button Pressed");
                },
                child: Text(
                  'Tennis',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(108, 40),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Popular Shoes',
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff2b2b2b),
                height: 24 / 16,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoeDetail(
                          description: '',
                          imagePath: '',
                          price: '',
                          title: '',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ShoeCard(
                      title: "Best Seller",
                      description: "Nike Jordan",
                      price: "\Rp.302.000",
                      imagePath: "assets/shoes/shoes1.png",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoeDetail(
                          description: '',
                          imagePath: '',
                          price: '',
                          title: '',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ShoeCard(
                      title: "Best Seller",
                      description: "Nike Air Max",
                      price: "\Rp.752.000",
                      imagePath: "assets/shoes/shoes2.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "New Arrival",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff2b2b2b),
                height: 19 / 16,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 100, // Set the height of the elongated frame
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Summer Sale',
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff3b3b3b),
                            height: 14 / 12,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "15% OFF", // More details about the discount
                          style: TextStyle(
                            fontFamily: "Futura",
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff674dc5),
                            height: 37 / 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/shoes/shoes3.png", // Image for the offer
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'looking for shoes',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class Sliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: ShapeDecoration(
        color: Color(0xFF0D6EFD),
        shape: CircleBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Slider(
          value: 0.5, // Set the initial value of the slider
          onChanged: (double value) {
            // Handle the value change of the slider
            print("Slider value: $value");
          },
        ),
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imagePath;

  const ShoeCard({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(imagePath),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                // Handle button tap
                print("Add to Cart Button Pressed");
              },
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                primary: Colors.blue,
                padding: EdgeInsets.zero, // No padding inside the button
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Heart Content'),
    );
  }
}

class BagContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bag Content'),
    );
  }
}

class NotificationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notification Content'),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Content'),
    );
  }
}

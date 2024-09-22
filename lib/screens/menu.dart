import 'package:flutter/material.dart';
import 'package:madmunchies/models/food.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Sliding Cards',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const HeaderWithSearchBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(child: HorizontalCardList()),
              SizedBox(child: PopularItems()),
              SizedBox(child: ComboDealPage()),
            ],
          ),
        ),
        bottomNavigationBar: const CustomFooter(),
      ),
    );
  }
}

class HeaderWithSearchBar extends StatelessWidget {
  const HeaderWithSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        children: [
          // Logo on the left side
          Image.asset(
            'assets/images.jpg', // Replace with your logo URL or asset path
            width: 70,
            height: 70,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for meals',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalCardList extends StatelessWidget {
  final List<Food> cardData = [
    Food(name: 'Fingers', price: '\$12.99', imgpath: 'assets/fingers1.png'),
    Food(name: 'Nachos', price: '\$9.99', imgpath: 'assets/nacho.png'),
    Food(name: 'Sliders', price: '\$11.49', imgpath: 'assets/sliders.png'),
    Food(name: 'Wings', price: '\$8.99', imgpath: 'assets/wings.png'),
    Food(
        name: 'Pizza',
        price: '\$15.99',
        imgpath: 'https://via.placeholder.com/150'),
    Food(
        name: 'Fry Chicken',
        price: '\$13.49',
        imgpath: 'https://via.placeholder.com/150'),
    Food(
        name: 'Cheesy Fries',
        price: '\$7.49',
        imgpath: 'https://via.placeholder.com/150'),
  ];

  HorizontalCardList({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;

    // Set the card width to be a fraction of the screen width, with a maximum width
    final cardWidth = screenWidth * 0.4; // 40% of screen width
    const maxCardWidth = 150.0; // Maximum card width

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for the card list
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Top Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10), // Spacing between title and card list
          SizedBox(
            height: 150, // Adjusted height to accommodate image and name
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return Container(
                  width: cardWidth > maxCardWidth
                      ? maxCardWidth
                      : cardWidth, // Responsive with max width
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8), // Add margin between cards
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            cardData[index].imgpath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cardData[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PopularItems extends StatelessWidget {
  final List<Food> cardData = [
    Food(name: 'Fingers', price: '\$12.99', imgpath: 'assets/fingers1.png'),
    Food(name: 'Nachos', price: '\$9.99', imgpath: 'assets/nacho.png'),
    Food(name: 'Sliders', price: '\$11.49', imgpath: 'assets/sliders.png'),
    Food(name: 'Wings', price: '\$8.99', imgpath: 'assets/wings.png'),
    Food(
        name: 'Pizza',
        price: '\$15.99',
        imgpath: 'https://via.placeholder.com/150'),
    Food(
        name: 'Fry Chicken',
        price: '\$13.49',
        imgpath: 'https://via.placeholder.com/150'),
    Food(
        name: 'Cheesyjew09j0fej0jf0je0j0iefj0ifjew0j Fries',
        price: '\$7.49',
        imgpath: 'https://via.placeholder.com/150'),
  ];

  PopularItems({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth =
        screenWidth * 0.8; // Set card width to 80% of screen width
    const maxCardWidth = 250.0; // Max width of each card

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Popular Items',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10), // Spacing between title and card list
          SizedBox(
            height: 200, // Adjusted height to accommodate image and name
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return Container(
                  width: cardWidth > maxCardWidth
                      ? maxCardWidth
                      : cardWidth, // Responsive with max width
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8), // Add margin between cards
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.network(
                            cardData[index].imgpath,
                            fit: BoxFit.cover,
                            width: 150, // Fixed width for the image
                            height: double.infinity, // Stretch height to full
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Space between image and text
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cardData[index].name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        5), // Spacing between name and price
                                Text(
                                  cardData[index].price,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 0,
                                        0), // Lighter color for price
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ComboDealPage extends StatelessWidget {
  final List<Food> comboDeals = [
    Food(
        name: 'Combo Deal 1', price: '\$19.99', imgpath: 'assets/fingers1.png'),
    Food(name: 'Combo Deal 2', price: '\$24.99', imgpath: 'assets/nacho.png'),
    Food(name: 'Combo Deal 3', price: '\$29.99', imgpath: 'assets/combo3.png'),
    // Add more combo deals as needed
  ];

  ComboDealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = 400;
    const maxCardWidth = 300.0; // Max width of each card

    // Dynamically set image size based on screen width
    double imageWidth =
        screenWidth * 0.5; // Image width is 30% of the screen width
    double imageHeight = imageWidth * 0.75; // Maintain aspect ratio

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Combo Deals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10), // Spacing between title and card list
          SizedBox(
            height: imageHeight +
                40, // Dynamic height based on image size and padding
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: comboDeals.length,
              itemBuilder: (context, index) {
                return Container(
                  width: maxCardWidth < screenWidth * 0.8
                      ? screenWidth * 0.8
                      : maxCardWidth, // Max width of the card
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8), // Add margin between cards
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.asset(
                            comboDeals[index].imgpath,
                            fit: BoxFit.cover,
                            width: imageWidth, // Dynamic width for the image
                            height: imageHeight, // Dynamic height for the image
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Space between image and text
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  comboDeals[index].name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true, // Allow text to wrap
                                ),
                                const SizedBox(
                                    height:
                                        5), // Spacing between name and price
                                Text(
                                  comboDeals[index].price,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black, // Text color for price
                                  ),
                                  softWrap: true, // Allow price to wrap
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.red, // Set footer color to red
      shape: const CircularNotchedRectangle(), // Optional, to give notch effect
      child: SizedBox(
        height: 60, // Set height for the footer
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Space icons apart
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                // Define menu button functionality
              },
            ),
            IconButton(
              icon: const Icon(Icons.fastfood),
              color: Colors.white,
              onPressed: () {
                // Define food icon functionality
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                // Define shopping cart functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}

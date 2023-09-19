import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:techprohelpline/UI/shport/color.dart';

class OurserviceScnre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSlideCard(),
              MostPopularProducts(),
              AllProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

///ye vala slid view ka code hai============================================================
class TopSlideCard extends StatelessWidget {
  final List<String> slideImageUrls = [
    // 'https://cdn.pixabay.com/photo/2023/05/01/14/26/bee-7963186_1280.jpg',
    // 'https://cdn.pixabay.com/photo/2023/08/02/12/39/bird-8165143_1280.jpg',
    // 'https://cdn.pixabay.com/photo/2023/07/28/18/23/bird-8155768_640.jpg',
    // 'https://cdn.pixabay.com/photo/2023/07/22/15/07/silver-spotted-skipper-8143617_640.jpg',
    // 'https://cdn.pixabay.com/photo/2023/08/04/08/00/coneflower-8168628_640.jpg',
    'asset/image/balckimg.jpg',
    'asset/image/balckimg.jpg',
    'asset/image/balckimg.jpg',
    'asset/image/balckimg.jpg',
    'asset/image/balckimg.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        height: MediaQuery.of(context).size.width / 2,
        child: GestureDetector(
          onTap: () {
            // Handle double-tap action
            print('Slide view click on product card');
            // Navigator.pushNamed(context,
            //     "/ProductDetailScreen"); // Pass the product as an argument);
          },
          child: CarouselSlider.builder(
            itemCount: slideImageUrls.length,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(slideImageUrls[
                        index]), // NetworkImage(slideImageUrls[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Coming soon....... ${index + 1}',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// ye vala section most popular product vala hai =========================================================
class MostPopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          // Handle double-tap action
          print('Double-tapped on product card');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Popular Products',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor),
            ),
            SizedBox(height: 10),
            _buildProductList(
              MediaQuery.of(context).size.width,
              isMostPopular: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(double screenWidth, {required bool isMostPopular}) {
    int itemCount = (screenWidth / 150).floor();

    return Wrap(
      spacing: 16.0,
      children: List.generate(itemCount, (index) {
        return _buildProductItem(
          'Product ${index + 1}',
          //'https://cdn.pixabay.com/photo/2023/08/02/14/56/animal-8165466_640.jpg',
          'asset/image/balckimg.jpg',

          isMostPopular: isMostPopular,
        );
      }),
    );
  }

  Widget _buildProductItem(String name, String imageUrl,
      {required bool isMostPopular}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Card(
        elevation: 15,
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  //network(
                  imageUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(name),
                ),
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Color.fromARGB(255, 0, 0, 0)
                      .withOpacity(0.0), // Background color
                  child: TextButton(
                    onPressed: () {
                      print("Add to Card Button on popular product");
                      // Handle "Add to Cart" action
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets
                          .zero, // Remove padding to make the text touchable
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // Make button size to its content
                    ),
                    child: Text(
                      'Coming soon.......',
                      style: TextStyle(
                          color: AppColors.textColor), // Set text color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ye vala all product section ka code hai ================================================================
class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          // Handle double-tap action
          print('Double-tapped on product all product section');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Products',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor),
            ),
            SizedBox(height: 10),
            _buildProductList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.asset(
              'asset/image/balckimg.jpg',

              //   'https://cdn.pixabay.com/photo/2023/07/05/09/28/insect-8107897_640.jpg',
              height: 100,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coming soon....... ${index + 1}', //product name
                  style: TextStyle(color: AppColors.textColor),
                ),
                Text(
                  '\$19.99', // Replace with the actual product price
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.productprise, // Set your desired color
                  ),
                ),
              ],
            ),
            subtitle: Text(
              'Product description...',
              style: TextStyle(color: AppColors.textColor),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     print("Add to Card button click all poduct");
                //     // Handle "Add to Cart" action
                //   },
                //   child: Text('Add to Cart'),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

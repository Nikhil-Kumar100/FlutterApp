import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techprohelpline/UI/shport/color.dart';
import 'package:techprohelpline/UI/drawer/review.dart';
import 'package:techprohelpline/UI/shport/text.dart';
import 'package:google_fonts/google_fonts.dart'; // Make sure to import the Google Fonts package

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                  AppColors.theerdcolor,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Section
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '${AppText.homepagequte}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor),
                  ),
                ),

                // Hero Section
                Container(
                  width: double.infinity, // Expand to full width
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(30), // Adding rounded corners
                        child: Image.asset(
                          'asset/image/homeimg.webp',
                          height: MediaQuery.of(context).size.width / 2,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          print("Start Your Project");
                          Navigator.pushNamed(context, "/chat");
                          // Handle button press
                        },
                        child: Text(
                          '${AppText.homepagebutton}',
                          style: TextStyle(color: AppColors.textColor),
                        ),
                      ),
                    ],
                  ),
                ),

                // Services Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        '${AppText.homePageServiceHeader}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor),
                      ),
                      SizedBox(height: 20),
                      TopSlideCard(),
                      // SingleChildScrollView(
                      //   // Use SingleChildScrollView to handle overflow
                      //   scrollDirection: Axis.horizontal, // Scroll horizontally
                      //   child: Row(
                      //     children: [
                      //       ServiceCard(
                      //         AppText.webDevelopmentService,
                      //         AppText.webDevelopmentDescription,
                      //       ),
                      //       SizedBox(width: 20),
                      //       ServiceCard(
                      //         AppText.mobileAppDevelopmentService,
                      //         AppText.mobileAppDevelopmentDescription,
                      //       ),
                      //       SizedBox(width: 20),
                      //       ServiceCard(
                      //         AppText.uiUxDesignService,
                      //         AppText.uiUxDesignDescription,
                      //       ),
                      //       SizedBox(width: 20),
                      //       ServiceCard(
                      //         AppText.cybersecurityService,
                      //         AppText.cybersecurityDescription,
                      //       ),
                      //       SizedBox(width: 20),
                      //       ServiceCard(
                      //         AppText.ethicalHackingService,
                      //         AppText.ethicalHackingDescription,
                      //       ),
                      //       // Add more service cards
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),

                // Portfolio Section
                // ...
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewCard()),
                      );
                    },
                    child: Text('${AppText.homepageReviewsbutton}'),
                  ),
                ),
                // About Us Section
                // ...

                // Testimonials Section
                // ...

                // Blog Section
                // ...

                // Contact Section
                // ...

                // Footer Section
                // ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ServiceCard extends StatelessWidget {
//   final String title;
//   final String description;

//   ServiceCard(this.title, this.description);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       width: 250,
//       height: 150,
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.border),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: 10),
//           Text(description),
//         ],
//       ),
//     );
//   }
// }

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
    'asset/image/balckimg.jpg',
    'asset/image/balckimg.jpg',
    'asset/image/balckimg.jpg',
    'asset/image/balckimg.jpg',
    'asset/image/balckimg.jpg',
  ];
  final List<String> slidetitleText = [
    // 'https://cdn.pixabay.com/photo/2023/05/01/14/26/bee-7963186_1280.jpg',
    // 'https://cdn.pixabay.com/photo/2023/08/02/12/39/bird-8165143_1280.jpg',
    // 'https://cdn.pixabay.com/photo/2023/07/28/18/23/bird-8155768_640.jpg',
    // 'https://cdn.pixabay.com/photo/2023/07/22/15/07/silver-spotted-skipper-8143617_640.jpg',
    // 'https://cdn.pixabay.com/photo/2023/08/04/08/00/coneflower-8168628_640.jpg',
    '  ${AppText.webDevelopmentService}  ',
    '  ${AppText.androidAppDevelopmentService}  ',
    '  ${AppText.IosAppDevelopmentService}  ',
    '  ${AppText.MacAppDevelopmentService}  ',
    '  ${AppText.WindowsAppDevelopmentService}  ',
    '  ${AppText.linuxAppDevelopmentService}  ',
    '  ${AppText.uiUxDesignService}  ',
    '  ${AppText.cybersecurityService}  ',
    '  ${AppText.ethicalHackingService}  ',
    '  ${AppText.blueteamingService}  ',
  ];
  final List<String> slidedescriptionText = [
    // 'https://cdn.pixabay.com/photo/2023/05/01/14/26/bee-7963186_1280.jpg',
    // 'https://cdn.pixabay.com/photo/2023/08/02/12/39/bird-8165143_1280.jpg',
    // 'https://cdn.pixabay.com/photo/2023/07/28/18/23/bird-8155768_640.jpg',
    // 'https://cdn.pixabay.com/photo/2023/07/22/15/07/silver-spotted-skipper-8143617_640.jpg',
    // 'https://cdn.pixabay.com/photo/2023/08/04/08/00/coneflower-8168628_640.jpg',
    ' ${AppText.webDevelopmentDescription} ',
    ' ${AppText.androidAppDevelopmentDescription} ',
    '  ${AppText.IosAppDevelopmentDescription}  ',
    '  ${AppText.MacAppDevelopmentDescription}  ',
    '  ${AppText.WindowsAppDevelopmentDescription}  ',
    '  ${AppText.linuxAppDevelopmentDescription}  ',
    ' ${AppText.uiUxDesignDescription} ',
    ' ${AppText.cybersecurityDescription} ',
    ' ${AppText.ethicalHackingDescription} ',
    '  ${AppText.blueteaming}  ',
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
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      // border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(slidetitleText[index],
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight
                                    .bold, // Use FontWeight enum for font weight
                                fontFamily: GoogleFonts.mukta().fontFamily,

                                // Use the Google Fonts family
                                color: AppColors.textColor,
                              )),
                          const SizedBox(height: 10),
                          Text(slidedescriptionText[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                color: AppColors.textColor,
                              )),
                        ],
                      ),
                    ),
                  ),
                  // child: Text(
                  //   slideImageText[index],
                  //   style: TextStyle(
                  //     color: AppColors.textColor,
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

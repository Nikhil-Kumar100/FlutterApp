import 'package:share_plus/share_plus.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'package:social_media_flutter/widgets/text.dart';
import 'package:techprohelpline/UI/shport/color.dart';
import 'package:techprohelpline/UI/Home/homepages.dart';
import 'package:techprohelpline/UI/shport/text.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DrawerScreen> {
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  // final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();  // ye bhi slide right code hai==================

  void _incrementCounter() {
    setState(() {});
  }

  toggleMenu([bool end = false]) {
    if (end) {
      // final _state = _endSideMenuKey.currentState!; // ye bhi slide right code hai==================
      // if (_state.isOpened) {
      //   _state.closeSideMenu();
      // } else {
      //   _state.openSideMenu();
      // }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      // key: _endSideMenuKey,   // ye bhi slide right code hai==================
      inverse: true, // end side menu
      background: const Color.fromARGB(57, 175, 179, 171),
      type: SideMenuType.slideNRotate,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: SideMenu(
        key: _sideMenuKey,
        menu: buildMenu(),
        type: SideMenuType.slideNRotate,
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: IgnorePointer(
          ignoring: isOpened,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.appbar,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => toggleMenu(),
              ),
              actions: [
                //=================================yeh right slid code hai=======================
                // IconButton(
                //   icon: const Icon(Icons.menu),
                //   onPressed: () => toggleMenu(true),
                // )
              ],
              title: Text("${AppText.homeappbartext}"),
            ),
            body: HomeScreen(),
          ),
        ),
      ),
    );
  }

//ye slide code hai ======================================================================
  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.bgavtar,
                  radius: 50.0,
                ),
                SizedBox(height: 16.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        "${AppText.griting} ",
                        style: TextStyle(color: AppColors.textColor),
                      ),
                      Profilename(),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
            leading: const Icon(Icons.home, size: 20.0, color: AppColors.icon),
            title: const Text("Home"),
            textColor: AppColors.textColor,
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: AppColors.icon),
            title: const Text("Profile"),
            textColor: AppColors.textColor,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/wallet");
            },
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: AppColors.icon),
            title: const Text("Wallet"),
            textColor: AppColors.textColor,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/checkout");
            },
            leading: const Icon(Icons.shopping_cart,
                size: 20.0, color: AppColors.icon),
            title: const Text("Cart"),
            textColor: AppColors.textColor,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/Favorites");
            },
            leading:
                const Icon(Icons.favorite, size: 20.0, color: AppColors.icon),
            title: const Text("Favorites"),
            textColor: AppColors.textColor,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              _onShare(context); // Call the _onShare function
            },
            leading: const Icon(Icons.share, size: 20.0, color: AppColors.icon),
            title: const Text("Share"),
            textColor: AppColors.textColor,
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/setting");
            },
            leading:
                const Icon(Icons.settings, size: 20.0, color: AppColors.icon),
            title: const Text("Settings"),
            textColor: AppColors.textColor,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/logout");
            },
            leading:
                const Icon(Icons.logout, size: 20.0, color: AppColors.icon),
            title: const Text("Logout"),
            textColor: AppColors.textColor,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            leading:
                const Icon(Icons.reviews, size: 20.0, color: AppColors.icon),
            title: SocialWidget(
              placeholderText: 'Review',
              iconData: Icons.reviews,
              link: 'https://www.youtube.com/channel/UCqwR5trO2ukalbrLYm7hwVQ',
              iconColor: AppColors.icon,
              iconSize: 0.0,
              placeholderStyle:
                  TextStyle(color: AppColors.textColor, fontSize: 14),
              // Adding a margin of 20 pixels
            ),
            textColor: AppColors.textColor,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}

///app  share code hai ==========================================================================

void _onShare(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox?;

  await Share.share(
    'https://www.youtube.com/', // Replace with your actual text
    subject: 'Sharing Experience',
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  );
}
//==================================================================================================
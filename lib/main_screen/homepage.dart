import 'package:flutter/material.dart';
import 'package:food_delivery/main_screen/gofood.dart';
import 'package:food_delivery/components/gopay.dart';
// import 'package:food_delivery/components/akses.dart';
import 'package:food_delivery/components/goclub.dart';
// import 'package:food_delivery/components/gopay.dart';
// import 'package:food_delivery/components/header.dart';
// import 'package:food_delivery/components/menus.dart';
import 'package:food_delivery/components/news.dart';
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map> menuFavorites = [
    {
      'label': 'GoRide',
      'image': '',
      'color': Colors.green,
      'route' : gofood()
    },
    {
      'label': 'GoCar',
      'image': '',
      'color': Colors.green,
      'route' : gofood()
    },
    {
      'label': 'GoFood',
      'image': '',
      'color': Colors.red,
      'route' : gofood()
    },
    {
      'label': 'GoSend',
      'image': '',
      'color': Colors.green,
      'route' : gofood()
    },
    {
      'label': 'GoMart',
      'image': '',
      'color': Colors.red,
      'route' : gofood()
    },
    {
      'label': 'GoTransit',
      'image': '',
      'color': Colors.green,
      'route' : gofood()
    },
    {
      'label': 'GoTagihan',
      'image': '',
      'color': Colors.blue,
      'route' : gofood()
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Material(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(32),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: const [
                            Icon(Icons.search),
                            SizedBox(width: 16,),
                            Text('Find services, food, or place',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16,),
                Material(
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.person,
                        color: Theme.of(context).primaryColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gopay(),
            Wrap(
              runSpacing: 8,
              alignment: WrapAlignment.spaceBetween,
              children: [
                for (final menuFavorite in menuFavorites) Material(
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: menuFavorite['color'].withOpacity(0.4),
                    highlightColor: menuFavorite['color'].withOpacity(0.2),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => menuFavorite['route']),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: menuFavorite['color'].withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset('assets/place.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(menuFavorite['label'])
                        ],
                      ),
                    ),
                  )
                ),
                Material(
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle
                            ),
                            child: const Icon(Icons.more_horiz) 
                          ),
                          const SizedBox(height: 8,),
                          const Text('More')
                        ],
                      ),
                    ),
                  )
                )
              ]
            ), GoCLub(), News(),
          ],
        ),
      ),
    );
  }
}

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  List<Widget> halaman = [
    HomePage(),
    Container(
      color: Colors.grey,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: halaman,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCirc,
            );
          });
        },
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black26,
        ),
        iconSize: 32,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: 'Promos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list_rounded),
            label: 'Orders'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat'
          )
        ],
      ),
    );
  }
}
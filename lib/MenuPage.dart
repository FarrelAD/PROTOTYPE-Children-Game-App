import 'package:flutter/material.dart';
import 'package:prototye_children_game_app/GamePage.dart';

class MenuPage extends StatelessWidget {
  final List<Map<String, String>> gamesOption = [
    {'name': 'Puzzle', 'img': 'assets/img/puzzle.jpg'},
    {'name': 'Tebak warna', 'img': 'assets/img/color_matching.jpg'},
    {'name': 'Berhitung', 'img': 'assets/img/counting.webp'},
    {'name': 'Menggambar', 'img': 'assets/img/coloring.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount;

            if (constraints.maxWidth >= 1200) {
              crossAxisCount = 4;
            } else if (constraints.maxWidth >= 800) {
              crossAxisCount = 3;
            } else {
              crossAxisCount = 2;
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
              itemCount: gamesOption.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GamePage()),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Stack(
                      children: [
                        ClipRect(
                          child: Image.asset(
                            gamesOption[index]['img']!,
                            fit: BoxFit.cover,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                          ),
                        ),
                        Positioned.fill(
                            child: Center(
                              child: Text(
                                gamesOption[index]['name']!,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10,
                                        color: Colors.black54,
                                        offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        )
                      ],
                    )
                  ),
                );
              },
            );
          }
        )
      ),
    );
  }

}
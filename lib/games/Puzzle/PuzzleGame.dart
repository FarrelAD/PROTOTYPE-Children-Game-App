import 'package:flutter/material.dart';

class PuzzleGame extends StatefulWidget {
  const PuzzleGame({super.key});

  @override
  _PuzzleGameState createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  Map<String, bool> placed = {};

  final List<String> puzzleList = [
    'dolphin',
    'horse',
    'chicken',
    'eagle',
    'elephant',
    'swan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle'),
        backgroundColor: Color(0xFFB4D8E7),
      ),
      body: Center(
        child: Column(children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              int crossAxisCount = (constraints.maxWidth >= 800) ? 3 : 2;

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 3,
                  childAspectRatio: 1.5
                ),
                itemCount: puzzleList.length,
                itemBuilder: (context, index) {
                  return _buildDragTarget(puzzleList[index]);
                }
              );
            }),
          ),
          Container(
            color: Color(0xFFFFD6E8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: puzzleList.take(3).map((item) => _buildDraggable(item)).toList()
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: puzzleList.skip(puzzleList.length > 3 ? puzzleList.length - 3 : 0)
                    .map((item) => _buildDraggable(item))
                    .toList(),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildDragTarget(String imageKey) {
    return Container(
      child: DragTarget<String>(
        onAcceptWithDetails: (DragTargetDetails<String> detail) {
          if (detail.data == imageKey) {
            setState(() {
              placed[imageKey] = true;
            });
          }
        }, 
        builder: (context, candidateData, rejectedData) {
          return Container(
            width: 100,
            height: 100,
            child: (placed[imageKey] == true)
              ? Image.asset('assets/img/$imageKey.png')
              : Image.asset("assets/img/${imageKey}_black.png"),
          );
        }
      )
    );
  }

  Widget _buildDraggable(String imageKey) {
    return Draggable<String>(
      data: imageKey,
      feedback: Image.asset(
        "assets/img/$imageKey.png",
        width: 80,
        height: 80,
        opacity: AlwaysStoppedAnimation(0.7)
      ),
      childWhenDragging:
        Container(
          width: 80, 
          height: 80, 
          color: Colors.transparent
        ),
      child: Image.asset(
        "assets/img/$imageKey.png", 
        width: 80, 
        height: 80
      ),
    );
  }
}

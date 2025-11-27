import 'package:flutter/material.dart';

class GridExample extends StatelessWidget {
  final items = List.generate(12, (i) => i + 1);

  Widget buildGridItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image, size: 40),
          SizedBox(height: 8),
          Text("Item $index"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid Example")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12),
            Text("Fixed Column Grid", style: TextStyle(fontSize: 20)),
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: items.map((i) => buildGridItem(i)).toList(),
            ),
            SizedBox(height: 20),
            Text("Responsive Grid", style: TextStyle(fontSize: 20)),
            GridView.extent(
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: items.map((i) => buildGridItem(i)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

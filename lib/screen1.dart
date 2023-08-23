import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container(height: 200,width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryCard(
              title: 'Category 1',
              color: Colors.blue,
              icon: Icons.category,
            ),
            CategoryCard(
              title: 'Category 2',
              color: Colors.green,
              icon: Icons.category,
            ),
            CategoryCard(
              title: 'Category 3',
              color: Colors.orange,
              icon: Icons.category,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  CategoryCard({required this.title, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () {
          // Handle category tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController categoryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.add_circle_outline,
                size: 100,
                color: Colors.teal,
              ),
            ),
            const Text(
              'Title',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const Text('Price', style: TextStyle(fontSize: 18)),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Price'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Description', style: TextStyle(fontSize: 18)),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Category', style: TextStyle(fontSize: 18)),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: categoryController,
              decoration: const InputDecoration(
                label: Text('Category'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Add Product',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

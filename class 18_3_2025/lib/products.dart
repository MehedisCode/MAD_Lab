import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    modelController.dispose();
    priceController.dispose();
    super.dispose();
  }

  // Function to add data to Firestore
  Future<void> addData() async {
    String name = nameController.text.trim();
    String model = modelController.text.trim();
    String price = priceController.text.trim();

    if (name.isNotEmpty && model.isNotEmpty && price.isNotEmpty) {
      try {
        await _firestore.collection("products").add({
          "name": name,
          "model": model,
          "price": price,
          "timestamp": FieldValue.serverTimestamp(),
        });

        // Clear fields after saving
        nameController.clear();
        modelController.clear();
        priceController.clear();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product added successfully!")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: modelController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Model",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Price",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: addData,
                child: const Text("Save to Firestore"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

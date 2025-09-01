import 'package:flutter/material.dart';
import 'package:crud_oparation/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crud_oparation/widgets/snackbar_message.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageUrlTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameTEController.text = widget.product.name;
    _codeTEController.text = widget.product.code.toString();
    _quantityTEController.text = widget.product.quantity.toString();
    _priceTEController.text = widget.product.unitPrice.toString();
    _imageUrlTEController.text = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update product')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              children: [
                TextFormField(
                  controller: _nameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Product name',
                    labelText: 'Product name',
                  ),
                ),
                TextFormField(
                  controller: _codeTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Product code',
                    labelText: 'Product code',
                  ),
                ),
                TextFormField(
                  controller: _quantityTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Quantity',
                  ),
                ),
                TextFormField(
                  controller: _priceTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Unit price',
                    labelText: 'Unit price',
                  ),
                ),
                TextFormField(
                  controller: _imageUrlTEController,
                  decoration: InputDecoration(
                    hintText: 'Image Url',
                    labelText: 'Image Url',
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton(onPressed: _updateProduct, child: Text('Update')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateProduct() async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    int totalPrice = int.parse(_priceTEController.text) * int.parse(_quantityTEController.text);
    Map<String, dynamic> requestBody = {
      "ProductName": _nameTEController.text.trim(),
      "ProductCode": int.parse(_codeTEController.text.trim()),
      "Img": _imageUrlTEController.text.trim(),
      "Qty": int.parse(_quantityTEController.text.trim()),
      "UnitPrice": int.parse(_priceTEController.text.trim()),
      "TotalPrice": totalPrice
    };

    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/UpdateProduct/${widget.product.id}');
    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      Navigator.of(context).pop(); // Remove loading indicator
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        if (decodedJson['status'] == 'success') {
          showSnackBarMessage(context, 'Product updated successfully');
          Navigator.of(context).pop(); // Go back to previous screen
        } else {
          showSnackBarMessage(context, decodedJson['data'] ?? 'Update failed');
        }
      } else {
        showSnackBarMessage(context, 'Update failed: ${response.statusCode}');
      }
    } catch (e) {
      Navigator.of(context).pop();
      showSnackBarMessage(context, 'Error: $e');
    }
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _imageUrlTEController.dispose();
    _codeTEController.dispose();
    super.dispose();
  }
}
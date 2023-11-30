import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product-screen';

  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _focusPriceNode = FocusNode();
  final _focusDescriptionNode = FocusNode();
  final _focusImageUrl = FocusNode();
  final _imageUrlControler = TextEditingController();

  @override
  void dispose() {
    _focusPriceNode.dispose();
    _focusDescriptionNode.dispose();
    _imageUrlControler.dispose();
    _focusImageUrl.dispose();
    _focusImageUrl.removeListener(_updateImgUrl);
    super.dispose();
  }

  @override
  void initState() {
    _focusImageUrl.addListener(_updateImgUrl);
    super.initState();
  }

  void _updateImgUrl() {
    if (!_focusImageUrl.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_focusPriceNode);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _focusPriceNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_focusDescriptionNode);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _focusDescriptionNode,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageUrlControler.text.isEmpty
                        ? const Text('Enter image URL')
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(_imageUrlControler.text),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      controller: _imageUrlControler,
                      focusNode: _focusImageUrl,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

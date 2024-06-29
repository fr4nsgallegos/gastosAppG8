import 'package:flutter/material.dart';
import 'package:gastosappg8/widgets/field_modal_widget.dart';

class RegisterModal extends StatefulWidget {
  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  TextEditingController _productController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Registra el gasto",
        ),
        SizedBox(
          height: 16,
        ),
        FielModalWidget(),
        FielModalWidget(),
        FielModalWidget(),
      ],
    );
  }
}

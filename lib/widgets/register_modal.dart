import 'package:flutter/material.dart';
import 'package:gastosappg8/utils/data_general.dart';
import 'package:gastosappg8/widgets/field_modal_widget.dart';
import 'package:gastosappg8/widgets/item_type_widget.dart';

class RegisterModal extends StatefulWidget {
  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  TextEditingController _productController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String typeSelected = "Alimentos";
  _buildButtonAdd() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Añadir"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  showDateTimePicker() async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData.light().copyWith(
              dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              colorScheme: ColorScheme.light(primary: Colors.black),
            ),
            child: child!);
      },
    );
    _dateController.text = datePicker.toString();
    // if (datePicker != null) {
    //   // final DateFormat
    // }
    print(_dateController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Registra el gasto",
          ),
          SizedBox(
            height: 16,
          ),
          FieldModalWidget(
              hint: "Ingresa el título", controller: _productController),
          FieldModalWidget(
              hint: "Ingresa el monto",
              controller: _priceController,
              isNumberKeryboard: true),
          FieldModalWidget(
            hint: "Selecciona una fecha",
            controller: _dateController,
            isDatePicker: true,
            function: () {
              // print("ES UNA FECHA");
              showDateTimePicker();
            },
          ),
          SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: types
                .map(
                  (e) => ItemTypeWidget(
                    data: e,
                    isSelected: e["name"] == typeSelected,
                    tap: () {
                      typeSelected = e["name"];
                      setState(() {});
                      print(typeSelected);
                    },
                  ),
                )
                .toList(),
          ),
          _buildButtonAdd(),
        ],
      ),
    );
  }
}

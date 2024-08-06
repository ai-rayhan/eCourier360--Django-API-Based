import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String initialItem;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownButton({
    super.key,
    required this.initialItem,
    required this.items,
    this.onChanged,
  });

  @override
  CustomDropdownButtonState createState() => CustomDropdownButtonState();
}

class CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Row(
            children: [
              // Image(
              //   image: item["image"] as ImageProvider,
              //   width: 30,
              //   height: 30,
              // ),
              // const SizedBox(width: 10),
              Text(item),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedItem = value!;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}

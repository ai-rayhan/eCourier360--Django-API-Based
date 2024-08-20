import 'package:flutter/material.dart';

class ImageDropdownButton extends StatefulWidget {
  final String initialItem;
  final List<Map<String, dynamic>> items;
  final ValueChanged<String?>? onChanged;

  const ImageDropdownButton({
    super.key,
    required this.initialItem,
    required this.items,
    this.onChanged,
  });

  @override
  ImageDropdownButtonState createState() => ImageDropdownButtonState();
}

class ImageDropdownButtonState extends State<ImageDropdownButton> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem,
      icon: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Icon(Icons.expand_circle_down_outlined,size: 17,),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item["value"] as String,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                item["image"],
                width: 25,
              ),
              const SizedBox(width: 10),
              Text(item["value"] as String),
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

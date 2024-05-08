// ignore_for_file: library_private_types_in_public_api

import 'package:coffee_shop/utils/cup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CupSizeSelector extends StatefulWidget {
  final List<String> cupSizes;
  final Function(String) onSizeSelected;

  const CupSizeSelector(
      {super.key, required this.cupSizes, required this.onSizeSelected});

  @override
  _CupSizeSelectorState createState() => _CupSizeSelectorState();
}

class _CupSizeSelectorState extends State<CupSizeSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Cup Size:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: widget.cupSizes.map((size) {
            return ChoiceChip(
                label: Text(size),
                selected:
                    Provider.of<CupSizeProvider>(context).selectedSize == size,
                onSelected: (selected) {
                  if (selected) {
                    Provider.of<CupSizeProvider>(context, listen: false)
                        .setSelectedSize(size);
                  
                  }
                });
          }).toList(),
        ),
      ],
    );
  }
}

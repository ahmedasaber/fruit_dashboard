import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Icon(Icons.filter_alt_outlined, size: 24,),
          SizedBox(width: 8,),
          Text('Filter', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

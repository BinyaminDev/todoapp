import 'package:flutter/material.dart';

class MoiCheckedBox extends StatefulWidget {
  
  const MoiCheckedBox({Key? key}) : super(key: key);

  @override
  State<MoiCheckedBox> createState() => _MoiCheckedBoxState();
}

class _MoiCheckedBoxState extends State<MoiCheckedBox> {
  
   bool isChecked = false;
  @override
  Widget build(BuildContext context) {  
    return CheckboxListTile(
      
     
       activeColor: Colors.black,
         checkColor: Colors.white,
      value: isChecked,
      
      onChanged: (bool? value) {
        setState(() {
          
          isChecked = value!;
    
      });
      }
      );
      }
  }


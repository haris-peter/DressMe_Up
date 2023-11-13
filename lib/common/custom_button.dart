import 'package:dressme_up/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final Color buttoncolor;
  const CustomButton({super.key, required this.text, required this.onTap, required this.buttoncolor, });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      child: ElevatedButton(
      child: Text(
        text  ,
      ),
      onPressed: onTap,
      
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor:buttoncolor,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontWeight: FontWeight.bold)
           ),
          
      
    ),
    
    
    );
  }
}

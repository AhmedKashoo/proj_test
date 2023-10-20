import 'package:flutter/material.dart';
 var barcodenum = TextEditingController();

Widget form({
  required TextEditingController controlled_text,
  required String text,
  var validator,
  var tap ,
  var onChanged,
  bool ?enabled,
  var prefix_icon,
  var suffix_color,
  var suffix_icon ,
  var visible_function,
  var color,
  var border_colors=Colors.black,
  double bordercercuilar = 15.0,
  var fontcolor,
  bool obscureText = false,
  required TextInputType input_type,
})=>TextFormField(
  textDirection: TextDirection.rtl,

  onTap: tap,
  onFieldSubmitted: onChanged,
  enabled: enabled,
  validator: validator,
  obscureText: obscureText,
  keyboardType: input_type,
  controller: controlled_text,
  decoration: InputDecoration(
    labelStyle: TextStyle(
        color: fontcolor
    ),
    fillColor: color,
    filled: true,
    labelText:text,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(bordercercuilar),
      borderSide: BorderSide(
        color: border_colors,
      ),
    ),
    border:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(bordercercuilar),

    ),
    prefixIcon: Icon(prefix_icon),
    suffixIcon: suffix_icon != null ?  IconButton(onPressed: visible_function,
      icon: Icon(suffix_icon),color: suffix_color,) :null,
  ),
);

Widget button ({
  double width = double.infinity,
  bool isupper = true,
  Color color = Colors.blue,
  required String text,
  required var function,
})=>Container(
  decoration: BoxDecoration(
      color: color,

      borderRadius: BorderRadius.circular(10)
  ),
  width: width,
  child: MaterialButton(
    onPressed: function,
    child:
    Text(
      isupper ? text.toUpperCase() : text ,
      style:
      TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    ),
  ),
);
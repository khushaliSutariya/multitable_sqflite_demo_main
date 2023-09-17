import 'package:flutter/material.dart';

class CustomTxtField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? user;
  final FormFieldSetter? onsave;
  final FormFieldValidator? validator;

  const CustomTxtField({super.key, this.hintText, this.user,  this.onsave, this.validator});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.only(top: 20),
          width: 300,
          child:   TextFormField(
            textInputAction: TextInputAction.next,
            validator: validator,
            onSaved: onsave,
            controller: user,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              // fillColor: Colors.white70,
              errorStyle: const TextStyle(
                  color: Colors.red
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.black,width: 2),
              ),
            ),)
      ),
    );
  }
}




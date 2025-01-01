import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'get_screen_size.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final int? maxLines;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.labelText,
      this.hintText,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.enabled = true,
      this.maxLines = 1,
      this.onFieldSubmitted,
      this.focusNode,
      this.autofocus = false,
      this.onEditingComplete,
      this.onSaved,
      this.onTap,
      this.readOnly = false,
      this.inputFormatters,
      this.obscureText = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late double width;

  @override
  Widget build(BuildContext context) {
    width = GetScreenSize().getWidth(context);
    return SizedBox(
      width: width * 0.8,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
        onSaved: widget.onSaved,
        onEditingComplete: widget.onEditingComplete,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}

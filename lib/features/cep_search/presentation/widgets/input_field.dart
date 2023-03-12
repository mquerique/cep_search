import 'package:cep_search/core/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepInputField extends StatelessWidget {
  final TextEditingController? controller;

  const CepInputField({
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 8),
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        validator: (val) {
          String? message = Validators.nullOrEmptyValidator(
            context: context,
            val: val,
          );
          return message ??
              Validators.lengthValidator(
                context: context,
                val: val,
                minLength: 8,
              );
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        maxLines: 1,
        maxLength: 8,
      ),
    );
  }
}

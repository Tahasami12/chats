import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ContomButton extends StatelessWidget {
  const ContomButton({super.key, this.onTap,this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:  MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color:kprimaryColor,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: Colors.black,)
              : Text('Add', style: TextStyle(color: Colors.black, fontSize: 18)),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('onTap', onTap));
  }
}
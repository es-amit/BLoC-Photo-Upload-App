

import 'package:flutter/widgets.dart' show BuildContext;
import 'package:testing_bloc/auth/auth_error.dart';
import 'package:testing_bloc/dialogs/generic_dialog.dart';

Future<void> showAuthError({
  required AuthError authError, required BuildContext context}){

  return showGenericDialog<void>(
    context: context, 
    title: authError.dialogTitle, 
    content: authError.dialogText, 
    optionsBuilder: () =>{
      'OK': true,
    }
  );
}
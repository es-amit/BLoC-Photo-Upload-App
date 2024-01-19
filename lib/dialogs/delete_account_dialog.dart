

import 'package:flutter/widgets.dart' show BuildContext;
import 'package:testing_bloc/dialogs/generic_dialog.dart';

Future<bool> showDeleteAccountDialog(BuildContext context){

  return showGenericDialog(
    context: context, 
    title: 'Delete Account', 
    content: 'Are you sure you want to delete your account? You cannot undo this operation!', 
    optionsBuilder: () =>{
      'Cancel': false,
      'Delete account': true
    }
  ).then((value) => value ?? false);
}
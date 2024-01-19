
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_bloc/bloc/app_bloc.dart';
import 'package:testing_bloc/bloc/app_event.dart';
import 'package:testing_bloc/dialogs/delete_account_dialog.dart';
import 'package:testing_bloc/dialogs/logout_dialog.dart';

enum MenuAction {
  logout,
  deleteAccount
}

class MainPopupMenuButton extends StatelessWidget {
  const MainPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuAction>(
      onSelected: (value) async{
        switch(value) {
          
          case MenuAction.logout:
            final shouldLogOut = await showLogOutDialog(context);
            if(shouldLogOut){
              // ignore: use_build_context_synchronously
              context.read<AppBloc>().add(const AppEventLogOut());
            }
            break;

          case MenuAction.deleteAccount:
            final shouldDeleteAccount = await showDeleteAccountDialog(context);
            if(shouldDeleteAccount){
              // ignore: use_build_context_synchronously
              context.read<AppBloc>().add(const AppEventDeleteAccount());
            }
            break;
            
        }
      },
      itemBuilder: (context){
        return [
          const PopupMenuItem<MenuAction>(
            value: MenuAction.logout,
            child: Text('Log out')
          ),
          const PopupMenuItem<MenuAction>(
            value: MenuAction.deleteAccount,
            child: Text('Delete account')
          ),
        ];
      }
    );
  }
}
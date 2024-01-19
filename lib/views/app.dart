import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_bloc/bloc/app_bloc.dart';
import 'package:testing_bloc/bloc/app_event.dart';
import 'package:testing_bloc/bloc/app_state.dart';
import 'package:testing_bloc/dialogs/show_auth_error.dart';
import 'package:testing_bloc/loading/loading_screen.dart';
import 'package:testing_bloc/views/login_view.dart';
import 'package:testing_bloc/views/photo_gallery_view.dart';
import 'package:testing_bloc/views/register_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => AppBloc()..add(const AppEventInitialize()),
      child: MaterialApp(
        title: 'Photo Library',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        home: BlocConsumer<AppBloc,AppState>(
          builder: (context, state) {
            if(state is AppStateLoggedOut){
              return const LoginView();
            }
            else if(state is AppStateLoggedIn){
              return const PhotoGalleryView();
            }
            else if(state is AppStateIsInRegistrationView){
              return const RegisterView();
            }
            else{
              // this should never happen
              return Container();
            }
          }, 
          listener: (context,state){
            if(state.isLoading){
              return LoadingScreen.instance().show(
                context: context, 
                text: 'Loading...'
              );
            }
            else{
              LoadingScreen.instance().hide();
            }

            final authError = state.authError;
            if(authError != null){
              showAuthError(
                authError: authError, 
                context: context
              );
            }
          }
        ),
      ),
    );
  }
}

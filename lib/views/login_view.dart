import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:testing_bloc/bloc/app_bloc.dart';
import 'package:testing_bloc/bloc/app_event.dart';
import 'package:testing_bloc/extensions/if_debugging.dart';

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: "amit@gmail.com".ifDebugging);

    final passwordController = useTextEditingController(text: "foobarbaz".ifDebugging);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter your email here..."
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
            ),

            const SizedBox(height: 10,),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Enter your password here..."
              ),
              obscureText: true,
              obscuringCharacter: '✘',
              keyboardAppearance: Brightness.dark,
            ),
            const SizedBox(height: 10,),
            TextButton(
              onPressed: (){
                final email = emailController.text;
                final password = passwordController.text;
                context.read<AppBloc>().add(
                  AppEventLogIn(
                    email: email, 
                    password: password
                  )
                );
              }, 
              child: const Text('Log in')
            ),
            const SizedBox(height: 10,),
            TextButton(
              onPressed: (){
                context.read<AppBloc>().add(
                  const AppEventGoToRegistration()
                );
              }, 
              child: const Text('Not registered yet? Register here!')
            ),
          ],
        ),
      ),
    );
  }
}
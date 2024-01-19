
import 'package:flutter/foundation.dart' show immutable;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;

const Map<String, AuthError> authErrorMapping ={
  'user-not-found': AuthErrorUserNotFound(),
  'weak-password': AuthErrorWeakPassword(),
  'invalid-email': AuthErrorInvalidEmail(),
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'email-already-in-use': AuthErrorEmailAlreadyInUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'no-current-user': AuthErrorNoCurrentUser(),
  
};


@immutable
abstract class AuthError {
  final String dialogTitle;
  final String dialogText;

  const AuthError({
    required this.dialogTitle, 
    required this.dialogText
  });


  factory AuthError.from(FirebaseAuthException exception) => 
    authErrorMapping[exception.code.toLowerCase().trim()] ?? const  AuthErrorUnknown();

  
}

@immutable
class AuthErrorUnknown extends AuthError {
  
  const AuthErrorUnknown() : super(
    dialogText: 'Authentication error',
    dialogTitle: 'Unknown authentication error'
  );
}

@immutable
// auth/no-currrent-user
class AuthErrorNoCurrentUser extends AuthError {
  const AuthErrorNoCurrentUser() : super(
      dialogText: 'No current user with this information was found!',
      dialogTitle: 'No current user!'
    );
}



@immutable

// auth/requires-recent-login
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin() : super(
      dialogText: 'You need to log out and log back in again order to perform this operation',
      dialogTitle: 'Requires recent login'
    );
}

@immutable

// auth/operation-not-allowed
class AuthErrorOperationNotAllowed extends AuthError {
  const AuthErrorOperationNotAllowed() : super(
      dialogText: 'You cannot register using this method at this moment!',
      dialogTitle: 'Operation not allowed!'
    );
}



// auth/user-not-found
@immutable

class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound() : super(
      dialogText: 'The given user was not found on the server!',
      dialogTitle: 'User not found!'
    );
}


//auth/weak-password

@immutable

class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword() : super(
      dialogText: 'Please choose a stronger password consisting of more character',
      dialogTitle: 'Weak password!'
    );
}

@immutable
//auth/invalid-email

class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail() : super(
      dialogText: 'Please double check your email and try again!',
      dialogTitle: 'Invalid email!'
    );

}

@immutable

// auth/email-already-in-use
class AuthErrorEmailAlreadyInUse extends AuthError {
  const AuthErrorEmailAlreadyInUse() : super(
      dialogText: 'Please choose another email to register with!',
      dialogTitle: 'Email already in use'
    );
}
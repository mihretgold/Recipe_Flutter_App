import 'package:recipes_app/utils/class.dart';
import 'package:collection/collection.dart';
class UserData{
  static String CurrentUser = "";
  static List<Users> users = [
    Users(id: '1', name: "Mihret", email: 'mihret@gmail.com', password: '1234#bbB'),
    Users(id: '1', name: "Natanim", email: 'natanim@gmail.com', password: '1234#bbB'),
    
  ];

   // Login method
  static Users? login(String email, String password) {
    Users? user = users.firstWhereOrNull(
      (user) => user.email == email && user.password == password,
    );
    CurrentUser = email;
    return user;
  }

  // Signup method
  static Users? signup(String name, String email, String password) {
    // Check if the email is already registered
    bool emailExists = users.any((user) => user.email == email);

    if (!emailExists) {
      // Generate a unique ID (you may want to use a better method for production)
      String newUserId = DateTime.now().millisecondsSinceEpoch.toString();

      // Create a new user
      Users newUser =
          Users(id: newUserId, name: name, email: email, password: password);

      // Add the new user to the list
      users.add(newUser);

      // Return the created user
      return newUser;
    } else {
      // Email is already registered, handle accordingly (show an error message, etc.)
      // print('Email is already registered.');
      return null;
    }
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';

/// Model class representing user data.
class UserModel {
  // Keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String email;

  // String phoneNumber;
  String profilePicture;
  String selectedSchool;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    // required this.phoneNumber,
    required this.profilePicture,
    required this.selectedSchool,
  });

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");


  /// Static function to create an empty user model.
  static UserModel empty() =>
      UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        // phoneNumber: '',
        profilePicture: '',
        selectedSchool: '',
      );

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'ProfilePicture': profilePicture,
      'SelectedSchool': selectedSchool,
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        email: data['Email'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        selectedSchool: data['SelectedSchool'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}


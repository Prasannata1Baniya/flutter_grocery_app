import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // Instances of Firebase services
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // --- PUBLIC GETTERS ---

  // Stream to listen for authentication changes (login/logout).
  // This is the primary tool for routing in your app.
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Synchronously get the current logged-in user, if any.
  User? get currentUser => _firebaseAuth.currentUser;

  // --- AUTHENTICATION METHODS ---

  // Sign in with email and password.
  // Throws FirebaseAuthException on failure.
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential =
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  // Create a new user with email and password.
  // Also creates a corresponding user document in Firestore.
  // Throws FirebaseAuthException on failure.
  Future<User?> signUp({
    required String email,
    required String password,
    String? name, // Making name optional
  }) async {
    // 1. Create user in Firebase Auth
    final UserCredential userCredential =
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = userCredential.user;

    // 2. Create user document in Firestore, if Auth creation was successful
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'fullName': name, // Using the consistent 'fullName'
        'email': email,
        'createdAt': Timestamp.now(), // Using standard camelCase
        // Add other fields for your grocery app here, e.g.,
        // 'primaryAddress': null,
        // 'phoneNumber': null,
      });

      // Optional: Update the user's display name in Firebase Auth itself
      if (name != null) {
        await user.updateDisplayName(name);
      }
    }

    return user;
  }

  // Sign out the current user.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}




















/*import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService{

  final SupabaseClient _supabase =Supabase.instance.client;

  //Sign in with email and password
  Future<AuthResponse> signInWithEmailAndPassword(String email, String password) async{
    return await _supabase.auth.signInWithPassword(email: email,
        password: password);
  }

  //sign up
   Future<AuthResponse> signUpWithEmailAndPassword(String name, String email, String password) async{

      final AuthResponse res= await _supabase.auth.signUp(
          email:email,
          password: password,
        data: {
          'full_name':name,
        },
      );
      if(res.user !=null){
        await _createPublicProfile(
          userId: res.user!.id,
          name: name,
          email: email,

        );
      }
      return res;

   }

  Future<void> _createPublicProfile({required String userId, required String name,required String email}) async{
   await _supabase.from("Profiles").insert({
     'id':userId,
     'full_name':name,
     'email':email,
      'created_at': DateTime.now().toIso8601String(),
   });

  }

  //Sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
 */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;


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

  Future<User?> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    final UserCredential userCredential =
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = userCredential.user;

    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'fullName': name,
        'email': email,
        'createdAt': Timestamp.now(),
      });

      if (name != null) {
        await user.updateDisplayName(name);
      }
    }

    return user;
  }

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
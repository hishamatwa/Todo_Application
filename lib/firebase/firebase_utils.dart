import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/date_format.dart';
import 'package:todo_app/features/tasks/mainlayoutView.dart';
import 'package:todo_app/firebase/task_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../home_screen.dart';
import '../login_screen.dart';

class FireBaseUtils {


  CollectionReference<TaskModel> collectionReference(String? uid) {
    return
        FirebaseFirestore.instance.collection(uid!).withConverter<TaskModel>(
        fromFirestore: (snapshot, options) => TaskModel.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore(),);
  }


  void fireStoreAdd(String? uid, TaskModel model) {
    var collection = collectionReference(uid);
    var doc = collection.doc();
    model.id = doc.id;
    doc.set(model);
  }

  Stream<QuerySnapshot<TaskModel>> getFromFireStore(String? uid,DateTime date)  {
    var collection = collectionReference(uid).where("date",isEqualTo: dateFormat(date).millisecondsSinceEpoch);
    var data = collection.snapshots();

    return data;
  }

  deleteFromFireStore(String? id,String?uid){
    var collection = collectionReference(uid);
    var doc = collection.doc(id);
    return doc.delete();
  }
  updateFromFireStore(String? id,String?uid){
    var collection = collectionReference(uid);
    var doc = collection.doc(id);
    return doc.update({"isdone":true});
  }
  createUserWithEmailAndPassword(String emailAddress, String password,
      BuildContext context) async {
    try {
      EasyLoading.show();
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print("Registered successfully");

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message:
          'Registered successfully',
        ),
      );
      EasyLoading.dismiss();
      Navigator.pushNamed(context, LoginScreen.routeName);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        EasyLoading.dismiss();
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message:
            'The password provided is too weak.',
          ),
        );
        print('The password provided is too weak.');
        // EasyLoading.dismiss();
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.dismiss();
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message:
            'The account already exists for that email.',
          ),
        );
        print('The account already exists for that email.');
        // EasyLoading.dismiss();
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPassword(String emailAddress, String password,
      BuildContext context) async {
    try {
      EasyLoading.show();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      String? s = credential.user?.email;
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message:
          'Signed in successfully',
        ),
      );
      print("Signed in successfully");
      EasyLoading.dismiss();
      Navigator.pushNamed(context, HomeScreen.routeName, arguments: s);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message:
            'No user found for that email',
          ),
        );
        print('No user found for that email.');
        EasyLoading.dismiss();
      } else if (e.code == 'invalid-credential') {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message:
            'Wrong Email or password',
          ),
        );
        print('Wrong Email or password provided for that user.');
        EasyLoading.dismiss();
      }
    }
  }

}
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/firebase/firebase_auth_service.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/firebase_storage_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final ImagePicker picker = ImagePicker();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserModel user = UserModel();

  void register() async {
    emit(RegisterLoading());
    try {
      UserCredential? userCredential =
          await FirebaseAuthService.signUpWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      user.uid = userCredential!.user!.uid;

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'weak-password') {
        emit(
          RegisterError('The password provided is too weak.'),
        );
      } else if (e.code == 'invalid-email') {
        emit(
          RegisterError('The email address is badly formatted.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          RegisterError(
              'The email address is already in use by another account.'),
        );
      } else {
        emit(
          RegisterError(e.toString()),
        );
      }
    } catch (e) {
      emit(
        RegisterError(
          e.toString(),
        ),
      );
    }
  }

  void addRegisterInfo() {
    user.userName = nameController.text;
    user.email = emailController.text;
    user.role = "customer";
    //todo add subscription
    user.subscription = 10;
  }

  Future<void> addDataUserToFirebase() async {
    addRegisterInfo();
    print(user.toString());
    await FirebaseFireStoreService.addData(
      tableName: TablesName.users,
      data: user.toJson(),
    );
  }

  Future<void> uploadImage() async {
    String url = await FirebaseStorageService.uploadImage(
      image: image!,
    );
    user.imageUrl = url;
  }

  File? image;
  Future<void> pickImage({required ImageSource source}) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(PickImageSuccess());
    } else {
      if (image == null) {
        emit(
          PickImageError('No image selected'),
        );
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    return super.close();
  }
}

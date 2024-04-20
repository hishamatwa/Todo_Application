import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_utils.dart';
import 'package:todo_app/fonts/fonts.dart';
import 'package:todo_app/register.dart';

import '../provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var vm = Provider.of<ProviderService>(context);
    return Container(
      decoration: BoxDecoration(
        color: vm.isDark() ? const Color(0xFF060E1E) : Colors.white,
        image: const DecorationImage(
          image: AssetImage('assets/light_mode/background_login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(" login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontFamily: Fontss.Poppins,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: vm.isDark() ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: Fontss.Poppins,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: vm.isDark() ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller:emailController ,
                          style: TextStyle(
                            fontFamily: Fontss.Poppins,
                            fontSize: 20,
                            color: vm.isDark() ? Colors.white : Colors.black,
                          ),
                          validator: (value) {

                            RegExp emailRegex =
                                RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email address.';
                            }
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            emailController.text.trim();
                            formkey.currentState?.validate();
                          },
                          decoration:  InputDecoration(
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: vm.isDark()? Colors.white:Colors.black)),
                            errorStyle: const TextStyle(fontSize: 14),
                            hintText: "Enter Your Email",
                            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                            suffixIcon: const Icon(Icons.mail,color: Colors.grey,),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "password",
                          style: TextStyle(
                            fontFamily: Fontss.Poppins,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: vm.isDark() ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(
                            fontFamily: Fontss.Poppins,
                            fontSize: 20,
                            color: vm.isDark() ? Colors.white : Colors.black,
                          ),
                          obscureText: isPassword,
                          validator: (value) {
                            RegExp emailRegex = RegExp(
                              r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                            );
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (!emailRegex.hasMatch(value)) {
                              return 'Invalid password. It must meet the following criteria:\n'
                                  '- At least one alphabetical character (uppercase or lowercase).\n'
                                  '- At least one digit.\n'
                                  '- At least one special character from @\$!%*?&.\n'
                                  '- Minimum length of 8 characters.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            passwordController.text.trim();
                            formkey.currentState?.validate();
                          },

                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: vm.isDark()? Colors.white:Colors.black)),
                            errorStyle: const TextStyle(fontSize: 14),
                            hintText: "Enter Your Password",
                            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                            suffixIcon: InkWell(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),

                                onTap: () {
                                  isPassword = !isPassword;
                                  setState(() {});
                                },
                                child: isPassword == true
                                    ?  const Icon(Icons.visibility_off, color: Colors.grey,)
                                    :  const Icon(Icons.visibility,color: Colors.grey,)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: size.height * 0.06,
                          width: size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if(formkey.currentState!.validate()){
                                FireBaseUtils().signInWithEmailAndPassword(emailController.text, passwordController.text, context);
                              }
                              //EasyLoading.show();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text("Login"), Icon(Icons.arrow_forward)],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        InkWell(

                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.routeName);
                          },
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          child: Text(
                            "Or Create My Account",
                            style: TextStyle(
                              fontFamily: Fontss.Poppins,
                              fontSize: 18,
                              color: vm.isDark() ? Colors.white : Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

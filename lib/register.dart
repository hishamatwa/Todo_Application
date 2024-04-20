import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../firebase/firebase_utils.dart';
import '../fonts/fonts.dart';
import '../provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formkey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  bool isPassword = true;
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ProviderService>(context);
    var size = MediaQuery.of(context).size;
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
          title: const Text(" Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height*0.16),
              // Text(
              //   "Input your data",
              //   style: TextStyle(
              //     fontFamily: Fontss.Poppins,
              //     fontSize: 25,
              //     fontWeight: FontWeight.bold,
              //     color: vm.isDark() ? Colors.white : Colors.black,
              //   ),
              // ),

              Expanded(
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: Fontss.Poppins,
                            fontSize: 18,
                            color: vm.isDark() ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontFamily: Fontss.Poppins,
                            fontSize: 20,
                            color: vm.isDark() ? Colors.white : Colors.black,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            formkey.currentState?.validate();
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: vm.isDark()
                                        ? Colors.white
                                        : Colors.black)),
                            errorStyle: const TextStyle(fontSize: 14),
                            hintText: "Enter Your Name",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
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
                            RegExp emailRegex = RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email address.';
                            }
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formkey.currentState?.validate();
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: vm.isDark()
                                        ? Colors.white
                                        : Colors.black)),
                            errorStyle: const TextStyle(fontSize: 14),
                            hintText: "Enter Your Email",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            suffixIcon: const Icon(
                              Icons.mail,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "password",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: Fontss.Poppins,
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
                            formkey.currentState?.validate();
                          },

                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: vm.isDark()
                                        ? Colors.white
                                        : Colors.black)),
                            errorStyle: const TextStyle(fontSize: 14),
                            hintText: "Enter Your Password",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            suffixIcon: InkWell(
                                onTap: () {
                                  isPassword = !isPassword;
                                  setState(() {});
                                },
                                child: isPassword == true
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      )),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Confirm password",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: Fontss.Poppins,
                            fontSize: 18,
                            color: vm.isDark() ? Colors.white : Colors.black,
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontFamily: Fontss.Poppins,
                            fontSize: 20,
                            color: vm.isDark() ? Colors.white : Colors.black,
                          ),
                          obscureText: isPassword,
                          validator: (value) {

                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (passwordController.text!=passwordController2.text) {
                              return 'password not match';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formkey.currentState?.validate();
                          },
                          controller: passwordController2,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: vm.isDark()
                                        ? Colors.white
                                        : Colors.black)),
                            errorStyle: const TextStyle(fontSize: 14),
                            hintText: "Confirm Your Password",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            suffixIcon: InkWell(
                                onTap: () {
                                  isPassword = !isPassword;
                                  setState(() {});
                                },
                                child: isPassword == true
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      )),
                          ),
                        ),
                        SizedBox(height: size.height*0.03),
                        SizedBox(
                          height: size.height * 0.06,
                          width: size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if(formkey.currentState!.validate()){
                                FireBaseUtils().createUserWithEmailAndPassword(emailController.text, passwordController.text,context);
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("SignUp"),
                                  Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          ),
                        ),
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

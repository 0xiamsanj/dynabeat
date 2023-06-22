import 'package:dynabeat/controller/login_screen_controller.dart';
import 'package:dynabeat/utils/export.dart';
import 'package:dynabeat/widgets/helper_widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final _loginController = Get.put(LoginScreenController());

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.primaryBackground,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(alignment: Alignment.center, child: logo()),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  alignment: AlignmentDirectional.centerStart,
                  child: textWidget(
                      "Create\nAccount", 30, FontWeight.w600, Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: textWidget(
                          "Email", 15, FontWeight.w700, GlobalColors.accent),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 330,
                      decoration: BoxDecoration(
                          color: const Color(0xffF0F5FE),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: TextFormField(
                        style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.check),
                          hintStyle: GoogleFonts.raleway(color: Colors.black45),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: GlobalColors.accent,
                          fontWeight: FontWeight.w600),
                    ),
                    Obx(() {
                      return Container(
                        width: 330,
                        decoration: BoxDecoration(
                            color: const Color(0xffF0F5FE),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TextFormField(
                          onTap: () {
                            {
                              _loginController.showEmail.value =
                                  !_loginController.showEmail.value;
                            }
                          },
                          style: GoogleFonts.raleway(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          obscureText: _loginController.showPassword.value,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _loginController.showPassword.value =
                                      !_loginController.showPassword.value;
                                },
                                icon: _loginController.showPassword.value
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(
                                        Icons.visibility_off_outlined)),
                            border: InputBorder.none,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          backgroundColor: GlobalColors.accent,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          fixedSize: const Size(330, 50),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.raleway(
                              color: GlobalColors.primaryBackground,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fixedSize: const Size(330, 50),
                          side: BorderSide(
                            width: 1.8,
                            color: GlobalColors.accent,
                          )),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            child: Image.network(
                                "https://img.icons8.com/color/48/000000/google-logo.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign up with Google",
                            style: GoogleFonts.raleway(
                                color: GlobalColors.accent,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  InkWell(
                      onTap: () {
                        print("22");
                      },
                      child: Text(
                        " Log in",
                        style: GoogleFonts.raleway(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: GlobalColors.accent),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

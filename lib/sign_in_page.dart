import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class SignInPage extends StatelessWidget {
  final _email = Get.arguments;
  final _loginFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();

  final List<Tab> _loginTabs = <Tab>[
    Tab(
      child: Container(
        child: Text(
          '로그인',
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Text(
          '회원가입',
        ),
      ),
    ),
  ];

  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController =
      TextEditingController();
  final TextEditingController _signUpPasswordConfirmController =
      TextEditingController();
  final TextEditingController _signUpNickNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: GestureDetector(
          onTap: () async {
            FocusScope.of(context).unfocus();
          },
          child: _bodyWidget(),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
      reverse: true,
      scrollDirection: Axis.vertical,
      child: Container(
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),
            Container(
              child: Theme(
                data: ThemeData().copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: Container(
                  height: 50,
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.white,
                    tabs: _loginTabs,
                  ),
                ),
              ),
            ),
            Container(
              height: Get.height * 0.65,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _loginTabBarView(),
                  _signUpTabBarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpTabBarView() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 1),
          _emailSignUpFiled(),
        ],
      ),
    );
  }

  Widget _loginTabBarView() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          _emailLoginFiled(),
          SizedBox(height: Get.height * 0.1),
          Obx(
            () => true
                ? Column(
                    children: [
                      _loginButton(),
                      SizedBox(
                        height: Get.height * 0.07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _googleLoginButton(),
                          Platform.isIOS ? _appleLoginButton() : SizedBox()
                        ],
                      )
                    ],
                  )
                : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return Obx(
      () => MaterialButton(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: () async {
          if (_loginFormKey.currentState!.validate()) {}
        },
        elevation: 5.0,
        child: Container(
          width: Get.width * 0.85,
          height: Get.height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('로그인'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _googleLoginButton() => SignInButton.mini(
        buttonType: ButtonType.google,
        onPressed: () {},
      );

  Widget _appleLoginButton() => SignInButton.mini(
        buttonType: ButtonType.apple,
        onPressed: () {},
      );

  Form _emailLoginFiled() {
    if (_email != null) _loginEmailController.text = _email;
    return Form(
      key: _loginFormKey,
      onChanged: () {
        if (_loginEmailController.text.isNotEmpty &&
            _loginPasswordController.text.isNotEmpty) {
          if (_loginFormKey.currentState!.validate())
            print('_loginButtonController.activation()');
          // _loginButtonController.activation();
        } else {
          print('inactivation');
          // _loginButtonController.inactivation();
        }
      },
      child: Column(
        children: [
          emailField(0),
          SizedBox(height: Get.height * 0.02),
          passwordField(0),
        ],
      ),
    );
  }

  Form _emailSignUpFiled() {
    return Form(
      key: _signUpFormKey,
      onChanged: () {
        if (_signUpEmailController.text.isNotEmpty &&
            _signUpPasswordController.text.isNotEmpty &&
            _signUpPasswordConfirmController.text.isNotEmpty &&
            _signUpNickNameController.text.isNotEmpty) {
          if (_signUpFormKey.currentState!.validate())
            print('_signUpButtonController.activation();');
        } else {
          print('_signUpButtonController.inactivation();');
        }
      },
      child: Column(
        children: [
          emailField(1),
          SizedBox(height: Get.height * 0.02),
          passwordField(1),
          SizedBox(height: Get.height * 0.02),
          passwordConfirmField(),
          SizedBox(height: Get.height * 0.02),
          nickNameField(),
        ],
      ),
    );
  }

  Widget emailField(int index) => TextFormField(
        controller: index == 0 ? _loginEmailController : _signUpEmailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          prefixIcon: Icon(
            Icons.alternate_email,
          ),
          hintText: "이메일",
          hintStyle: TextStyle(),
          labelStyle: TextStyle(),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '이메일을 입력하세요.';
          } else if (!value.isEmail) {
            return '이메일 형식이 아닙니다.';
          } else {
            return null;
          }
        },
      );

  Widget passwordField(int index) => TextFormField(
        obscureText: true,
        controller:
            index == 0 ? _loginPasswordController : _signUpPasswordController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          hintText: '패스워드',
          hintStyle: TextStyle(),
          labelStyle: TextStyle(),
          prefixIcon: Icon(
            Icons.vpn_key_outlined,
          ),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '패스워드를 입력하세요.';
          } else {
            return null;
          }
        },
      );

  Widget passwordConfirmField() => TextFormField(
        obscureText: true,
        controller: _signUpPasswordConfirmController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          hintText: '패스워드 확인',
          hintStyle: TextStyle(),
          labelStyle: TextStyle(),
          prefixIcon: Icon(
            Icons.check,
          ),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '패스워드를 입력하세요.';
          } else if (value.trim() != _signUpPasswordController.text) {
            return '패스워드가 일치하지 않습니다.';
          } else {
            return null;
          }
        },
      );

  Widget nickNameField() => TextFormField(
        controller: _signUpNickNameController,
        maxLength: 10,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          prefixIcon: Icon(
            Icons.person_pin,
          ),
          hintText: "닉네임",
          hintStyle: TextStyle(),
          labelStyle: TextStyle(),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '닉네임을 입력하세요.';
          } else {
            return null;
          }
        },
      );
}

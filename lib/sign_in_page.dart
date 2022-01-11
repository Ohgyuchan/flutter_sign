import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sign/custom_tab.dart';
import 'package:sign_button/sign_button.dart';

class SignInPage extends StatelessWidget {
  final _signInFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _signInEmailController = TextEditingController();
  final TextEditingController _signInPasswordController =
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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBarWidget(context),
          body: _bodyWidget(),
        ),
      ),
    );
  }

  _bodyWidget() {
    return TabBarView(
      children: [
        _signInTab(),
        _signUpTab(),
      ],
    );
  }

  _signInTab() {
    return Form(
      key: _signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              emailField(0),
              passwordField(0),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton.mini(
                buttonType: ButtonType.google,
                onPressed: () {},
              ),
              SignInButton.mini(
                buttonType: ButtonType.apple,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(),
          const SizedBox(),
        ],
      ),
    );
  }

  _signUpTab() {
    return Form(
      key: _signUpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          emailField(1),
          passwordField(1),
          passwordConfirmField(),
          nickNameField(),
          ElevatedButton(
            onPressed: () {},
            child: Text('회원가입'),
          ),
        ],
      ),
    );
  }

  Widget emailField(int index) {
    return TextFormField(
      controller: index == 0 ? _signInEmailController : _signUpEmailController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        prefixIcon: Icon(
          Icons.alternate_email,
          color: Colors.black,
        ),
        hintText: "이메일",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
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
  }

  Widget passwordField(int index) {
    return TextFormField(
      obscureText: true,
      controller:
          index == 0 ? _signInPasswordController : _signUpPasswordController,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        hintText: '패스워드',
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        prefixIcon: Icon(
          Icons.vpn_key_outlined,
          color: Colors.black,
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
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
  }

  Widget passwordConfirmField() {
    return TextFormField(
      obscureText: true,
      controller: _signUpPasswordConfirmController,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        hintText: '패스워드 확인',
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        prefixIcon: Icon(
          Icons.check,
          color: Colors.black,
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
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
  }

  Widget nickNameField() {
    return TextFormField(
      controller: _signUpNickNameController,
      maxLength: 10,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        prefixIcon: Icon(
          Icons.person_pin,
          color: Colors.black,
        ),
        hintText: "닉네임",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
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

  PreferredSize _appBarWidget(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.0),
      child: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: AppBar(
          elevation: 0,
          bottomOpacity: 1,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 40),
            unselectedLabelStyle: TextStyle(fontSize: 20),
            tabs: [
              CustomTab(text: '로그인'),
              CustomTab(text: '회원가입'),
            ],
          ),
        ),
      ),
    );
  }
}

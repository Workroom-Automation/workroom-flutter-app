import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/api_service/dio_api_service.dart';
import 'package:workroom_flutter_app/common/services/supertoken_service/supertoken_service.dart';

class WorkRoomLogin extends StatefulWidget {
  const WorkRoomLogin({super.key});

  @override
  State<WorkRoomLogin> createState() => _WorkRoomLoginState();
}

class _WorkRoomLoginState extends State<WorkRoomLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.workRoomLogo,
          fit: BoxFit.fill,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > mobileScreenSizeLimit &&
              constraints.maxWidth < tabletScreenSizeLimit) {
            return Column(children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter email',
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                ),
              ),
              TextButton(
                style: ButtonStyle(),
                onPressed: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                  login(email, password);
                },
                child: Text('TextButton'),
              )
            ]);
          }
          if (constraints.maxWidth < mobileScreenSizeLimit) {
            return Placeholder();
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  void login(String email, String password) async {
    print(email);
    print(password);
    var dio = DioApiService('https://dev.api.onworkroom.com:9006');
    var identifier = Map<String, dynamic>();
    identifier['rid'] = 'emailpassword';
    var data = {
      "formFields": [
        {"id": "email", "value": email},
        {"id": "password", "value": password}
      ]
    };
    var res = await dio.post("/auth/public/signin", data, {}, identifier);
    print(res);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

import 'package:assignment10/core/common_widgets/custom_button.dart';
import 'package:assignment10/features/Home/presentation/pages/home.dart';
import 'package:assignment10/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment10/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment10/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController givenNameController = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: GoogleFonts.heebo(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // if (state is RegisterLoading) {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return Center(child: CircularProgressIndicator());
          //     },
          //   );
          // } else if (state is RegisterSuccess) {
          //   Navigator.of(context).pop(); // Close the loading dialog
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Registration Successful')),
          //   );
          // } else if (state is RegisterFailure) {
          //   Navigator.of(context).pop(); // Close the loading dialog
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Registration Failed: ${state.error}')),
          //   );
          // }
          switch(state.runtimeType)
          {
            case RegisterLoading:
             showDialog(
              context: context,
              builder: (context) {
                
                return Center(child: CircularProgressIndicator());},);


                case  RegisterSuccess :
                ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Registration Successful')),
            );

            case NavigateToHomeScreenState :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            },));

             case  RegisterFailure:
             final errorState = state as RegisterFailure;
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Registration Failed: ${errorState.error}')),
            );



          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Expanded(flex: 104, child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Given Name',
                    style: GoogleFonts.heebo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextFormField(
                      controller: givenNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        labelText: 'Enter Given Name',
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 20, child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Family Name',
                    style: GoogleFonts.heebo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextFormField(
                      controller: familyNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        labelText: 'Enter Family Name',
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 20, child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: GoogleFonts.heebo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        labelText: 'Enter Username',
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 20, child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: GoogleFonts.heebo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        labelText: 'Enter Password',
                      ),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 23, child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 97, right: 107),
                child: CustomButton(
                  text: 'Sign up',
                  onpress: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      RegisterButtonClickedEvent(
                        email: emailController.text,
                        familyName: familyNameController.text,
                        givenName: givenNameController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                ),
              ),
              const Expanded(flex: 139, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

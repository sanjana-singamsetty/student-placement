import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  String? userRole;
  String? stateId;

  List<dynamic> Roles = [];
  List<dynamic> FormValues = [];
  List<dynamic> states = [];

  @override
  void initState() {
    super.initState();
    Roles = [
      {"id": 1, "label": 'Student'},
      {"id": 2, "label": 'Parent'},
      {"id": 3, "label": 'Faculty mentor'},
      {"id": 4, "label": 'Faculty coordinator'},
    ];

    FormValues = [
      {"id": 1, "label": "Student full name", "ParentId": 1},
      {"id": 2, "label": "College email", "ParentId": 1},
      {"id": 3, "label": "Student Roll number", "ParentId": 1},
      {"id": 1, "label": "Parent full name", "ParentId": 2},
      {"id": 2, "label": "Student full name", "ParentId": 2},
      {"id": 1, "label": "Faculty mentor name", "ParentId": 3},
      {"id": 2, "label": "College mail", "ParentId": 3},
      {"id": 1, "label": "Faculty coordinator name", "ParentId": 4},
      {"id": 2, "label": "College mail", "ParentId": 4},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
          backgroundColor: mainColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Select Role",
                "Select Role",
                userRole,
                Roles,
                    (onChangedVal) {
                  setState(() {
                    userRole = onChangedVal;
                    print("Selected Role $onChangedVal");
                  });
                },
                    (onValidate) {
                  if (onValidate == null) {
                    return "Kindly select the role";
                  }
                  return null;
                },
                borderColor: thirdColor,
                borderFocusColor: mainColor,
                borderRadius: 18,
                optionLabel: "label",
                optionValue: "id",
                prefixIcon: const Icon(Icons.switch_account_rounded),
                prefixIconColor: mainColor,
                showPrefixIcon: true,
              ),
              if (userRole != null) ...getFormFieldsForRole(userRole!),
              ElevatedButton(
                onPressed: () {
                  // Perform form submission here
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getFormFieldsForRole(String role) {
    List<Widget> formFields = [];

    for (var formValue in FormValues) {
      if (formValue['ParentId'] == int.parse(role)) {
        formFields.add(FormHelper.inputFieldWidgetWithLabel(
          context,
          formValue['label'],
          formValue['label'],
          "",
              (onValidateVal) {
            if (formValue['label'] == 'Student Roll number') {
              if (!RegExp(r'^AP\d{11}$').hasMatch(onValidateVal)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid roll number format. Format should be like APXXXXXXXXXXX'),
                    backgroundColor: Colors.red,
                  ),
                );
                return 'Invalid format';
              }
            } else if (formValue['label'] == 'College email') {
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@srmap\.edu\.in$').hasMatch(onValidateVal)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Invalid email address. Must be of the format example@srmap.edu.in'),
                    backgroundColor: Colors.red,
                  ),
                );
                return 'Invalid email address';
              }
            }
            return null;
          },
              (onSavedVal) {},
          obscureText: false,
          borderColor: thirdColor,
          borderFocusColor: mainColor,
          prefixIconColor: mainColor,
          borderRadius: 10,
          paddingLeft: 20,
          paddingRight: 20,
          showPrefixIcon: true,
          validationColor: mainColor,
          prefixIcon: Icon(Icons.web),
          onChange: (val) {},
        ));
      }
    }

    return formFields;
  }
}

const Color mainColor = Color(0xff6a6446);
const Color secondaryColor = Color(0xfff2f0e4);
const Color thirdColor = Color(0xff403a1f);
const Color fourthColor = Color(0xffbf7d2c);

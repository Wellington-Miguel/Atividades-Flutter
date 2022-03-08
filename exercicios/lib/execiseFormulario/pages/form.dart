import 'package:exercicio/execiseFormulario/Components/checkBoxContact.dart';
import 'package:exercicio/execiseFormulario/resouces/strings.dart';
import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../Components/dateField.dart';
import '../Components/emailField.dart';
import '../Components/fullNameField.dart';
import '../Components/passwordField.dart';
import '../Components/userNameField.dart';
import '../funcions/alertConfirmation.dart';
import '../funcions/dateDialog.dart';
// quando fizer a transferência do projeto lemnbrar das bibliotecas

class PersonalForms extends StatefulWidget {
  PersonalForms(this.onpresstheme, this.curretTheme, {Key? key})
      : super(key: key);
  bool curretTheme;
  Function(bool) onpresstheme;
  @override
  State<PersonalForms> createState() => _PersonalFormsState();
}

class _PersonalFormsState extends State<PersonalForms> {
  DateTime? selctedDate;
  bool obscurepass = true;
  final dateController = TextEditingController();
  bool emailCheckController = true;
  bool phoneCheckController = true;
  bool switchTerms = false;
  final dateFocusController = FocusNode();
  final phoneFocusController = FocusNode();
  final regexEmail = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  final regexPassword =
      RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
  final phoneMask = MaskTextInputFormatter(mask: '(##) #####-####', filter: {
    '#': RegExp(r'[0-9]'),
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:
                widget.curretTheme ? Colors.green[600] : Colors.green[900],
            title: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Formulário: dados pessoais'),
            ),
            actions: [
              IconButton(
                icon: Icon(widget.curretTheme
                    ? Icons.lightbulb
                    : Icons.lightbulb_outline),
                onPressed: () {
                  widget.curretTheme = widget.curretTheme ? false : true;
                  widget.onpresstheme(widget.curretTheme);
                  setState(() {
                    widget.curretTheme;
                  });
                },
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              BuildSections(context, Words.sectionDateaccess),
              UsernameField(
                validatorBuild: validatorBuild,
              ),
              const SizedBox(
                height: 10,
              ),
              emailField(
                buildValidatorEmail: buildValidatorEmail,
              ),
              const SizedBox(
                height: 10,
              ),
              passwordField(
                obscurepass: obscurepass,
                buildValidatorPassword: buildValidatorPassword,
              ),
              const SizedBox(
                height: 10,
              ),
              BuildSections(context, Words.sectionPersonalData),
              fullNameField(
                validatorBuild: validatorBuild,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  dateField(
                      dateFocusController: dateFocusController,
                      dateController: dateController,
                      dateDialog: dateDialog(context),
                      validatorBuild: validatorBuild),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      focusNode: phoneFocusController,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: Words.phone,
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (phone) {
                        final phoneNotNull = validatorBuild(phone);
                        if (phoneNotNull != null) {
                          return phoneNotNull;
                        }
                        if (phoneNotNull == null && phone != null) {
                          final phoneNumber = phoneMask.unmaskText(phone);
                          if (phoneNumber.length < 11) {
                            return Words.erroPhone;
                          }
                        }
                        return null;
                      },
                      inputFormatters: [phoneMask],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              BuildSections(context, Words.sectionContact),
              CheckBoxContact(
                check: phoneCheckController,
                onchange: (value) {
                  setState(() {
                    phoneCheckController = value!;
                  });
                },
                text: Words.phone,
                label: Icons.phone,
                theme: widget.curretTheme,
              ),
              const SizedBox(
                height: 10,
              ),
              CheckBoxContact(
                  theme: widget.curretTheme,
                  check: emailCheckController,
                  onchange: (value) {
                    setState(() {
                      emailCheckController = value!;
                    });
                  },
                  text: Words.email,
                  label: Icons.email),
              const SizedBox(
                height: 10,
              ),
              FormField(
                validator: (_) {
                  if (!switchTerms) {
                    return Words.erroTerms;
                  }
                  return null;
                },
                builder: (field) {
                  final erroTerms = field.errorText;
                  return SwitchListTile(
                      dense: true,
                      subtitle: erroTerms != null
                          ? Text(
                              erroTerms,
                              style: const TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        Words.terms,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      value: switchTerms,
                      onChanged: (value) {
                        setState(() {
                          switchTerms = value;
                        });
                      });
                },
              ),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      final formsState = Form.of(context);

                      if (formsState != null && formsState.validate()) {
                        alertConfimation(context);
                      }
                    },
                    child: const Text('Confirmar'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? buildValidatorPassword(text) {
    final passwordNotNul = validatorBuild(text);
    if (passwordNotNul != null) {
      return passwordNotNul;
    }
    if (passwordNotNul == null && text != null) {
      if (!regexPassword.hasMatch(text)) {
        return Words.passwordConditions;
      }
    }
    return null;
  }

  String? buildValidatorEmail(text) {
    final emailNotNul = validatorBuild(text);
    if (emailNotNul != null) {
      return emailNotNul;
    }
    if (emailNotNul == null && text != null) {
      if (!regexEmail.hasMatch(text)) {
        return Words.erroEmail;
      }
    }
    return null;
  }

  Padding BuildSections(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    dateFocusController.dispose();
  }

  String? validatorBuild(String? value) {
    if (value == null || value.isEmpty) {
      return Words.erromandatory;
    }
    return null;
  }
}

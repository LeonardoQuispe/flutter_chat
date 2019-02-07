import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';


class NewContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SliverAppBar is declared in Scaffold.body, in slivers of a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Registrar Contacto"),
              background: Image.asset(
                'res/images/material_design_3.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 24.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Nombres',
                      // prefixText: '\$',
                      // suffixText: 'USD',
                      suffixStyle: TextStyle(color: Colors.green)),
                  maxLines: 1,
                ),
                 SizedBox(height: 24.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Apellidos',
                      // prefixText: '\$',
                      // suffixText: 'USD',
                      suffixStyle: TextStyle(color: Colors.green)),
                  maxLines: 1,
                ),

                DateTimePickerFormField(
                  inputType: InputType.both,
                  format: DateFormat('yyyy-MM-dd'),
                  editable: true,
                  decoration: InputDecoration(
                      labelText: 'Date/Time', hasFloatingPlaceholder: false),
                  // onChanged: (dt) => setState(() => date = dt),
                ),








                // SizedBox(height: 24.0),
                // // "Name" form.
                // TextFormField(
                //   textCapitalization: TextCapitalization.words,
                //   decoration: InputDecoration(
                //     border: UnderlineInputBorder(),
                //     filled: true,
                //     icon: Icon(Icons.person),
                //     hintText: 'What do people call you?',
                //     labelText: 'Name *',
                //   ),
                //   onSaved: (String value) {
                //     // this._name = value;
                //   },
                //   // validator: _validateName,
                // ),
                // SizedBox(height: 24.0),
                // // "Phone number" form.
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: UnderlineInputBorder(),
                //     filled: true,
                //     icon: Icon(Icons.phone),
                //     hintText: 'Where can we reach you?',
                //     labelText: 'Phone Number *',
                //     prefixText: '+86',
                //   ),
                //   keyboardType: TextInputType.phone,
                //   onSaved: (String value) {
                //     // this._phoneNumber = value;
                //   },
                //   // TextInputFormatters are applied in sequence.
                //   // inputFormatters: <TextInputFormatter>[
                //   //   WhitelistingTextInputFormatter.digitsOnly,
                //   // ],
                // ),
                // SizedBox(height: 24.0),
                // // "Email" form.
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: UnderlineInputBorder(),
                //     filled: true,
                //     icon: Icon(Icons.email),
                //     hintText: 'Your email address',
                //     labelText: 'E-mail',
                //   ),
                //   keyboardType: TextInputType.emailAddress,
                //   onSaved: (String value) {
                //     // this._email = value;
                //   },
                // ),
                // SizedBox(height: 24.0),
                // // "Life story" form.
                // TextFormField(
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Tell us about yourself',
                //     helperText: 'Keep it short, this is just a demo.',
                //     labelText: 'Life story',
                //   ),
                //   maxLines: 3,
                // ),
                // SizedBox(height: 24.0),
                // // "Salary" form.
                // TextFormField(
                //   keyboardType: TextInputType.number,
                //   decoration: const InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Salary',
                //       prefixText: '\$',
                //       suffixText: 'USD',
                //       suffixStyle: TextStyle(color: Colors.green)),
                //   maxLines: 1,
                // ),
                // SizedBox(height: 24.0),
                // // "Password" form.
                // // PasswordField(
                // //   fieldKey: _passwordFieldKey,
                // //   helperText: 'No more than 8 characters.',
                // //   labelText: 'Password *',
                // //   onFieldSubmitted: (String value) {
                // //     setState(() {
                // //       this._password = value;
                // //     });
                // //   },
                // // ),
                // SizedBox(height: 24.0),
                // // "Re-type password" form.
                // // TextFormField(
                // //   enabled: this._password != null && this._password.isNotEmpty,
                // //   decoration: const InputDecoration(
                // //     border: UnderlineInputBorder(),
                // //     filled: true,
                // //     labelText: 'Re-type password',
                // //   ),
                // //   maxLength: 8,
                // //   obscureText: true,
                // // ),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
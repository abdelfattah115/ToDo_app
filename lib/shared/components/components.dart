import 'package:first_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  Color background = Colors.blue,
  double width = double.infinity,
  bool isUppercase= true,
  required Function() function,
  required String text,
}) => Container(
  width: width,
  height: 40.0,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUppercase ? text.toUpperCase(): text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: background,
  ),
) ;

Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType type,
  //required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function()? onTap,
  Function()? suffixPressed,
  required String? validate(String? value) ,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  onTap: onTap,
  obscureText: isPassword,
  validator:  validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
        prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
      ),
    ) : null,
    border: OutlineInputBorder(),
  ),
);

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
  
          radius: 40.0,
  
          child: Text(
  
            '${model['time']}',
  
          ),
  
        ),
  
        SizedBox(
  
          width: 15.0,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize: MainAxisSize.min,
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              Text(
  
                '${model['title']}',
  
                style: TextStyle(
  
                  fontSize: 20.0,
  
                  fontWeight: FontWeight.bold,
  
                ),
  
  
  
              ),
  
              Text(
  
                '${model['date']}',
  
                style: TextStyle(
  
                  color: Colors.grey,
  
                ),
  
  
  
              ),
  
            ],
  
          ),
  
        ),
  
        SizedBox(
  
          width: 15.0,
  
        ),
  
        IconButton(
  
            onPressed: ()
  
            {
  
              AppCubit.get(context).updateDB(status: 'done', id: model['id']);
  
            },
  
            icon: Icon(
  
              Icons.check_box,
  
              color: Colors.green,
  
            ),
  
        ),
  
        IconButton(
  
            onPressed: ()
  
            {
  
              AppCubit.get(context).updateDB(status: 'archived', id: model['id']);
  
            },
  
            icon: Icon(
  
              Icons.archive_outlined,
  
              color: Colors.black45,
  
            ),
  
        ),
  
      ],
  
    ),
  ),
  onDismissed: (direction) {
    AppCubit.get(context).deleteDB(id: model['id']);
  },
);

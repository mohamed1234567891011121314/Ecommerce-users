import 'package:flutter/material.dart';

class CustomeAppbarr extends StatelessWidget {
  final String title;
  final void Function()? onPressedSearch;
  final void Function()? onPressedNotification;
  final void Function()? onPressedfavourite;
  final Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomeAppbarr(
      {super.key,
      required this.title,
      required this.onPressedSearch,
      this.onPressedNotification,
      required this.onPressedfavourite,
      required this.onChanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: mycontroller,
              decoration: InputDecoration(
                  hintText: title,
                  hintStyle: const TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: IconButton(
                    onPressed: onPressedSearch,
                    icon: const Icon(
                      Icons.search_off_outlined,
                    ),
                  )),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   padding: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(15)),
          //   child: IconButton(
          //     onPressed: onPressedNotification,
          //     icon: const Icon(
          //       Icons.notifications_active_outlined,
          //       size: 30,
          //     ),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              onPressed: onPressedfavourite,
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

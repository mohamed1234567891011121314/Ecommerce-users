import 'package:ecommerce/linkapi.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String nameproduct;
  final String priceproduct;
  final String numproduct;
  final String nameImage;
  final void Function() onAdd;
  final void Function() onRemove;
  const CustomItemsCartList(
      {super.key,
      required this.nameproduct,
      required this.priceproduct,
      required this.numproduct,
      required this.nameImage,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: [
          Expanded(
            flex: 2,
            child: FastCachedImage(url: '${AppLink.itemsimage}/${nameImage}'),
          ),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  nameproduct,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  '$priceproduct\$',
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
              )),
          Expanded(
            child: Column(
              children: [
                Container(
                    height: 40,
                    child: IconButton(
                        onPressed: onAdd, icon: const Icon(Icons.add))),
                Container(
                  height: 40,
                  child: Text(
                    numproduct,
                    style: TextStyle(fontSize: 25, color: Colors.black54),
                  ),
                ),
                Container(
                  height: 30,
                  child: IconButton(
                      onPressed: onRemove, icon: const Icon(Icons.remove)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

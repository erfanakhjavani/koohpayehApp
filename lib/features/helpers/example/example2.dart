import 'package:flutter/material.dart';

import '../../../api/list_store.dart';
import '../../../model/SellUserModel/storeListModel.dart';


class StoreListPage extends StatefulWidget {
  @override
  _StoreListPageState createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  late Future<List<storeListModel>> futureStores;

  @override
  void initState() {
    super.initState();
    futureStores = getData(); // فراخوانی تابع getData که قبلا تعریف کردید
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لیست فروشگاه‌ها'),
      ),
      body: FutureBuilder<List<storeListModel>>(
        future: futureStores,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].id.toString()),

                  subtitle: Text(snapshot.data![index].name),
                  // می‌توانید سایر فیلدها را نیز به همین شکل نمایش دهید
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

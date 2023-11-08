# Stocko (tapi mobile)

# Tugas 7

## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Stateless widget adalah widget yang memiliki <i>state</i> atau keadaan internal. Data widget ini tidak berubah sendiri ketika ada <i>action</i>. Stateless widget berubah ketika ada external events pada parent widget. Biasanya digunakan untuk merender tampilan yang tidak berubah sama sekali ketika program dijalankan.

Stateful widget adalah widget yang memiliki <i>state</i> atau keadaan internal. Keadaan widget berubah secara dinamis selama <i>lifetime</i>-nya. Widget bisa berubah apabila ada input data atau local state-nya berubah.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

- MyApp (stateless) - Widget root untuk aplikasi
- MyHomePage (stateless) - Widget untuk home page aplikasi
- Scaffold - widget untuk mengatur layout
- SnackBar - widget yang digunakan untuk menampilkan pesan ringkas di bagian bawah layar.
- Icon - widget untuk menampilkan ikon
- SingleChildScrollView - Widget untuk layar yang dapat di scroll

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step

1. Initialize flutter project

   ```
   flutter create stocko_tapi_mobile
   cd stocko_tapi_mobile
   ```

2. Menambah impor pada main.dart
   ```
   import 'package:flutter/material.dart';
   ```
3. Menghapus class \_MyHomePage state, memindahkan class MyHomePage ke file baru menu.dart. Setelah itu, impor package dari menu.dart

   ```
   import 'package:stocko_tapi_mobile/menu.dart';
   ```

4. Membuat class Shop Item pada menu.dart

   ```
   class ShopItem {
      final String name;
      final IconData icon;

      ShopItem(this.name, this.icon);
   }
   ```

5. Menambahkan list items pada class MyHomePage

   ```
   final List<ShopItem> items = [
      ShopItem("Lihat Produk", Icons.checklist),
      ShopItem("Tambah Produk", Icons.add_shopping_cart),
      ShopItem("Logout", Icons.logout),
   ];
   ```

6. Mengubah Widget build

   ```
   return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
   ```

7. Menambah class ShopCard

   ```
   class ShopCard extends StatelessWidget {
   final ShopItem item;

   const ShopCard(this.item, {super.key}); // Constructor

   @override
   Widget build(BuildContext context) {
      return Material(
         color: Colors.indigo,
         child: InkWell(
         // Area responsive terhadap sentuhan
         onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
               ..hideCurrentSnackBar()
               ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!")));
         },
         child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
               child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  Icon(
                     item.icon,
                     color: Colors.white,
                     size: 30.0,
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                     item.name,
                     textAlign: TextAlign.center,
                     style: const TextStyle(color: Colors.white),
                  ),
               ],
               ),
            ),
         ),
         ),
      );
   }
   }
   ```

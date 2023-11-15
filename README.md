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
- Column
- Padding
- ColorScheme
- AppBar
- GridView
- InkWell
- Container
- Material
- Text

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

<hr>
<br>

# Tugas 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Navigator.push() menambahkan sebuah <i>route</i> ke dalam <i>stack route</i> sehingga <i>route</i> yang di-<i>push</i> berada di paling atas <i>stack</i> dan muncul ke tampilan pengguna.

Navigator.pushReplacement() juga menambahkan sebuah <i>route</i> ke dalam <i>stack route</i>, tetapi <i>route</i> yang berada di paling atas <i>stack</i> dikeluarkan dan akhirnya digantikan oleh <i>route</i> baru yang ingin dimasukkan, sehingga <i>route</i> yang baru menggantikan <i>route</i> yang lama, bukan menambahkan <i>layer</i> baru di atasnya.

Contohnya ada pada tugas dan tutorial. Ketika kita baru masuk aplikasi, jika kita pindah ke halaman Add Product melalui button di menu utama, maka kita akan menambahkan <i>route</i> atau tampilan baru di atas halaman menu utama, sehingga ketika menekan tombol Back, kita akan kembali ke menu utama. Sementara itu, jika kita berpindah ke halaman Add Product dari halaman menu utama melalui Left Drawer, maka kita akan me-<i>replace</i> halaman utama pada <i>stack route</i>, sehingga setelah berpindah ke halaman Add Product jika kita menekan tombol Back maka kita akan keluar dari aplikasi.

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

- Container: Kita dapat menambahkan padding, margin, border, dan warna latar belakang seperti properti dalam widget ini dan kita dapat menyesuaikannya sesuai kebutuhan kita1.

- Row dan Column: Widget ini digunakan untuk menata sejumlah widget anak secara horizontal (Row) atau vertikal (Column). Anda dapat menentukan bagaimana widget anak harus ditempatkan dan berapa banyak ruang yang harus mereka tempati2.

- ListView: Untuk menampilkan anak-anaknya satu demi satu dalam arah scroll.

- Padding: Digunakan untuk memberikan jarak antara widget dan widget lainnya di sekelilingnya2.

- Align: Digunakan untuk menyelaraskan widget anaknya dalam dirinya sendiri dan secara opsional mengatur ukurannya berdasarkan ukuran anaknya2.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

- Nama: Nama dari produk yang ingin ditambahkan
- Amount: Jumlah produk yang ingin ditambahkan
- Price: Harga produk yang ingin ditambahkan
- Deskripsi: Deskripsi dari produk yang ingin ditambahkan

Semua input form dipasangkan validator di mana formnya wajib di isi. Khusus untuk Amount dan Price, karena berupa angka, maka ada validator untuk non-angka dan angka negatif juga di validatornya.

Keempat elemen input tersebut dipakai pada tugas ini karena sesuai dengan tugas aplikasi Django. Aplikasinya bertema tentang pengelolaan produk toko, jadi tiap produk harus memiliki nama, jumlah, harga, dan deskripsinya.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?

Dengan cara membagi aplikasi ke dalam beberapa layer, misalnya file menu.dart dan shoplist.dart dipindah ke folder screens. Beberapa layernya adalah layer Domain, aplikasi, infrastruktur, presentasi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

1. Membuat file shoplist_form.dart untuk halaman Add Product.

   ```
   import 'package:flutter/material.dart';

   class ShopFormPage extends StatefulWidget {
      const ShopFormPage({super.key});

      @override
      State<ShopFormPage> createState() => _ShopFormPageState();
   }

   class _ShopFormPageState extends State<ShopFormPage> {
      @override
      Widget build(BuildContext context) {
         return Scaffold();
      }
   }
   ```

2. Menambahkan elemen-elemen input form dan pop up ke dalam class ShopFormPageState

   ```
   class _ShopFormPageState extends State<ShopFormPage> {
   final _formKey = GlobalKey<FormState>();
   String _name = "";
   int _amount = 0;
   int _price = 0;
   String _description = "";
   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
         title: const Center(
            child: Text(
               'Add Product',
            ),
         ),
         backgroundColor: Colors.indigo,
         foregroundColor: Colors.white,
         ),
         body: Form(
         key: _formKey,
         child: SingleChildScrollView(
               child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
               decoration: InputDecoration(
                  hintText: "Product Name",
                  labelText: "Product Name",
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                  ),
               ),
               onChanged: (String? value) {
                  setState(() {
                     _name = value!;
                  });
               },
               validator: (String? value) {
                  if (value == null || value.isEmpty) {
                     return "Product name can't be empty!";
                  }
                  return null;
               },
               ),
            ),
            Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
               decoration: InputDecoration(
                  hintText: "Amount",
                  labelText: "Amount",
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                  ),
               ),
               onChanged: (String? value) {
                  setState(() {
                     _amount = int.parse(value!);
                  });
               },
               validator: (String? value) {
                  if (value == null || value.isEmpty) {
                     return "Amount can't be empty!";
                  }
                  if (int.tryParse(value) == null) {
                     return "Amount must be a number!";
                  }
                  if (int.parse(value) < 0) {
                     return "Amount must be positive number!";
                  }
                  return null;
               },
               ),
            ),
            Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
               decoration: InputDecoration(
                  hintText: "Price",
                  labelText: "Price",
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                  ),
               ),
               onChanged: (String? value) {
                  setState(() {
                     _price = int.parse(value!);
                  });
               },
               validator: (String? value) {
                  if (value == null || value.isEmpty) {
                     return "Price can't be empty!";
                  }
                  if (int.tryParse(value) == null) {
                     return "Price must be a number!";
                  }
                  if (int.parse(value) < 0) {
                     return "Price must be positive number!";
                  }
                  return null;
               },
               ),
            ),
            Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
               decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                  ),
               ),
               onChanged: (String? value) {
                  setState(() {
                     _description = value!;
                  });
               },
               validator: (String? value) {
                  if (value == null || value.isEmpty) {
                     return "Description can't be empty!";
                  }
                  return null;
               },
               ),
            ),
            Align(
               alignment: Alignment.bottomCenter,
               child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(
                  style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () {
                     if (_formKey.currentState!.validate()) {
                     showDialog(
                        context: context,
                        builder: (context) {
                           return AlertDialog(
                           title: const Text('Product saved!'),
                           content: SingleChildScrollView(
                              child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                 Text('Name: $_name'),
                                 Text('Amount: $_amount'),
                                 Text('Price: $_price'),
                                 Text('Description: $_description'),
                                 ],
                              ),
                           ),
                           actions: [
                              TextButton(
                                 child: const Text('OK'),
                                 onPressed: () {
                                 Navigator.pop(context);
                                 },
                              )
                           ],
                           );
                        },
                     );
                     _formKey.currentState!.reset();
                     }
                  },
                  child: const Text(
                     "Save",
                     style: TextStyle(color: Colors.white),
                  ),
               ),
               ),
            ),
         ])),
         ),
      );
   }
   }
   ```

   Pertama-tama tambahkan variable-variable yang diperlukan

   - \_formKey berfungsi sebagai <i>handler</i> dari <i>form state</i>
   - name, amount, price, dan description adalah variable untuk menerima masing-masing elemen input
   - Child dari body adalah sebuah SingleChildScrollView, dan child dari SingleChildScrollView-nya adalah Column() yang berisi masing-masing elemen input.
   - Masing-masing elemen input diberi onChanged untuk mengubah <i>state</i> dan validator untuk memvalidasi input
   - Button save dibungkus widget Align dan akan memunculkan pop-up dengan elevated button.

3. Menambahkan Left Drawer dengan membuat file left_drawer.dart

   ```
   import 'package:flutter/material.dart';
   import 'package:stocko_tapi_mobile/screens/menu.dart';
   import 'package:stocko_tapi_mobile/screens/shoplist_form.dart';

   class LeftDrawer extends StatelessWidget {
   const LeftDrawer({super.key});

   @override
   Widget build(BuildContext context) {
      return Drawer(
         child: ListView(
         children: [
            const DrawerHeader(
               decoration: BoxDecoration(
               color: Colors.indigo,
               ),
               child: Column(
               children: [
                  Text(
                     'Stocko',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                     fontSize: 30,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                     ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                     "Manage your stockos!",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
               ],
               ),
            ),
            ListTile(
               leading: const Icon(Icons.home_outlined),
               title: const Text('Home Page'),
               // Bagian redirection ke MyHomePage
               onTap: () {
               Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                     builder: (context) => MyHomePage(),
                     ));
               },
            ),
            ListTile(
               leading: const Icon(Icons.add_shopping_cart),
               title: const Text('Add Product'),
               onTap: () {
               Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                     builder: (context) => ShopFormPage(),
                     ));
               },
            ),
         ],
         ),
      );
   }
   }
   ```

   Masing-masing ListTile akan melakukan pushReplacement untuk mereplace halaman sekarang sesuai dengan apa yang ditekan pengguna dengan menambahkan Navigator.pushReplacement pada onTap

4. Menambahkan left drawer pada halaman utama dan halaman Add Product

   Pada kedua file (menu.dart dan shoplist_form.dart), tambahkan

   ```
   import 'package:stocko_tapi_mobile/widgets/left_drawer.dart';
   ```

   lalu tambahkan

   ```
   drawer: LeftDrawer(),
   ```

   pada Scaffold masing-masing file

5. Memindahkan class ShopItem dan ShopCard ke file sendiri, yaitu shop_card.dart

6. Menambahkan routing pada ShopCard untuk button Add Product

   ```
   if (item.name == "Add Product") {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ShopFormPage()));
            }
   ```

7. Memindahkan file menu.dart dan shoplist_form.dart ke folder lib/screens
8. Memindahkan file left_drawer.dart dan shop_card.dart ke folder lib/widgets

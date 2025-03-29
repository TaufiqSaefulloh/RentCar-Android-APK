import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Provider/CartProvider.dart';
import 'package:provider/provider.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _payController = TextEditingController();
  final TextEditingController _senderNameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String _selectedPayment = 'Transfer Bank';

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang Belanja")),
      body:
          cartItems.isEmpty
              ? const Center(
                child: Text(
                  "Keranjang Anda Kosong",
                  style: TextStyle(fontSize: 18),
                ),
              )
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Image.asset(
                              item.car.imageAsset,
                              width: 50,
                            ),
                            title: Text(item.car.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Harga: ${item.car.ticketPrice}"),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        if (item.quantity > 1) {
                                          cartProvider.updateQuantity(
                                            item.car,
                                            item.quantity - 1,
                                          );
                                        }
                                      },
                                    ),
                                    Text("${item.quantity}"),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        cartProvider.updateQuantity(
                                          item.car,
                                          item.quantity + 1,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                cartProvider.removeFromCart(item.car);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Input Nama
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: "Nama"),
                    ),
                    const SizedBox(height: 10),

                    // Input Tujuan
                    TextField(
                      controller: _destinationController,
                      decoration: const InputDecoration(labelText: "Tujuan"),
                    ),
                    const SizedBox(height: 10),

                    // Input Tanggal
                    TextField(
                      controller: _dateController,
                      decoration: const InputDecoration(labelText: "Tanggal"),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _dateController.text =
                                pickedDate.toLocal().toString().split(' ')[0];
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 10),

                    // Input No HP
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(labelText: "No HP"),
                    ),
                    const SizedBox(height: 10),
                    // Jumah Pembayaran
                    TextField(
                      controller: _payController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Jumlah Pembayaran",
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Dropdown Metode Pembayaran
                    DropdownButtonFormField<String>(
                      value: _selectedPayment,
                      decoration: const InputDecoration(
                        labelText: "Metode Pembayaran",
                      ),
                      items:
                          ['Transfer Bank', 'E-Wallet', 'Kartu Kredit', 'Tunai']
                              .map(
                                (payment) => DropdownMenuItem(
                                  value: payment,
                                  child: Text(payment),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPayment = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 10),

                    // Input Atas Nama Pengirim (Hanya jika bukan Tunai)
                    if (_selectedPayment != 'Tunai')
                      TextField(
                        controller: _senderNameController,
                        decoration: const InputDecoration(
                          labelText: "Atas Nama Pengirim",
                        ),
                      ),
                    const SizedBox(height: 20),

                    // Catatan Pelanggan
                    TextField(
                      controller: _noteController,
                      decoration: const InputDecoration(
                        labelText: "Catatan Pelanggan",
                        hintText:
                            "Ex: Bawa kembalian 10 ribu, Diskon Promo dll",
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tombol Cetak Struk
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _showReceiptDialog(context, cartItems);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        child: const Text(
                          "Cetak Struk",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

// MENAMPILKAN STRUK
  void _showReceiptDialog(BuildContext context, List<CartItem> cartItems) {
    // Ambil waktu sekarang dalam format yang mudah dibaca
    String formattedTime = DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(DateTime.now());
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                Image.asset("assets/logo/logo-2.png", width: 150),
                const SizedBox(height: 10),

                // Alamat & Kontak
                const Text(
                  "Jl. Contoh No. 123, Kota Anda\nTelp: 0812-3456-7890\nInstagram: @garasirentcar",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Divider(),

                // Informasi Pesanan
                ListBody(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detail Pesanan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...cartItems.map(
                          (item) => Text("${item.car.name} x ${item.quantity}"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Waktu",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formattedTime,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('nama:'), 
                        Text(_nameController.text)]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tujuan:'),
                        Text(_destinationController.text),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal:'),
                        Text(_dateController.text),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('No HP:'),
                        Text(_phoneController.text),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jumlah Pembayaran:'),
                        Text(_payController.text),
                      ],
                    ),
                    Row(  
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Metode Pembayaran:'),
                        Text(_selectedPayment),
                      ],
                    ),
                    if (_selectedPayment != 'Tunai')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Atas Nama Pengirim:'),
                        Text(_senderNameController.text),
                      ],
                    ),
                    const SizedBox(height: 10),
                    
                    Text(
                      "Catatan:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_noteController.text),
                    SizedBox(height: 10),
                  ],
                ),
                Text('Terima kasih atas pesanan anda!'),
              ],
            ),
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //       Provider.of<CartProvider>(context, listen: false).clearCart();
          //     },
          //     child: const Text("Print"),
          //   ),
          // ],
          actions: [
            TextButton(
              onPressed: () {
                _printReceipt(cartItems); // Panggil fungsi cetak
                Navigator.pop(context);
              },
              child: const Text("Print"),
            ),
          ],
        );
      },
    );
  }

  //CERAK STRUK
  void _printReceipt(List<CartItem> cartItems) async {
    BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

    // Cek apakah Bluetooth aktif
    bool? isConnected = await bluetooth.isConnected;
    if (isConnected == null || !isConnected) {
      List<BluetoothDevice> devices = await bluetooth.getBondedDevices();
      if (devices.isEmpty) {
        print("Tidak ada perangkat terhubung!");
        return;
      }

      await bluetooth.connect(devices.first); // Pilih printer pertama
    }

    // Format waktu
    String formattedTime = DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(DateTime.now());

    // Mulai cetak
    bluetooth.printNewLine();
    bluetooth.printImage("assets/logo/logo-2.png"); // Cetak logo
    bluetooth.printNewLine();
    bluetooth.printCustom("GARASI RENT CAR", 3, 1); // Judul
    bluetooth.printCustom("Jl. Contoh No. 123, Kota Anda", 1, 1);
    bluetooth.printCustom("Telp: 0812-3456-7890", 1, 1);
    bluetooth.printCustom("Instagram: @garasirentcar", 1, 1);
    bluetooth.printNewLine();
    bluetooth.printLeftRight("Waktu:", formattedTime, 1);
    bluetooth.printLeftRight("Nama:", _nameController.text, 1);
    bluetooth.printLeftRight("Tujuan:", _destinationController.text, 1);
    bluetooth.printLeftRight("Tanggal:", _dateController.text, 1);
    bluetooth.printLeftRight("No HP:", _phoneController.text, 1);
    bluetooth.printLeftRight("Total:", _payController.text, 1);
    bluetooth.printLeftRight("Metode:", _selectedPayment, 1);

    if (_selectedPayment != 'Tunai') {
      bluetooth.printLeftRight("Pengirim:", _senderNameController.text, 1);
    }

    bluetooth.printNewLine();
    bluetooth.printCustom("Detail Pesanan:", 2, 1);
    for (var item in cartItems) {
      bluetooth.printCustom("${item.car.name} x ${item.quantity}", 1, 1);
    }

    bluetooth.printNewLine();
    bluetooth.printCustom("Terima kasih atas pesanan Anda!", 2, 1);
    bluetooth.printNewLine();
    bluetooth.paperCut(); // Potong kertas jika printer mendukung

    print("Struk berhasil dicetak!");
  }

}

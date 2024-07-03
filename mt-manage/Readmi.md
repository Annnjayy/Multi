### Penjelasan Argumen dan Contoh Penggunaan

Kode di atas mendefinisikan CLI untuk mengelola berbagai jenis akun (SSH, NoobzVPN, dan berbagai jenis Xray) serta menyediakan fitur untuk memulai server API. Berikut adalah penjelasan mengenai argumen yang tersedia serta contoh penggunaannya.

### Struktur CLI

1. **Cli**: Struktur utama yang mencakup semua subcommand.
2. **Commands**: Enum yang mendefinisikan perintah-perintah utama yang bisa dijalankan.
3. **ServiceCommands, NoobzvpnCommands, XrayCommands**: Struktur yang menangani perintah spesifik untuk masing-masing jenis layanan.
4. **ServiceAction, NoobzvpnAction, XrayAction**: Enum yang mendefinisikan tindakan-tindakan yang dapat dilakukan pada masing-masing jenis layanan.
5. **ServiceOptions, NoobzvpnOptions, XrayOptions, UserOptions**: Struktur yang mendefinisikan opsi-opsi yang diperlukan untuk tindakan-tindakan tersebut.

### Argumen yang Tersedia

#### Commands
- **Ssh**: Mengelola akun SSH.
- **Noobzvpn**: Mengelola akun NoobzVPN.
- **Vmess**: Mengelola akun VMess.
- **Vless**: Mengelola akun VLess.
- **Trojan**: Mengelola akun Trojan.
- **Shadowsocks**: Mengelola akun Shadowsocks.
- **Serve**: Memulai server API dengan opsi `--port` untuk menentukan port.

#### ServiceCommands
- **Add**: Menambahkan akun baru.
- **Edit**: Mengedit akun yang ada.
- **Remove**: Menghapus akun yang ada.
- **Lock**: Mengunci akun.
- **Unlock**: Membuka kunci akun.

#### NoobzvpnCommands
- **Add**: Menambahkan akun baru.
- **Edit**: Mengedit akun yang ada.
- **Remove**: Menghapus akun yang ada.
- **Lock**: Mengunci akun.
- **Unlock**: Membuka kunci akun.

#### XrayCommands
- **Add**: Menambahkan akun baru.
- **Edit**: Mengedit akun yang ada.
- **Remove**: Menghapus akun yang ada.
- **Lock**: Mengunci akun.
- **Unlock**: Membuka kunci akun.

#### ServiceOptions
- **user**: Nama pengguna untuk akun.
- **pass**: Kata sandi untuk akun (default: "random").
- **exp**: Tanggal kadaluarsa (default: "360").
- **device**: Identifier perangkat (default: "999").

#### NoobzvpnOptions
- **user**: Nama pengguna untuk akun.
- **pass**: Kata sandi untuk akun (default: "random").
- **exp**: Tanggal kadaluarsa (default: "360").
- **device**: Identifier perangkat (default: "999").
- **bandwidth**: Batas bandwidth (default: "9999").

#### XrayOptions
- **types**: Jenis akun link (default: "all").
- **user**: Nama pengguna untuk akun.
- **uuid**: UUID untuk akun (default: "random").
- **exp**: Tanggal kadaluarsa (default: "360").
- **device**: Identifier perangkat (default: "999").
- **bandwidth**: Batas bandwidth (default: "9999").

#### UserOptions
- **user**: Nama pengguna untuk akun.

### Contoh Penggunaan

#### Menjalankan Server
Untuk memulai server API di port 2052 (atau port lain yang diinginkan):
```bash
cargo run -- serve --port 2052
```

#### Menambahkan Akun SSH
Untuk menambahkan akun SSH:
```bash
cargo run -- ssh add --user myuser --pass mypassword --exp 360 --device 999
```

#### Mengedit Akun SSH
Untuk mengedit akun SSH:
```bash
cargo run -- ssh edit --user myuser --pass newpassword --exp 360 --device 999
```

#### Menghapus Akun SSH
Untuk menghapus akun SSH:
```bash
cargo run -- ssh remove --user myuser
```

#### Mengunci Akun SSH
Untuk mengunci akun SSH:
```bash
cargo run -- ssh lock --user myuser
```

#### Membuka Kunci Akun SSH
Untuk membuka kunci akun SSH:
```bash
cargo run -- ssh unlock --user myuser
```

### Kesimpulan

Struktur CLI ini menyediakan cara yang komprehensif untuk mengelola berbagai jenis akun layanan melalui perintah baris. Pengguna dapat menambahkan, mengedit, menghapus, mengunci, dan membuka kunci akun dengan mudah menggunakan perintah yang sesuai. Selain itu, terdapat opsi untuk memulai server API untuk integrasi lebih lanjut dengan sistem lain.

### Penjelasan Argumen dan Contoh Penggunaan

CLI untuk mengelola berbagai jenis akun (SSH, NoobzVPN, dan berbagai jenis Xray) serta menyediakan fitur untuk memulai server API. Berikut adalah penjelasan mengenai argumen yang tersedia serta contoh penggunaannya.

### Argumen yang Tersedia
|Tunnel|Path|Command|
|--|--|--|
|SSH/OpenVPN|/ssh|✅|
|VMess|/vmess|✅|
|VLess|/vless|✅|
|Trojan|/trojan|✅|
|Shadowsocks|/shadowsocks|✅|

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
- **device**: Batas perangkat (default: "999").

#### NoobzvpnOptions
- **user**: Nama pengguna untuk akun.
- **pass**: Kata sandi untuk akun (default: "random").
- **exp**: Tanggal kadaluarsa (default: "360").
- **device**: Batas perangkat (default: "999").
- **bandwidth**: Batas bandwidth (default: "9999").

#### XrayOptions
- **types**: Jenis akun link [ all /ws / grpc ] (default: "all").
- **user**: Nama pengguna untuk akun.
- **uuid**: UUID untuk akun (default: "random").
- **exp**: Tanggal kadaluarsa (default: "360").
- **device**: Batas perangkat (default: "999").
- **bandwidth**: Batas bandwidth (default: "9999").

#### UserOptions
- **user**: Nama pengguna untuk akun.

### Contoh Penggunaan

#### Menjalankan Server
Untuk memulai server API di port 2052 (atau port lain yang diinginkan):
```bash
./mt-manage-cli serve --port 2052
```

#### Menambahkan Akun SSH
Untuk menambahkan akun SSH:
```bash
./mt-manage-cli ssh add --user myuser --pass mypassword --exp 360 --device 999
```

#### Mengedit Akun SSH
Untuk mengedit akun SSH:
```bash
./mt-manage-cli ssh edit --user myuser --pass newpassword --exp 360 --device 999
```

#### Menghapus Akun SSH
Untuk menghapus akun SSH:
```bash
./mt-manage-cli ssh remove --user myuser
```

#### Mengunci Akun SSH
Untuk mengunci akun SSH:
```bash
./mt-manage-cli ssh lock --user myuser
```

#### Membuka Kunci Akun SSH
Untuk membuka kunci akun SSH:
```bash
./mt-manage-cli ssh unlock --user myuser
```

### Kesimpulan

Struktur CLI ini menyediakan cara yang komprehensif untuk mengelola berbagai jenis akun layanan melalui perintah baris. Pengguna dapat menambahkan, mengedit, menghapus, mengunci, dan membuka kunci akun dengan mudah menggunakan perintah yang sesuai. Selain itu, terdapat opsi untuk memulai server API untuk integrasi lebih lanjut dengan sistem lain.

## Dokumentasi: mt-manage-cli

### Deskripsi
`mt-manage-cli` adalah antarmuka baris perintah (CLI) yang digunakan untuk mengelola berbagai layanan seperti akun SSH, Noobzvpn, dan Xray. Selain itu, CLI ini juga menyediakan server web API untuk mengelola akun melalui permintaan HTTP.

### Instalasi
Pastikan Anda memiliki Rust dan Cargo yang terinstal di sistem Anda. Clone repository dan build proyeknya:

```bash
git clone <repository_url>
cd <repository_directory>
cargo build --release
```

### Penggunaan CLI

#### Menampilkan Bantuan
Menampilkan bantuan umum untuk CLI:
```bash
./mt-manage-cli --help
```
Menampilkan bantuan untuk subperintah:
```bash
./mt-manage-cli <command> --help
```

#### Perintah
1. **SSH**
   - Menambah akun SSH:
     ```bash
     ./mt-manage-cli ssh add --user <username> --pass <password> --exp <expiration_date> --device <device_id>
     ```
   - Mengedit akun SSH:
     ```bash
     ./mt-manage-cli ssh edit --user <username> --pass <password> --exp <expiration_date> --device <device_id>
     ```
   - Menghapus akun SSH:
     ```bash
     ./mt-manage-cli ssh remove --user <username>
     ```
   - Mengunci akun SSH:
     ```bash
     ./mt-manage-cli ssh lock --user <username>
     ```
   - Membuka kunci akun SSH:
     ```bash
     ./mt-manage-cli ssh unlock --user <username>
     ```

2. **Noobzvpn**
   - Menambah akun Noobzvpn:
     ```bash
     ./mt-manage-cli noobzvpn add --user <username> --pass <password> --exp <expiration_date> --device <device_id> --bandwidth <bandwidth_limit>
     ```
   - Mengedit akun Noobzvpn:
     ```bash
     ./mt-manage-cli noobzvpn edit --user <username> --pass <password> --exp <expiration_date> --device <device_id> --bandwidth <bandwidth_limit>
     ```
   - Menghapus akun Noobzvpn:
     ```bash
     ./mt-manage-cli noobzvpn remove --user <username>
     ```
   - Mengunci akun Noobzvpn:
     ```bash
     ./mt-manage-cli noobzvpn lock --user <username>
     ```
   - Membuka kunci akun Noobzvpn:
     ```bash
     ./mt-manage-cli noobzvpn unlock --user <username>
     ```

3. **Xray (Vmess, Vless, Trojan, Shadowsocks)**
   - Menambah akun Xray:
     ```bash
     ./mt-manage-cli vmess add --user <username> --uuid <uuid> --exp <expiration_date> --device <device_id> --bandwidth <bandwidth_limit>
     ```
   - Mengedit akun Xray:
     ```bash
     ./mt-manage-cli vmess edit --user <username> --uuid <uuid> --exp <expiration_date> --device <device_id> --bandwidth <bandwidth_limit>
     ```
   - Menghapus akun Xray:
     ```bash
     ./mt-manage-cli vmess remove --user <username>
     ```
   - Mengunci akun Xray:
     ```bash
     ./mt-manage-cli vmess lock --user <username>
     ```
   - Membuka kunci akun Xray:
     ```bash
     ./mt-manage-cli vmess unlock --user <username>
     ```

4. **Menjalankan Server API**
   Untuk memulai server API pada port tertentu:
   ```bash
   ./mt-manage-cli serve --port <port_number>
   ```

### Penggunaan API

#### Menambah Akun
Endpoint: `POST /{service}/add`
Body (JSON):
```json
{
  "user": "username",
  "pass": "password",
  "exp": "expiration_date",
  "device": "device_id",
  "bandwidth": "bandwidth_limit"
}
```

#### Mengedit Akun
Endpoint: `POST /{service}/edit`
Body (JSON):
```json
{
  "user": "username",
  "pass": "password",
  "exp": "expiration_date",
  "device": "device_id",
  "bandwidth": "bandwidth_limit"
}
```

#### Menghapus Akun
Endpoint: `POST /{service}/remove`
Body (JSON):
```json
{
  "user": "username"
}
```

#### Mengunci Akun
Endpoint: `POST /{service}/lock`
Body (JSON):
```json
{
  "user": "username"
}
```

#### Membuka Kunci Akun
Endpoint: `POST /{service}/unlock`
Body (JSON):
```json
{
  "user": "username"
}
```

### Kesimpulan
`mt-manage-cli` adalah alat serbaguna untuk mengelola berbagai jenis layanan VPN dan SSH baik melalui baris perintah maupun API web. Dengan dokumentasi ini, pengguna dapat menambah, mengedit, menghapus, mengunci, dan membuka kunci akun dengan mudah. Server API juga memungkinkan integrasi dengan aplikasi lain untuk mengelola akun secara otomatis.

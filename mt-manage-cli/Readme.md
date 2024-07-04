### Deskripsi
`mt-manage-cli` adalah antarmuka baris perintah (CLI) yang digunakan untuk mengelola berbagai layanan seperti akun SSH, Noobzvpn, dan Xray. Selain itu, CLI ini juga menyediakan server web API untuk mengelola akun melalui permintaan HTTP.

### Penggunaan CLI

| Command |
|--|
| ssh |
| noobzvpn |
| vmmess |
| vless |
| trojan |
| shadowsocks |
| serve |

| Action | Req_Options |
|--|--|
| add | all opts |
| edit | all opts |
| remove | --user |
| lock | --user |
| unlock | --user |

| Options | Informasi | For_Command |
|--|--|--|
| --port | Port for the API Web server | for serve |
| --types | Types for the account link ( all / ws / grpc ) | for xray ( vmess, vless, trojan, shadowsocks ) |
| --user | Username for the all service | for xray ( vmess, vless, trojan, shadowsocks ) |
| --pass | Password for the account | for ssh & noobzvpn |
| --uuid | UUID [v4] for the account | for xray ( vmess, vless, trojan, shadowsocks ) |
| -e | Expiration date | for all service |
| -d | Device Limit | for all service |
| -b | Bandwidth Limit | for noobzvpn & xray ( vmess, vless, trojan, shadowsocks ) |

#### Menampilkan Bantuan
Menampilkan bantuan umum untuk CLI:
```bash
./mt-manage-cli --help
```
Menampilkan bantuan untuk service:
```bash
./mt-manage-cli <command> --help
```
Menampilkan bantuan untuk Aksi service:
```bash
./mt-manage-cli <command> <action> --help
```

```USAGE
Usage: ./mt-manage-cli [command] [action] [options]

[action]:
add [opts] [..] : add new account.
edit [opts] [..] : edit existing account.
remove [opts] [..] : remove existing account.
lock [opts] [..] : locking existing account.
unlock [opts] [..] : unlocking existing account.

[opts]:
--port <PORT_API> : give port for the API Web server, default: 2052 .
--types <TYPE_XRAY> : give the account xray link type, default: all .
--user <USERNAME> : give the account username.
--pass <PASSWORD> : give the account password.
--uuid <UUID V4> : give the account uuid, default: random .
-e, <DAYS> : give the account expiration, default: 360 .
-d, <UNITS> : give the allowed max login device, default: 999 = unlimited.
-b, <GIGA_BYTES> : give the allowed max bandwidth, default: 9999 = unlimited.
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
Berikut ini adalah contoh penggunaan dan bagaimana cara memanggil endpoint untuk menambahkan akun melalui API mt-manage-cli:

|Service|Path|Command|
|--|--|--|
|SSH/OpenVPN|/ssh|✅|
|Noobzvps|/noobzvpn|✅||
|VMess|/vmess|✅|
|VLess|/vless|✅|
|Trojan|/trojan|✅|
|Shadowsocks|/shadowsocks|✅|

1. Menjalankan Server
   Pertama, Anda perlu menjalankan server Anda. Pastikan Anda sudah mengompilasi dan menjalankan program Anda dengan perintah:
   ```bash
   ./mt-manage-cli serve --port 2052
   ```

2. Mengirimkan Permintaan & Respon JSON
   Gunakan alat seperti `curl`, Postman, atau alat lain untuk mengirimkan permintaan POST ke endpoint yang telah Anda tentukan. Berikut ini adalah contoh menggunakan `curl`:

   - Menambahkan akun SSH:
     ```bash
     curl -X POST http://localhost:2052/ssh/add -H "Content-Type: application/json" -d '{ "user": "username", "pass": "password", "exp": "360", "device": "999" }'
     ```

   Jika permintaan berhasil, Anda akan menerima respon dalam format JSON seperti ini:
   ```json
   {
        "service": "ssh"
        "user": <user>
        "pass": <pass>
        "exp_date": <date>
        "iplim": <iplim>
        "status": "unlock"
   }
   ```

   - Menambahkan akun Noobzvpn:
     ```bash
     curl -X POST http://localhost:2052/noobzvpn/add -H "Content-Type: application/json" -d '{ "user": "username", "pass": "password", "exp": "360", "device": "999", "bandwidth": "9999" }'
     ```

   Jika permintaan berhasil, Anda akan menerima respon dalam format JSON seperti ini:
   ```json
   {
        "service": "noobzvpn"
        "user": <user>
        "pass": <pass>
        "exp_date": <date>
        "iplim": <iplim>
        "quota": <quota>
        "status": "unlock"
   }
   ```

   - Menambahkan akun Xray (misalnya vmess):
     ```bash
     curl -X POST http://localhost:2052/vmess/add -H "Content-Type: application/json" -d '{ "types": "all", "user": "username", "uuid": "random", "exp": "360", "device": "999", "bandwidth": "9999" }'
     ```

   Jika permintaan berhasil, Anda akan menerima respon dalam format JSON seperti ini:
   ```json
   {
        "service": <service>
        "types": "all"
        "user": <user>
        "uuid": <uuid>
        "exp_date": <date>
        "iplim": <iplim>
        "quota": <quota>
        "status": "unlock"
   }
   ```

3. Contoh Endpoint Lainnya
   Anda juga bisa menggunakan endpoint lain seperti mengedit, menghapus, mengunci, atau membuka kunci akun. Contoh permintaan untuk menghapus akun:
   ```bash
   curl -X POST http://localhost:2052/ssh/remove -H "Content-Type: application/json" -d '{ "user": "username" }'
   ```

   Jika permintaan berhasil, Anda akan menerima respon seperti ini:
   ```json
   {
        "message": "Removed ssh account for user: <username>"
   }
   ```

### Kesimpulan
Dengan menggunakan pendekatan ini, Anda bisa mengelola akun-akun Anda melalui API dengan endpoint yang sesuai. Pastikan server Anda berjalan dan endpoint sudah benar sebelum mengirim permintaan.

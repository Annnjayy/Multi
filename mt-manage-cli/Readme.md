# mt-manage-cli

`mt-manage-cli` adalah antarmuka baris perintah (CLI) yang digunakan untuk mengelola berbagai layanan seperti akun SSH, Noobzvpn, dan Xray. Selain itu, CLI ini juga menyediakan server web API untuk mengelola akun melalui permintaan HTTP.

## Penggunaan CLI

| Command | Deskripsi |
|--|--|
| `ssh` | Mengelola akun SSH |
| `noobzvpn` | Mengelola akun Noobzvpn |
| `vmess` | Mengelola akun VMess |
| `vless` | Mengelola akun VLess |
| `trojan` | Mengelola akun Trojan |
| `shadowsocks` | Mengelola akun Shadowsocks |
| `serve` | Menjalankan server API Web |

| Action | Req_Options |
|--|--|
| `add` | Semua opsi kecuali `--port` |
| `edit` | `-e`, `-d`, `-b` |
| `remove` | `--user` |
| `lock` | `--user` |
| `unlock` | `--user` |

| Options | Informasi | For_Command | default_value |
|--|--|--|--|
| `--port` | Port untuk server API Web | Untuk `serve` | 2052 |
| `--types` | Tipe link untuk akun Xray (`all`/`ws`/`grpc`) | Untuk Xray (`vmess`, `vless`, `trojan`, `shadowsocks`) | all |
| `--user` | Username untuk semua layanan | Untuk Xray (`vmess`, `vless`, `trojan`, `shadowsocks`) | |
| `--pass` | Password untuk akun | Untuk `ssh` & `noobzvpn` | |
| `--uuid` | UUID [v4] untuk akun | Untuk Xray (`vmess`, `vless`, `trojan`, `shadowsocks`) | random |
| `-e` | Tanggal kadaluarsa | Untuk semua layanan | 360 |
| `-d` | Batas perangkat | Untuk semua layanan | 999 |
| `-b` | Batas bandwidth | Untuk `noobzvpn` & Xray (`vmess`, `vless`, `trojan`, `shadowsocks`) | 9999 |

### Menampilkan Bantuan
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

### Penggunaan

```USAGE
Usage: ./mt-manage-cli [command] [action] [opts]

[command]:
ssh [action] [..] : Mengelola akun SSH.
noobzvpn [action] [..] : Mengelola akun Noobzvpn.
vmess [action] [..] : Mengelola akun VMess.
vless [action] [..] : Mengelola akun VLess.
trojan [action] [..] : Mengelola akun Trojan.
shadowsocks [action] [..] : Mengelola akun Shadowsocks.
serve [opts] [..] : Menjalankan server API Web.

[action]:
add [opts] [..] : Menambah akun baru.
edit [opts] [..] : Mengedit akun yang sudah ada.
remove [opts] [..] : Menghapus akun yang sudah ada.
lock [opts] [..] : Mengunci akun yang sudah ada.
unlock [opts] [..] : Membuka kunci akun yang sudah ada.

[opts]:
--port <PORT_API> : Menentukan port untuk server API Web, default: 2052.
--types <TYPE_XRAY> : Menentukan tipe link akun Xray, default: all.
--user <USERNAME> : Menentukan username akun.
--pass <PASSWORD> : Menentukan password akun.
--uuid <UUID V4> : Menentukan UUID akun, default: random.
-e, <DAYS> : Menentukan masa kadaluarsa akun, default: 360 hari.
-d, <UNITS> : Menentukan batas perangkat maksimal, default: 999 (unlimited).
-b, <GIGA_BYTES> : Menentukan batas bandwidth, default: 9999 (unlimited).
```

### Contoh Penggunaan Perintah

#### SSH
- Menambah akun SSH:
  ```bash
  ./mt-manage-cli ssh add --user <username> --pass <password> -e <expiration_date> -d <device_limit>
  ```
- Mengedit akun SSH:
  ```bash
  ./mt-manage-cli ssh edit --user <username> --pass <password> -e <expiration_date> -d <device_limit>
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

#### Noobzvpn
- Menambah akun Noobzvpn:
  ```bash
  ./mt-manage-cli noobzvpn add --user <username> --pass <password> -e <expiration_date> -d <device_limit> -b <bandwidth_limit>
  ```
- Mengedit akun Noobzvpn:
  ```bash
  ./mt-manage-cli noobzvpn edit --user <username> --pass <password> -e <expiration_date> -d <device_limit> -b <bandwidth_limit>
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

#### Xray (Vmess, Vless, Trojan, Shadowsocks)
- Menambah akun Xray:
  ```bash
  ./mt-manage-cli vmess add --user <username> --uuid <uuid> -e <expiration_date> -d <device_limit> -b <bandwidth_limit>
  ```
- Mengedit akun Xray:
  ```bash
  ./mt-manage-cli vmess edit --user <username> --uuid <uuid> -e <expiration_date> -d <device_limit> -b <bandwidth_limit>
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

#### Menjalankan Server API
Untuk memulai server API pada port tertentu:
```bash
./mt-manage-cli serve --port <port_number>
```

### Penggunaan API
Berikut ini adalah contoh penggunaan dan bagaimana cara memanggil endpoint untuk menambahkan akun melalui API `mt-manage-cli`:

| Service | Path | Command |
|--|--|--|
| SSH/OpenVPN | /ssh | ✅ |
| Noobzvpn | /noobzvpn | ✅ |
| VMess | /vmess | ✅ |
| VLess | /vless | ✅ |
| Trojan | /trojan | ✅ |
| Shadowsocks | /shadowsocks | ✅ |

Contoh `config.json`
```json
{
    "apikey": "<api_token>"
    "token": "<bot_token>"
    "admin": [
      "<id_tele>",
      "xxx"
    ]
}
```

1. Menjalankan Server
   Pastikan Anda sudah mengompilasi dan menjalankan program Anda dengan perintah:
   ```bash
   ./mt-manage-cli serve --port 2052
   ```

2. Mengirimkan Permintaan & Respon JSON
   Gunakan alat seperti `curl`, Postman, atau alat lain untuk mengirimkan permintaan POST ke endpoint yang telah Anda tentukan. Berikut ini adalah contoh menggunakan `curl`:

   - Menambahkan akun SSH:
     ```bash
     curl -X POST http://localhost:2052/ssh/add -H "Content-Type: application/json" -H "Authorization: Bearer <my_token>" -d '{ "user": "username", "pass": "password", "exp": "360", "device": "999" }'
     ```
   Jika permintaan berhasil, Anda akan menerima respon dalam format JSON seperti ini:
   ```json
   {
        "service": "ssh",
        "user": "username",
        "pass": "password",
        "exp_date": "360",
        "iplim": "999",
        "status": "unlock"
   }
   ```

   - Menambahkan akun Noobzvpn:
     ```bash
     curl -X POST http://localhost:2052/noobzvpn/add -H "Content-Type: application/json" -H "Authorization: Bearer <my_token>" -d '{ "user": "username", "pass": "password", "exp": "360", "device": "999", "bandwidth": "9999" }'
     ```
Jika permintaan berhasil, Anda akan menerima respon dalam format JSON seperti ini:
```json
{
    "service": "noobzvpn",
    "user": "username",
    "pass": "password",
    "exp_date": "360",
    "iplim": "999",
    "quota": "9999",
    "status": "unlock"
}
```

- Menambahkan akun Xray (misalnya VMess):
  ```bash
  curl -X POST http://localhost:2052/vmess/add -H "Content-Type: application/json" -H "Authorization: Bearer <my_token>" -d '{ "types": "all", "user": "username", "uuid": "random", "exp": "360", "device": "999", "bandwidth": "9999" }'
  ```
  Jika permintaan berhasil, Anda akan menerima respon dalam format JSON seperti ini:
  ```json
  {
      "service": "vmess",
      "types": "all",
      "user": "username",
      "uuid": "random",
      "exp_date": "360",
      "iplim": "999",
      "quota": "9999",
      "status": "unlock"
  }
  ```

### Contoh Endpoint Lainnya
Anda juga bisa menggunakan endpoint lain seperti mengedit, menghapus, mengunci, atau membuka kunci akun. Contoh permintaan untuk menghapus akun:
```bash
curl -X POST http://localhost:2052/ssh/remove -H "Content-Type: application/json" -H "Authorization: Bearer <my_token>" -d '{ "user": "username" }'
```
Jika permintaan berhasil, Anda akan menerima respon seperti ini:
```json
{
    "message": "Successfully removed ssh account for user: username",
    "status": "success"
}
```
Jika user tidak ada, Anda akan menerima respon seperti ini:
```json
{
    "message": "User username does not exist.",
    "status": "error"
}
```

### Kesimpulan
Dengan menggunakan pendekatan ini, Anda bisa mengelola akun-akun Anda melalui API dengan endpoint yang sesuai. Pastikan server Anda berjalan dan endpoint sudah benar sebelum mengirim permintaan.

## Lisensi
Proyek ini dilisensikan di bawah MIT License. Lihat file [LICENSE](LICENSE) untuk informasi lebih lanjut.

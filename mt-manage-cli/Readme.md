Berikut ini adalah contoh penggunaan dan bagaimana cara memanggil endpoint untuk menambahkan akun melalui API mt-manage-cli:

|Tunnel|Path|Command|
|--|--|--|
|SSH/OpenVPN|/ssh|✅|
|VMess|/vmess|✅|
|VLess|/vless|✅|
|Trojan|/trojan|✅|
|Shadowsocks|/shadowsocks|✅|

### 1. Menjalankan Server
Pertama, Anda perlu menjalankan server Anda. Pastikan Anda sudah mengompilasi dan menjalankan program Anda dengan perintah:
```bash
./mt-manage-cli serve --port 2052
```

### 2. Mengirimkan Permintaan & Respon JSON
Gunakan alat seperti `curl`, Postman, atau alat lain untuk mengirimkan permintaan POST ke endpoint yang telah Anda tentukan. Berikut ini adalah contoh menggunakan `curl`:

#### SSH Account
Untuk menambahkan akun SSH:
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

#### Noobzvpn Account
Untuk menambahkan akun Noobzvpn:
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

#### Xray Account (vmess, vless, trojan, shadowsocks)
Untuk menambahkan akun Xray (misalnya vmess):
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

### 3. Contoh Endpoint Lainnya
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

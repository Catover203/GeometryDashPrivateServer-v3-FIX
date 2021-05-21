# GMDprivateServer
## Geometry Dash Private Server fix v3
Basically a Geometry Dash Server Emulator

Supported version of Geometry Dash: 1.0 - 2.11 (sometime i will add more file to support 2.2 version) (so any version of Geometry Dash works, as of fix this [20/4/2020])

Required version of PHP: 5.4+ (tested up to 7.3.11)

### Setup
1) Upload the files on a webserver
2) ChMod the data directory to 777
3) Import database.sql into a MySQL/MariaDB database
4) ->PC:Edit the links in GeometryDash.exe (some are base64 encoded since 2.1, remember that)

   ->Android : edit link using hex editor to edit lib2coco.so with base64 then replace this file to apk using apk editor
   
### Credits
Base for account settings and the private messaging system by someguy28

Using this for XOR encryption - https://github.com/sathoro/php-xor-cipher - (incl/lib/XORCipher.php)

Using this for cloud save encryption - https://github.com/defuse/php-encryption - (incl/lib/defuse-crypto.phar)

Jscolor (color picker in packCreate.php) - http://jscolor.com/

Using this for Send Mail - https://github.com/Catover203/CatBoomMailer - (accounts/Mail/)

Fix Gdps by Catover203 and suport elder mod, email, reset passsword, ect...

Most of the stuff in generateHash.php has been figured out by pavlukivan and Italian APK Downloader, so credits to them

* Based on [Cvolton's Private Server](https://github.com/Cvolton/GMDprivateServer) and [DonAlex0's Private Server](https://github.com/DonAlex0/GMDPrivateServer)

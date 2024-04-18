# SOAL Implementasi 1 Backend Developer

# Base Code Laravel Restful API

Rest API ini terdapat Login, Manage User, Manage Conntact, Manage Address. Base Code ini dapat digunakan untuk kebutuhan Aplikasi Anda yang memiliki fitur dasar seperti yang disebutkan.
Authorization menggunakan uuid yang di generate menjadi token dan digunakan ketika melakukan request di tiap endpoint.
## Versi Laravel
10.2.5

## Instalasi

Berikut adalah langkah-langkah untuk menginstal dan menjalankan proyek ini secara lokal. Pastikan Anda memiliki PHP, Composer, dan MySQL atau database yang sesuai diinstal di komputer Anda sebelum melanjutkan.

1. **Clone Repository:**
   git clone https://github.com/dwiarmandhani/laravel-rest-api.git
2. **Masuk Direktori**
    cd nama-repositori
3. **Install Dependencies**
    composer install
4. **Salin File ENV**
   cp .env.example .env
5. **Config ENV**
   Buka file .env dan atur pengaturan database sesuai dengan lingkungan lokal Anda (nama database, pengguna, kata sandi, dll.).
   Konfikurasi saya:
   DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=laravel_resftul_api
    DB_USERNAME=root
    DB_PASSWORD=
6. **Generate Key Aplikasi**
   php artisan key:generate
7. **Jalankan Migrasi dan Seeder**
   php artisan migrate --seed
8. **Jalankan Server Lokal**
   php artisan serve

## Documentasi Swagger
Anda dapat membukanya dalam file di bawah ini:
User : /docs/user-api.json
Contact : /docs/contact-api.json
Address : /docs/address-api.json

## Sample Request
1. Register User API
POST http://localhost:8000/api/users
Content-Type: application/json
Accept: application/json

{
    "username" : "mustdwi_admin",
    "password": "@aduhlupa123",
    "name": "Dwi Armandhani Admin"
}

2. Login User API
POST http://localhost:8000/api/users/login
Content-Type: application/json
Accept: application/json

{
    "username": "mustdwi",
    "password": "@aduhlupa123"
}

3. Get Current User API
GET http://localhost:8000/api/users/current
Accept: application/json
Authorization: 8829eb90-96df-403a-ad09-2cc2ec957898

4. Update Current User API
PATCH http://localhost:8000/api/users/current
Content-Type: application/json
Accept: application/json
Authorization: 8829eb90-96df-403a-ad09-2cc2ec957898

{
    "name" : "Mas Dwi"
}

5. Logout User API
DELETE http://localhost:8000/api/users/logout
Accept: application/json
Authorization: 8829eb90-96df-403a-ad09-2cc2ec957898

6. Create Contact API
POST http://localhost:8000/api/contacts
Content-Type: application/json
Accept: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

{
    "first_name" : "Dwi",
    "last_name" : "Sumiati",
    "email" : "dwi@gmail.com",
    "phone" : "085721813979"
}

7. GEt Contact API #249
GET http://localhost:8000/api/contacts/2300
Accept: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

8. Update Contact API #249
PUT http://localhost:8000/api/contacts/2300
Accept: application/json
Content-Type: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

{
    "first_name" : "Budi",
    "last_name" : "Anduk",
    "email" : "dwi@gmail.com",
    "phone" : "08572181397"
}

9. Delete Contact API #249
DELETE http://localhost:8000/api/contacts/2300
Accept: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

10. Search Contact API
GET http://localhost:8000/api/contacts?email=dwi
Accept: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

11. Create Address API #250
POST http://localhost:8000/api/contacts/2302/addresses
Accept: application/json
Content-Type: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

{
    "street": "Jalan Kenangan Manis",
    "city" : "Saranjana",
    "province": "Saranjana Utara",
    "country": "Saranjanan",
    "postal_code": "40000"
}

12. Get Address API #25
GET http://localhost:8000/api/contacts/2301/addresses/52
Accept: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

13. Update Address API #25
PUT http://localhost:8000/api/contacts/2301/addresses/52
Accept: application/json
Content-Type: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

{
    "street": "jalan melati Raya",
    "city" : "Bandung",
    "province": "dki jakarta",
    "country": "indonesia",
    "postal_code": "324234"
}

14. Remove Address API 
DELETE http://localhost:8000/api/contacts/25/addresses/24
Accept: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

15. List Address API
GET http://localhost:8000/api/contacts/250/addresses
Accept: application/json
Authorization: 496d6e25-f43a-47db-b3ee-80deb8ebe3d1

### UNIT TESTING

**Tests\Feature\AddressTest**
  ✓ create success                                          
  ✓ create failed                                           
  ✓ create contact not found                                
  ✓ get success                                             
  ✓ get not found                                           
  ✓ update success                                          
  ✓ update failed                                           
  ✓ update not found                                        
  ✓ delete success                                          
  ✓ delete not found                                        
  ✓ list success                                            
  ✓ list contact not found                                  

**Tests\Feature\ContactTest**
  ✓ create success                                         
  ✓ create failed                                          
  ✓ create unauthorized                                    
  ✓ get success                                            
  ✓ get not found                                          
  ✓ get other user contact                                 
  ✓ update success                                         
  ✓ update validation error                                
  ✓ delete success                                         
  ✓ delete not found                                       
  ✓ search by first name                                   
  ✓ search by last name                                    
  ✓ search by email                                        
  ✓ search by phone                                        
  ✓ search not found                                       
  ✓ search with page                                       

**Tests\Feature\UserTest**
  ✓ register success                                        
  ✓ register failed                                         
  ✓ register username already exists                        
  ✓ login success                                           
  ✓ login failed username not found                         
  ✓ get success                                             
  ✓ get unauthorized                                        
  ✓ get invalid token                                       
  ✓ update password success                                 
  ✓ update name success                                     
  ✓ update failed                                           
  ✓ logout success                                          
  ✓ logout failed

  
<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

You may also try the [Laravel Bootcamp](https://bootcamp.laravel.com), where you will be guided through building a modern Laravel application from scratch.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 2000 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell).

### Premium Partners

- **[Vehikl](https://vehikl.com/)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Cubet Techno Labs](https://cubettech.com)**
- **[Cyber-Duck](https://cyber-duck.co.uk)**
- **[Many](https://www.many.co.uk)**
- **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
- **[DevSquad](https://devsquad.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel/)**
- **[OP.GG](https://op.gg)**
- **[WebReinvent](https://webreinvent.com/?utm_source=laravel&utm_medium=github&utm_campaign=patreon-sponsors)**
- **[Lendio](https://lendio.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).



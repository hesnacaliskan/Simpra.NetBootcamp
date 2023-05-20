# Hafta 2 Ödevi

Simpra .Net Bootcamp'i kapsamında ikinci haftanın ödevi olarak bizden içerisinde GET,POST,PUT ve DELETE metotları bulunan bir Web API projesi yapmamız istendi. Bu proje Onion Architecture ve Generic Repository Design Pattern kullanılarak tasarlanmıştır. "Staff" adlı entity sınıfı oluşturulmuş, üzerinde CRUD işlemleri gerçekleştirilmiştir. Ek olarak GetWhere() metodu ile name ve country propertyleri üzerinden filtreleme yapılmıştır. Validation yöntemi olarak Fluent Validation tercih edilmiştir. Projenin yapısı aşağıdaki gibidir:

![Ekran görüntüsü 2023-05-18 232602](https://github.com/P259-Simpra-NET-Bootcamp/aw2-hesnacaliskan/assets/56639245/ff056c6e-34e4-430d-a091-6df61fce33e8)


# Projede Kullanınan Teknolojiler
* .Net 6
* MSSQL
* Swagger UI
* Entity Framework Code First
* Generic Repository Desing Pattern
* Fluent Validation
* Onion Architecture

# Projenin Yapısı
## *Onion Architecture*
![Nedir-Bu-Onion-Architecture](https://github.com/P259-Simpra-NET-Bootcamp/aw2-hesnacaliskan/assets/56639245/62285155-463c-43f7-a522-a2f3940b8303)

Görüldüğü üzere Onion Architecture’da katmanlar iç içe dairesel şekilde seyretmektedir. Görüntüsü Onion’a yani Soğan’a benzediği için bu ismi almıştır. Hatta görüntüden ziyade işlevsel açıdan her bir katmanın sadece bir içteki katmana bağımlılık göstermesi gözde soğan anatomisini canlandırdığı için bu şekilde sıfatlandırılmıştır diyebiliriz.

Onion Architecture’da her katmanın daha merkezi katmanlara bağlılığı temel ilkedir. Bu durum merkezi katmanların dıştaki katmanlara bağlılık sergilememesini gerektirir. Yani bağlılık yine tek yönlüdür. Lakin bu sefer içe doğrudur. Bu da, herhangi bir katmanda yapılan değişikliğin içe doğru bir bağlayıcılığı olmadığı için merkeze doğru olan katmanları etkilemeyeceği lakin dıştaki katmanları etkileyeceği anlamına gelecektir.

Yukarıdaki görseli detaylandırırsak eğer içten dışa doğru;

* **Domain Entities/Domain/Core Katmanı**

   Mimarinin merkezi katmanıdır. Tüm uygulama için olan Domain ve veritabanı entity’leri bu katmanda oluşturulur.
  * *Entities*

    ORM araçları tarafından kullanılan ve veritabanındaki tabloları temsil eden sınıflardır. *(En önemli)

  * *Value Object*
  
    Kimliksiz ve immutable(değişmez) olan nesnelerdir.
    
  * *Enumeration*
  
  * *Exceptions*

    Domain için oluşturulan exception sınıflarıdır.

* **Repository&Service Interfaces/Core Katmanı**

  Bu katman, Domain katmanı ile uygulamanın iş/business/service katmanı arasında bir soyutlama katmanıdır. Repository olsun, service olsun tüm arayüzler burada tanımlanır. Amaç veri         erişiminde Gevşek Bağlı(Loose Coupling) bir yaklaşım sergilemektir. Domain katmanını referans eder. Gerekli arayüzlerle birlikte uygulamanın geneline hitap edecek tüm objeler bu katmanda   tanımlanır.

  * *Custom Exception*
    
    Kişiselleştirilmiş exception sınıflarıdır.

  * *Response Object*
  * *Request Parameters Object*
  * *DTO Objects*
  * *ViewModels Objects*
  * *Interfaces(Repository, UnitOfWork)*
  * *Mapping*
     
     CQRS tasarım kalıbı kullanılır.
  * *Validators*

>Onion Architecture’da Repository & Service Interfaces katmanı bir bütün olarak Application isminde nitelendirilebilmektedir. Aynı şekilde, Domain ve Application katmanlarıda bütünsel olarak Core yani çekirdek katmanı olarak nitelendirilmektedirler.

* **Persistence Katmanı**

  DbContext, migration ve veritabanı konfigürasyon işlemleri bu katmanda gerçekleştirilir. Ayrıca Application katmanındaki interface’ler burada implemente edilir.
  * *DbContext*
  * *Migrations*
  * *Configurations*
  * *Seeding*
  * *Interface Implementation*
     
     Özellikle repository ve unit of work gibi desenlerin concrete nesneleri burada oluşturulur.

  En dış katman olduğu için bu katmana herhangi bir katman bağımlılık göstermeyecektir.

* **Infrastructure Katmanı**
  
  Esasında Persistence katmanı bu katmanla bütünleşik olarak kullanılmaktadır. Genellikle sisteme eklenecek dış/external yapılanmalar bu katmanda dahil edilir. Haliyle bu katmanda diğer en   dış katman olduğu için herhangi bir katman tarafından bağlılık olmamalıdır.
  * *Email/Sms*
  * *Notification*
  * *Payment*

* **Presentation Katmanı**

  Kullanıcının uygulama ile iletişime geçtiği katmandır.
  * *Console App.*
  * *Web App.*
  * *MVC*
  * *Web API*

  En üst katmandır diyebiliriz.

>Onion Architecture, Clean Architecture uygulayabilmek için kullanılan tasarım kalıplarından biridir.

## *Entity Framework Code First*

Projede veri tabanı ile bağlantı code first yaklaşımı ile yapılmıştır. Buradaki amaç veritabanı arayüzü ile etkileşimi minimize etmektir. Entity framework Code First yaklaşımının en büyük avantajı projedeki modeli tam hakimiyetle istediğimiz şekilde kullanmaktır. Code First yaklaşımım aşağıdaki şekildedir:

![codefirst](https://github.com/P259-Simpra-NET-Bootcamp/aw2-hesnacaliskan/assets/56639245/226087d4-8aee-42e0-84d9-cae2557eb4a7)

## *Generic Repository Desing Patern*

Bildiğiniz üzere her model için bazı ortak işlemler vardır. Biz bu ortak işlemlere kısaca CRUD (Create, Read, Update, Delete) işlemler diyebiliriz. Kod tekrarına düşmemek adına, tüm modeller için kullanılabilir ortak bir yapı oluşturmalıyız. Generic Repository Design Pattern, “generic” kelimesinden de anlaşılacağı gibi bu “genel” yapıyı oluşturmamızı sağlıyor. Yani, ortak işlemlerimiz için genel bir yapı kurup, her bir modelin bu genel yapı üzerinden o işlemi gerçekleştirmesini sağlıyor. Böylece, kod tekrarlarından kaçınırken, gelecekteki değişiklikler için efor sarfetmemizi gerektirmeyecek bir yapı oluşturulmuş oluyor. Ben projeme aşağıdaki gibi implement ettim: 

![repository](https://github.com/P259-Simpra-NET-Bootcamp/aw2-hesnacaliskan/assets/56639245/3529d84d-e9e4-4623-bb8f-b3583b5fba0a)

## *Fluent Validation*

FluentValidation bir veri doğrulama kütüphanesidir. FluentValidation ve benzeri ürünlerin kullanılması, verilerin doğru şekilde yani verilerin oluştururken konulmuş kısıtlamaları sağlayarak kurallara uyumlu halde olmasını ve kullanıcı ya da sistem kaynaklı hataların oluşmasını engeller. Bu kütühaneyi proje içerisinde PUT ve POST metodları için aşağıdaki gibi kullandım:

![validation](https://github.com/P259-Simpra-NET-Bootcamp/aw2-hesnacaliskan/assets/56639245/aa998aa0-9e0e-48f4-8884-949fabc84001)

# Nasıl Kurulur?
1. Öncelikle projeyi klonlamak istediğiniz dosyada terminali açınız ve aşağıdaki kodu yazınız.

```bash
git clone https://github.com/P259-Simpra-NET-Bootcamp/aw2-hesnacaliskan.git
```

2. Projeyi cloneladıktan sonra Visual Studio programında açınız. Visual Studio Code programını kullananlar aşağıdaki kodu terminale yazarak da açabilirler.

Linux için:
```linux
cd aw2-hesnacaliskan
code .
```
3. Veritabanını baştan oluşturmanıza gerek yoktur. Repo içerisinde yer alan "script.sql" dosyasını Microsoft SQL Server Managemnet içerisinde açmanız, script içerisinde de bulunan aynı isimde yeni bir veritabanı oluşturduktan sonra script dosyasını execute etmeniz yeterlidir.

4.  Son olarak veritabanı işlemlerini gerçekleştirebilmek için proje içerisinde "appsettings.json" dosyasında yer alan  connection string'teki "Server" ve "Database" adını kendi server adınız ve belirlediğiniz veritabanı adı ile değiştirmeniz gerekmektedir.

![connectionstring](https://github.com/P259-Simpra-NET-Bootcamp/aw2-hesnacaliskan/assets/56639245/02d5ed6e-a645-4f84-81a4-4959fe3e2c4e)

# Katkı

Pull requestler kabul edilir. Büyük değişiklikler için, lütfen önce neyi değiştirmek istediğinizi tartışmak için bir konu açınız.



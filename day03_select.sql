/* ======================= SELECT - WHERE ==================================*/    
    CREATE TABLE ogrenciler
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)    
    
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
    SELECT * FROM ogrenciler;
    
    /* ============================================================================
   Verileri SELECT komutu ile veritabanýndan çekerken filtreleme yapmak için 
   
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanýlabilir. 
   
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adýWHERE koþul;
==============================================================================*/
  
       
    /* -----------------------------------------------------------------------------
  ORNEK1: Sýnav notu 80'den büyük olan öðrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM ogrenciler
    WHERE sinav_notu>80;
    
    -----notu 80 den buyuk olanlarin isim ve not bilgilerini listeleme
    SELECT isim ,sinav_notu
    FROM ogrencýler
    WHERE sinav_notu>80;
    
     /* -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan öðrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM ogrenciler
    WHERE adres = 'Ankara';
    
     /* ----------------------------------------------------------------------------
  ORNEK3: id'si 124 olan öðrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
    SELECT * FROM ogrenciler
    WHERE id = 124;
    
    /*
=                   ==> Esit mi
>                   ==> Buyuk mu ?
<                   ==> Kucuk mu ?
>=                ==> Buyuk esit mi ?
<=                ==> Kucuk esit mi ?
<>                ==> Esit degil mi ?
AND            ==> Ve Operator'u
OR               ==> Veya Operator'u
BETWEEN  ==> Belirtilen degerler arasindaki veriler icin
IN                 ==> Bir sutun icin bir cok uygun kosulu secmek icin
LIKE            ==> belirli bir patter'ni aramak icin */

-----------------------------------------------------------------------------

   CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yilmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayse Can', 4000);

    SELECT * FROM personel;
    
    
    /*=============================BETWEEN===============================*/
     -- NOT:BETWEEN iki mantýksal ifade ile tanýmlayabileceðimiz durumlarý 
    -- tek komutla yazabilme imkâný verir. Yazdýðýmýz 2 sýnýr da aralýða dahildir.
    
    
    /* -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 arasýnda olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
    
    --1.yontem(and)
    SELECT * FROM personel
    WHERE id>='10002' and id<='10005'; --char kullanildigi icin tirnak icerisinde yazdik
    
    --2.yontem(between)
    SELECT id,isim
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; --alt ve ust limitler dahil
    
    /* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yýlmaz ile Veli Han arasýndaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim BETWEEN 'Mehmet Yilmaz' AND 'Veli Han';
    
    /*-----------------------------------------------------------------------------
  ORNEK6: id’si 10002 - 10004 arasýnda olmayan personelin bilgilerini listele
-------------------------------------------------------------------------------*/ 
    FROM * SELECT personel
    WHERE id NOT BETWEEN '10002' AND '10004;
    
    /*=================== IN ===============================================
     IN birden fazla mantýksal ifade ile tanýmlayabileceðimiz durumlarý 
    tek komutla yazabilme imkâný verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adý
    WHERE sutun_adý IN (deger1, deger2, ...);
 ========================================================================== */
    
    /* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
    
    SELECT * FROM personel
    WHERE id = '10001' OR id = '10002' OR id = '10004';
    
    --in yontemi ile ayni soruyu cozelim
    
    SELECT * FROM personel
    WHERE id IN('10001','10002','10004');
    
    /* -----------------------------------------------------------------------------
  ORNEK8: Maaþý sadece 7000  ve 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas IN(7000,12000);
    
    /*========================= LIKE =================================
     NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak saðlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adýWHERE sütunN LIKE pattern
    
    PATTERN ÝÇÝN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
    
    -->'_li'      son ii harfi li olan                           ali
    -->'_li%'     2. ve 3. harfleri li olan                      aliye
    -->'_a%y%'    2 harfi a ortada y olan bir isim               bahtiyar
    -->'__r___'   3 haf r olan 6 haneli bir isim                 karaca
    
    LIKE TA % YUZDE ISATERINE PATTERN DENIR
    
        
============================================================================ */
    
    /* -----------------------------------------------------------------------------
  ORNEK9:  ismi A harfi ile baþlayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel 
    WHERE isim LIKE 'A%';
    
    --ISMI 7 HANELI OLANLARI GOSTER
    
    SELECT * FROM personel
    WHERE isim LIKE '_______'; --MERYEM in arkasinda bir space bosluk var bu sebeple 7 cizgi yapinca onu yazdirdi
    
    /* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
    
     /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanlarý listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM
    WHERE isim LIKE '_e%';
    
    /* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diðer harflerinde y olanlarý listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '_e%y%';
    
    --maasinin son iki hanesi 00 olan personel listele
    
    SELECT * FROM personel
    WHERE maas LIKE '%00';
    
    --1.harfi A ve 7.harfi A OLAN PERSONEL
    
    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';
    
    --isminde an kelimesi olanlar
    
     SELECT * FROM personel
    WHERE isim LIKE '%an%';
    
    --maasi 5 basamkli olanlari goster
    SELECT * FROM personel
    WHERE maas LIKE '_____';
    
    /* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile baþlamayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';

/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';
    
    -- maasi 4 basamaki olmayanlari goster
    
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
    
    /*======================= SELECT - REGEXP_LIKE ================================
    Daha karmaþýk pattern ile sorgulama iþlemi için REGEXP_LIKE kullanýlabilir. 
    Syntax:
    --------
    REGEXP_LIKE(sutun_adý, ‘pattern[] ’, ‘c’ ] )
           
========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    SELECT * FROM kelimeler;
    
    /* -----------------------------------------------------------------------------
  ORNEK21: Ýçerisinde 'hi' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    --icerisinde herhangi bir yerde h veya i bulunan kelimeler
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]'); --[]veya anlamina geliyor binevi.
    
    --icerisinde herhangi bir yerde h veya i bulunan kelimeleri sorgulayiniz.
    --veya islemi | karakteri ile yapilir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi' 'i'); --'i' case sensitive olmadan buyuk kucuk herseyi gosterir
                                          --'c' case sensitive bakiyor
    
    --hi veya ho ile baslayan kelimeleri sorgulayiniz.
    --baslama islemi ^ karakteri ile yapilir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^hi|^ho');
    
    --t veya m ile biten kelimeleri buyuk kucuk harf duyarsiz sekilde listeleyiniz
    --bitis icin $ isareti kullanilir
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'t$|m$','i');
    
    -- h ile baþlayýp t ile biten 3 harfli kelimeleri büyük-küçük harfe
    -- dikkat etmeksizin listeleyeniz
    -- -(tire) karakteri bir aralik verir
    -- [] tek bir karakter gosterir ve veya gibi baglar
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'^h[a-z0-9]t$','i'); --[burada a dan z ye veya 0 dan 9 a kadar] bir karakter yaz anlamindadir
    
    --Ilk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli
    -- kelimelerin tüm bilgilerini sorgulayalým.
    
     SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'^h[ai]t$','i');
    
    --icerisinde m veya i veya e olan kelimelerin tum bilgilerini listeleyin
    --like taki yuzde isareti gibi buada da gerisi ne olursa olsun demek icin *(yildiz) kullanilir
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'[mie](*)');
    
    --içerisinde en az 2 adet oo barýdýran kelimelerin tüm bilgilerini
   --listeleyiniz.
   --{} suslu parantez tekrarli harf icin kullanilir
   
   SELECT * FROM kelimeler
   WHERE REGEXP_LIKE (kelime,'[o]{2}','i');
   
   SELECT * FROM kelimeler
   WHERE REGEXP_LIKE (kelime,'[a]{2}','i');
    

    
    
    

    
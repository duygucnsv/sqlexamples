/*===============DELETE=======================*/

--DELETE FROM tablo_adi; tablonun tum icerigini siler 
--bu komut bir DML komutudur.Dolayisiyla devaminda WHERE gib cumlecikler kullanilir

--DELETE FROM tablo_adi
--WHERE sutun_adi = veri;  sart gerceklestiginde ilgili satiri sileriz
--secerek sýlmek ýcýn WHERE keyword kullanilir

    CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3)       
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);

    SELECT * FROM ogrenciler;
  
    
    --id si 124 olan ogrenciyi silin
    DELETE FROM ogrenciler
    WHERE id =124;
    
    --adi Kemal Yasa olan kaydi silin
    DELETE FROM ogrenciler
    WHERE isim = 'Kemal Yasa';
    
    --adi Nesibe Yilmaz ve Mustafa Bak olan kayitlari silelim
    
    DELETE FROM ogrenciler
    WHERE isim = 'Nesibe Yilmaz' OR isim = 'Mustafa Bak';
    
    --ismi Ali Can olan ve ýd sý 123 olan kaydý sýlýniz
    DELETE FROM ogrenciler
    WHERE isim ='Ali Can' AND id = 123;
    
    --id si 126 dan buyuk olanlari silelim
    DELETE FROM ogrenciler 
    WHERE id > 126;
    
     --id si 123,125 ve 126 olanlari silelim
    DELETE FROM ogrenciler 
    WHERE id IN (123,125,126);
    
    --TABLODAKI HERSEYI SILELIM
    DELETE FROM ogrenciler;
    /* ======================== DELETE - TRUCATE - DROP ============================   
    
    1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamýný siler.
    Ancak, seçmeli silme yapamaz. Çünkü Truncate komutu DML deðil DDL komutudur. 
    
    2-) DELETE komutu beraberinde WHERE cümleciði kullanýlabilir. TRUNCATE ile 
    kullanýlmaz.
    
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylýkla geri 
    alýnabilir.
    
    4-) Truncate ile silinen veriler geri alýnmasý daha zordur. Ancak
    Transaction yöntemi ile geri alýnmasý mümkün olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. Silinen tablo Veritabanýnýn geri dönüþüm kutusuna gider. Silinen 
    tablo aþaðýdaki komut ile geri alýnabilir. Veya SQL GUI'den geri alýnabilir. 
        
     FLASHBACK TABLE tablo_adý TO BEFORE DROP;  -> tabloyu geri alýr.
     
     PURGE TABLE tablo_adý;        -> Geri dönüþümdeki tabloyu siler.
            
     DROP TABLE tablo_adý PURGE;  -> Tabloyu tamamen siler
==============================================================================*/ 
    
    SELECT * FROM ogrenciler;
    
    ROLLBACK ;
    
    --DROP TABLE ogrenciler; --tabloyu siler.DDL komutudur.
    DROP TABLE ogrenciler; --tabloyu siler ve veritabaninin cop kutsuna gonderir
    
    FLASHBACK TABLE ogrenciler TO BEFORE DROP; --COP kutusunda olan tabloyu geri getirir
    
    DROP TABLE ogrenciler PURGE; --tamamen siler (shift delete gibi) cop kutusuna atmaz
    
    
/*========================== TRUNCATE ======================================*/

--DELETE gibi tum verileri siler.Secmeli silme yapamaz (DDL komutudur)
--Truncate ile silme yapildiginsa ROL BACK ile geri alma yapilamaz 
--Hassas silme islemi yapar
/*DROP ==> Tabloyu siler DDL
DELETE ==> Tablo içeriðini siler DML
TRUNCATE ==> Delete gibi içeriði siler ama DDL DÝR */
 TRUNCATE TABLE ogrenciler; --tum verileri hassas bir sekilde siler
 SELECT * FROM ogrencýler;
 
-------------------------------------------------------------------------------


/*=======Tablolar arasinda bir iliski varsa veri nasil silinebilir============*/

 CREATE TABLE talebeler
    (
        id CHAR(3), --pk
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3),
        CONSTRAINT talebe_pk PRIMARY KEY (id)
    );
    
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

     CREATE TABLE notlar 
    ( 
        talebe_id char(3), --fk
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE
    ); 
/*============================== ON DELETE CASCADE =============================

  Her defasýnda önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliðini aktif hale getirebiliriz.
  
  Bunun için FK olan satýrýn en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  --ON DELETE CASCADE
  --Parent daki silinen bir kayýt ile iliþkili olan child kayýtlarýný siler

==============================================================================*/ 

    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('124', 'fizik',75);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);
    
    SELECT * FROM talebeler;
    SELECT * FROM notlar;
    
    DELETE FROM notlar --notlar child oldugu icin once bunun silinip sonra parent olan talebeleri siler
    WHERE talebe_id = 124;
    
    DELETE FROM talebeler
    WHERE id = 124;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
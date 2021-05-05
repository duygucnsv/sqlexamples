/*===============DELETE=======================*/

--DELETE FROM tablo_adi; tablonun tum icerigini siler 
--bu komut bir DML komutudur.Dolayisiyla devaminda WHERE gib cumlecikler kullanilir

--DELETE FROM tablo_adi
--WHERE sutun_adi = veri;  sart gerceklestiginde ilgili satiri sileriz
--secerek s�lmek �c�n WHERE keyword kullanilir

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
    
    --ismi Ali Can olan ve �d s� 123 olan kayd� s�l�niz
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
    
    1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamam�n� siler.
    Ancak, se�meli silme yapamaz. ��nk� Truncate komutu DML de�il DDL komutudur. 
    
    2-) DELETE komutu beraberinde WHERE c�mleci�i kullan�labilir. TRUNCATE ile 
    kullan�lmaz.
    
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolayl�kla geri 
    al�nabilir.
    
    4-) Truncate ile silinen veriler geri al�nmas� daha zordur. Ancak
    Transaction y�ntemi ile geri al�nmas� m�mk�n olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. Silinen tablo Veritaban�n�n geri d�n���m kutusuna gider. Silinen 
    tablo a�a��daki komut ile geri al�nabilir. Veya SQL GUI'den geri al�nabilir. 
        
     FLASHBACK TABLE tablo_ad� TO BEFORE DROP;  -> tabloyu geri al�r.
     
     PURGE TABLE tablo_ad�;        -> Geri d�n���mdeki tabloyu siler.
            
     DROP TABLE tablo_ad� PURGE;  -> Tabloyu tamamen siler
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
DELETE ==> Tablo i�eri�ini siler DML
TRUNCATE ==> Delete gibi i�eri�i siler ama DDL D�R */
 TRUNCATE TABLE ogrenciler; --tum verileri hassas bir sekilde siler
 SELECT * FROM ogrenc�ler;
 
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

  Her defas�nda �nce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme �zelli�ini aktif hale getirebiliriz.
  
  Bunun i�in FK olan sat�r�n en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  --ON DELETE CASCADE
  --Parent daki silinen bir kay�t ile ili�kili olan child kay�tlar�n� siler

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

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
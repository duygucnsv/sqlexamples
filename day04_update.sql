/* ============================== UPDATE SET ===================================    
    
 �lk olarak a�a��daki gibi tedarikciler ad�nda bir tablo olu�turunu ve 
   vergi_no sutununu primary key yap�n�z.Ayrica a���daki verileri tabloya giriniz.

    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
	INSERT INTO tedarikciler VALUES (102, 'Huawei', '�in Li');
	INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonras�nda a�a��daki gibi urunler ad�nda bir ba�ka tablo olu�turunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutular�
    yard�m�yla ili�ki kurunuz. Verileri giriniz.

    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay�e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y�lmaz');
    
==============================================================================*/  

    CREATE TABLE tedarikciler
    (
        vergi_no NUMBER(3),
        firma_ismi VARCHAR2(50),
        irtibat_ismi VARCHAR2(50),
        CONSTRAINT pk_ted PRIMARY KEY (verg�_no)
    );
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
	INSERT INTO tedarikciler VALUES (102, 'Huawei', '�in Li');
	INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
   
    
    CREATE TABLE urunler
    (
       ted_vergino NUMBER(3), 
       urun_id NUMBER(11), 
       urun_isim VARCHAR2(50), 
       musteri_isim VARCHAR2(50),
       CONSTRAINT fk_urunler FOREIGN KEY (ted_vergino) REFERENCES tedarikciler(vergi_no)
    );
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay�e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y�lmaz');
    
     SELECT * FROM tedarikciler;
     SELECT * FROM urunler;
     
     --SYNTAX
     ----------
    /* UPDATE tablo_adi
     SET sutun_adi = yeni_deger
     WHERE sutun_adi ;
     */
     
 -----------------------------------------------------------------------------
 -- ORNEK1: vergi_no�su 101 olan tedarikcinin ismini �LG� olarak guncelleyiniz
-----------------------------------------------------------------------------

    UPDATE tedar�kc�ler
    SET firma_ismi = 'LG' 
    WHERE vergi_no= 101;
    
    SELECT * FROM tedarikciler;
     SELECT * FROM urunler;
/*----------------------------------------------------------------------------
ornek2: tedarikciler tablosundaki tum firma isimlerini 'samsung'olarak guncelleyiniz
------------------------------------------------------------------------------*/
     UPDATE tedar�kc�ler
    SET firma_ismi = 'SAMSUNG';
    
   
    DELETE FROM tedarikciler;
    --tabloyu degilde tablonun icerigini siler
    
    --drop table tablou siler
    
    
/*--------------------------------------------------------
    ORNEK 3 : vergi nosu 102 olan tedarikcinin  ismini 'samsung' ve irtibat_ismi'ni
    'ali veli' olarak GUNCELLEYINIz
    --------------------------------------------------------------*/ 
    
    UPDATE tedarikciler
    SET firma_ismi = 'Samsung', irtibat_ismi = 'Ali Veli'
    WHERE vergi_no = 102;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
    /* -----------------------------------------------------------------------------
  ORNEK4: ismi Samsung olan tedarikcinin irtibat_ismini �Ay�e Y�lmaz� olarak
  g�ncelleyiniz.
 -----------------------------------------------------------------------------*/
 
    UPDATE tedarikciler
    SET irtibat_ismi = 'Ayse Yilmaz'
    WHERE firma_ismi = 'Samsung';
    
    
  /* ----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki �Phone� de�erlerini Telefon olarak g�ncelleyiniz.
 -----------------------------------------------------------------------------*/ 
 
   UPDATE urunler
   SET urun_isim= 'Telefon' 
   WHERE urun_isim = 'Phone';
   
 /*-----------------------------------------------------------------------------
  ORNEK6: urunler tablosundaki urun_id de�eri 1004'ten b�y�k olanlar�n urun_id
  de�erlerini bir artt�r�n�z
 -----------------------------------------------------------------------------*/
 
   UPDATE urunler
   SET urun_id = urun_id + 1 
   WHERE urun_�d > 1004;
   
   
/* -----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki t�m �r�nlerin urun_id de�erini ted_vergino
  sutun de�erleri ile toplayarak g�ncelleyiniz.
-----------------------------------------------------------------------------*/

    UPDATE urunler
    SET urun_id = urun_id + ted_vergino;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
/*============================================================================
   ORNEK6: urunler tablosundan Ali Bak�in aldigi urunun ismini, tedarikci
   tablosunda irtibat_ismi �Adam Eve� olan firman�n ismi (firma_ismi) ile
   degistiriniz.    
==============================================================================*/ 
    UPDATE urunler
    SET  urun_isim = (SELECT firma_ismi FROM tedarikciler
                     WHERE irtibat_ismi = 'Adam Eve')    
    WHERE musteri_isim = 'Ali Bak';
    
/*==============================================================================
   ORNEK7: Laptop satin alan musterilerin ismini, Apple�in irtibat_isim�i ile
   degistirin
==============================================================================*/
    UPDATE urunler
    SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler
                       WHERE firma_ismi = 'Apple')
    WHERE urun_isim = 'Laptop';
    
    
     
     
     
     
    
    
    
    
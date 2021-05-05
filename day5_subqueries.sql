/* ============================= SUBQUERIES ====================================
    SORGU içinde çalýþan SORGUYA SUBQUERY (ALT SORGU) denilir.
==============================================================================*/

     CREATE TABLE personel2
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20)
    );
    INSERT INTO personel2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
    INSERT INTO personel2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
    INSERT INTO personel2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
    INSERT INTO personel2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
    INSERT INTO personel2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
    INSERT INTO personel2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
    INSERT INTO personel2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
    
    CREATE TABLE sirketler
    (
        sirket_id NUMBER(9), 
        sirket_adi VARCHAR2(20), 
        personel_sayisi NUMBER(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Honda', 12000);
    INSERT INTO sirketler VALUES(101, 'Ford', 18000);
    INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
    INSERT INTO sirketler VALUES(103, 'Toyota', 21000);


SELECT *FROM sirketler;
SELECT * FROM personel2;



/* -----------------------------------------------------------------------------
  ORNEK1: Personel sayýsý 15.000’den cok olan sirketlerin isimlerini(bu kisim aLT sorgu oluyor) ve bu
  sirkette calisan personelin isimlerini(bu kisimda ASIL sorgu oluyor) listeleyin
-----------------------------------------------------------------------------*/

    SELECT isim, sirket, maas
    FROM personel2
    WHERE sirket IN( SELECT sirket_adi
    FROM sirketler
    WHERE personel_sayisi>15000
    );
    
   -- WHERE isim IN(personel.isim = sirketler.isim)
   
/* -----------------------------------------------------------------------------
  ORNEK2: sirket_id’si 101’den büyük olan þirket çalýþanlarýnýn isim, maaþ ve
  þehirlerini listeleyiniz.
-----------------------------------------------------------------------------*/

    SELECT isim,maas,sehir FROM personel2
    WHERE sirket IN (SELECT sirket_id FROM sirketler
                     WHERE sirket_id>101);
                     
/* -----------------------------------------------------------------------------
  ORNEK3:  Ankara’da personeli olan þirketlerin þirket id’lerini ve personel
  sayýlarýný listeleyiniz
-----------------------------------------------------------------------------*/
   
    SELECT sirket_id,personel_sayisi FROM sýrketler
    WHERE sirket_adi IN( SELECT sirket FROM personel2
                        WHERE sehýr = 'Ankara');
                        
/* -----------------------------------------------------------------------------
  ORNEK4: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  toplam maaþýný listeleyen bir Sorgu yazýnýz.
 -------------------------------------------------------------*/
 
         
 /* ===================== AGGREGATE METOT KULLANIMI ===========================
   
    Aggregate Metotlarý(SUM,COUNT, MIN,MAX, AVG) Subquery içinde kullanýlabilir.
    Ancak, Sorgu tek bir deðer döndüryor olmalýdýr.
    
 =============================================================================*/
 
    SELECT sirket_adi,personel_sayisi, (SELECT SUM(maas) FROM personel2
                                       WHERE sirket = sirketler.sirket_adi) AS toplam_maas
    FROM sirketler;
    
/*-----------------------------------------------------------------------------
  ORNEK5: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  ortalama maaþýný listeleyen bir Sorgu yazýnýz.
-----------------------------------------------------------------------------*/
    
    SELECT sirket_adi,personel_sayisi, (SELECT ROUND(AVG(maas),1) FROM personel2
                                       WHERE sirket = sirketler.sirket_adi) AS ortalama_maas
    FROM sirketler;
    
/*----------------------------------------------------------------------------
  ORNEK6: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  maksimum ve minumum maaþýný listeleyen bir Sorgu yazýnýz.
 -----------------------------------------------------------------------------*/ 
    SELECT sirket_adi,personel_sayisi, 
    (SELECT MIN(maas) FROM personel2 WHERE sirket = sirketler.sirket_adi) AS min_maas,
    (SELECT MAX(maas) FROM personel2 WHERE sirket = sirketler.sirket_adi) AS max_maas
                                       
    FROM sirketler;
    
/* -----------------------------------------------------------------------------
  ORNEK8: Her sirketin id’sini, ismini ve toplam kaç þehirde bulunduðunu 
  listeleyen bir SORGU yazýnýz.
 -------------------------------------------------------------------------*/
 
    SELECT sirket_id, sirket_adi, 
              (SELECT COUNT(sehir) FROM personel2
               WHERE sirket = sirketler.sirket_adi) AS sehir_sayisi
    
    FROM sirketler;
    







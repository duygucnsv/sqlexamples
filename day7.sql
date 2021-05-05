/*============================= GROUP BY =====================================
    
    GROUP BY cümleciði bir SELECT ifadesinde satýrlarý, sutunlarýn deðerlerine 
    göre özet olarak gruplamak için kullanýlýr. 
   
    GROUP BY cümleceði her grup baþýna bir satýr döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlarý ile birlikte kullanýlýr.
    
==============================================================================*/ 
      
    CREATE TABLE manav 
    (
        isim varchar2(50), 
        urun_adi varchar2(50), 
        urun_miktari number(15) 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', '', 2);
    
/* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satýlan toplam meyve miktarlarýný gösteren sorguyu 
  yazýnýz.
------------------------------------------------------------------------------*/  
    SELECT isim, SUM(urun_miktari) AS toplam_urun 
    FROM manav
    GROUP BY isim;
   
/* ----------------------------------------------------------------------------
  ORNEK2: satýlan meyve türüne (urun_adi) göre urun alan kiþi sayýsýný gösteren
  sorguyu yazýnýz. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
    -- GROUP by ile birlikte WHERE cümleciði kullanýlabilir.
        
    SELECT urun_adi, COUNT(isim) AS kisi_sayisi
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi

/* ----------------------------------------------------------------------------
  ORNEK3: satýlan meyve türüne (urun_adi) göre satýlan MIN ve MAX urun
  miktarlarini MAX urun miktarina göre sýralayarak listeyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/

    SELECT urun_adi, MIN(urun_miktari) min_miktar, MAX(urun_miktari) max_miktar
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi
    ORDER BY MAX(urun_miktari);
    
 /* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adýna göre satýlan ürünlerin toplamýný
  gruplandýran ve isime göre ters sýrasýda listeyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/

     SELECT isim,urun_adi, SUM(urun_miktari) AS toplam_miktar
     FROM manav
     GROUP BY isim,urun_adi
     ORDER BY isim DESC;
     
/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adýna göre satýlan ürünlerin toplamýný bulan ve
  ve bu toplam deðeri 3 ve fazlasi olan kayitlari toplam urun miktarina gore 
  ters siralayarak listeyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
    
     SELECT isim,urun_adi, SUM(urun_miktari) AS toplam_miktar
     FROM manav     
     GROUP BY isim,urun_adi
     HAVING SUM(urun_miktari) >= 3
     ORDER BY SUM(urun_miktari) DESC;
    
    ---- AGGREGATE fonksiyonlarý ile ilgili bir koþul koymak için GROUP BY’dan
    -- sonra HAVING cümleciði kullanýlýr.
    
/* ----------------------------------------------------------------------------
  ORNEK6: satýlan urun_adi’na göre MAX urun sayýlarýný sýralayarak listeyen
  sorguyu yazýnýz. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarýna
  eþit olmayan kayýtlarý listelemelidir.
-----------------------------------------------------------------------------*/

     SELECT urun_adi, MAX(urun_miktari)
     FROM manav
     GROUP BY urun_adi
     HAVING MAX(urun_miktari) <> MIN(urun_miktari)
     ORDER BY MAX(urun_miktari);
     
 /*============================= DISTINCT =====================================
   
    DISTINCT cümleciði bir SORGU ifadesinde benzer olan satýrlarý flitrelemek
    için kullanýlýr. Dolayýsýyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satýrlar oluþturmaya yarar.
  
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, sutun_adi_3
    FROM  tablo_adý;
==============================================================================*/

/* ----------------------------------------------------------------------------
  ORNEK1: satýlan farklý meyve türlerinin sayýsýný  listeyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/

     SELECT COUNT(DISTINCT urun_adi) as urun_sayýsý
     FROM manav;
     
/* ===========================================================================
ORNEK 2 satilan meyve ve isimlerin farklý olanlarýný listeleyen sorguyu yazýnýz
=============================================================================*/     
     
     SELECT DISTINCT isim,urun_adi --iki sutun icin beraber benzerli olanlari cikariyor
     FROM manav;
     
/* ----------------------------------------------------------------------------
  ORNEK3: satýlan meyverin urun+miktarlarinin benzersiz toplamlarini sorguyu yazýnýz.
-----------------------------------------------------------------------------*/ 
     SELECT SUM(DISTINCT urun_miktari) AS urun_sayisi
     FROM manav;

      
     
    
    
    
    
    
    
    
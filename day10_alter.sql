/*=============================== ALTER TABLE ==================================
   
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin
    kullanilir.
   
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de
    kullanilir.
  
==============================================================================*/

    CREATE TABLE personel1
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20),
        CONSTRAINT personel1_pk PRIMARY KEY (id)
    );
??
    INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel1 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
    
    
/* -----------------------------------------------------------------------------
  ORNEK1: personel tablosuna ulke_isim adinda ve default degeri ‘Turkiye’ olan
  yeni bir sutun ekleyiniz.
------------------------------------------------------------------------------*/

    ALTER TABLE personel1
    ADD ulke_isim VARCHAR2(20) DEFAULT 'TURKIYE';
    
    SELECT * FROM personel1;
    
/* -----------------------------------------------------------------------------
  ORNEK2: personel tablosuna cinsiyet varchar2(20) ve yas number(3) adinda ve default degeri ‘Turkiye’ olan
  yeni bir sutun ekleyiniz.
------------------------------------------------------------------------------*/    

 
/* -----------------------------------------------------------------------------
  ORNEK3: personel tablosundan yas sutununu siliniz.
------------------------------------------------------------------------------*/

    ALTER TABLE personel1
    DROP COLUMN sirket;
    
/* -----------------------------------------------------------------------------
  ORNEK4: personel tablosundaki ulke_isim sutununun adini ulke_adi olarak
  degistiriniz.
------------------------------------------------------------------------------*/    
    
    ALTER TABLE personel1
    RENAME COLUMN ulke_isim TO ulke_adi;
    
/* -----------------------------------------------------------------------------
  ORNEK5: personel tablosunun adini isciler olarak degistiriniz.
------------------------------------------------------------------------------*/

    ALTER TABLE personel1
    RENAME TO isciler;
    
    SELECT * FROM isciler;
    
/* -----------------------------------------------------------------------------
  ORNEK6: isciler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz.
------------------------------------------------------------------------------*/

    ALTER TABLE isciler
    MODIFY ulke_adi VARCHAR2(30) NOT NULL; --hem veri tipini degidtirdik hem de
                                           --NOT NULL kisitlamasi ekledik
    
    ALTER TABLE isciler
    MODIFY isim CHAR(100); --veri tipini CHAR(100) olarak degistirdik 
    
    ALTER TABLE isciler
    MODIFY maas CHECK (maas >= 3500); --maas alt limit ksitlamasi yaptik
    
      INSERT INTO isciler VALUES(123452310, 'Hatice Sahin', 'Bursa', 3000,'Almanya', 'Kadýn');
    
    
    
    
    
    
    
    
    
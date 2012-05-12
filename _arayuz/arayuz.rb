 require 'Qt'
 require 'gettext'
 require 'rubygems'
 require 'net/ldap'
 require 'sorgu'
$ad = 0
$sad = 0
$kad = 0
$paswd = 8
$ogr = 0
$per = 0
$kullaniciSilme = 0
$aramaFonksiyonu = 0
class Uygulama < Qt::TabWidget
include GetText
    
    slots 'silmeFonksiyonu()' 
    slots 'secim()'
    slots  'onchangedAd(QString)'
    slots 'onchangedkAd(QString)'
    slots 'onchangedsAd(QString)'
    slots 'onchangedpaswd(QString)'
    slots 'slots_paswd()'
    slots 'fonksiyon()'
    slots 'slots_radio_ogr()'
    slots 'slots_radio_per()'
    slots 'aramaFonksiyonu_buton()'
    slots 'onchangedArama(QString)'
    slots 'kullaniciSilme()'
    signals 'my_signals(QString)'
 
 def setupUi(tabWidget)
   
 def slots_paswd #parola üretme fonksiyonunun icinde "@line_paswd.text = random_password.inspect" aldıramadıgm icin baska bi fonksiyonla slot attım
	 def random_password(size = 8)
          chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
          (1..size).collect{|a| chars[rand(chars.size)] }.join
        end
            parola = random_password.inspect
            parola = parola.gsub!(/\W/,"")
            puts parola
            @line_paswd.text = parola
end

        tabWidget.windowTitle = "qunduz"
   
	tabWidget.resize(571, 399)
        @tab = Qt::Widget.new()
	@button_ = Qt::DialogButtonBox.new(@tab)
	@button_.geometry = Qt::Rect.new(320, 310, 176, 27)
	@button_.standardButtons = Qt::DialogButtonBox::Cancel|Qt::DialogButtonBox::Ok
	
	#yeniparola
	@button_parolasil = Qt::PushButton.new(@tab)
	@button_parolasil.geometry = Qt::Rect.new(310,110,155,27)
	 @button_parolasil.text = Qt::Application.translate(nil, "Yeni Parola Olustur", nil, Qt::Application::UnicodeUTF8)
	
	#yeniparola
	
	#close
	@button_kapat = Qt::PushButton.new(@tab)
	@button_kapat.text = Qt::Application.translate(nil, "Quit", nil, Qt::Application::UnicodeUTF8)
	@button_kapat.geometry = Qt::Rect.new(30, 310, 91, 27)
	Qt::Object.connect(@button_kapat, SIGNAL('clicked()'), tabWidget, SLOT('close()'))

	@button_kapat1 = Qt::PushButton.new(@tab1)
        @button_kapat1.text = Qt::Application.translate(nil, "Quit", nil, Qt::Application::UnicodeUTF8)
        @button_kapat1.geometry = Qt::Rect.new(30, 310, 91, 27)
        Qt::Object.connect(@button_kapat1, SIGNAL('clicked()'), tabWidget, SLOT('close()'))  

	#close
	@label_kad = Qt::Label.new(@tab)
	@label_kad.geometry = Qt::Rect.new(20, 160, 81, 20)
	@label_sad = Qt::Label.new(@tab)
	@label_sad.geometry = Qt::Rect.new(20, 80, 81, 20)
	@label_ad = Qt::Label.new(@tab)
	@label_ad.geometry = Qt::Rect.new(20, 40, 81, 20)
	@label_paswd = Qt::Label.new(@tab)
	@label_paswd.geometry = Qt::Rect.new(20, 120, 81, 20)
	@line_ad = Qt::LineEdit.new(@tab)
	@line_ad.geometry = Qt::Rect.new(160, 30, 113, 27)
	@line_sad = Qt::LineEdit.new(@tab)
	@line_sad.geometry = Qt::Rect.new(160, 70, 113, 27)
	@line_paswd = Qt::LineEdit.new(@tab)
	
	@line_paswd.text = Qt::Application.translate(nil,slots_paswd() , nil, Qt::Application::UnicodeUTF8)
	
	@line_paswd.geometry = Qt::Rect.new(160, 110, 113, 27)
	@line_kad = Qt::LineEdit.new(@tab)
	@line_kad.geometry = Qt::Rect.new(160, 150, 113, 27)
	@radio_ogr = Qt::RadioButton.new(@tab)
	@radio_ogr.geometry = Qt::Rect.new(350, 30, 116, 22)
	@radio_per = Qt::RadioButton.new(@tab)
	@radio_per.geometry = Qt::Rect.new(350, 80, 116, 22)
=begin
	@comboBox_fklt = Qt::ComboBox.new(@tab)
	@comboBox_fklt.geometry = Qt::Rect.new(160, 200, 111, 27)
	@label_fklt = Qt::Label.new(@tab)
	@label_fklt.geometry = Qt::Rect.new(20, 210, 81, 20)
	@label_bol = Qt::Label.new(@tab)
	@label_bol.geometry = Qt::Rect.new(20, 250, 81, 20)
	@comboBox_bol = Qt::ComboBox.new(@tab)
	@comboBox_bol.geometry = Qt::Rect.new(160, 240, 111, 27)
	@comboBox_fklt.insertItems(0, [Qt::Application.translate("Form", "Muhendislik-Mimarlik Fakultesi", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_fklt.insertItems(1, [Qt::Application.translate("Form", "Fen-Edebiyat Fakultesi", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_fklt.insertItems(2, [Qt::Application.translate("Form", "Egitim Fakultesi", nil, Qt::Application::UnicodeUTF8)])
=end
	tabWidget.addTab(@tab, Qt::Application.translate(nil, "Tab 1", nil, Qt::Application::UnicodeUTF8))
	@tab1 = Qt::Widget.new()
	@button_1 = Qt::DialogButtonBox.new(@tab1)
	@button_1.geometry = Qt::Rect.new(320, 310, 176, 27)
	@button_1.standardButtons = Qt::DialogButtonBox::Cancel|Qt::DialogButtonBox::Ok
	@label_kad1 = Qt::Label.new(@tab1)
	@label_kad1.geometry = Qt::Rect.new(20,200,81,20)
	@label_sad1 = Qt::Label.new(@tab1)
	@label_sad1.geometry = Qt::Rect.new(20,150,81,20)
	@label_ad1 = Qt::Label.new(@tab1)
	@label_ad1.geometry = Qt::Rect.new(20,100,81,20)
	@label_paswd1 = Qt::Label.new(@tab1)
	@label_paswd1.geometry = Qt::Rect.new(20,260,81,20)
	@line_ad1 = Qt::LineEdit.new(@tab1)
	@line_ad1.geometry = Qt::Rect.new(120,100,113,27)
	@line_sad1 = Qt::LineEdit.new(@tab1)
	@line_sad1.geometry = Qt::Rect.new(120,150,113,27)
	@line_paswd1 = Qt::LineEdit.new(@tab1)

	@line_paswd1.geometry = Qt::Rect.new(120,250,113,27)
	@line_kad1 = Qt::LineEdit.new(@tab1)
	@line_kad1.geometry = Qt::Rect.new(120,200,113,27)
	@radio_ogr1 = Qt::RadioButton.new(@tab1)
	@radio_ogr1.geometry = Qt::Rect.new(270,20,116,22)
	@radio_per1 = Qt::RadioButton.new(@tab1)
	@radio_per1.geometry = Qt::Rect.new(270,60,116,22)
=begin
	@comboBox_fklt1 = Qt::ComboBox.new(@tab1)
	@comboBox_fklt1.geometry = Qt::Rect.new(370,100,111,27)
	@label_fklt1 = Qt::Label.new(@tab1)
	@label_fklt1.geometry = Qt::Rect.new(270,110,81,20)
	@label_bol1 = Qt::Label.new(@tab1)
	@label_bol1.geometry = Qt::Rect.new(270,150,81,20)
	@comboBox_bol1 = Qt::ComboBox.new(@tab1)
	@comboBox_bol1.insertItems(0, [Qt::Application.translate("Form", "Bilgisayar Muhendisligi", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_bol1.insertItems(0, [Qt::Application.translate("Form", "Biyoloji Ogretmenligi", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_bol1.insertItems(0, [Qt::Application.translate("Form", "Fizik", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_bol1.geometry = Qt::Rect.new(370,150,111,27)
	@comboBox_fklt1.insertItems(0, [Qt::Application.translate("Form", "Muhendislik-Mimarlik Fakultesi", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_fklt1.insertItems(1, [Qt::Application.translate("Form", "Fen-Edebiyat Fakultesi", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_fklt1.insertItems(2, [Qt::Application.translate("Form", "Egitim Fakultesi", nil, Qt::Application::UnicodeUTF8)])
=end
	#silme
	@button_kullanicisilme = Qt::PushButton.new(@tab1)
	@button_kullanicisilme.geometry = Qt::Rect.new(20, 310, 101, 27)
	@button_kullanicisilme.text = Qt::Application.translate(nil, "Kullanici Sil", nil, Qt::Application::UnicodeUTF8)

	#arama butonu
	@button_arama = Qt::PushButton.new(@tab1)
	@button_arama.text = Qt::Application.translate(nil, "Arama Yap", nil, Qt::Application::UnicodeUTF8)
	@button_arama.geometry = Qt::Rect.new(160, 20, 91, 27)
	#arama satiri
	@line_arama = Qt::LineEdit.new(@tab1)
	@line_arama.geometry = Qt::Rect.new(20, 20, 113, 27)
	
	@label_kad1.text = Qt::Application.translate(nil, "Kullanıci Adi", nil, Qt::Application::UnicodeUTF8)
        @label_sad1.text = Qt::Application.translate(nil, "Soyad", nil, Qt::Application::UnicodeUTF8)
        @label_ad1.text = Qt::Application.translate(nil, "Ad", nil, Qt::Application::UnicodeUTF8)
        @label_paswd1.text = Qt::Application.translate(nil, "Parola", nil, Qt::Application::UnicodeUTF8)
        @radio_ogr1.text = Qt::Application.translate(nil, "Ogrenci", nil, Qt::Application::UnicodeUTF8)
        @radio_per1.text = Qt::Application.translate(nil, "Personel", nil, Qt::Application::UnicodeUTF8)
#        @label_fklt1.text = Qt::Application.translate(nil, "Fakulte", nil, Qt::Application::UnicodeUTF8)
 #       @label_bol1.text = Qt::Application.translate(nil, "Bolum", nil, Qt::Application::UnicodeUTF8)
	tabWidget.addTab(@tab1, Qt::Application.translate(nil, "Tab 2", nil, Qt::Application::UnicodeUTF8))
	tabWidget.setCurrentIndex(0)
	Qt::MetaObject.connectSlotsByName(tabWidget)  #bunu pek anlamadim 
	
        @label_kad.text = Qt::Application.translate(nil, "Kullanici Adi", nil, Qt::Application::UnicodeUTF8)
        @label_sad.text = Qt::Application.translate(nil, "Soyad", nil, Qt::Application::UnicodeUTF8)
        @label_ad.text = Qt::Application.translate(nil, "Ad", nil, Qt::Application::UnicodeUTF8)
        @label_paswd.text = Qt::Application.translate(nil, "Parola", nil, Qt::Application::UnicodeUTF8)
        @radio_ogr.text = Qt::Application.translate(nil, "Ogrenci", nil, Qt::Application::UnicodeUTF8)
        @radio_per.text = Qt::Application.translate(nil, "Personel", nil, Qt::Application::UnicodeUTF8)
=begin
        @label_fklt.text = Qt::Application.translate(nil, "Fakulte", nil, Qt::Application::UnicodeUTF8)
        @label_bol.text = Qt::Application.translate(nil, "Bolum", nil, Qt::Application::UnicodeUTF8)
	@comboBox_bol.insertItems(0, [Qt::Application.translate("Form", "Bilgisayar Muhendisligi", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_bol.insertItems(0, [Qt::Application.translate("Form", "Biyoloji Ogretmenligi", nil, Qt::Application::UnicodeUTF8)])
	@comboBox_bol.insertItems(0, [Qt::Application.translate("Form", "Fizik", nil, Qt::Application::UnicodeUTF8)])
=end
        tabWidget.setTabText(tabWidget.indexOf(@tab), Qt::Application.translate(nil, "Ekle", nil, Qt::Application::UnicodeUTF8))
        tabWidget.setTabText(tabWidget.indexOf(@tab1), Qt::Application.translate(nil, gettext("Duzenle"), nil, Qt::Application::UnicodeUTF8))
	#ceviri icin buton
	
	 @pushButton = Qt::PushButton.new(tabWidget)
	 @pushButton.geometry = Qt::Rect.new(310, 260, 111, 31)
	 @pushButton.text = Qt::Application.translate(nil, "OK", nil, Qt::Application::UnicodeUTF8)
	 #ceviri icin comboBox
	 @comboBox = Qt::ComboBox.new(tabWidget)
	 @comboBox.geometry = Qt::Rect.new(310, 220, 111, 31)
	 @comboBox.insertItems(0, [Qt::Application.translate("Form", "Tr", nil, Qt::Application::UnicodeUTF8)])
         @comboBox.insertItems(1, [Qt::Application.translate("Form", "En", nil, Qt::Application::UnicodeUTF8)])
	 @comboBox.insertItems(2, [Qt::Application.translate("Form", "De", nil, Qt::Application::UnicodeUTF8)])
         #@comboBox.currentIndex = 0
	 
	 Qt::Object.connect(@pushButton,SIGNAL('clicked()'),self,SLOT('secim()'))
	
	
	 Qt::Object.connect(@button_parolasil, SIGNAL('clicked()'), self, SLOT('slots_paswd()'))
       	 Qt::Object.connect(@radio_per, SIGNAL('clicked(bool)'), self, SLOT('slots_radio_per()'))
	 Qt::Object.connect(@radio_ogr, SIGNAL('clicked(bool)'), self, SLOT('slots_radio_ogr()'))
=begin
 Qt::Object.connect(@radio_per, SIGNAL('clicked(bool)'), @comboBox_bol, SLOT('setDisabled(bool)'))
 Qt::Object.connect(@radio_per, SIGNAL('clicked(bool)'), @comboBox_fklt, SLOT('setDisabled(bool)'))
 Qt::Object.connect(@radio_ogr, SIGNAL('clicked(bool)'), @comboBox_bol, SLOT('setEnabled(bool)'))
 Qt::Object.connect(@radio_ogr, SIGNAL('clicked(bool)'), @comboBox_fklt, SLOT('setEnabled(bool)'))
=end
 Qt::Object.connect(@line_ad,SIGNAL('textChanged(QString)'),self,SLOT('onchangedAd(QString)'))
 Qt::Object.connect(@line_kad,SIGNAL('textChanged(QString)'),self,SLOT('onchangedkAd(QString)'))
 Qt::Object.connect(@line_paswd,SIGNAL('textChanged(QString)'),self,SLOT('onchangedpaswd(QString)'))
 Qt::Object.connect(@line_sad,SIGNAL('textChanged(QString)'),self,SLOT('onchangedsAd(QString)'))
 
  
  Qt::Object.connect(@button_arama, SIGNAL('clicked()'), self, SLOT('aramaFonksiyonu_buton()'))
  Qt::Object.connect(@button_kullanicisilme, SIGNAL('clicked()'), self, SLOT('silmeFonksiyonu()'))
  
  def secim
      if @comboBox.currentIndex == 1
	 bindtextdomain("arayuz", :path => "locale")
	 GetText.set_locale_all("en")
	 puts "** ingilizce **"
      end
      if @comboBox.currentIndex == 2
	   bindtextdomain("arayuz", :path => "locale")
	 GetText.set_locale_all("de")
	 puts "** almanca **"
      end
      if @comboBox.currentIndex == 0
	   bindtextdomain("arayuz", :path => "locale")
	 GetText.set_locale_all("tr")
	 puts "** turkce **"
      end
        puts "ii"
        @button_kullanicisilme.text = gettext("Kullanici Sil")
        @button_arama.text = gettext("Arama Yap")
        @label_kad1.text = gettext("Kullanici Adi")
        @label_sad1.text = gettext("Soyad")
        puts "klm"
        @label_paswd1.text = gettext("Parola")
        @radio_ogr1.text = gettext("Ogrenci")
        @radio_per1.text = gettext("Personel")
        @label_fklt1.text = gettext("Fakulte")
        @label_bol1.text = gettext("Bolum")
        @label_ad1.text = gettext("Ad")
        @label_kad.text = gettext("Kullanici Adi")
        @label_sad.text = gettext("Soyad")
        @label_ad.text = gettext("Ad")
        @label_paswd.text = gettext("Parola")
        @radio_ogr.text = gettext("Ogrenci")
        @radio_per.text = gettext("Personel")
        @label_fklt.text = gettext("Fakulte")
        @label_bol.text = gettext("Bolum")
	@button_parolasil.text = gettext("Yeni Parola Olustur")
	

  end
  
  def inglizce
	  GetText.set_locale_all("en")
    puts "inglizce"
  end
  def almanca
	GetText.set_locale_all("de")
	puts "almanca"
  end
  def turkce
      GetText.set_locale_all("en")
      puts "turkce"
  end
	
 def slots_radio_per
	$bilgi = "personel"
	$per = 1
 end

 def slots_radio_ogr   # ou = ogrenci bilgisinin alinmasi icin yazildi
	$bilgi = "ogrenci"
	$ogr = 1
 end
 
 def onchangedAd text
        $ad = text.length
        print $ad , "    ad : \n"
 end
 
 def onchangedkAd text
        $kad = text.length
        print $kad , "    kad : \n"
 end

 def onchangedsAd text
        $sad = text.length
        print $sad , "    sad  \n"
 end
 
 def onchangedpaswd text
   puts "parola fonksiyon"
   print $parola , "\n"
        $paswd = text.length
	$parola = text	
	puts "parola = text alndktan sonra"
	print $parola , "\n"
 end

 def fonksiyon
      $x = 2
#$x message kutusu butun bi for boyunca tıklama gerektirmesin diye eklendi
	if $ogr == 0 && $per == 0
		button = sender 
		Qt::MessageBox.warning self, "Warning", _("Ogrenci ya da Personel bilgisini girin")
	end
	puts "fonksiyon icine gelindi "
        dizi = Array.new
        dizi.push($ad)
        dizi.push($sad)
	dizi.push($kad)
	dizi.push($paswd)
        dizi.each do |i|
           if i == 0 and ($per !=0 || $ogr !=0)
	     $x = 0 #tekrar yazi silinp yazılırsa $x in degerini guncelliyo
	       button = sender  #?? anlamadim
	       Qt::MessageBox.warning self, "Warning", _("Eksik Bilgi Girdiniz!")
	       puts "i == 0"
	        break
	   end
       	end
      if $paswd < 8 and $x != 0 and ($per !=0 || $ogr !=0)
		puts "$paswd < 8"
		Qt::MessageBox.warning self, "Warning", _("8 karakterden az karakter girdiniz!")
      end
      if $x!=0 and $paswd >= 8 and ($per !=0 || $ogr !=0)
	  puts "update()"
	  #update()
	  eklemeFonksiyonu_buton
	  Qt::MessageBox.information self, "Information", _("Bilgiler Kaydedildi")
      end
     
 end
 
 Qt::Object.connect(@button_, SIGNAL('rejected()'), tabWidget, SLOT('close()'))
 Qt::Object.connect(@button_, SIGNAL('accepted()'),self, SLOT('fonksiyon()'))
 Qt::Object.connect(@button_1,SIGNAL('rejected()'),tabWidget,SLOT('close()'))
 Qt::Object.connect(@button_1,SIGNAL('accepted()'),tabWidget,SLOT('update()'))

   end
end

if $0 == __FILE__
   a = Qt::Application.new ARGV
   u = Uygulama.new
   w = Qt::TabWidget.new
   u.setupUi(w)
   w.show

   a.exec

end
	

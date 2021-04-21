import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/locale_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/http_service.dart';
import 'package:flutter_app/global.dart';

class AppLocalizations {
  final Locale locale;
  // final HttpService httpService = HttpService();
  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  // Future<bool> load() async {
  // String jsonString =
  //     await rootBundle.loadString('i18n/${locale.languageCode}.json');
  //
  // Map<String, dynamic> jsonMap = json.decode(jsonString);
  //
  // _localizedStrings = jsonMap.map((key, value) {
  //   return MapEntry(key, value.toString());
  // });
  // return true;
  // }

  // This method will be called from every widget which needs a localized text
  // String translate(String key) {
  //   return _localizedStrings[key];
  // }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'ru', 'et', 'lt', 'uz'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = new AppLocalizations(locale);
    // await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');
  final HttpService httpService = HttpService();

  Locale get appLocal => _appLocale ?? Locale("en");

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ru")) {
      _appLocale = Locale("ru");

      await prefs.setString('language_code', 'ru');
      await prefs.setString('countryCode', '');
    }
    if (type == Locale("en")) {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', '');
    }
    if (type == Locale("uz")) {
      _appLocale = Locale("uz");

      await prefs.setString('language_code', 'uz');
      await prefs.setString('countryCode', '');
    }
    if (type == Locale("lt")) {
      _appLocale = Locale("lt");
      await prefs.setString('language_code', 'lt');
      await prefs.setString('countryCode', '');
    }
    if (type == Locale("et")) {
      _appLocale = Locale("et");
      await prefs.setString('language_code', 'et');
      await prefs.setString('countryCode', '');
    }
    notifyListeners();
  }
}

class LocalizedData extends ChangeNotifier {
  final HttpService httpService = HttpService();
  final Map<String, String> data = {};

  getDataFromInitRequest() async {
    await httpService
        .getLocalizedText(BaseUrl('ru').url.toString())
        .then((dataList) {
          var localizedFromServer = dataList.where((element) => element.mob_copyrights != null);
      data['ru'] = 'true';
      data['ruCopyrights'] = localizedFromServer.first.mob_copyrights;
      data['ruHalalControlLithuania'] =
          localizedFromServer.first.halal_control_lithuania;
      data['ruEnumbers'] = localizedFromServer.first.mobile_e_numbers;
      data['ruRestaurants'] = localizedFromServer.first.mobile_restaurants;
      data['ruRestaurantsOnMap'] =
          localizedFromServer.first.mobile_restaurants_on_map;
      data['ruHotels'] = localizedFromServer.first.mobile_hotels;
      data['ruHotelsOnMap'] = localizedFromServer.first.mobile_hotels_on_map;
      data['ruProducts'] = localizedFromServer.first.mobile_products;
      data['ruCertificateCheck'] =
          localizedFromServer.first.mobile_certificate_check;
      data['ruContactUs'] = localizedFromServer.first.mobile_contact_us;
      data['ruReportFraud'] = localizedFromServer.first.mobile_report_fraud;
      data['ruOpenInPdf'] = localizedFromServer.first.mobile_open_in_pdf;
//langs
      data['ruMobileLang'] = localizedFromServer.first.mobile_lang;
      data['ruMobileEn'] = localizedFromServer.first.mobile_en;
      data['ruMobileLt'] = localizedFromServer.first.mobile_lt;
      data['ruMobileRu'] = localizedFromServer.first.mobile_ru;
      data['ruMobileEs'] = localizedFromServer.first.mobile_es;
      data['ruMobileUz'] = localizedFromServer.first.mobile_uz;
//buttons
      data['ruSendMessageBtn'] = localizedFromServer.first.mobile_send_message;
      data['ruCertificateCheckBtn'] =
          localizedFromServer.first.mobile_certificate_check_button;
      data['ruReportFraud2'] = localizedFromServer.first.mobile_report_fraud2;
//other buttons
      data['ruMobileTakeAPhoto'] =
          localizedFromServer.first.mobile_take_a_photo;
      data['ruChooseFromGallery'] =
          localizedFromServer.first.mobile_choose_from_gallery;
      data['ruMobileUpload'] = localizedFromServer.first.mobile_upload;
      data['ruUseCamera'] = localizedFromServer.first.mobile_use_camera;
      data['ruCancel'] = localizedFromServer.first.mobile_cancel;
      data['ruCancel2'] = localizedFromServer.first.mobile_cancel2;
      data['ruOk'] = localizedFromServer.first.mobile_ok;
      data['ruUploadImage'] = localizedFromServer.first.upload_image;

      data['ruAboutUs'] = localizedFromServer.first.mobile_about_us;
      data['ruAboutUsTerms'] = localizedFromServer.first.terms;
      data['ruAboutUsPrivacy'] = localizedFromServer.first.privacy;
      data['ruAboutUsTermsLink'] = localizedFromServer.first.termslink;
      data['ruAboutUsPrivacyLink'] = localizedFromServer.first.privacylink;

//contact us form
      data['ruContactFormName'] = localizedFromServer.first.mobile_form_name;
      data['ruContactFormEmail'] = localizedFromServer.first.mobile_form_email;
      data['ruContactFormPhoneNumber'] =
          localizedFromServer.first.mobile_form_phone_number;
      data['ruContactFormSubject'] =
          localizedFromServer.first.mobile_form_subject;
      data['ruContactFormMessage'] =
          localizedFromServer.first.mobile_form_message;
      data['ruCertCheckNotFound'] =
          localizedFromServer.first.mobile_certificate_check_not_found;
      data['ruCertificateCheckEmpty'] =
          localizedFromServer.first.mobile_certificate_check_empty;
      data['ruSendFormError'] =
          localizedFromServer.first.mobile_send_form_error;
      data['ruSendFormMessage'] =
          localizedFromServer.first.mobile_form_sent_message;
      data['ruContactFormText'] = localizedFromServer.first.contact_form_text;
      data['ruContactFormTerms'] = localizedFromServer.first.contact_form_terms;
      data['ruContactFormAnd'] = localizedFromServer.first.contact_form_and;
      data['ruContactFormPrivacy'] =
          localizedFromServer.first.contact_form_privacy;
      data['ruContactFormLastText'] =
          localizedFromServer.first.contact_form_lastText;

//fraud form
      data['ruMobileEmailFraud'] = localizedFromServer.first.mobile_email_fraud;
      data['ruMobileUploadImageFraud'] =
          localizedFromServer.first.mobile_upload_image_fraud;
      data['ruMobileTypeOfFraud'] =
          localizedFromServer.first.mobile_type_of_fraud;
      data['ruMessage'] = localizedFromServer.first.message;
      data['ruChooseImage'] = localizedFromServer.first.choose_image;

      data['ruMobileFraudType1'] = localizedFromServer.first.mobile_fraud_type1;
      data['ruMobileFraudType2'] = localizedFromServer.first.mobile_fraud_type2;
      data['ruMobileFraudType3'] = localizedFromServer.first.mobile_fraud_type3;
//certificate info
      data['ruMobileCertIdNo'] = localizedFromServer.first.mobile_ceft_id_no;
      data['ruMobileCertStatus'] = localizedFromServer.first.mobile_ceft_status;
      data['ruMobileCertValidUntil'] =
          localizedFromServer.first.mobile_certificate_valid_until;

      data['ruMobileMuslimFriendly'] =
          localizedFromServer.first.mobile_muslim_friendly;
      data['ruMobileCertCheckBold'] =
          localizedFromServer.first.mobile_certificate_check_bold_text;
      data['ruMobileCertCheckText'] =
          localizedFromServer.first.mobile_certificate_check_text;

      return data;
    }).catchError((e) {
      print("No data for 'ru': ${e}");
    });

    await httpService
        .getLocalizedText(BaseUrl('en').url.toString())
        .then((dataList) {
      var localizedFromServer = dataList.where((element) => element.mob_copyrights != null);

      data['enCopyrights'] = localizedFromServer.first.mob_copyrights;
      data['enHalalControlLithuania'] =
          localizedFromServer.first.halal_control_lithuania;
      data['enEnumbers'] = localizedFromServer.first.mobile_e_numbers;
      data['enRestaurants'] = localizedFromServer.first.mobile_restaurants;
      data['enRestaurantsOnMap'] =
          localizedFromServer.first.mobile_restaurants_on_map;
      data['enHotels'] = localizedFromServer.first.mobile_hotels;
      data['enHotelsOnMap'] = localizedFromServer.first.mobile_hotels_on_map;
      data['enProducts'] = localizedFromServer.first.mobile_products;
      data['enCertificateCheck'] =
          localizedFromServer.first.mobile_certificate_check;
      data['enContactUs'] = localizedFromServer.first.mobile_contact_us;
      data['enReportFraud'] = localizedFromServer.first.mobile_report_fraud;
//langs
      data['enMobileLang'] = localizedFromServer.first.mobile_lang;
      data['enMobileEn'] = localizedFromServer.first.mobile_en;
      data['enMobileLt'] = localizedFromServer.first.mobile_lt;
      data['enMobileRu'] = localizedFromServer.first.mobile_ru;
      data['enMobileEs'] = localizedFromServer.first.mobile_es;
      data['enMobileUz'] = localizedFromServer.first.mobile_uz;
//buttons
      data['enSendMessageBtn'] = localizedFromServer.first.mobile_send_message;
      data['enCertificateCheckBtn'] =
          localizedFromServer.first.mobile_certificate_check_button;
      data['enReportFraud2'] = localizedFromServer.first.mobile_report_fraud2;
      data['enOpenInPdf'] = localizedFromServer.first.mobile_open_in_pdf;
//other buttons
      data['enMobileTakeAPhoto'] =
          localizedFromServer.first.mobile_take_a_photo;
      data['enChooseFromGallery'] =
          localizedFromServer.first.mobile_choose_from_gallery;
      data['enMobileUpload'] = localizedFromServer.first.mobile_upload;
      data['enUseCamera'] = localizedFromServer.first.mobile_use_camera;
      data['enCancel'] = localizedFromServer.first.mobile_cancel;
      data['enCancel2'] = localizedFromServer.first.mobile_cancel2;
      data['enOk'] = localizedFromServer.first.mobile_ok;
      data['enUploadImage'] = localizedFromServer.first.upload_image;

      data['enAboutUs'] = localizedFromServer.first.mobile_about_us;
      data['enAboutUsTerms'] = localizedFromServer.first.terms;
      data['enAboutUsPrivacy'] = localizedFromServer.first.privacy;
      data['enAboutUsTermsLink'] = localizedFromServer.first.termslink;
      data['enAboutUsPrivacyLink'] = localizedFromServer.first.privacylink;

//contact us form
      data['enContactFormName'] = localizedFromServer.first.mobile_form_name;
      data['enContactFormEmail'] = localizedFromServer.first.mobile_form_email;
      data['enContactFormPhoneNumber'] =
          localizedFromServer.first.mobile_form_phone_number;
      data['enContactFormSubject'] =
          localizedFromServer.first.mobile_form_subject;
      data['enContactFormMessage'] =
          localizedFromServer.first.mobile_form_message;
      data['enCertCheckNotFound'] =
          localizedFromServer.first.mobile_certificate_check_not_found;
      data['enCertificateCheckEmpty'] =
          localizedFromServer.first.mobile_certificate_check_empty;
      data['enSendFormError'] =
          localizedFromServer.first.mobile_send_form_error;
      data['enSendFormMessage'] =
          localizedFromServer.first.mobile_form_sent_message;
      data['enContactFormText'] = localizedFromServer.first.contact_form_text;
      data['enContactFormTerms'] = localizedFromServer.first.contact_form_terms;
      data['enContactFormAnd'] = localizedFromServer.first.contact_form_and;
      data['enContactFormPrivacy'] =
          localizedFromServer.first.contact_form_privacy;
      data['enContactFormLastText'] =
          localizedFromServer.first.contact_form_lastText;

//fraud form
      data['enMobileEmailFraud'] = localizedFromServer.first.mobile_email_fraud;
      data['enMobileUploadImageFraud'] =
          localizedFromServer.first.mobile_upload_image_fraud;
      data['enMobileTypeOfFraud'] =
          localizedFromServer.first.mobile_type_of_fraud;
      data['enMessage'] = localizedFromServer.first.message;
      data['enChooseImage'] = localizedFromServer.first.choose_image;

      data['enMobileFraudType1'] = localizedFromServer.first.mobile_fraud_type1;
      data['enMobileFraudType2'] = localizedFromServer.first.mobile_fraud_type2;
      data['enMobileFraudType3'] = localizedFromServer.first.mobile_fraud_type3;
//certificate info
      data['enMobileCertIdNo'] = localizedFromServer.first.mobile_ceft_id_no;
      data['enMobileCertStatus'] = localizedFromServer.first.mobile_ceft_status;
      data['enMobileCertValidUntil'] =
          localizedFromServer.first.mobile_certificate_valid_until;

      data['enMobileMuslimFriendly'] =
          localizedFromServer.first.mobile_muslim_friendly;
      data['enMobileCertCheckBold'] =
          localizedFromServer.first.mobile_certificate_check_bold_text;
      data['enMobileCertCheckText'] =
          localizedFromServer.first.mobile_certificate_check_text;
      return data;
    }).catchError((e) {
      print("No data for 'en': ${e}");
    });

    await httpService
        .getLocalizedText(BaseUrl('uz').url.toString())
        .then((dataList) {
      var localizedFromServer = dataList.where((element) => element.mob_copyrights != null);

      data['uz'] = 'true';
            data['uzCopyrights'] =
                localizedFromServer.first.mob_copyrights;
            data['uzHalalControlLithuania'] =
                localizedFromServer.first.halal_control_lithuania;
            data['uzEnumbers'] =
                localizedFromServer.first.mobile_e_numbers;
            data['uzRestaurants'] =
                localizedFromServer.first.mobile_restaurants;
            data['uzRestaurantsOnMap'] =
                localizedFromServer.first.mobile_restaurants_on_map;
            data['uzHotels'] = localizedFromServer.first.mobile_hotels;
            data['uzHotelsOnMap'] =
                localizedFromServer.first.mobile_hotels_on_map;
            data['uzProducts'] =
                localizedFromServer.first.mobile_products;
            data['uzCertificateCheck'] =
                localizedFromServer.first.mobile_certificate_check;
            data['uzContactUs'] =
                localizedFromServer.first.mobile_contact_us;
            data['uzReportFraud'] =
                localizedFromServer.first.mobile_report_fraud;
            data['uzOpenInPdf'] =
                localizedFromServer.first.mobile_open_in_pdf;
//langs
            data['uzMobileLang'] = localizedFromServer.first.mobile_lang;
            data['uzMobileEn'] = localizedFromServer.first.mobile_en;
            data['uzMobileLt'] = localizedFromServer.first.mobile_lt;
            data['uzMobileRu'] = localizedFromServer.first.mobile_ru;
            data['uzMobileEs'] = localizedFromServer.first.mobile_es;
            data['uzMobileUz'] = localizedFromServer.first.mobile_uz;
//buttons
            data['uzSendMessageBtn'] =
                localizedFromServer.first.mobile_send_message;
            data['uzCertificateCheckBtn'] =
                localizedFromServer.first.mobile_certificate_check_button ?? '';
            data['uzReportFraud2'] =
                localizedFromServer.first.mobile_report_fraud2;
//other buttons
            data['uzMobileTakeAPhoto'] =
                localizedFromServer.first.mobile_take_a_photo;
            data['uzChooseFromGallery'] =
                localizedFromServer.first.mobile_choose_from_gallery;
            data['uzMobileUpload'] =
                localizedFromServer.first.mobile_upload;
            data['uzUseCamera'] =
                localizedFromServer.first.mobile_use_camera;
            data['uzCancel'] = localizedFromServer.first.mobile_cancel;
            data['uzCancel2'] = localizedFromServer.first.mobile_cancel2;
            data['uzOk'] = localizedFromServer.first.mobile_ok;
            data['uzUploadImage'] =
                localizedFromServer.first.upload_image;

            data['uzAboutUs'] = localizedFromServer.first.mobile_about_us;
            data['uzAboutUsTerms'] = localizedFromServer.first.terms;
            data['uzAboutUsPrivacy'] = localizedFromServer.first.privacy;
            data['uzAboutUsTermsLink'] =
                localizedFromServer.first.termslink;
            data['uzAboutUsPrivacyLink'] =
                localizedFromServer.first.privacylink;

//contact us form
            data['uzContactFormName'] =
                localizedFromServer.first.mobile_form_name;
            data['uzContactFormEmail'] =
                localizedFromServer.first.mobile_form_email;
            data['uzContactFormPhoneNumber'] =
                localizedFromServer.first.mobile_form_phone_number;
            data['uzContactFormSubject'] =
                localizedFromServer.first.mobile_form_subject;
            data['uzContactFormMessage'] =
                localizedFromServer.first.mobile_form_message;
            data['uzCertCheckNotFound'] =
                localizedFromServer.first.mobile_certificate_check_not_found;
            data['uzCertificateCheckEmpty'] =
                localizedFromServer.first.mobile_certificate_check_empty;
            data['uzSendFormError'] =
                localizedFromServer.first.mobile_send_form_error;
            data['uzSendFormMessage'] =
                localizedFromServer.first.mobile_form_sent_message;
            data['uzContactFormText'] =
                localizedFromServer.first.contact_form_text;
            data['uzContactFormTerms'] =
                localizedFromServer.first.contact_form_terms;
            data['uzContactFormAnd'] =
                localizedFromServer.first.contact_form_and;
            data['uzContactFormPrivacy'] =
                localizedFromServer.first.contact_form_privacy;
            data['uzContactFormLastText'] =
                localizedFromServer.first.contact_form_lastText;

//fraud form
            data['uzMobileEmailFraud'] =
                localizedFromServer.first.mobile_email_fraud;
            data['uzMobileUploadImageFraud'] =
                localizedFromServer.first.mobile_upload_image_fraud;
            data['uzMobileTypeOfFraud'] =
                localizedFromServer.first.mobile_type_of_fraud;
            data['uzMessage'] = localizedFromServer.first.message;
            data['uzChooseImage'] =
                localizedFromServer.first.choose_image;

            data['uzMobileFraudType1'] =
                localizedFromServer.first.mobile_fraud_type1;
            data['uzMobileFraudType2'] =
                localizedFromServer.first.mobile_fraud_type2;
            data['uzMobileFraudType3'] =
                localizedFromServer.first.mobile_fraud_type3;
//certificate info
            data['uzMobileCertIdNo'] =
                localizedFromServer.first.mobile_ceft_id_no;
            data['uzMobileCertStatus'] =
                localizedFromServer.first.mobile_ceft_status;
            data['uzMobileCertValidUntil'] =
                localizedFromServer.first.mobile_certificate_valid_until;

            data['uzMobileMuslimFriendly'] =
                localizedFromServer.first.mobile_muslim_friendly;
            data['uzMobileCertCheckBold'] =
                localizedFromServer.first.mobile_certificate_check_bold_text;
            data['uzMobileCertCheckText'] =
                localizedFromServer.first.mobile_certificate_check_text;

            return data;
    }).catchError((e) {
      print("No data for 'uz': ${e}");
    });

    await httpService
        .getLocalizedText(BaseUrl('lt').url.toString())
        .then((dataList) {
      var localizedFromServer = dataList.where((element) => element.mob_copyrights != null);

      data['lt'] = 'true';
      data['ltCopyrights'] = localizedFromServer.first.mob_copyrights;
      data['ltHalalControlLithuania'] =
      localizedFromServer.first.halal_control_lithuania;
      data['ltEnumbers'] = localizedFromServer.first.mobile_e_numbers;
      data['ltRestaurants'] = localizedFromServer.first.mobile_restaurants;
      data['ltRestaurantsOnMap'] =
      localizedFromServer.first.mobile_restaurants_on_map;
      data['ltHotels'] = localizedFromServer.first.mobile_hotels;
      data['ltHotelsOnMap'] = localizedFromServer.first.mobile_hotels_on_map;
      data['ltProducts'] = localizedFromServer.first.mobile_products;
      data['ltCertificateCheck'] =
      localizedFromServer.first.mobile_certificate_check;
      data['ltContactUs'] = localizedFromServer.first.mobile_contact_us;
      data['ltReportFraud'] = localizedFromServer.first.mobile_report_fraud;
      data['ltOpenInPdf'] = localizedFromServer.first.mobile_open_in_pdf;
//langs
      data['ltMobileLang'] = localizedFromServer.first.mobile_lang;
      data['ltMobileEn'] = localizedFromServer.first.mobile_en;
      data['ltMobileLt'] = localizedFromServer.first.mobile_lt;
      data['ltMobileRu'] = localizedFromServer.first.mobile_ru;
      data['ltMobileEs'] = localizedFromServer.first.mobile_es;
      data['ltMobileUz'] = localizedFromServer.first.mobile_uz;
//buttons
      data['ltSendMessageBtn'] = localizedFromServer.first.mobile_send_message;
      data['ltCertificateCheckBtn'] =
      localizedFromServer.first.mobile_certificate_check_button;
      data['ltReportFraud2'] = localizedFromServer.first.mobile_report_fraud2;
//other buttons
      data['ltMobileTakeAPhoto'] =
      localizedFromServer.first.mobile_take_a_photo;
      data['ltChooseFromGallery'] =
      localizedFromServer.first.mobile_choose_from_gallery;
      data['ltMobileUpload'] = localizedFromServer.first.mobile_upload;
      data['ltUseCamera'] = localizedFromServer.first.mobile_use_camera;
      data['ltCancel'] = localizedFromServer.first.mobile_cancel;
      data['ltCancel2'] = localizedFromServer.first.mobile_cancel2;
      data['ltOk'] = localizedFromServer.first.mobile_ok;
      data['ltUploadImage'] = localizedFromServer.first.upload_image;

      data['ltAboutUs'] = localizedFromServer.first.mobile_about_us;
      data['ltAboutUsTerms'] = localizedFromServer.first.terms;
      data['ltAboutUsPrivacy'] = localizedFromServer.first.privacy;
      data['ltAboutUsTermsLink'] = localizedFromServer.first.termslink;
      data['ltAboutUsPrivacyLink'] = localizedFromServer.first.privacylink;

//contact us form
      data['ltContactFormName'] = localizedFromServer.first.mobile_form_name;
      data['ltContactFormEmail'] = localizedFromServer.first.mobile_form_email;
      data['ltContactFormPhoneNumber'] =
      localizedFromServer.first.mobile_form_phone_number;
      data['ltContactFormSubject'] =
      localizedFromServer.first.mobile_form_subject;
      data['ltContactFormMessage'] =
      localizedFromServer.first.mobile_form_message;
      data['ltCertCheckNotFound'] =
      localizedFromServer.first.mobile_certificate_check_not_found;
      data['ltCertificateCheckEmpty'] =
      localizedFromServer.first.mobile_certificate_check_empty;
      data['ltSendFormError'] =
      localizedFromServer.first.mobile_send_form_error;
      data['ltSendFormMessage'] =
      localizedFromServer.first.mobile_form_sent_message;
      data['ltContactFormText'] = localizedFromServer.first.contact_form_text;
      data['ltContactFormTerms'] = localizedFromServer.first.contact_form_terms;
      data['ltContactFormAnd'] = localizedFromServer.first.contact_form_and;
      data['ltContactFormPrivacy'] =
      localizedFromServer.first.contact_form_privacy;
      data['ltContactFormLastText'] =
      localizedFromServer.first.contact_form_lastText;

//fraud form
      data['ltMobileEmailFraud'] = localizedFromServer.first.mobile_email_fraud;
      data['ltMobileUploadImageFraud'] =
      localizedFromServer.first.mobile_upload_image_fraud;
      data['ltMobileTypeOfFraud'] =
      localizedFromServer.first.mobile_type_of_fraud;
      data['ltMessage'] = localizedFromServer.first.message;
      data['ltChooseImage'] = localizedFromServer.first.choose_image;

      data['ltMobileFraudType1'] = localizedFromServer.first.mobile_fraud_type1;
      data['ltMobileFraudType2'] = localizedFromServer.first.mobile_fraud_type2;
      data['ltMobileFraudType3'] = localizedFromServer.first.mobile_fraud_type3;
//certificate info
      data['ltMobileCertIdNo'] = localizedFromServer.first.mobile_ceft_id_no;
      data['ltMobileCertStatus'] = localizedFromServer.first.mobile_ceft_status;
      data['ltMobileCertValidUntil'] =
      localizedFromServer.first.mobile_certificate_valid_until;

      data['ltMobileMuslimFriendly'] =
      localizedFromServer.first.mobile_muslim_friendly;
      data['ltMobileCertCheckBold'] =
      localizedFromServer.first.mobile_certificate_check_bold_text;
      data['ltMobileCertCheckText'] =
      localizedFromServer.first.mobile_certificate_check_text;

      return data;

    }).catchError((e) {
      print("No data for 'lt': ${e}");
    });

    await httpService
        .getLocalizedText(BaseUrl('et').url.toString())
        .then((dataList) {
      var localizedFromServer = dataList.where((element) => element.mob_copyrights != null);

      data['et'] = 'true';
      data['etCopyrights'] = localizedFromServer.first.mob_copyrights;
      data['etHalalControlLithuania'] =
          localizedFromServer.first.halal_control_lithuania;
      data['etEnumbers'] = localizedFromServer.first.mobile_e_numbers;
      data['etRestaurants'] = localizedFromServer.first.mobile_restaurants;
      data['etRestaurantsOnMap'] =
          localizedFromServer.first.mobile_restaurants_on_map;
      data['etHotels'] = localizedFromServer.first.mobile_hotels;
      data['etHotelsOnMap'] = localizedFromServer.first.mobile_hotels_on_map;
      data['etProducts'] = localizedFromServer.first.mobile_products;
      data['etCertificateCheck'] =
          localizedFromServer.first.mobile_certificate_check;
      data['etContactUs'] = localizedFromServer.first.mobile_contact_us;
      data['etReportFraud'] = localizedFromServer.first.mobile_report_fraud;
      data['etOpenInPdf'] = localizedFromServer.first.mobile_open_in_pdf;
//langs
      data['etMobileLang'] = localizedFromServer.first.mobile_lang;
      data['etMobileEn'] = localizedFromServer.first.mobile_en;
      data['etMobileLt'] = localizedFromServer.first.mobile_lt;
      data['etMobileRu'] = localizedFromServer.first.mobile_ru;
      data['etMobileEs'] = localizedFromServer.first.mobile_es;
      data['etMobileUz'] = localizedFromServer.first.mobile_uz;
//buttons
      data['etSendMessageBtn'] = localizedFromServer.first.mobile_send_message;
      data['etCertificateCheckBtn'] =
          localizedFromServer.first.mobile_certificate_check_button;
      data['etReportFraud2'] = localizedFromServer.first.mobile_report_fraud2;
//other buttons
      data['etMobileTakeAPhoto'] =
          localizedFromServer.first.mobile_take_a_photo;
      data['etChooseFromGallery'] =
          localizedFromServer.first.mobile_choose_from_gallery;
      data['etMobileUpload'] = localizedFromServer.first.mobile_upload;
      data['etUseCamera'] = localizedFromServer.first.mobile_use_camera;
      data['etCancel'] = localizedFromServer.first.mobile_cancel;
      data['etCancel2'] = localizedFromServer.first.mobile_cancel2;
      data['etOk'] = localizedFromServer.first.mobile_ok;
      data['etUploadImage'] = localizedFromServer.first.upload_image;

      data['etAboutUs'] = localizedFromServer.first.mobile_about_us;
      data['etAboutUsTerms'] = localizedFromServer.first.terms;
      data['etAboutUsPrivacy'] = localizedFromServer.first.privacy;
      data['etAboutUsTermsLink'] = localizedFromServer.first.termslink;
      data['etAboutUsPrivacyLink'] = localizedFromServer.first.privacylink;

//contact us form
      data['etContactFormName'] = localizedFromServer.first.mobile_form_name;
      data['etContactFormEmail'] = localizedFromServer.first.mobile_form_email;
      data['etContactFormPhoneNumber'] =
          localizedFromServer.first.mobile_form_phone_number;
      data['etContactFormSubject'] =
          localizedFromServer.first.mobile_form_subject;
      data['etContactFormMessage'] =
          localizedFromServer.first.mobile_form_message;
      data['etCertCheckNotFound'] =
          localizedFromServer.first.mobile_certificate_check_not_found;
      data['etCertificateCheckEmpty'] =
          localizedFromServer.first.mobile_certificate_check_empty;
      data['etSendFormError'] =
          localizedFromServer.first.mobile_send_form_error;
      data['etSendFormMessage'] =
          localizedFromServer.first.mobile_form_sent_message;
      data['etContactFormText'] = localizedFromServer.first.contact_form_text;
      data['etContactFormTerms'] = localizedFromServer.first.contact_form_terms;
      data['etContactFormAnd'] = localizedFromServer.first.contact_form_and;
      data['etContactFormPrivacy'] =
          localizedFromServer.first.contact_form_privacy;
      data['etContactFormLastText'] =
          localizedFromServer.first.contact_form_lastText;

//fraud form
      data['etMobileEmailFraud'] = localizedFromServer.first.mobile_email_fraud;
      data['etMobileUploadImageFraud'] =
          localizedFromServer.first.mobile_upload_image_fraud;
      data['etMobileTypeOfFraud'] =
          localizedFromServer.first.mobile_type_of_fraud;
      data['etMessage'] = localizedFromServer.first.message;
      data['etChooseImage'] = localizedFromServer.first.choose_image;

      data['etMobileFraudType1'] = localizedFromServer.first.mobile_fraud_type1;
      data['etMobileFraudType2'] = localizedFromServer.first.mobile_fraud_type2;
      data['etMobileFraudType3'] = localizedFromServer.first.mobile_fraud_type3;
//certificate info
      data['etMobileCertIdNo'] = localizedFromServer.first.mobile_ceft_id_no;
      data['etMobileCertStatus'] = localizedFromServer.first.mobile_ceft_status;
      data['etMobileCertValidUntil'] =
          localizedFromServer.first.mobile_certificate_valid_until;

      data['etMobileMuslimFriendly'] =
          localizedFromServer.first.mobile_muslim_friendly;
      data['etMobileCertCheckBold'] =
          localizedFromServer.first.mobile_certificate_check_bold_text;
      data['etMobileCertCheckText'] =
          localizedFromServer.first.mobile_certificate_check_text;

      return data;
    }).catchError((e) {
      print("No data for 'et': ${e}");
    });
  }
}

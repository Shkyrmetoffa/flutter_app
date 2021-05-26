import 'package:flutter/material.dart';

class Localized {
  final String? mob_copyrights;
  final String? halal_control_lithuania;
  final String? mobile_e_numbers;
  final String? mobile_restaurants;
  final String? mobile_restaurants_on_map;
  final String? mobile_hotels;
  final String? mobile_hotels_on_map;
  final String? mobile_products;
  final String? mobile_certificate_check;
  final String? mobile_contact_us;
  final String? mobile_report_fraud;
  //langs
  final String? mobile_lang;
  final String? mobile_en;
  final String? mobile_lt;
  final String? mobile_ru;
  final String? mobile_es;
  final String? mobile_uz;
  //buttons
  final String? mobile_send_message;
  final String? mobile_certificate_check_button;
  final String? mobile_report_fraud2;
  final String? mobile_open_in_pdf;

  final String? mobile_about_us;
//contact us form
  final String? mobile_form_name;
  final String? mobile_form_email;
  final String? mobile_form_phone_number;
  final String? mobile_form_subject;
  final String? mobile_form_message;
  final String? contact_form_text;
  final String? contact_form_terms;
  final String? contact_form_and;
  final String? contact_form_privacy;
  final String? contact_form_lastText;

  final String? mobile_certificate_check_not_found;
  final String? mobile_certificate_check_empty;
  //other buttons
  final String? mobile_take_a_photo;
  final String? mobile_choose_from_gallery;
  final String? mobile_upload;
  final String? mobile_use_camera;
  final String? mobile_cancel;
  final String? mobile_cancel2;
  final String? mobile_ok;
  final String? upload_image;

  final String? mobile_send_form_error;
  final String? mobile_form_sent_message;
  //fraud form
  final String? mobile_email_fraud;
  final String? mobile_upload_image_fraud;
  final String? mobile_type_of_fraud;
  final String? message;
  final String? choose_image;

  final String? mobile_fraud_type1;
  final String? mobile_fraud_type2;
  final String? mobile_fraud_type3;
//certificate info
  final String? mobile_ceft_id_no;
  final String? mobile_ceft_status;
  final String? mobile_certificate_valid_until;

  final String? mobile_muslim_friendly;
  final String? mobile_certificate_check_bold_text;
  final String? mobile_certificate_check_text;

  final String? terms;
  final String? privacy;
  final String? termslink;
  final String? privacylink;
//Search fields
  final String? numbers;
  final String? restaurants;
  final String? products;
  final String? hotels;

  Localized({
    this.mob_copyrights,
    this.halal_control_lithuania,
    this.mobile_e_numbers,
    this.mobile_restaurants,
    this.mobile_restaurants_on_map,
    this.mobile_hotels,
    this.mobile_hotels_on_map,
    this.mobile_products,
    this.mobile_certificate_check,
    this.mobile_contact_us,
    this.mobile_report_fraud,
    //langs
    this.mobile_lang,
    this.mobile_en,
    this.mobile_lt,
    this.mobile_ru,
    this.mobile_es,
    this.mobile_uz,
    //buttons
    this.mobile_send_message,
    this.mobile_certificate_check_button,
    this.mobile_report_fraud2,
    this.mobile_open_in_pdf,
    this.mobile_about_us,
    //contact us form
    this.mobile_form_name,
    this.mobile_form_email,
    this.mobile_form_phone_number,
    this.mobile_form_subject,
    this.mobile_form_message,
    this.contact_form_text,
    this.contact_form_terms,
    this.contact_form_and,
    this.contact_form_privacy,
    this.contact_form_lastText,

    this.mobile_certificate_check_not_found,
    this.mobile_certificate_check_empty,
    //other buttons
    this.mobile_take_a_photo,
    this.mobile_choose_from_gallery,
    this.mobile_upload,
    this.mobile_use_camera,
    this.mobile_cancel,
    this.mobile_cancel2,
    this.mobile_ok,
    this.upload_image,

    this.mobile_send_form_error,
    this.mobile_form_sent_message,
    //fraud form
    this.mobile_email_fraud,
    this.mobile_upload_image_fraud,
    this.mobile_type_of_fraud,
    this.message,
    this.choose_image,

    this.mobile_fraud_type1,
    this.mobile_fraud_type2,
    this.mobile_fraud_type3,
    //certificate info
    this.mobile_ceft_id_no,
    this.mobile_ceft_status,
    this.mobile_certificate_valid_until,

    this.mobile_muslim_friendly,
    this.mobile_certificate_check_bold_text,
    this.mobile_certificate_check_text,

    this.terms,
    this.privacy,
    this.termslink,
    this.privacylink,
//Search fields
    this.numbers,
    this.restaurants,
    this.products,
    this.hotels,
  });

  factory Localized.fromJson(Map<String, dynamic> json) {
    return Localized(
      mob_copyrights: json['acf']['mob_copyrights'] as String,
      mobile_about_us: json['acf']['mobile_about_us'] as String,
      mobile_certificate_check_not_found: json['acf']['mobile_certificate_check_not_found'] as String,
      mobile_certificate_check_empty: json['acf']['mobile_certificate_check_empty'] as String,
      mobile_send_form_error: json['acf']['mobile_send_form_error'] as String,
      mobile_form_sent_message: json['acf']['mobile_form_sent_message'] as String,
      mobile_muslim_friendly: json['acf']['mobile_muslim_friendly'] as String,
      mobile_certificate_check_bold_text: json['acf']['mobile_certificate_check_bold_text'] as String,
      mobile_certificate_check_text: json['acf']['mobile_certificate_check_text'] as String,
      // mobile_buttons: json['acf']['mobile_buttons'] != null
      //     ? (json['acf']['mobile_buttons'] as List)
      //         .map((i) => MobileLanguagesList.fromJson(i))
      //         .toList()
      //     : null,
      halal_control_lithuania: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.halal_control_lithuania.toString()
          : "",
      mobile_e_numbers: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_e_numbers.toString()
          : "",
      mobile_restaurants: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_restaurants.toString()
          : "",
      mobile_restaurants_on_map: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_restaurants_on_map.toString()
          : "",
      mobile_hotels: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_hotels.toString()
          : "",
      mobile_hotels_on_map: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_hotels_on_map.toString()
          : "",
      mobile_products: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_products.toString()
          : "",
      mobile_certificate_check: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_certificate_check.toString()
          : "",
      mobile_contact_us: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_contact_us.toString()
          : "",
      mobile_report_fraud: json['acf']['mobile_page_name'] != null
          ? (json['acf']['mobile_page_name'] as List)
          .map((i) => MobilePageNameList.fromJson(i))
          .toList().first.mobile_report_fraud.toString()
          : "",
      mobile_lang: json['acf']['mobile_languages'] != null
          ? (json['acf']['mobile_languages'] as List)
              .map((i) => MobileLanguagesList.fromJson(i))
              .toList().first.mobile_lang.toString()
          : "",
      mobile_en: json['acf']['mobile_languages'] != null
          ? (json['acf']['mobile_languages'] as List)
              .map((i) => MobileLanguagesList.fromJson(i))
              .toList().first.mobile_en.toString()
          : "",
      mobile_lt: json['acf']['mobile_languages'] != null
          ? (json['acf']['mobile_languages'] as List)
              .map((i) => MobileLanguagesList.fromJson(i))
              .toList().first.mobile_lt.toString()
          : "",
      mobile_ru: json['acf']['mobile_languages'] != null
          ? (json['acf']['mobile_languages'] as List)
              .map((i) => MobileLanguagesList.fromJson(i))
              .toList().first.mobile_ru.toString()
          : "",
      mobile_es: json['acf']['mobile_languages'] != null
          ? (json['acf']['mobile_languages'] as List)
              .map((i) => MobileLanguagesList.fromJson(i))
              .toList().first.mobile_es.toString()
          : "",
      mobile_uz: json['acf']['mobile_languages'] != null
          ? (json['acf']['mobile_languages'] as List)
              .map((i) => MobileLanguagesList.fromJson(i))
              .toList().first.mobile_uz.toString()
          : "",
      mobile_send_message: json['acf']['mobile_buttons'] != null
          ? (json['acf']['mobile_buttons'] as List)
          .map((i) => MobileButtonsList.fromJson(i))
          .toList().first.mobile_send_message.toString()
          : "",
      mobile_certificate_check_button: json['acf']['mobile_buttons'] != null
            ? (json['acf']['mobile_buttons'] as List)
            .map((i) => MobileButtonsList.fromJson(i))
            .toList().first.mobile_certificate_check_button.toString()
            : "",
      mobile_report_fraud2: json['acf']['mobile_buttons'] != null
            ? (json['acf']['mobile_buttons'] as List)
            .map((i) => MobileButtonsList.fromJson(i))
            .toList().first.mobile_report_fraud2.toString()
            : "",
      mobile_open_in_pdf: json['acf']['mobile_buttons'] != null
            ? (json['acf']['mobile_buttons'] as List)
            .map((i) => MobileButtonsList.fromJson(i))
            .toList().first.mobile_open_in_pdf.toString()
            : "",
      mobile_form_name: json['acf']['mobile_contact_form'] != null
            ? (json['acf']['mobile_contact_form'] as List)
            .map((i) => MobileContactFormList.fromJson(i))
            .toList().first.mobile_form_name.toString()
            : "",
      mobile_form_email: json['acf']['mobile_contact_form'] != null
            ? (json['acf']['mobile_contact_form'] as List)
            .map((i) => MobileContactFormList.fromJson(i))
            .toList().first.mobile_form_email.toString()
            : "",
      mobile_form_phone_number: json['acf']['mobile_contact_form'] != null
            ? (json['acf']['mobile_contact_form'] as List)
            .map((i) => MobileContactFormList.fromJson(i))
            .toList().first.mobile_form_phone_number.toString()
            : "",
      mobile_form_subject: json['acf']['mobile_contact_form'] != null
            ? (json['acf']['mobile_contact_form'] as List)
            .map((i) => MobileContactFormList.fromJson(i))
            .toList().first.mobile_form_subject.toString()
            : "",
      mobile_form_message: json['acf']['mobile_contact_form'] != null
            ? (json['acf']['mobile_contact_form'] as List)
            .map((i) => MobileContactFormList.fromJson(i))
            .toList().first.mobile_form_message.toString()
            : "",
      mobile_take_a_photo: json['acf']['mobile_other_buttons'] != null
            ? (json['acf']['mobile_other_buttons'] as List)
            .map((i) => MobileOtherButtonsList.fromJson(i))
            .toList().first.mobile_take_a_photo.toString()
            : "",
      mobile_choose_from_gallery: json['acf']['mobile_other_buttons'] != null
            ? (json['acf']['mobile_other_buttons'] as List)
            .map((i) => MobileOtherButtonsList.fromJson(i))
            .toList().first.mobile_choose_from_gallery.toString()
            : "",
      mobile_upload: json['acf']['mobile_other_buttons'] != null
            ? (json['acf']['mobile_other_buttons'] as List)
            .map((i) => MobileOtherButtonsList.fromJson(i))
            .toList().first.mobile_upload.toString()
            : "",
      mobile_use_camera: json['acf']['mobile_other_buttons'] != null
            ? (json['acf']['mobile_other_buttons'] as List)
            .map((i) => MobileOtherButtonsList.fromJson(i))
            .toList().first.mobile_use_camera.toString()
            : "",
      mobile_cancel: json['acf']['mobile_other_buttons'] != null
            ? (json['acf']['mobile_other_buttons'] as List)
            .map((i) => MobileOtherButtonsList.fromJson(i))
            .toList().first.mobile_cancel.toString()
            : "",
      mobile_cancel2: json['acf']['mobile_other_buttons'] != null
            ? (json['acf']['mobile_other_buttons'] as List)
            .map((i) => MobileOtherButtonsList.fromJson(i))
            .toList().first.mobile_cancel2.toString()
            : "",
      mobile_ok: json['acf']['mobile_other_buttons'] != null
            ? (json['acf']['mobile_other_buttons'] as List)
            .map((i) => MobileOtherButtonsList.fromJson(i))
            .toList().first.mobile_ok.toString()
            : "",
      upload_image: json['acf']['mobile_other_buttons'] != null
            ? (json['acf']['mobile_other_buttons'] as List)
            .map((i) => MobileOtherButtonsList.fromJson(i))
            .toList().first.upload_image.toString()
            : "",
      mobile_email_fraud: json['acf']['mobile_fraud_form'] != null
            ? (json['acf']['mobile_fraud_form'] as List)
            .map((i) => MobileFraudFormList.fromJson(i))
            .toList().first.mobile_email_fraud.toString()
            : "",
      mobile_upload_image_fraud: json['acf']['mobile_fraud_form'] != null
            ? (json['acf']['mobile_fraud_form'] as List)
            .map((i) => MobileFraudFormList.fromJson(i))
            .toList().first.mobile_upload_image_fraud.toString()
            : "",
      mobile_type_of_fraud: json['acf']['mobile_fraud_form'] != null
            ? (json['acf']['mobile_fraud_form'] as List)
            .map((i) => MobileFraudFormList.fromJson(i))
            .toList().first.mobile_type_of_fraud.toString()
            : "",
      message: json['acf']['mobile_fraud_form'] != null
            ? (json['acf']['mobile_fraud_form'] as List)
            .map((i) => MobileFraudFormList.fromJson(i))
            .toList().first.message.toString()
            : "",
      choose_image: json['acf']['mobile_fraud_form'] != null
            ? (json['acf']['mobile_fraud_form'] as List)
            .map((i) => MobileFraudFormList.fromJson(i))
            .toList().first.choose_image.toString()
            : "",
      mobile_fraud_type1: json['acf']['mobile_type_of_fraud'] != null
            ? (json['acf']['mobile_type_of_fraud'] as List)
            .map((i) => MobileTypesOfFraudList.fromJson(i))
            .toList().first.mobile_fraud_type1.toString()
            : "",
      mobile_fraud_type2: json['acf']['mobile_type_of_fraud'] != null
          ? (json['acf']['mobile_type_of_fraud'] as List)
          .map((i) => MobileTypesOfFraudList.fromJson(i))
          .toList().first.mobile_fraud_type2.toString()
          : "",
      mobile_fraud_type3: json['acf']['mobile_type_of_fraud'] != null
          ? (json['acf']['mobile_type_of_fraud'] as List)
          .map((i) => MobileTypesOfFraudList.fromJson(i))
          .toList().first.mobile_fraud_type3.toString()
          : "",
      mobile_ceft_id_no: json['acf']['mobile_certificate_info'] != null
          ? (json['acf']['mobile_certificate_info'] as List)
          .map((i) => MobileCertificateInfoList.fromJson(i))
          .toList().first.mobile_ceft_id_no.toString()
          : "",
      mobile_ceft_status: json['acf']['mobile_certificate_info'] != null
          ? (json['acf']['mobile_certificate_info'] as List)
          .map((i) => MobileCertificateInfoList.fromJson(i))
          .toList().first.mobile_ceft_status.toString()
          : "",
      mobile_certificate_valid_until: json['acf']['mobile_certificate_info'] != null
          ? (json['acf']['mobile_certificate_info'] as List)
          .map((i) => MobileCertificateInfoList.fromJson(i))
          .toList().first.mobile_certificate_valid_until.toString()
          : "",
      terms: json['acf']['aboutuslinks'] != null
          ? (json['acf']['aboutuslinks'] as List)
          .map((i) => MobileAboutUsLinksList.fromJson(i))
          .toList().first.terms.toString()
          : "",
      privacy: json['acf']['aboutuslinks'] != null
          ? (json['acf']['aboutuslinks'] as List)
          .map((i) => MobileAboutUsLinksList.fromJson(i))
          .toList().first.privacy.toString()
          : "",
      termslink: json['acf']['aboutuslinks'] != null
          ? (json['acf']['aboutuslinks'] as List)
          .map((i) => MobileAboutUsLinksList.fromJson(i))
          .toList().first.termslink.toString()
          : "",
      privacylink: json['acf']['aboutuslinks'] != null
          ? (json['acf']['aboutuslinks'] as List)
          .map((i) => MobileAboutUsLinksList.fromJson(i))
          .toList().first.privacylink.toString()
          : "",
      contact_form_text: json['acf']['mobile_contact_form_agree'] != null
          ? (json['acf']['mobile_contact_form_agree'] as List)
          .map((i) => ContactFormAgreeList.fromJson(i))
          .toList().first.contact_form_text.toString()
          : "",
      contact_form_terms: json['acf']['mobile_contact_form_agree'] != null
          ? (json['acf']['mobile_contact_form_agree'] as List)
          .map((i) => ContactFormAgreeList.fromJson(i))
          .toList().first.contact_form_terms.toString()
          : "",
      contact_form_and: json['acf']['mobile_contact_form_agree'] != null
          ? (json['acf']['mobile_contact_form_agree'] as List)
          .map((i) => ContactFormAgreeList.fromJson(i))
          .toList().first.contact_form_and.toString()
          : "",
      contact_form_privacy: json['acf']['mobile_contact_form_agree'] != null
          ? (json['acf']['mobile_contact_form_agree'] as List)
          .map((i) => ContactFormAgreeList.fromJson(i))
          .toList().first.contact_form_privacy.toString()
          : "",
      contact_form_lastText: json['acf']['mobile_contact_form_agree'] != null
          ? (json['acf']['mobile_contact_form_agree'] as List)
          .map((i) => ContactFormAgreeList.fromJson(i))
          .toList().first.contact_form_lastText.toString()
          : "",
      numbers: json['acf']['search_field'] != null
          ? (json['acf']['search_field'] as List)
          .map((i) => SearchFieldsList.fromJson(i))
          .toList().first.numbers.toString()
          : "",
      restaurants: json['acf']['search_field'] != null
          ? (json['acf']['search_field'] as List)
          .map((i) => SearchFieldsList.fromJson(i))
          .toList().first.restaurants.toString()
          : "",
      products: json['acf']['search_field'] != null
          ? (json['acf']['search_field'] as List)
          .map((i) => SearchFieldsList.fromJson(i))
          .toList().first.products.toString()
          : "",
      hotels: json['acf']['search_field'] != null
          ? (json['acf']['search_field'] as List)
          .map((i) => SearchFieldsList.fromJson(i))
          .toList().first.hotels.toString()
          : "",

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acf']['mob_copyrights'] = this.mob_copyrights;
    data['acf']['mobile_about_us'] = this.mobile_about_us;
    data['acf']['mobile_certificate_check_not_found'] = this.mobile_certificate_check_not_found;
    data['acf']['mobile_certificate_check_empty'] = this.mobile_certificate_check_empty;
    data['acf']['mobile_send_form_error'] = this.mobile_send_form_error;
    data['acf']['mobile_form_sent_message'] = this.mobile_form_sent_message;
    data['acf']['mobile_muslim_friendly'] = this.mobile_muslim_friendly;
    data['acf']['mobile_certificate_check_bold_text'] = this.mobile_certificate_check_bold_text;
    data['acf']['mobile_certificate_check_text'] = this.mobile_certificate_check_text;
    return data;
  }
}

class MobilePageNameList {
  final String? halal_control_lithuania;
  final String? mobile_e_numbers;
  final String? mobile_restaurants;
  final String? mobile_restaurants_on_map;
  final String? mobile_hotels;
  final String? mobile_hotels_on_map;
  final String? mobile_products;
  final String? mobile_certificate_check;
  final String? mobile_contact_us;
  final String? mobile_report_fraud;

  MobilePageNameList(
      {this.halal_control_lithuania,
      this.mobile_e_numbers,
      this.mobile_restaurants,
      this.mobile_restaurants_on_map,
      this.mobile_hotels,
      this.mobile_hotels_on_map,
      this.mobile_products,
      this.mobile_certificate_check,
      this.mobile_contact_us,
      this.mobile_report_fraud,
      });

  factory MobilePageNameList.fromJson(Map<String, dynamic> json) {
    return MobilePageNameList(
      halal_control_lithuania: json['halal_control_lithuania'],
      mobile_e_numbers: json['mobile_e_numbers'],
      mobile_restaurants: json['mobile_restaurants'],
      mobile_restaurants_on_map: json['mobile_restaurants_on_map'],
      mobile_hotels: json['mobile_hotels'],
      mobile_hotels_on_map: json['mobile_hotels_on_map'],
      mobile_products: json['mobile_products'],
      mobile_certificate_check: json['mobile_certificate_check'],
      mobile_contact_us: json['mobile_contact_us'],
      mobile_report_fraud: json['mobile_report_fraud'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['halal_control_lithuania'] = this.halal_control_lithuania;
    data['mobile_e_numbers'] = this.mobile_e_numbers;
    data['mobile_restaurants'] = this.mobile_restaurants;
    data['mobile_restaurants_on_map'] = this.mobile_restaurants_on_map;
    data['mobile_hotels'] = this.mobile_hotels;
    data['mobile_hotels_on_map'] = this.mobile_hotels_on_map;
    data['mobile_products'] = this.mobile_products;
    data['mobile_certificate_check'] = this.mobile_certificate_check;
    data['mobile_contact_us'] = this.mobile_contact_us;
    data['mobile_report_fraud'] = this.mobile_report_fraud;
    return data;
  }
}

class MobileLanguagesList {
  final String? mobile_lang;
  final String? mobile_en;
  final String? mobile_lt;
  final String? mobile_ru;
  final String? mobile_es;
  final String? mobile_uz;

  MobileLanguagesList(
      {this.mobile_lang,
      this.mobile_en,
      this.mobile_lt,
      this.mobile_ru,
      this.mobile_es,
      this.mobile_uz});

  factory MobileLanguagesList.fromJson(Map<String, dynamic> json) {
    return MobileLanguagesList(
      mobile_lang: json['mobile_lang'],
      mobile_en: json['mobile_en'],
      mobile_lt: json['mobile_lt'],
      mobile_ru: json['mobile_ru'],
      mobile_es: json['mobile_es'],
      mobile_uz: json['mobile_uz'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_lang'] = this.mobile_lang;
    data['mobile_en'] = this.mobile_en;
    data['mobile_lt'] = this.mobile_lt;
    data['mobile_ru'] = this.mobile_ru;
    data['mobile_es'] = this.mobile_es;
    data['mobile_uz'] = this.mobile_uz;
    return data;
  }
}

class MobileButtonsList {
  final String? mobile_send_message;
  final String? mobile_certificate_check_button;
  final String? mobile_report_fraud2;
  final String? mobile_open_in_pdf;

  MobileButtonsList(
      {this.mobile_send_message,
        this.mobile_certificate_check_button,
        this.mobile_report_fraud2,
        this.mobile_open_in_pdf,
      });

  factory MobileButtonsList.fromJson(Map<String, dynamic> json) {
    return MobileButtonsList(
      mobile_send_message: json['mobile_send_message'],
      mobile_certificate_check_button: json['mobile_certificate_check_button'],
      mobile_report_fraud2: json['mobile_report_fraud2'],
      mobile_open_in_pdf: json['mobile_open_in_pdf'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_send_message'] = this.mobile_send_message;
    data['mobile_certificate_check_button'] = this.mobile_certificate_check_button;
    data['mobile_report_fraud2'] = this.mobile_report_fraud2;
    data['mobile_open_in_pdf'] = this.mobile_open_in_pdf;
    return data;
  }
}

class MobileContactFormList {
  final String? mobile_form_name;
  final String? mobile_form_email;
  final String? mobile_form_phone_number;
  final String? mobile_form_subject;
  final String? mobile_form_message;

  MobileContactFormList(
      {this.mobile_form_name,
        this.mobile_form_email,
        this.mobile_form_phone_number,
        this.mobile_form_subject,
        this.mobile_form_message,
      });

  factory MobileContactFormList.fromJson(Map<String, dynamic> json) {
    return MobileContactFormList(
      mobile_form_name: json['mobile_form_name'],
      mobile_form_email: json['mobile_form_email'],
      mobile_form_phone_number: json['mobile_form_phone_number'],
      mobile_form_subject: json['mobile_form_subject'],
      mobile_form_message: json['mobile_form_message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_form_name'] = this.mobile_form_name;
    data['mobile_form_email'] = this.mobile_form_email;
    data['mobile_form_phone_number'] = this.mobile_form_phone_number;
    data['mobile_form_subject'] = this.mobile_form_subject;
    data['mobile_form_message'] = this.mobile_form_message;
    return data;
  }
}

class MobileOtherButtonsList {
  final String? mobile_take_a_photo;
  final String? mobile_choose_from_gallery;
  final String? mobile_upload;
  final String? mobile_use_camera;
  final String? mobile_cancel;
  final String? mobile_cancel2;
  final String? mobile_ok;
  final String? upload_image;

  MobileOtherButtonsList(
      {this.mobile_take_a_photo,
        this.mobile_choose_from_gallery,
        this.mobile_upload,
        this.mobile_use_camera,
        this.mobile_cancel,
        this.mobile_cancel2,
        this.mobile_ok,
        this.upload_image,
      });

  factory MobileOtherButtonsList.fromJson(Map<String, dynamic> json) {
    return MobileOtherButtonsList(
      mobile_take_a_photo: json['mobile_take_a_photo'],
      mobile_choose_from_gallery: json['mobile_choose_from_gallery'],
      mobile_upload: json['mobile_upload'],
      mobile_use_camera: json['mobile_use_camera'],
      mobile_cancel: json['mobile_cancel'],
      mobile_cancel2: json['mobile_cancel2'],
      mobile_ok: json['mobile_ok'],
      upload_image: json['upload_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_take_a_photo'] = this.mobile_take_a_photo;
    data['mobile_choose_from_gallery'] = this.mobile_choose_from_gallery;
    data['mobile_upload'] = this.mobile_upload;
    data['mobile_use_camera'] = this.mobile_use_camera;
    data['mobile_cancel'] = this.mobile_cancel;
    data['mobile_cancel2'] = this.mobile_cancel2;
    data['mobile_ok'] = this.mobile_ok;
    data['upload_image'] = this.upload_image;
    return data;
  }
}

class MobileFraudFormList {
  final String? mobile_email_fraud;
  final String? mobile_upload_image_fraud;
  final String? mobile_type_of_fraud;
  final String? message;
  final String? choose_image;

  MobileFraudFormList(
      {this.mobile_email_fraud,
        this.mobile_upload_image_fraud,
        this.mobile_type_of_fraud,
        this.message,
        this.choose_image,
      });

  factory MobileFraudFormList.fromJson(Map<String, dynamic> json) {
    return MobileFraudFormList(
      mobile_email_fraud: json['mobile_email_fraud'],
      mobile_upload_image_fraud: json['mobile_upload_image_fraud'],
      mobile_type_of_fraud: json['mobile_type_of_fraud'],
      message: json['message'],
      choose_image: json['choose_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_email_fraud'] = this.mobile_email_fraud;
    data['mobile_upload_image_fraud'] = this.mobile_upload_image_fraud;
    data['mobile_type_of_fraud'] = this.mobile_type_of_fraud;
    data['message'] = this.message;
    data['choose_image'] = this.choose_image;

    return data;
  }
}

class MobileTypesOfFraudList {
  final String? mobile_fraud_type1;
  final String? mobile_fraud_type2;
  final String? mobile_fraud_type3;

  MobileTypesOfFraudList(
      {this.mobile_fraud_type1,
        this.mobile_fraud_type2,
        this.mobile_fraud_type3,
      });

  factory MobileTypesOfFraudList.fromJson(Map<String, dynamic> json) {
    return MobileTypesOfFraudList(
      mobile_fraud_type1: json['mobile_fraud_type1'],
      mobile_fraud_type2: json['mobile_fraud_type2'],
      mobile_fraud_type3: json['mobile_fraud_type3'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_fraud_type1'] = this.mobile_fraud_type1;
    data['mobile_fraud_type2'] = this.mobile_fraud_type2;
    data['mobile_fraud_type3'] = this.mobile_fraud_type3;

    return data;
  }
}

class MobileCertificateInfoList {
  final String? mobile_ceft_id_no;
  final String? mobile_ceft_status;
  final String? mobile_certificate_valid_until;

  MobileCertificateInfoList(
      {this.mobile_ceft_id_no,
        this.mobile_ceft_status,
        this.mobile_certificate_valid_until,
      });

  factory MobileCertificateInfoList.fromJson(Map<String, dynamic> json) {
    return MobileCertificateInfoList(
      mobile_ceft_id_no: json['mobile_ceft_id_no'],
      mobile_ceft_status: json['mobile_ceft_status'],
      mobile_certificate_valid_until: json['mobile_certificate_valid_until'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_ceft_id_no'] = this.mobile_ceft_id_no;
    data['mobile_ceft_status'] = this.mobile_ceft_status;
    data['mobile_certificate_valid_until'] = this.mobile_certificate_valid_until;

    return data;
  }
}

class MobileAboutUsLinksList {
  final String? terms;
  final String? privacy;
  final String? termslink;
  final String? privacylink;

  MobileAboutUsLinksList(
      {this.terms,
        this.privacy,
        this.termslink,
        this.privacylink,
      });

  factory MobileAboutUsLinksList.fromJson(Map<String, dynamic> json) {
    return MobileAboutUsLinksList(
      terms: json['terms'],
      privacy: json['privacy'],
      termslink: json['termslink'],
      privacylink: json['privacylink'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terms'] = this.terms;
    data['privacy'] = this.privacy;
    data['termslink'] = this.termslink;
    data['privacylink'] = this.privacylink;

    return data;
  }
}

class ContactFormAgreeList {
  final String? contact_form_text;
  final String? contact_form_terms;
  final String? contact_form_and;
  final String? contact_form_privacy;
  final String? contact_form_lastText;

  ContactFormAgreeList(
      {this.contact_form_text,
       this.contact_form_terms,
      this.contact_form_and,
      this.contact_form_privacy,
      this.contact_form_lastText,
      });

  factory ContactFormAgreeList.fromJson(Map<String, dynamic> json) {
    return ContactFormAgreeList(
      contact_form_text: json['contact_form_text'],
      contact_form_terms: json['contact_form_terms'],
      contact_form_and: json['contact_form_and'],
      contact_form_privacy: json['contact_form_privacy'],
      contact_form_lastText: json['contact_form_lastText'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_form_text'] = this.contact_form_text;
    data['contact_form_terms'] = this.contact_form_terms;
    data['contact_form_and'] = this.contact_form_and;
    data['contact_form_privacy'] = this.contact_form_privacy;
    data['contact_form_lastText'] = this.contact_form_lastText;

    return data;
  }
}

class SearchFieldsList {
  final String? numbers;
  final String? restaurants;
  final String? products;
  final String? hotels;

  SearchFieldsList(
      {this.numbers,
        this.restaurants,
        this.products,
        this.hotels,
      });

  factory SearchFieldsList.fromJson(Map<String, dynamic> json) {
    return SearchFieldsList(
      numbers: json['numbers'],
      restaurants: json['restaurants'],
      products: json['products'],
      hotels: json['hotels'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numbers'] = this.numbers;
    data['restaurants'] = this.restaurants;
    data['products'] = this.products;
    data['hotels'] = this.hotels;

    return data;
  }
}
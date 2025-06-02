// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    // Ensure S.current is set to a non-null value before returning it
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current ??= S(); // If current is null, initialize it

      return S.current!;
    });
  }

  // Make the return type nullable (S?)
  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Financial`
  String get Financial {
    return Intl.message(
      'Financial',
      name: 'Financial',
      desc: '',
      args: [],
    );
  }

  /// `Calender`
  String get Calender {
    return Intl.message(
      'Calender',
      name: 'Calender',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get Old_Password {
    return Intl.message(
      'Old Password',
      name: 'Old_Password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get New_Password {
    return Intl.message(
      'New Password',
      name: 'New_Password',
      desc: '',
      args: [],
    );
  }

  /// `Cofirm Password`
  String get Cofirm_Password {
    return Intl.message(
      'Cofirm Password',
      name: 'Cofirm_Password',
      desc: '',
      args: [],
    );
  }

  /// `Password Change Successfully`
  String get Password_Change_Successfully {
    return Intl.message(
      'Password Change Successfully',
      name: 'Password_Change_Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Error Data`
  String get Error_Data {
    return Intl.message(
      'Error Data',
      name: 'Error_Data',
      desc: '',
      args: [],
    );
  }

  /// `Error Validation`
  String get Error_Validation {
    return Intl.message(
      'Error Validation',
      name: 'Error_Validation',
      desc: '',
      args: [],
    );
  }

  /// `Two passwords don't match`
  String get Two_passwords_dont_match {
    return Intl.message(
      'Two passwords don\'t match',
      name: 'Two_passwords_dont_match',
      desc: '',
      args: [],
    );
  }

  /// `Edit Personal Info`
  String get Edit_Personal_Info {
    return Intl.message(
      'Edit Personal Info',
      name: 'Edit_Personal_Info',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get Email_Address {
    return Intl.message(
      'Email Address',
      name: 'Email_Address',
      desc: '',
      args: [],
    );
  }

  /// `Edit info`
  String get Edit_info {
    return Intl.message(
      'Edit info',
      name: 'Edit_info',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get Title {
    return Intl.message(
      'Title',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get Overview {
    return Intl.message(
      'Overview',
      name: 'Overview',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get Details {
    return Intl.message(
      'Details',
      name: 'Details',
      desc: '',
      args: [],
    );
  }

  /// `TimeLine`
  String get Timeline {
    return Intl.message(
      'TimeLine',
      name: 'Timeline',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get Images {
    return Intl.message(
      'Images',
      name: 'Images',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get Notes {
    return Intl.message(
      'Notes',
      name: 'Notes',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get Active {
    return Intl.message(
      'Active',
      name: 'Active',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get Clear {
    return Intl.message(
      'Clear',
      name: 'Clear',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get Comments {
    return Intl.message(
      'Comments',
      name: 'Comments',
      desc: '',
      args: [],
    );
  }

  /// `XRay`
  String get XRay {
    return Intl.message(
      'XRay',
      name: 'XRay',
      desc: '',
      args: [],
    );
  }

  /// `Intraoraol`
  String get Intraoral {
    return Intl.message(
      'Intraoraol',
      name: 'Intraoral',
      desc: '',
      args: [],
    );
  }

  /// `Extraoral`
  String get Extraoral {
    return Intl.message(
      'Extraoral',
      name: 'Extraoral',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get Products {
    return Intl.message(
      'Products',
      name: 'Products',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `Search Here`
  String get Search_Here {
    return Intl.message(
      'Search Here',
      name: 'Search_Here',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `Drugs`
  String get Drugs {
    return Intl.message(
      'Drugs',
      name: 'Drugs',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get Appointments {
    return Intl.message(
      'Appointments',
      name: 'Appointments',
      desc: '',
      args: [],
    );
  }

  /// `Pick images`
  String get Pick_images {
    return Intl.message(
      'Pick images',
      name: 'Pick_images',
      desc: '',
      args: [],
    );
  }

  /// `Patient Drugs`
  String get Patient_Drugs {
    return Intl.message(
      'Patient Drugs',
      name: 'Patient_Drugs',
      desc: '',
      args: [],
    );
  }

  /// `Add Drug`
  String get Add_Drug {
    return Intl.message(
      'Add Drug',
      name: 'Add_Drug',
      desc: '',
      args: [],
    );
  }

  /// `Save Drug`
  String get Save_Drug {
    return Intl.message(
      'Save Drug',
      name: 'Save_Drug',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get Comment {
    return Intl.message(
      'Comment',
      name: 'Comment',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get Mobile {
    return Intl.message(
      'Mobile',
      name: 'Mobile',
      desc: '',
      args: [],
    );
  }

  /// `Medical`
  String get Medical {
    return Intl.message(
      'Medical',
      name: 'Medical',
      desc: '',
      args: [],
    );
  }

  /// `Patient Medical History`
  String get PatientMedicalHistory {
    return Intl.message(
      'Patient Medical History',
      name: 'PatientMedicalHistory',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get Previous {
    return Intl.message(
      'Previous',
      name: 'Previous',
      desc: '',
      args: [],
    );
  }

  /// `Patient added successfully`
  String get Patientaddedsuccessfully {
    return Intl.message(
      'Patient added successfully',
      name: 'Patientaddedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Someting wrong happend`
  String get Sometingwronghappend {
    return Intl.message(
      'Someting wrong happend',
      name: 'Sometingwronghappend',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `FROM`
  String get FROM {
    return Intl.message(
      'FROM',
      name: 'FROM',
      desc: '',
      args: [],
    );
  }

  /// `TO`
  String get TO {
    return Intl.message(
      'TO',
      name: 'TO',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get Income {
    return Intl.message(
      'Income',
      name: 'Income',
      desc: '',
      args: [],
    );
  }

  /// `Expanses`
  String get Expanses {
    return Intl.message(
      'Expanses',
      name: 'Expanses',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete?`
  String get Areyousureyouwanttodelete {
    return Intl.message(
      'Are you sure you want to delete?',
      name: 'Areyousureyouwanttodelete',
      desc: '',
      args: [],
    );
  }

  /// `Add Income & Expenses`
  String get AddIncomeExpenses {
    return Intl.message(
      'Add Income & Expenses',
      name: 'AddIncomeExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Edit Income & Expenses`
  String get EditIncomeExpenses {
    return Intl.message(
      'Edit Income & Expenses',
      name: 'EditIncomeExpenses',
      desc: '',
      args: [],
    );
  }

  /// `You need to select a Type`
  String get YouneedtoselectaType {
    return Intl.message(
      'You need to select a Type',
      name: 'YouneedtoselectaType',
      desc: '',
      args: [],
    );
  }

  /// `You need to select a Category`
  String get YouneedtoselectaCategory {
    return Intl.message(
      'You need to select a Category',
      name: 'YouneedtoselectaCategory',
      desc: '',
      args: [],
    );
  }

  /// `You need to add Amount`
  String get YouneedtoaddAmount {
    return Intl.message(
      'You need to add Amount',
      name: 'YouneedtoaddAmount',
      desc: '',
      args: [],
    );
  }

  /// `You need to select a Date`
  String get YouneedtoselectaDate {
    return Intl.message(
      'You need to select a Date',
      name: 'YouneedtoselectaDate',
      desc: '',
      args: [],
    );
  }

  /// `Change Status`
  String get ChangeStatus {
    return Intl.message(
      'Change Status',
      name: 'ChangeStatus',
      desc: '',
      args: [],
    );
  }

  /// `Choose status to change`
  String get Choosestatustochange {
    return Intl.message(
      'Choose status to change',
      name: 'Choosestatustochange',
      desc: '',
      args: [],
    );
  }

  /// `Search a doctor`
  String get Searchadoctor {
    return Intl.message(
      'Search a doctor',
      name: 'Searchadoctor',
      desc: '',
      args: [],
    );
  }

  /// `Select doctor`
  String get Selectdoctor {
    return Intl.message(
      'Select doctor',
      name: 'Selectdoctor',
      desc: '',
      args: [],
    );
  }

  /// `Search a patient`
  String get Searchapatient {
    return Intl.message(
      'Search a patient',
      name: 'Searchapatient',
      desc: '',
      args: [],
    );
  }

  /// `Select patient`
  String get Selectpatient {
    return Intl.message(
      'Select patient',
      name: 'Selectpatient',
      desc: '',
      args: [],
    );
  }

  /// `Search a Room`
  String get SearchaRoom {
    return Intl.message(
      'Search a Room',
      name: 'SearchaRoom',
      desc: '',
      args: [],
    );
  }

  /// `Select Room`
  String get SelectRoom {
    return Intl.message(
      'Select Room',
      name: 'SelectRoom',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `You need to select a Doctor`
  String get YouneedtoselectaDoctor {
    return Intl.message(
      'You need to select a Doctor',
      name: 'YouneedtoselectaDoctor',
      desc: '',
      args: [],
    );
  }

  /// `You need to select a Patient`
  String get YouneedtoselectaPatient {
    return Intl.message(
      'You need to select a Patient',
      name: 'YouneedtoselectaPatient',
      desc: '',
      args: [],
    );
  }

  /// `You need to select a Status`
  String get YouneedtoselectaStatus {
    return Intl.message(
      'You need to select a Status',
      name: 'YouneedtoselectaStatus',
      desc: '',
      args: [],
    );
  }

  /// `You need to select a Room`
  String get YouneedtoselectaRoom {
    return Intl.message(
      'You need to select a Room',
      name: 'YouneedtoselectaRoom',
      desc: '',
      args: [],
    );
  }

  /// `Treatment`
  String get Treatment {
    return Intl.message(
      'Treatment',
      name: 'Treatment',
      desc: '',
      args: [],
    );
  }

  /// `Update Treatment`
  String get UpdateTreatment {
    return Intl.message(
      'Update Treatment',
      name: 'UpdateTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Write Medical Company`
  String get WriteMedicalCompany {
    return Intl.message(
      'Write Medical Company',
      name: 'WriteMedicalCompany',
      desc: '',
      args: [],
    );
  }

  /// ` Medical Company`
  String get MedicalCompany {
    return Intl.message(
      ' Medical Company',
      name: 'MedicalCompany',
      desc: '',
      args: [],
    );
  }

  /// `Write Tolerance Ratio`
  String get WriteToleranceRatio {
    return Intl.message(
      'Write Tolerance Ratio',
      name: 'WriteToleranceRatio',
      desc: '',
      args: [],
    );
  }

  /// `Update Procedure`
  String get UpdateProcedure {
    return Intl.message(
      'Update Procedure',
      name: 'UpdateProcedure',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get InviteFriends {
    return Intl.message(
      'Invite Friends',
      name: 'InviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `Invite Your Friends`
  String get InviteYourFriends {
    return Intl.message(
      'Invite Your Friends',
      name: 'InviteYourFriends',
      desc: '',
      args: [],
    );
  }

  /// `Are you one of those who makes everything\n at the last moment?`
  String get Areyouoneofthosewhomakes {
    return Intl.message(
      'Are you one of those who makes everything\n at the last moment?',
      name: 'Areyouoneofthosewhomakes',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get Share {
    return Intl.message(
      'Share',
      name: 'Share',
      desc: '',
      args: [],
    );
  }

  /// `Update Insurance`
  String get UpdateInsurance {
    return Intl.message(
      'Update Insurance',
      name: 'UpdateInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get Help {
    return Intl.message(
      'Help',
      name: 'Help',
      desc: '',
      args: [],
    );
  }

  /// `How can we help you?`
  String get Howcanwehelpyou {
    return Intl.message(
      'How can we help you?',
      name: 'Howcanwehelpyou',
      desc: '',
      args: [],
    );
  }

  /// `It looks like you are experiencing problems\nwith our sign up process. We are here to\nhelp so please get in touch with us`
  String get Itlookslikeyouareexperiencing {
    return Intl.message(
      'It looks like you are experiencing problems\nwith our sign up process. We are here to\nhelp so please get in touch with us',
      name: 'Itlookslikeyouareexperiencing',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Us`
  String get ChatwithUs {
    return Intl.message(
      'Chat with Us',
      name: 'ChatwithUs',
      desc: '',
      args: [],
    );
  }

  /// `Your FeedBack`
  String get YourFeedBack {
    return Intl.message(
      'Your FeedBack',
      name: 'YourFeedBack',
      desc: '',
      args: [],
    );
  }

  /// `Give your best time for this moment.`
  String get Giveyourbesttimeforthismoment {
    return Intl.message(
      'Give your best time for this moment.',
      name: 'Giveyourbesttimeforthismoment',
      desc: '',
      args: [],
    );
  }

  /// `Enter your feedback`
  String get Enteryourfeedback {
    return Intl.message(
      'Enter your feedback',
      name: 'Enteryourfeedback',
      desc: '',
      args: [],
    );
  }

  /// `Invite Freind`
  String get InviteFreind {
    return Intl.message(
      'Invite Freind',
      name: 'InviteFreind',
      desc: '',
      args: [],
    );
  }

  /// `FeedBack`
  String get FeedBack {
    return Intl.message(
      'FeedBack',
      name: 'FeedBack',
      desc: '',
      args: [],
    );
  }

  /// `new password sent to email with new password successfully`
  String get newpasswordsenttoemailwithnewpasswordsuccessfully {
    return Intl.message(
      'new password sent to email with new password successfully',
      name: 'newpasswordsenttoemailwithnewpasswordsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset user password by email?`
  String get youwanttoresetuserpasswordbyemail {
    return Intl.message(
      'Are you sure you want to reset user password by email?',
      name: 'youwanttoresetuserpasswordbyemail',
      desc: '',
      args: [],
    );
  }

  /// `Delete User`
  String get DeleteUser {
    return Intl.message(
      'Delete User',
      name: 'DeleteUser',
      desc: '',
      args: [],
    );
  }

  /// `Account Deleted`
  String get AccountDeleted {
    return Intl.message(
      'Account Deleted',
      name: 'AccountDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Edit User Info`
  String get EditUserInfo {
    return Intl.message(
      'Edit User Info',
      name: 'EditUserInfo',
      desc: '',
      args: [],
    );
  }

  /// `Data updated successfully`
  String get Dataupdatedsuccessfully {
    return Intl.message(
      'Data updated successfully',
      name: 'Dataupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `User Added Successfully`
  String get UserAddedSuccessfully {
    return Intl.message(
      'User Added Successfully',
      name: 'UserAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Write Procedure name`
  String get WriteProcedurename {
    return Intl.message(
      'Write Procedure name',
      name: 'WriteProcedurename',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get SignOut {
    return Intl.message(
      'Sign Out',
      name: 'SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch`
  String get Couldnotlaunch {
    return Intl.message(
      'Could not launch',
      name: 'Couldnotlaunch',
      desc: '',
      args: [],
    );
  }

  /// `New password will be sent to your email.`
  String get Newpasswordwillbesenttoyouremail {
    return Intl.message(
      'New password will be sent to your email.',
      name: 'Newpasswordwillbesenttoyouremail',
      desc: '',
      args: [],
    );
  }

  /// `new password sent to you email successfully.`
  String get newpasswordsenttoyouemailsuccessfully {
    return Intl.message(
      'new password sent to you email successfully.',
      name: 'newpasswordsenttoyouemailsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `done . edit profile details `
  String get doneeditingdetailsprofile {
    return Intl.message(
      'done . edit profile details ',
      name: 'doneeditingdetailsprofile',
      desc: '',
      args: [],
    );
  }

  /// `uploaded images`
  String get uploadedimages {
    return Intl.message(
      'uploaded images',
      name: 'uploadedimages',
      desc: '',
      args: [],
    );
  }

  /// `SomeThing Went Wrongs`
  String get SomeThingWentWrongs {
    return Intl.message(
      'SomeThing Went Wrongs',
      name: 'SomeThingWentWrongs',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get Enable {
    return Intl.message(
      'Enable',
      name: 'Enable',
      desc: '',
      args: [],
    );
  }

  /// `Disable`
  String get Disable {
    return Intl.message(
      'Disable',
      name: 'Disable',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Age {
    return Intl.message(
      'Age',
      name: 'Age',
      desc: '',
      args: [],
    );
  }

  /// `Single`
  String get MS1 {
    return Intl.message(
      'Single',
      name: 'MS1',
      desc: '',
      args: [],
    );
  }

  /// `Married`
  String get MS2 {
    return Intl.message(
      'Married',
      name: 'MS2',
      desc: '',
      args: [],
    );
  }

  /// `Divorced`
  String get MS3 {
    return Intl.message(
      'Divorced',
      name: 'MS3',
      desc: '',
      args: [],
    );
  }

  /// `widow`
  String get MS4 {
    return Intl.message(
      'widow',
      name: 'MS4',
      desc: '',
      args: [],
    );
  }

  /// ` * `
  String get Required {
    return Intl.message(
      ' * ',
      name: 'Required',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get RL0 {
    return Intl.message(
      'Admin',
      name: 'RL0',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get RL1 {
    return Intl.message(
      'Owner',
      name: 'RL1',
      desc: '',
      args: [],
    );
  }

  /// `Branch Manager`
  String get RL2 {
    return Intl.message(
      'Branch Manager',
      name: 'RL2',
      desc: '',
      args: [],
    );
  }

  /// `Operator`
  String get RL3 {
    return Intl.message(
      'Operator',
      name: 'RL3',
      desc: '',
      args: [],
    );
  }

  /// `Secretariat`
  String get RL4 {
    return Intl.message(
      'Secretariat',
      name: 'RL4',
      desc: '',
      args: [],
    );
  }

  /// `Administrative`
  String get RL5 {
    return Intl.message(
      'Administrative',
      name: 'RL5',
      desc: '',
      args: [],
    );
  }

  /// `Basic`
  String get ST1 {
    return Intl.message(
      'Basic',
      name: 'ST1',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get ST2 {
    return Intl.message(
      'Premium',
      name: 'ST2',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get ST3 {
    return Intl.message(
      'Advanced',
      name: 'ST3',
      desc: '',
      args: [],
    );
  }

  /// `Procedure Type`
  String get LT1 {
    return Intl.message(
      'Procedure Type',
      name: 'LT1',
      desc: '',
      args: [],
    );
  }

  /// `Open Type`
  String get LT2 {
    return Intl.message(
      'Open Type',
      name: 'LT2',
      desc: '',
      args: [],
    );
  }

  /// `Standard`
  String get PT1 {
    return Intl.message(
      'Standard',
      name: 'PT1',
      desc: '',
      args: [],
    );
  }

  /// `VIP`
  String get PT2 {
    return Intl.message(
      'VIP',
      name: 'PT2',
      desc: '',
      args: [],
    );
  }

  /// `Blacklist`
  String get PT3 {
    return Intl.message(
      'Blacklist',
      name: 'PT3',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get CN1 {
    return Intl.message(
      'Egypt',
      name: 'CN1',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria`
  String get CT1 {
    return Intl.message(
      'Alexandria',
      name: 'CT1',
      desc: '',
      args: [],
    );
  }

  /// `Aswan`
  String get CT2 {
    return Intl.message(
      'Aswan',
      name: 'CT2',
      desc: '',
      args: [],
    );
  }

  /// `Cairo`
  String get CT3 {
    return Intl.message(
      'Cairo',
      name: 'CT3',
      desc: '',
      args: [],
    );
  }

  /// `Giza`
  String get CT4 {
    return Intl.message(
      'Giza',
      name: 'CT4',
      desc: '',
      args: [],
    );
  }

  /// `Ash sharqia`
  String get CT5 {
    return Intl.message(
      'Ash sharqia',
      name: 'CT5',
      desc: '',
      args: [],
    );
  }

  /// `Menofia`
  String get CT6 {
    return Intl.message(
      'Menofia',
      name: 'CT6',
      desc: '',
      args: [],
    );
  }

  /// `Gharbia`
  String get CT7 {
    return Intl.message(
      'Gharbia',
      name: 'CT7',
      desc: '',
      args: [],
    );
  }

  /// `Luxor`
  String get CT8 {
    return Intl.message(
      'Luxor',
      name: 'CT8',
      desc: '',
      args: [],
    );
  }

  /// `Asyut`
  String get CT9 {
    return Intl.message(
      'Asyut',
      name: 'CT9',
      desc: '',
      args: [],
    );
  }

  /// `El Beheira`
  String get CT10 {
    return Intl.message(
      'El Beheira',
      name: 'CT10',
      desc: '',
      args: [],
    );
  }

  /// `Beni suef`
  String get CT11 {
    return Intl.message(
      'Beni suef',
      name: 'CT11',
      desc: '',
      args: [],
    );
  }

  /// `Dakahlia`
  String get CT12 {
    return Intl.message(
      'Dakahlia',
      name: 'CT12',
      desc: '',
      args: [],
    );
  }

  /// `Damietta`
  String get CT13 {
    return Intl.message(
      'Damietta',
      name: 'CT13',
      desc: '',
      args: [],
    );
  }

  /// `Faiyum`
  String get CT14 {
    return Intl.message(
      'Faiyum',
      name: 'CT14',
      desc: '',
      args: [],
    );
  }

  /// `Ismailia`
  String get CT15 {
    return Intl.message(
      'Ismailia',
      name: 'CT15',
      desc: '',
      args: [],
    );
  }

  /// `Kafr El sheikh`
  String get CT16 {
    return Intl.message(
      'Kafr El sheikh',
      name: 'CT16',
      desc: '',
      args: [],
    );
  }

  /// `Marsa Matruh`
  String get CT17 {
    return Intl.message(
      'Marsa Matruh',
      name: 'CT17',
      desc: '',
      args: [],
    );
  }

  /// `Minya`
  String get CT18 {
    return Intl.message(
      'Minya',
      name: 'CT18',
      desc: '',
      args: [],
    );
  }

  /// `Al Qalyubia`
  String get CT19 {
    return Intl.message(
      'Al Qalyubia',
      name: 'CT19',
      desc: '',
      args: [],
    );
  }

  /// `New valley`
  String get CT20 {
    return Intl.message(
      'New valley',
      name: 'CT20',
      desc: '',
      args: [],
    );
  }

  /// `North sinai`
  String get CT21 {
    return Intl.message(
      'North sinai',
      name: 'CT21',
      desc: '',
      args: [],
    );
  }

  /// `Port said`
  String get CT22 {
    return Intl.message(
      'Port said',
      name: 'CT22',
      desc: '',
      args: [],
    );
  }

  /// `Qena`
  String get CT23 {
    return Intl.message(
      'Qena',
      name: 'CT23',
      desc: '',
      args: [],
    );
  }

  /// `Red sea`
  String get CT24 {
    return Intl.message(
      'Red sea',
      name: 'CT24',
      desc: '',
      args: [],
    );
  }

  /// `Suez`
  String get CT25 {
    return Intl.message(
      'Suez',
      name: 'CT25',
      desc: '',
      args: [],
    );
  }

  /// `South sinai`
  String get CT26 {
    return Intl.message(
      'South sinai',
      name: 'CT26',
      desc: '',
      args: [],
    );
  }

  /// `Sohag`
  String get CT27 {
    return Intl.message(
      'Sohag',
      name: 'CT27',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get MT1 {
    return Intl.message(
      'Review',
      name: 'MT1',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get MT2 {
    return Intl.message(
      'Suggestions',
      name: 'MT2',
      desc: '',
      args: [],
    );
  }

  /// `Technical Support`
  String get MT3 {
    return Intl.message(
      'Technical Support',
      name: 'MT3',
      desc: '',
      args: [],
    );
  }

  /// `Sales Inquery`
  String get MT4 {
    return Intl.message(
      'Sales Inquery',
      name: 'MT4',
      desc: '',
      args: [],
    );
  }

  /// `Complain`
  String get MT5 {
    return Intl.message(
      'Complain',
      name: 'MT5',
      desc: '',
      args: [],
    );
  }

  /// `مهندس`
  String get T1 {
    return Intl.message(
      'مهندس',
      name: 'T1',
      desc: '',
      args: [],
    );
  }

  /// `د.`
  String get T2 {
    return Intl.message(
      'د.',
      name: 'T2',
      desc: '',
      args: [],
    );
  }

  /// `أ.`
  String get T3 {
    return Intl.message(
      'أ.',
      name: 'T3',
      desc: '',
      args: [],
    );
  }

  /// `م.`
  String get T4 {
    return Intl.message(
      'م.',
      name: 'T4',
      desc: '',
      args: [],
    );
  }

  /// `أنسة.`
  String get T5 {
    return Intl.message(
      'أنسة.',
      name: 'T5',
      desc: '',
      args: [],
    );
  }

  /// `السفير.`
  String get T6 {
    return Intl.message(
      'السفير.',
      name: 'T6',
      desc: '',
      args: [],
    );
  }

  /// `اللواء.`
  String get T7 {
    return Intl.message(
      'اللواء.',
      name: 'T7',
      desc: '',
      args: [],
    );
  }

  /// `Un confirmed`
  String get AS1 {
    return Intl.message(
      'Un confirmed',
      name: 'AS1',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get AS2 {
    return Intl.message(
      'Confirmed',
      name: 'AS2',
      desc: '',
      args: [],
    );
  }

  /// `Checked In`
  String get AS3 {
    return Intl.message(
      'Checked In',
      name: 'AS3',
      desc: '',
      args: [],
    );
  }

  /// `In Chair`
  String get AS4 {
    return Intl.message(
      'In Chair',
      name: 'AS4',
      desc: '',
      args: [],
    );
  }

  /// `Waiting For Doctor`
  String get AS5 {
    return Intl.message(
      'Waiting For Doctor',
      name: 'AS5',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get AS6 {
    return Intl.message(
      'Completed',
      name: 'AS6',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get AS7 {
    return Intl.message(
      'Checkout',
      name: 'AS7',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get AS8 {
    return Intl.message(
      'Canceled',
      name: 'AS8',
      desc: '',
      args: [],
    );
  }

  /// `Missed`
  String get AS9 {
    return Intl.message(
      'Missed',
      name: 'AS9',
      desc: '',
      args: [],
    );
  }

  /// `Planned`
  String get S1 {
    return Intl.message(
      'Planned',
      name: 'S1',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get S2 {
    return Intl.message(
      'In Progress',
      name: 'S2',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get S3 {
    return Intl.message(
      'Done',
      name: 'S3',
      desc: '',
      args: [],
    );
  }

  /// `Done By Other`
  String get S4 {
    return Intl.message(
      'Done By Other',
      name: 'S4',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Payments`
  String get EC1 {
    return Intl.message(
      'Monthly Payments',
      name: 'EC1',
      desc: '',
      args: [],
    );
  }

  /// `Material`
  String get EC2 {
    return Intl.message(
      'Material',
      name: 'EC2',
      desc: '',
      args: [],
    );
  }

  /// `Office Supply`
  String get EC3 {
    return Intl.message(
      'Office Supply',
      name: 'EC3',
      desc: '',
      args: [],
    );
  }

  /// `Dental Lab`
  String get EC4 {
    return Intl.message(
      'Dental Lab',
      name: 'EC4',
      desc: '',
      args: [],
    );
  }

  /// `Food Supply`
  String get EC5 {
    return Intl.message(
      'Food Supply',
      name: 'EC5',
      desc: '',
      args: [],
    );
  }

  /// `Patients`
  String get EC6 {
    return Intl.message(
      'Patients',
      name: 'EC6',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get EC7 {
    return Intl.message(
      'Others',
      name: 'EC7',
      desc: '',
      args: [],
    );
  }

  /// `Add In&Ex`
  String get AddExpense {
    return Intl.message(
      'Add In&Ex',
      name: 'AddExpense',
      desc: '',
      args: [],
    );
  }

  /// `Marital Status`
  String get MaritalStatus {
    return Intl.message(
      'Marital Status',
      name: 'MaritalStatus',
      desc: '',
      args: [],
    );
  }

  /// `Patient Name`
  String get PatientName {
    return Intl.message(
      'Patient Name',
      name: 'PatientName',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get Occupation {
    return Intl.message(
      'Occupation',
      name: 'Occupation',
      desc: '',
      args: [],
    );
  }

  /// `Patient Code`
  String get PatientCode {
    return Intl.message(
      'Patient Code',
      name: 'PatientCode',
      desc: '',
      args: [],
    );
  }

  /// `Phone Work`
  String get PhoneWork {
    return Intl.message(
      'Phone Work',
      name: 'PhoneWork',
      desc: '',
      args: [],
    );
  }

  /// `Patient Type`
  String get PatientType {
    return Intl.message(
      'Patient Type',
      name: 'PatientType',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get EmailAddress {
    return Intl.message(
      'Email',
      name: 'EmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `House Head Phone No.`
  String get HouseHeadNumber {
    return Intl.message(
      'House Head Phone No.',
      name: 'HouseHeadNumber',
      desc: '',
      args: [],
    );
  }

  /// `Has Medical Insurance`
  String get HasMedicalInsurance {
    return Intl.message(
      'Has Medical Insurance',
      name: 'HasMedicalInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Save And Add Again`
  String get SaveAndAddAgain {
    return Intl.message(
      'Save And Add Again',
      name: 'SaveAndAddAgain',
      desc: '',
      args: [],
    );
  }

  /// `Medical Record`
  String get EMR {
    return Intl.message(
      'Medical Record',
      name: 'EMR',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get Create {
    return Intl.message(
      'Create',
      name: 'Create',
      desc: '',
      args: [],
    );
  }

  /// `Driver information`
  String get DriverInfo {
    return Intl.message(
      'Driver information',
      name: 'DriverInfo',
      desc: '',
      args: [],
    );
  }

  /// `User information`
  String get UserInfo {
    return Intl.message(
      'User information',
      name: 'UserInfo',
      desc: '',
      args: [],
    );
  }

  /// `Less than or equal`
  String get LessThanOrEqual {
    return Intl.message(
      'Less than or equal',
      name: 'LessThanOrEqual',
      desc: '',
      args: [],
    );
  }

  /// `Greater than or equal`
  String get GreaterThanOrEqual {
    return Intl.message(
      'Greater than or equal',
      name: 'GreaterThanOrEqual',
      desc: '',
      args: [],
    );
  }

  /// `Bank account information`
  String get BankAccountInfo {
    return Intl.message(
      'Bank account information',
      name: 'BankAccountInfo',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle information`
  String get VehicleInfo {
    return Intl.message(
      'Vehicle information',
      name: 'VehicleInfo',
      desc: '',
      args: [],
    );
  }

  /// `Payment ID`
  String get PaymentID {
    return Intl.message(
      'Payment ID',
      name: 'PaymentID',
      desc: '',
      args: [],
    );
  }

  /// `Save Dieases`
  String get SaveDieases {
    return Intl.message(
      'Save Dieases',
      name: 'SaveDieases',
      desc: '',
      args: [],
    );
  }

  /// `Save Drugs`
  String get SavDrugs {
    return Intl.message(
      'Save Drugs',
      name: 'SavDrugs',
      desc: '',
      args: [],
    );
  }

  /// `Egyptian Pound`
  String get EGP {
    return Intl.message(
      'Egyptian Pound',
      name: 'EGP',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get DeleteAll {
    return Intl.message(
      'Delete All',
      name: 'DeleteAll',
      desc: '',
      args: [],
    );
  }

  /// `Sorry..You account is not active`
  String get SorryYouAccountisNotActive {
    return Intl.message(
      'Sorry..You account is not active',
      name: 'SorryYouAccountisNotActive',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Name`
  String get DoctorName {
    return Intl.message(
      'Doctor Name',
      name: 'DoctorName',
      desc: '',
      args: [],
    );
  }

  /// `Room No`
  String get RoomNo {
    return Intl.message(
      'Room No',
      name: 'RoomNo',
      desc: '',
      args: [],
    );
  }

  /// `Checked In`
  String get CheckedIn {
    return Intl.message(
      'Checked In',
      name: 'CheckedIn',
      desc: '',
      args: [],
    );
  }

  /// `Checked Out`
  String get CheckedOut {
    return Intl.message(
      'Checked Out',
      name: 'CheckedOut',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get EG_Currency {
    return Intl.message(
      'EGP',
      name: 'EG_Currency',
      desc: '',
      args: [],
    );
  }

  /// `LYD`
  String get LY_Currency {
    return Intl.message(
      'LYD',
      name: 'LY_Currency',
      desc: '',
      args: [],
    );
  }

  /// `EUR`
  String get CZ_Currency {
    return Intl.message(
      'EUR',
      name: 'CZ_Currency',
      desc: '',
      args: [],
    );
  }

  /// `USD`
  String get US_Currency {
    return Intl.message(
      'USD',
      name: 'US_Currency',
      desc: '',
      args: [],
    );
  }

  /// `GBP`
  String get GB_Currency {
    return Intl.message(
      'GBP',
      name: 'GB_Currency',
      desc: '',
      args: [],
    );
  }

  /// `Send Reminder`
  String get SendReminder {
    return Intl.message(
      'Send Reminder',
      name: 'SendReminder',
      desc: '',
      args: [],
    );
  }

  /// `Send Whatsapp Reminder`
  String get SendWhatsReminder {
    return Intl.message(
      'Send Whatsapp Reminder',
      name: 'SendWhatsReminder',
      desc: '',
      args: [],
    );
  }

  /// `Go To Today`
  String get GoToToday {
    return Intl.message(
      'Go To Today',
      name: 'GoToToday',
      desc: '',
      args: [],
    );
  }

  /// `Edit Appointment`
  String get EditAppointment {
    return Intl.message(
      'Edit Appointment',
      name: 'EditAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Add Appointment`
  String get AddAppointment {
    return Intl.message(
      'Add Appointment',
      name: 'AddAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Delete Appointment`
  String get DeleteAppointment {
    return Intl.message(
      'Delete Appointment',
      name: 'DeleteAppointment',
      desc: '',
      args: [],
    );
  }

  /// `More Details`
  String get MoreDetails {
    return Intl.message(
      'More Details',
      name: 'MoreDetails',
      desc: '',
      args: [],
    );
  }

  /// `User account`
  String get UserAccount {
    return Intl.message(
      'User account',
      name: 'UserAccount',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get falseBool {
    return Intl.message(
      'No',
      name: 'falseBool',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get FalseBool {
    return Intl.message(
      'No',
      name: 'FalseBool',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get trueBool {
    return Intl.message(
      'Yes',
      name: 'trueBool',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get TrueBool {
    return Intl.message(
      'Yes',
      name: 'TrueBool',
      desc: '',
      args: [],
    );
  }

  /// `All Day`
  String get isAllDay {
    return Intl.message(
      'All Day',
      name: 'isAllDay',
      desc: '',
      args: [],
    );
  }

  /// `All Day`
  String get IsAllDay {
    return Intl.message(
      'All Day',
      name: 'IsAllDay',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get User {
    return Intl.message(
      'User',
      name: 'User',
      desc: '',
      args: [],
    );
  }

  /// `NoDataFound`
  String get NoDataFound {
    return Intl.message(
      'NoDataFound',
      name: 'NoDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Clients`
  String get Clients {
    return Intl.message(
      'Clients',
      name: 'Clients',
      desc: '',
      args: [],
    );
  }

  /// `Client`
  String get Client {
    return Intl.message(
      'Client',
      name: 'Client',
      desc: '',
      args: [],
    );
  }

  /// `PentaCors Denta`
  String get ProjectTitle {
    return Intl.message(
      'PentaCors Denta',
      name: 'ProjectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Setting {
    return Intl.message(
      'Settings',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled`
  String get Scheduled {
    return Intl.message(
      'Scheduled',
      name: 'Scheduled',
      desc: '',
      args: [],
    );
  }

  /// `Schedule conflict`
  String get ScheduleConflict {
    return Intl.message(
      'Schedule conflict',
      name: 'ScheduleConflict',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message(
      'Edit',
      name: 'Edit',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message(
      'Back',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get FirstName {
    return Intl.message(
      'First name',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get LastName {
    return Intl.message(
      'Last name',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get PhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `There are no drivers available at the moment`
  String get showNoDrivers {
    return Intl.message(
      'There are no drivers available at the moment',
      name: 'showNoDrivers',
      desc: '',
      args: [],
    );
  }

  /// `Tax ID`
  String get TaxID {
    return Intl.message(
      'Tax ID',
      name: 'TaxID',
      desc: '',
      args: [],
    );
  }

  /// `Back to home`
  String get BackToHome {
    return Intl.message(
      'Back to home',
      name: 'BackToHome',
      desc: '',
      args: [],
    );
  }

  /// `Commercial registration ID`
  String get CommercialRegistrationID {
    return Intl.message(
      'Commercial registration ID',
      name: 'CommercialRegistrationID',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `Zip code`
  String get ZipCode {
    return Intl.message(
      'Zip code',
      name: 'ZipCode',
      desc: '',
      args: [],
    );
  }

  /// `Driver balance`
  String get DriverBalance {
    return Intl.message(
      'Driver balance',
      name: 'DriverBalance',
      desc: '',
      args: [],
    );
  }

  /// `Account status`
  String get AccountStatus {
    return Intl.message(
      'Account status',
      name: 'AccountStatus',
      desc: '',
      args: [],
    );
  }

  /// `Vacation mode`
  String get VacationMode {
    return Intl.message(
      'Vacation mode',
      name: 'VacationMode',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle type`
  String get VehicleType {
    return Intl.message(
      'Vehicle type',
      name: 'VehicleType',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle option`
  String get VehicleOption {
    return Intl.message(
      'Vehicle option',
      name: 'VehicleOption',
      desc: '',
      args: [],
    );
  }

  /// `User balance`
  String get UserBalance {
    return Intl.message(
      'User balance',
      name: 'UserBalance',
      desc: '',
      args: [],
    );
  }

  /// `No data available... Please try again`
  String get showNoDataAvailable {
    return Intl.message(
      'No data available... Please try again',
      name: 'showNoDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message(
      'Error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong... Please try again`
  String get showError {
    return Intl.message(
      'Something went wrong... Please try again',
      name: 'showError',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get Update {
    return Intl.message(
      'Update',
      name: 'Update',
      desc: '',
      args: [],
    );
  }

  /// `Record updated successfully...`
  String get showUpdate {
    return Intl.message(
      'Record updated successfully...',
      name: 'showUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get ResetPassword {
    return Intl.message(
      'Reset password',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Kindly check you email for new password...`
  String get showCheckEmail {
    return Intl.message(
      'Kindly check you email for new password...',
      name: 'showCheckEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password changed...`
  String get showPasswordChanged {
    return Intl.message(
      'Password changed...',
      name: 'showPasswordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get Dashboard {
    return Intl.message(
      'Dashboard',
      name: 'Dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get Height {
    return Intl.message(
      'Height',
      name: 'Height',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get Length {
    return Intl.message(
      'Length',
      name: 'Length',
      desc: '',
      args: [],
    );
  }

  /// `Width`
  String get Width {
    return Intl.message(
      'Width',
      name: 'Width',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get Country {
    return Intl.message(
      'Country',
      name: 'Country',
      desc: '',
      args: [],
    );
  }

  /// `CUSTOMER ID`
  String get CustomerId {
    return Intl.message(
      'CUSTOMER ID',
      name: 'CustomerId',
      desc: '',
      args: [],
    );
  }

  /// `Start country`
  String get StartCountry {
    return Intl.message(
      'Start country',
      name: 'StartCountry',
      desc: '',
      args: [],
    );
  }

  /// `Start country code`
  String get StartCountryCode {
    return Intl.message(
      'Start country code',
      name: 'StartCountryCode',
      desc: '',
      args: [],
    );
  }

  /// `End country`
  String get EndCountry {
    return Intl.message(
      'End country',
      name: 'EndCountry',
      desc: '',
      args: [],
    );
  }

  /// `End country code`
  String get EndCountryCode {
    return Intl.message(
      'End country code',
      name: 'EndCountryCode',
      desc: '',
      args: [],
    );
  }

  /// `Find near by drivers`
  String get FindNearByDrivers {
    return Intl.message(
      'Find near by drivers',
      name: 'FindNearByDrivers',
      desc: '',
      args: [],
    );
  }

  /// `eCommerce`
  String get eCommerce {
    return Intl.message(
      'eCommerce',
      name: 'eCommerce',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get Chat {
    return Intl.message(
      'Chat',
      name: 'Chat',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get Calendar {
    return Intl.message(
      'Calendar',
      name: 'Calendar',
      desc: '',
      args: [],
    );
  }

  /// `Full calendar`
  String get FullCalendar {
    return Intl.message(
      'Full calendar',
      name: 'FullCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Simple calendar`
  String get SimpleCalendar {
    return Intl.message(
      'Simple calendar',
      name: 'SimpleCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get Shop {
    return Intl.message(
      'Shop',
      name: 'Shop',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get Checkout {
    return Intl.message(
      'Checkout',
      name: 'Checkout',
      desc: '',
      args: [],
    );
  }

  /// `UI`
  String get UI {
    return Intl.message(
      'UI',
      name: 'UI',
      desc: '',
      args: [],
    );
  }

  /// `Colors`
  String get Colors {
    return Intl.message(
      'Colors',
      name: 'Colors',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get Card {
    return Intl.message(
      'Card',
      name: 'Card',
      desc: '',
      args: [],
    );
  }

  /// `Basic`
  String get Basic {
    return Intl.message(
      'Basic',
      name: 'Basic',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get Statistics {
    return Intl.message(
      'Statistics',
      name: 'Statistics',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get Analytics {
    return Intl.message(
      'Analytics',
      name: 'Analytics',
      desc: '',
      args: [],
    );
  }

  /// `Table`
  String get Table {
    return Intl.message(
      'Table',
      name: 'Table',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get Alert {
    return Intl.message(
      'Alert',
      name: 'Alert',
      desc: '',
      args: [],
    );
  }

  /// `Avatar`
  String get Avatar {
    return Intl.message(
      'Avatar',
      name: 'Avatar',
      desc: '',
      args: [],
    );
  }

  /// `Chip`
  String get Chip {
    return Intl.message(
      'Chip',
      name: 'Chip',
      desc: '',
      args: [],
    );
  }

  /// `Collapse`
  String get Collapse {
    return Intl.message(
      'Collapse',
      name: 'Collapse',
      desc: '',
      args: [],
    );
  }

  /// `Dialogs`
  String get Dialogs {
    return Intl.message(
      'Dialogs',
      name: 'Dialogs',
      desc: '',
      args: [],
    );
  }

  /// `Divider`
  String get Divider {
    return Intl.message(
      'Divider',
      name: 'Divider',
      desc: '',
      args: [],
    );
  }

  /// `DropDown`
  String get DropDown {
    return Intl.message(
      'DropDown',
      name: 'DropDown',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get List {
    return Intl.message(
      'List',
      name: 'List',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get Loading {
    return Intl.message(
      'Loading',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `Navbar`
  String get Navbar {
    return Intl.message(
      'Navbar',
      name: 'Navbar',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Pagination`
  String get Pagination {
    return Intl.message(
      'Pagination',
      name: 'Pagination',
      desc: '',
      args: [],
    );
  }

  /// `Popup`
  String get Popup {
    return Intl.message(
      'Popup',
      name: 'Popup',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get Progress {
    return Intl.message(
      'Progress',
      name: 'Progress',
      desc: '',
      args: [],
    );
  }

  /// `Sidebar`
  String get Sidebar {
    return Intl.message(
      'Sidebar',
      name: 'Sidebar',
      desc: '',
      args: [],
    );
  }

  /// `Slider`
  String get Slider {
    return Intl.message(
      'Slider',
      name: 'Slider',
      desc: '',
      args: [],
    );
  }

  /// `Tabs`
  String get Tabs {
    return Intl.message(
      'Tabs',
      name: 'Tabs',
      desc: '',
      args: [],
    );
  }

  /// `Tooltip`
  String get Tooltip {
    return Intl.message(
      'Tooltip',
      name: 'Tooltip',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get Upload {
    return Intl.message(
      'Upload',
      name: 'Upload',
      desc: '',
      args: [],
    );
  }

  /// `Forms & Table`
  String get FormsAndTable {
    return Intl.message(
      'Forms & Table',
      name: 'FormsAndTable',
      desc: '',
      args: [],
    );
  }

  /// `Form Elements`
  String get FormElements {
    return Intl.message(
      'Form Elements',
      name: 'FormElements',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get Select {
    return Intl.message(
      'Select',
      name: 'Select',
      desc: '',
      args: [],
    );
  }

  /// `Switch`
  String get Switch {
    return Intl.message(
      'Switch',
      name: 'Switch',
      desc: '',
      args: [],
    );
  }

  /// `Checkbox`
  String get Checkbox {
    return Intl.message(
      'Checkbox',
      name: 'Checkbox',
      desc: '',
      args: [],
    );
  }

  /// `Radio`
  String get Radio {
    return Intl.message(
      'Radio',
      name: 'Radio',
      desc: '',
      args: [],
    );
  }

  /// `Input`
  String get Input {
    return Intl.message(
      'Input',
      name: 'Input',
      desc: '',
      args: [],
    );
  }

  /// `Number input`
  String get NumberInput {
    return Intl.message(
      'Number input',
      name: 'NumberInput',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back, Please login to your account...`
  String get LoginTitle {
    return Intl.message(
      'Welcome back, Please login to your account...',
      name: 'LoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Back to login`
  String get BackToLogin {
    return Intl.message(
      'Back to login',
      name: 'BackToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password ?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot password ?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get RememberMe {
    return Intl.message(
      'Remember me',
      name: 'RememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get CreateAccount {
    return Intl.message(
      'Create account',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Fill the below form to create a new account...`
  String get CreateAccountTitle {
    return Intl.message(
      'Fill the below form to create a new account...',
      name: 'CreateAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get deleteAllNotification {
    return Intl.message(
      'Delete All',
      name: 'deleteAllNotification',
      desc: '',
      args: [],
    );
  }

  /// `View All Notifications`
  String get ViewAllNotifications {
    return Intl.message(
      'View All Notifications',
      name: 'ViewAllNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Mark all as read `
  String get MarkAsReadAll {
    return Intl.message(
      'Mark all as read ',
      name: 'MarkAsReadAll',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get ForgotPasswordPage {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPasswordPage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back, Please Fill the below form to reset password.`
  String get ForgotPasswordPageTitle {
    return Intl.message(
      'Welcome back, Please Fill the below form to reset password.',
      name: 'ForgotPasswordPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lock screen`
  String get LockScreen {
    return Intl.message(
      'Lock screen',
      name: 'LockScreen',
      desc: '',
      args: [],
    );
  }

  /// `Miscellaneous`
  String get Miscellaneous {
    return Intl.message(
      'Miscellaneous',
      name: 'Miscellaneous',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get ComingSoon {
    return Intl.message(
      'Coming soon',
      name: 'ComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Not Authorized`
  String get NotAuthorized {
    return Intl.message(
      'Not Authorized',
      name: 'NotAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get Maintenance {
    return Intl.message(
      'Maintenance',
      name: 'Maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get Filters {
    return Intl.message(
      'Filters',
      name: 'Filters',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get Invoice {
    return Intl.message(
      'Invoice',
      name: 'Invoice',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get FAQ {
    return Intl.message(
      'FAQ',
      name: 'FAQ',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Update image`
  String get UpdateImage {
    return Intl.message(
      'Update image',
      name: 'UpdateImage',
      desc: '',
      args: [],
    );
  }

  /// `Update logo`
  String get UpdateLogo {
    return Intl.message(
      'Update logo',
      name: 'UpdateLogo',
      desc: '',
      args: [],
    );
  }

  /// `Assign to me`
  String get AssignToMe {
    return Intl.message(
      'Assign to me',
      name: 'AssignToMe',
      desc: '',
      args: [],
    );
  }

  /// `Knowledge base`
  String get KnowledgeBase {
    return Intl.message(
      'Knowledge base',
      name: 'KnowledgeBase',
      desc: '',
      args: [],
    );
  }

  /// `Charts & Maps`
  String get ChartsAndMaps {
    return Intl.message(
      'Charts & Maps',
      name: 'ChartsAndMaps',
      desc: '',
      args: [],
    );
  }

  /// `Google  map`
  String get GoogleMap {
    return Intl.message(
      'Google  map',
      name: 'GoogleMap',
      desc: '',
      args: [],
    );
  }

  /// `Extensions`
  String get Extensions {
    return Intl.message(
      'Extensions',
      name: 'Extensions',
      desc: '',
      args: [],
    );
  }

  /// `Quill editor`
  String get QuillEditor {
    return Intl.message(
      'Quill editor',
      name: 'QuillEditor',
      desc: '',
      args: [],
    );
  }

  /// `Datepicker`
  String get Datepicker {
    return Intl.message(
      'Datepicker',
      name: 'Datepicker',
      desc: '',
      args: [],
    );
  }

  /// `Datetime Picker`
  String get DatetimePicker {
    return Intl.message(
      'Datetime Picker',
      name: 'DatetimePicker',
      desc: '',
      args: [],
    );
  }

  /// `Access control`
  String get AccessControl {
    return Intl.message(
      'Access control',
      name: 'AccessControl',
      desc: '',
      args: [],
    );
  }

  /// `I18n`
  String get I18n {
    return Intl.message(
      'I18n',
      name: 'I18n',
      desc: '',
      args: [],
    );
  }

  /// `Carousel`
  String get Carousel {
    return Intl.message(
      'Carousel',
      name: 'Carousel',
      desc: '',
      args: [],
    );
  }

  /// `Clipboard`
  String get Clipboard {
    return Intl.message(
      'Clipboard',
      name: 'Clipboard',
      desc: '',
      args: [],
    );
  }

  /// `Context menu`
  String get ContextMenu {
    return Intl.message(
      'Context menu',
      name: 'ContextMenu',
      desc: '',
      args: [],
    );
  }

  /// `Star ratings`
  String get StarRatings {
    return Intl.message(
      'Star ratings',
      name: 'StarRatings',
      desc: '',
      args: [],
    );
  }

  /// `Autocomplete`
  String get Autocomplete {
    return Intl.message(
      'Autocomplete',
      name: 'Autocomplete',
      desc: '',
      args: [],
    );
  }

  /// `Tree`
  String get Tree {
    return Intl.message(
      'Tree',
      name: 'Tree',
      desc: '',
      args: [],
    );
  }

  /// `Schedual`
  String get Schedual {
    return Intl.message(
      'Schedual',
      name: 'Schedual',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get Import {
    return Intl.message(
      'Import',
      name: 'Import',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get Export {
    return Intl.message(
      'Export',
      name: 'Export',
      desc: '',
      args: [],
    );
  }

  /// `Export selected`
  String get ExportSelected {
    return Intl.message(
      'Export selected',
      name: 'ExportSelected',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get Others {
    return Intl.message(
      'Others',
      name: 'Others',
      desc: '',
      args: [],
    );
  }

  /// `Menu levels`
  String get MenuLevels {
    return Intl.message(
      'Menu levels',
      name: 'MenuLevels',
      desc: '',
      args: [],
    );
  }

  /// `Disabled menu`
  String get DisabledMenu {
    return Intl.message(
      'Disabled menu',
      name: 'DisabledMenu',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get Support {
    return Intl.message(
      'Support',
      name: 'Support',
      desc: '',
      args: [],
    );
  }

  /// `Documentation`
  String get Documentation {
    return Intl.message(
      'Documentation',
      name: 'Documentation',
      desc: '',
      args: [],
    );
  }

  /// `Raise support`
  String get RaiseSupport {
    return Intl.message(
      'Raise support',
      name: 'RaiseSupport',
      desc: '',
      args: [],
    );
  }

  /// `Card title`
  String get demoTitle {
    return Intl.message(
      'Card title',
      name: 'demoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Facility`
  String get Facility {
    return Intl.message(
      'Facility',
      name: 'Facility',
      desc: '',
      args: [],
    );
  }

  /// `Closing date`
  String get ClosingDate {
    return Intl.message(
      'Closing date',
      name: 'ClosingDate',
      desc: '',
      args: [],
    );
  }

  /// `Payment status`
  String get PaymentStatus {
    return Intl.message(
      'Payment status',
      name: 'PaymentStatus',
      desc: '',
      args: [],
    );
  }

  /// `Driver payment status`
  String get DriverPaymentStatus {
    return Intl.message(
      'Driver payment status',
      name: 'DriverPaymentStatus',
      desc: '',
      args: [],
    );
  }

  /// `Question type`
  String get QuestionType {
    return Intl.message(
      'Question type',
      name: 'QuestionType',
      desc: '',
      args: [],
    );
  }

  /// `Question level`
  String get QuestionLevel {
    return Intl.message(
      'Question level',
      name: 'QuestionLevel',
      desc: '',
      args: [],
    );
  }

  /// `Question bank`
  String get QuestionBank {
    return Intl.message(
      'Question bank',
      name: 'QuestionBank',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get Rating {
    return Intl.message(
      'Rating',
      name: 'Rating',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get Actions {
    return Intl.message(
      'Actions',
      name: 'Actions',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get Nationality {
    return Intl.message(
      'Nationality',
      name: 'Nationality',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message(
      'Status',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Contact type`
  String get ContactType {
    return Intl.message(
      'Contact type',
      name: 'ContactType',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get Customer {
    return Intl.message(
      'Customer',
      name: 'Customer',
      desc: '',
      args: [],
    );
  }

  /// `Driver ID`
  String get DriverID {
    return Intl.message(
      'Driver ID',
      name: 'DriverID',
      desc: '',
      args: [],
    );
  }

  /// `User management`
  String get UserManagement {
    return Intl.message(
      'User management',
      name: 'UserManagement',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get Users {
    return Intl.message(
      'Users',
      name: 'Users',
      desc: '',
      args: [],
    );
  }

  /// `Question management`
  String get Question {
    return Intl.message(
      'Question management',
      name: 'Question',
      desc: '',
      args: [],
    );
  }

  /// `Question category`
  String get QuestionCategory {
    return Intl.message(
      'Question category',
      name: 'QuestionCategory',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get UserID {
    return Intl.message(
      'User ID',
      name: 'UserID',
      desc: '',
      args: [],
    );
  }

  /// `Registration date`
  String get RegistrationDate {
    return Intl.message(
      'Registration date',
      name: 'RegistrationDate',
      desc: '',
      args: [],
    );
  }

  /// `Country code`
  String get CountryCode {
    return Intl.message(
      'Country code',
      name: 'CountryCode',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get PaymentMethod {
    return Intl.message(
      'Payment method',
      name: 'PaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `View user details`
  String get ViewUserDetails {
    return Intl.message(
      'View user details',
      name: 'ViewUserDetails',
      desc: '',
      args: [],
    );
  }

  /// `Offer`
  String get Offer {
    return Intl.message(
      'Offer',
      name: 'Offer',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get Duration {
    return Intl.message(
      'Duration',
      name: 'Duration',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get Distance {
    return Intl.message(
      'Distance',
      name: 'Distance',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get Close {
    return Intl.message(
      'Close',
      name: 'Close',
      desc: '',
      args: [],
    );
  }

  /// `Modefide date`
  String get ModefideDate {
    return Intl.message(
      'Modefide date',
      name: 'ModefideDate',
      desc: '',
      args: [],
    );
  }

  /// `Assign to another driver`
  String get AssignToDriver {
    return Intl.message(
      'Assign to another driver',
      name: 'AssignToDriver',
      desc: '',
      args: [],
    );
  }

  /// `Assign`
  String get Assign {
    return Intl.message(
      'Assign',
      name: 'Assign',
      desc: '',
      args: [],
    );
  }

  /// `Time difference`
  String get Time_Deff {
    return Intl.message(
      'Time difference',
      name: 'Time_Deff',
      desc: '',
      args: [],
    );
  }

  /// `Assigned user ID`
  String get AssignedUserID {
    return Intl.message(
      'Assigned user ID',
      name: 'AssignedUserID',
      desc: '',
      args: [],
    );
  }

  /// `Credit limet`
  String get CreditLimet {
    return Intl.message(
      'Credit limet',
      name: 'CreditLimet',
      desc: '',
      args: [],
    );
  }

  /// `Free trips`
  String get FreeTrips {
    return Intl.message(
      'Free trips',
      name: 'FreeTrips',
      desc: '',
      args: [],
    );
  }

  /// `Account type`
  String get AccountType {
    return Intl.message(
      'Account type',
      name: 'AccountType',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Birth date`
  String get BirthDate {
    return Intl.message(
      'Birth date',
      name: 'BirthDate',
      desc: '',
      args: [],
    );
  }

  /// `driver license`
  String get DriverLicense {
    return Intl.message(
      'driver license',
      name: 'DriverLicense',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get NationalID {
    return Intl.message(
      'National ID',
      name: 'NationalID',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get Documents {
    return Intl.message(
      'Documents',
      name: 'Documents',
      desc: '',
      args: [],
    );
  }

  /// `Completed trips`
  String get CompletedTrips {
    return Intl.message(
      'Completed trips',
      name: 'CompletedTrips',
      desc: '',
      args: [],
    );
  }

  /// `License plate`
  String get LicensePlate {
    return Intl.message(
      'License plate',
      name: 'LicensePlate',
      desc: '',
      args: [],
    );
  }

  /// `Bank address`
  String get BankAddress {
    return Intl.message(
      'Bank address',
      name: 'BankAddress',
      desc: '',
      args: [],
    );
  }

  /// `SWIFT`
  String get SWIFT {
    return Intl.message(
      'SWIFT',
      name: 'SWIFT',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get City {
    return Intl.message(
      'City',
      name: 'City',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get State {
    return Intl.message(
      'State',
      name: 'State',
      desc: '',
      args: [],
    );
  }

  /// `Start city`
  String get StartCity {
    return Intl.message(
      'Start city',
      name: 'StartCity',
      desc: '',
      args: [],
    );
  }

  /// `End city`
  String get EndCity {
    return Intl.message(
      'End city',
      name: 'EndCity',
      desc: '',
      args: [],
    );
  }

  /// `Start state`
  String get StartState {
    return Intl.message(
      'Start state',
      name: 'StartState',
      desc: '',
      args: [],
    );
  }

  /// `End state`
  String get EndState {
    return Intl.message(
      'End state',
      name: 'EndState',
      desc: '',
      args: [],
    );
  }

  /// `Insurance`
  String get Insurance {
    return Intl.message(
      'Insurance',
      name: 'Insurance',
      desc: '',
      args: [],
    );
  }

  /// `Insurance value`
  String get InsuranceValue {
    return Intl.message(
      'Insurance value',
      name: 'InsuranceValue',
      desc: '',
      args: [],
    );
  }

  /// `Account number`
  String get AccountNumber {
    return Intl.message(
      'Account number',
      name: 'AccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Bank name`
  String get BankName {
    return Intl.message(
      'Bank name',
      name: 'BankName',
      desc: '',
      args: [],
    );
  }

  /// `Edit user`
  String get EditUser {
    return Intl.message(
      'Edit user',
      name: 'EditUser',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get UserName {
    return Intl.message(
      'User Name',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `Client information`
  String get ClientInformation {
    return Intl.message(
      'Client information',
      name: 'ClientInformation',
      desc: '',
      args: [],
    );
  }

  /// `Submitted order number`
  String get SubmittedOrderNumber {
    return Intl.message(
      'Submitted order number',
      name: 'SubmittedOrderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm change`
  String get ConfirmChange {
    return Intl.message(
      'Confirm change',
      name: 'ConfirmChange',
      desc: '',
      args: [],
    );
  }

  /// `You are about to assign this driver to a driver`
  String get YouAreAboutToChangeThis {
    return Intl.message(
      'You are about to assign this driver to a driver',
      name: 'YouAreAboutToChangeThis',
      desc: '',
      args: [],
    );
  }

  /// `You are about to update bank information`
  String get YouAreAboutToUpdateBankInfo {
    return Intl.message(
      'You are about to update bank information',
      name: 'YouAreAboutToUpdateBankInfo',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get Change {
    return Intl.message(
      'Change',
      name: 'Change',
      desc: '',
      args: [],
    );
  }

  /// `Login attempt`
  String get LoginAttempt {
    return Intl.message(
      'Login attempt',
      name: 'LoginAttempt',
      desc: '',
      args: [],
    );
  }

  /// `You are about to reset passsword`
  String get YouAreAboutToResetPasssword {
    return Intl.message(
      'You are about to reset passsword',
      name: 'YouAreAboutToResetPasssword',
      desc: '',
      args: [],
    );
  }

  /// `Add balance`
  String get AddBalance {
    return Intl.message(
      'Add balance',
      name: 'AddBalance',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get Reset {
    return Intl.message(
      'Reset',
      name: 'Reset',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get Reports {
    return Intl.message(
      'Reports',
      name: 'Reports',
      desc: '',
      args: [],
    );
  }

  /// `Submit offer`
  String get SubmitOffer {
    return Intl.message(
      'Submit offer',
      name: 'SubmitOffer',
      desc: '',
      args: [],
    );
  }

  /// `Offer will send with value`
  String get OfferWillSendWithValue {
    return Intl.message(
      'Offer will send with value',
      name: 'OfferWillSendWithValue',
      desc: '',
      args: [],
    );
  }

  /// `Register created successfuly`
  String get RegisterCreatedSuccessfuly {
    return Intl.message(
      'Register created successfuly',
      name: 'RegisterCreatedSuccessfuly',
      desc: '',
      args: [],
    );
  }

  /// `Already exist`
  String get AlreadyExist {
    return Intl.message(
      'Already exist',
      name: 'AlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `This user already exist`
  String get ThisUserAlreadyExist {
    return Intl.message(
      'This user already exist',
      name: 'ThisUserAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Closing date from`
  String get ClosingDateFrom {
    return Intl.message(
      'Closing date from',
      name: 'ClosingDateFrom',
      desc: '',
      args: [],
    );
  }

  /// `Closing date to`
  String get ClosingDateTo {
    return Intl.message(
      'Closing date to',
      name: 'ClosingDateTo',
      desc: '',
      args: [],
    );
  }

  /// `Delete balance`
  String get DeleteBalance {
    return Intl.message(
      'Delete balance',
      name: 'DeleteBalance',
      desc: '',
      args: [],
    );
  }

  /// `Print invoice`
  String get PrintInvoice {
    return Intl.message(
      'Print invoice',
      name: 'PrintInvoice',
      desc: '',
      args: [],
    );
  }

  /// `print payment`
  String get printpayment {
    return Intl.message(
      'print payment',
      name: 'printpayment',
      desc: '',
      args: [],
    );
  }

  /// `Powered By`
  String get PoweredBy {
    return Intl.message(
      'Powered By',
      name: 'PoweredBy',
      desc: '',
      args: [],
    );
  }

  /// `Add Treatment`
  String get AddTreatment {
    return Intl.message(
      'Add Treatment',
      name: 'AddTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Treatments List`
  String get TreatmentsList {
    return Intl.message(
      'Treatments List',
      name: 'TreatmentsList',
      desc: '',
      args: [],
    );
  }

  /// `Treatment Name`
  String get TreatmentName {
    return Intl.message(
      'Treatment Name',
      name: 'TreatmentName',
      desc: '',
      args: [],
    );
  }

  /// `Add Procedure`
  String get AddProcedure {
    return Intl.message(
      'Add Procedure',
      name: 'AddProcedure',
      desc: '',
      args: [],
    );
  }

  /// `Procedures List`
  String get ProcedureList {
    return Intl.message(
      'Procedures List',
      name: 'ProcedureList',
      desc: '',
      args: [],
    );
  }

  /// `Active Treatments`
  String get ActiveTreatments {
    return Intl.message(
      'Active Treatments',
      name: 'ActiveTreatments',
      desc: '',
      args: [],
    );
  }

  /// `Inactive Treatments`
  String get DeactivateTreatments {
    return Intl.message(
      'Inactive Treatments',
      name: 'DeactivateTreatments',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Companies`
  String get InsuranceCompanies {
    return Intl.message(
      'Insurance Companies',
      name: 'InsuranceCompanies',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Companies List`
  String get InsuranceCompaniesList {
    return Intl.message(
      'Insurance Companies List',
      name: 'InsuranceCompaniesList',
      desc: '',
      args: [],
    );
  }

  /// `Add Insurance Company`
  String get AddInsuranceCompany {
    return Intl.message(
      'Add Insurance Company',
      name: 'AddInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Canceled Appointment`
  String get CanceledAppointment {
    return Intl.message(
      'Canceled Appointment',
      name: 'CanceledAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Patient canceled his appointment at `
  String get CanceledAppointmentTitle {
    return Intl.message(
      'Patient canceled his appointment at ',
      name: 'CanceledAppointmentTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Appointment`
  String get NewAppointment {
    return Intl.message(
      'New Appointment',
      name: 'NewAppointment',
      desc: '',
      args: [],
    );
  }

  /// `New appointment at `
  String get NewAppointmentTitle {
    return Intl.message(
      'New appointment at ',
      name: 'NewAppointmentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Patient Income`
  String get PatientIncome {
    return Intl.message(
      'Patient Income',
      name: 'PatientIncome',
      desc: '',
      args: [],
    );
  }

  /// `User Personal Details`
  String get UserPersonalDetails {
    return Intl.message(
      'User Personal Details',
      name: 'UserPersonalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Loading Branch Details`
  String get LoadingBranchDetails {
    return Intl.message(
      'Loading Branch Details',
      name: 'LoadingBranchDetails',
      desc: '',
      args: [],
    );
  }

  /// `Select Branch`
  String get SelectBranch {
    return Intl.message(
      'Select Branch',
      name: 'SelectBranch',
      desc: '',
      args: [],
    );
  }

  /// `Can't delete default insurance company`
  String get CantDeleteDefaultInsuranceCompany {
    return Intl.message(
      'Can\'t delete default insurance company',
      name: 'CantDeleteDefaultInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Income & Expenses`
  String get InAndEx {
    return Intl.message(
      'Income & Expenses',
      name: 'InAndEx',
      desc: '',
      args: [],
    );
  }

  /// `Price List`
  String get PriceList {
    return Intl.message(
      'Price List',
      name: 'PriceList',
      desc: '',
      args: [],
    );
  }

  /// `Activate`
  String get Activate {
    return Intl.message(
      'Activate',
      name: 'Activate',
      desc: '',
      args: [],
    );
  }

  /// `Company information`
  String get CompanyInfo {
    return Intl.message(
      'Company information',
      name: 'CompanyInfo',
      desc: '',
      args: [],
    );
  }

  /// `Company ID`
  String get CompanyID {
    return Intl.message(
      'Company ID',
      name: 'CompanyID',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get Find {
    return Intl.message(
      'Find',
      name: 'Find',
      desc: '',
      args: [],
    );
  }

  /// `This driver not found`
  String get ThisDriverNotFound {
    return Intl.message(
      'This driver not found',
      name: 'ThisDriverNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Edit Bank information`
  String get EditBankInformation {
    return Intl.message(
      'Edit Bank information',
      name: 'EditBankInformation',
      desc: '',
      args: [],
    );
  }

  /// `Send Text`
  String get SendText {
    return Intl.message(
      'Send Text',
      name: 'SendText',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get Send {
    return Intl.message(
      'Send',
      name: 'Send',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get UserNotFound {
    return Intl.message(
      'User not found',
      name: 'UserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Add driver to company`
  String get AddDriverToCompany {
    return Intl.message(
      'Add driver to company',
      name: 'AddDriverToCompany',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get ALL {
    return Intl.message(
      'All',
      name: 'ALL',
      desc: '',
      args: [],
    );
  }

  /// `Transactions history`
  String get TransactionsHistory {
    return Intl.message(
      'Transactions history',
      name: 'TransactionsHistory',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get Balance {
    return Intl.message(
      'Balance',
      name: 'Balance',
      desc: '',
      args: [],
    );
  }

  /// `Wallet country code`
  String get WalletCountryCode {
    return Intl.message(
      'Wallet country code',
      name: 'WalletCountryCode',
      desc: '',
      args: [],
    );
  }

  /// `Transaction type`
  String get TransactionType {
    return Intl.message(
      'Transaction type',
      name: 'TransactionType',
      desc: '',
      args: [],
    );
  }

  /// `Reciept number`
  String get RecieptNumber {
    return Intl.message(
      'Reciept number',
      name: 'RecieptNumber',
      desc: '',
      args: [],
    );
  }

  /// `Transaction number`
  String get TransactionNumber {
    return Intl.message(
      'Transaction number',
      name: 'TransactionNumber',
      desc: '',
      args: [],
    );
  }

  /// ` you have no access rights to login`
  String get AccessDenied {
    return Intl.message(
      ' you have no access rights to login',
      name: 'AccessDenied',
      desc: '',
      args: [],
    );
  }

  /// `Remove driver`
  String get RemoveDriver {
    return Intl.message(
      'Remove driver',
      name: 'RemoveDriver',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get Remove {
    return Intl.message(
      'Remove',
      name: 'Remove',
      desc: '',
      args: [],
    );
  }

  /// `You are about to remove`
  String get YouAreAboutToRemoveThis {
    return Intl.message(
      'You are about to remove',
      name: 'YouAreAboutToRemoveThis',
      desc: '',
      args: [],
    );
  }

  /// `View on  map`
  String get ViewOnMap {
    return Intl.message(
      'View on  map',
      name: 'ViewOnMap',
      desc: '',
      args: [],
    );
  }

  /// `Credit limit`
  String get CreditLimit {
    return Intl.message(
      'Credit limit',
      name: 'CreditLimit',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Company Wallet balance`
  String get CompanyWalletBalance {
    return Intl.message(
      'Company Wallet balance',
      name: 'CompanyWalletBalance',
      desc: '',
      args: [],
    );
  }

  /// `Apply bank information to all drivers`
  String get ApplyBankInfoToAllDrivers {
    return Intl.message(
      'Apply bank information to all drivers',
      name: 'ApplyBankInfoToAllDrivers',
      desc: '',
      args: [],
    );
  }

  /// `You are about to update bank information for all drivers`
  String get YouAreAboutToUpdateBankInfoForAllDrivers {
    return Intl.message(
      'You are about to update bank information for all drivers',
      name: 'YouAreAboutToUpdateBankInfoForAllDrivers',
      desc: '',
      args: [],
    );
  }

  /// `Update status`
  String get UpdateStatus {
    return Intl.message(
      'Update status',
      name: 'UpdateStatus',
      desc: '',
      args: [],
    );
  }

  /// `?`
  String get QMark {
    return Intl.message(
      '?',
      name: 'QMark',
      desc: '',
      args: [],
    );
  }

  /// `Drivers list`
  String get DriversList {
    return Intl.message(
      'Drivers list',
      name: 'DriversList',
      desc: '',
      args: [],
    );
  }

  /// `Successfully assigned to driver`
  String get successfullyAssignToDriver {
    return Intl.message(
      'Successfully assigned to driver',
      name: 'successfullyAssignToDriver',
      desc: '',
      args: [],
    );
  }

  /// `driver added successfully`
  String get DriverAddeddSuccessfuly {
    return Intl.message(
      'driver added successfully',
      name: 'DriverAddeddSuccessfuly',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get ContactUs {
    return Intl.message(
      'Contact Us',
      name: 'ContactUs',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get To {
    return Intl.message(
      'To',
      name: 'To',
      desc: '',
      args: [],
    );
  }

  /// `View driver on  map`
  String get ViewDriverOnMap {
    return Intl.message(
      'View driver on  map',
      name: 'ViewDriverOnMap',
      desc: '',
      args: [],
    );
  }

  /// `Upload documents`
  String get UploadDocuments {
    return Intl.message(
      'Upload documents',
      name: 'UploadDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Documen name `
  String get DocumentName {
    return Intl.message(
      'Documen name ',
      name: 'DocumentName',
      desc: '',
      args: [],
    );
  }

  /// `Weekly income Per Day`
  String get IncomePerDayforWeek {
    return Intl.message(
      'Weekly income Per Day',
      name: 'IncomePerDayforWeek',
      desc: '',
      args: [],
    );
  }

  /// `Drivers Per truck type`
  String get DriversPerTruckType {
    return Intl.message(
      'Drivers Per truck type',
      name: 'DriversPerTruckType',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get Wallet {
    return Intl.message(
      'Wallet',
      name: 'Wallet',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get Code {
    return Intl.message(
      'Code',
      name: 'Code',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get Amount {
    return Intl.message(
      'Amount',
      name: 'Amount',
      desc: '',
      args: [],
    );
  }

  /// `Message type`
  String get MessageType {
    return Intl.message(
      'Message type',
      name: 'MessageType',
      desc: '',
      args: [],
    );
  }

  /// `Out Standing balance`
  String get outStandingBalance {
    return Intl.message(
      'Out Standing balance',
      name: 'outStandingBalance',
      desc: '',
      args: [],
    );
  }

  /// `Error in the selected country or IBAN!`
  String get IBANErrorMsg {
    return Intl.message(
      'Error in the selected country or IBAN!',
      name: 'IBANErrorMsg',
      desc: '',
      args: [],
    );
  }

  /// `Income per Year`
  String get IncomePerYear {
    return Intl.message(
      'Income per Year',
      name: 'IncomePerYear',
      desc: '',
      args: [],
    );
  }

  /// `Personal Picture`
  String get PersonalPicture {
    return Intl.message(
      'Personal Picture',
      name: 'PersonalPicture',
      desc: '',
      args: [],
    );
  }

  /// `Personal ID front`
  String get PersonalIDFront {
    return Intl.message(
      'Personal ID front',
      name: 'PersonalIDFront',
      desc: '',
      args: [],
    );
  }

  /// `Personal ID back`
  String get PersonalIDBack {
    return Intl.message(
      'Personal ID back',
      name: 'PersonalIDBack',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get Passport {
    return Intl.message(
      'Passport',
      name: 'Passport',
      desc: '',
      args: [],
    );
  }

  /// `Driver license front`
  String get DriverLicenseFront {
    return Intl.message(
      'Driver license front',
      name: 'DriverLicenseFront',
      desc: '',
      args: [],
    );
  }

  /// `Driver license back`
  String get DriverLicenseback {
    return Intl.message(
      'Driver license back',
      name: 'DriverLicenseback',
      desc: '',
      args: [],
    );
  }

  /// `Car registration`
  String get CarRegistration {
    return Intl.message(
      'Car registration',
      name: 'CarRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Car registration back`
  String get CarRegistrationBack {
    return Intl.message(
      'Car registration back',
      name: 'CarRegistrationBack',
      desc: '',
      args: [],
    );
  }

  /// `license Plate back`
  String get LicensePlateBack {
    return Intl.message(
      'license Plate back',
      name: 'LicensePlateBack',
      desc: '',
      args: [],
    );
  }

  /// `license Plate front`
  String get LicensePlateFront {
    return Intl.message(
      'license Plate front',
      name: 'LicensePlateFront',
      desc: '',
      args: [],
    );
  }

  /// `Car Picture`
  String get CarPicture {
    return Intl.message(
      'Car Picture',
      name: 'CarPicture',
      desc: '',
      args: [],
    );
  }

  /// `Car insurance document`
  String get CarInsuranceDoc {
    return Intl.message(
      'Car insurance document',
      name: 'CarInsuranceDoc',
      desc: '',
      args: [],
    );
  }

  /// `Cargo insurance document`
  String get CargoInsuranceDoc {
    return Intl.message(
      'Cargo insurance document',
      name: 'CargoInsuranceDoc',
      desc: '',
      args: [],
    );
  }

  /// `Background check`
  String get BackgroundCheck {
    return Intl.message(
      'Background check',
      name: 'BackgroundCheck',
      desc: '',
      args: [],
    );
  }

  /// `Drug test`
  String get DrugTest {
    return Intl.message(
      'Drug test',
      name: 'DrugTest',
      desc: '',
      args: [],
    );
  }

  /// `Add Event`
  String get add_event {
    return Intl.message(
      'Add Event',
      name: 'add_event',
      desc: '',
      args: [],
    );
  }

  /// `Delete Event`
  String get delete_event {
    return Intl.message(
      'Delete Event',
      name: 'delete_event',
      desc: '',
      args: [],
    );
  }

  /// `Update Event`
  String get update_event {
    return Intl.message(
      'Update Event',
      name: 'update_event',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get Sunday {
    return Intl.message(
      'Sunday',
      name: 'Sunday',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get Monday {
    return Intl.message(
      'Monday',
      name: 'Monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get Tuesday {
    return Intl.message(
      'Tuesday',
      name: 'Tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get Wednesday {
    return Intl.message(
      'Wednesday',
      name: 'Wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get Thursday {
    return Intl.message(
      'Thursday',
      name: 'Thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get Friday {
    return Intl.message(
      'Friday',
      name: 'Friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get Saturday {
    return Intl.message(
      'Saturday',
      name: 'Saturday',
      desc: '',
      args: [],
    );
  }

  /// `Jan`
  String get Jan {
    return Intl.message(
      'Jan',
      name: 'Jan',
      desc: '',
      args: [],
    );
  }

  /// `Feb`
  String get Feb {
    return Intl.message(
      'Feb',
      name: 'Feb',
      desc: '',
      args: [],
    );
  }

  /// `Mar`
  String get Mar {
    return Intl.message(
      'Mar',
      name: 'Mar',
      desc: '',
      args: [],
    );
  }

  /// `Apr`
  String get Apr {
    return Intl.message(
      'Apr',
      name: 'Apr',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get May {
    return Intl.message(
      'May',
      name: 'May',
      desc: '',
      args: [],
    );
  }

  /// `Jun`
  String get Jun {
    return Intl.message(
      'Jun',
      name: 'Jun',
      desc: '',
      args: [],
    );
  }

  /// `Jul`
  String get Jul {
    return Intl.message(
      'Jul',
      name: 'Jul',
      desc: '',
      args: [],
    );
  }

  /// `Aug`
  String get Aug {
    return Intl.message(
      'Aug',
      name: 'Aug',
      desc: '',
      args: [],
    );
  }

  /// `Sep`
  String get Sep {
    return Intl.message(
      'Sep',
      name: 'Sep',
      desc: '',
      args: [],
    );
  }

  /// `Oct`
  String get Oct {
    return Intl.message(
      'Oct',
      name: 'Oct',
      desc: '',
      args: [],
    );
  }

  /// `Nov`
  String get Nov {
    return Intl.message(
      'Nov',
      name: 'Nov',
      desc: '',
      args: [],
    );
  }

  /// `Dec`
  String get Dec {
    return Intl.message(
      'Dec',
      name: 'Dec',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password... Please try again..!`
  String get PasswordError {
    return Intl.message(
      'Invalid Password... Please try again..!',
      name: 'PasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this appointment?`
  String get AreYouSureYouWantToDeleteThisAppointment {
    return Intl.message(
      'Are you sure you want to delete this appointment?',
      name: 'AreYouSureYouWantToDeleteThisAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email... Please try again..!`
  String get EmailError {
    return Intl.message(
      'Invalid Email... Please try again..!',
      name: 'EmailError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid country code... Please try again..!`
  String get CountryError {
    return Intl.message(
      'Invalid country code... Please try again..!',
      name: 'CountryError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong... Please try again..!`
  String get GeneralError {
    return Intl.message(
      'Something went wrong... Please try again..!',
      name: 'GeneralError',
      desc: '',
      args: [],
    );
  }

  /// `Email exist`
  String get EmailExistError {
    return Intl.message(
      'Email exist',
      name: 'EmailExistError',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is not valid`
  String get PhoneNumberNotValid {
    return Intl.message(
      'Phone number is not valid',
      name: 'PhoneNumberNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Successful registration..`
  String get SuccessfulRegistration {
    return Intl.message(
      'Successful registration..',
      name: 'SuccessfulRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message(
      'Success',
      name: 'Success',
      desc: '',
      args: [],
    );
  }

  /// `Email sent successfully..`
  String get EmailsentSuccessfully {
    return Intl.message(
      'Email sent successfully..',
      name: 'EmailsentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get Apply {
    return Intl.message(
      'Apply',
      name: 'Apply',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get Value {
    return Intl.message(
      'Value',
      name: 'Value',
      desc: '',
      args: [],
    );
  }

  /// `send`
  String get send {
    return Intl.message(
      'send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect code`
  String get IncorrectCode {
    return Intl.message(
      'Incorrect code',
      name: 'IncorrectCode',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all required data...`
  String get PleaseFillAllRequiredData {
    return Intl.message(
      'Please fill all required data...',
      name: 'PleaseFillAllRequiredData',
      desc: '',
      args: [],
    );
  }

  /// `Confirm remove`
  String get ConfirmRemove {
    return Intl.message(
      'Confirm remove',
      name: 'ConfirmRemove',
      desc: '',
      args: [],
    );
  }

  /// `Change type`
  String get ChangeType {
    return Intl.message(
      'Change type',
      name: 'ChangeType',
      desc: '',
      args: [],
    );
  }

  /// `You are about to activate `
  String get YouAreAboutToActivateThis {
    return Intl.message(
      'You are about to activate ',
      name: 'YouAreAboutToActivateThis',
      desc: '',
      args: [],
    );
  }

  /// `You are about to deActivate `
  String get YouAreAboutToDeActivateThis {
    return Intl.message(
      'You are about to deActivate ',
      name: 'YouAreAboutToDeActivateThis',
      desc: '',
      args: [],
    );
  }

  /// `Operation done successfuly`
  String get OperationDoneSuccessfuly {
    return Intl.message(
      'Operation done successfuly',
      name: 'OperationDoneSuccessfuly',
      desc: '',
      args: [],
    );
  }

  /// `Follow on map`
  String get FollowOnMap {
    return Intl.message(
      'Follow on map',
      name: 'FollowOnMap',
      desc: '',
      args: [],
    );
  }

  /// `Branch Name`
  String get BranchName {
    return Intl.message(
      'Branch Name',
      name: 'BranchName',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Name`
  String get ClinicName {
    return Intl.message(
      'Clinic Name',
      name: 'ClinicName',
      desc: '',
      args: [],
    );
  }

  /// `Branch Code`
  String get BranchCode {
    return Intl.message(
      'Branch Code',
      name: 'BranchCode',
      desc: '',
      args: [],
    );
  }

  /// `Branch ID`
  String get BranchID {
    return Intl.message(
      'Branch ID',
      name: 'BranchID',
      desc: '',
      args: [],
    );
  }

  /// `Delete Branch`
  String get DeleteBranch {
    return Intl.message(
      'Delete Branch',
      name: 'DeleteBranch',
      desc: '',
      args: [],
    );
  }

  /// `Branch Details`
  String get BranchDetails {
    return Intl.message(
      'Branch Details',
      name: 'BranchDetails',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Code`
  String get ClinicCode {
    return Intl.message(
      'Clinic Code',
      name: 'ClinicCode',
      desc: '',
      args: [],
    );
  }

  /// `No products added for this patient`
  String get NoProductsDataAvailable {
    return Intl.message(
      'No products added for this patient',
      name: 'NoProductsDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No dieases added for this patient`
  String get NoDieasesDataAvailable {
    return Intl.message(
      'No dieases added for this patient',
      name: 'NoDieasesDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No notes available`
  String get NoDataAvailable {
    return Intl.message(
      'No notes available',
      name: 'NoDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `User Details`
  String get UserDetails {
    return Intl.message(
      'User Details',
      name: 'UserDetails',
      desc: '',
      args: [],
    );
  }

  /// `Patient Details`
  String get PatientDetails {
    return Intl.message(
      'Patient Details',
      name: 'PatientDetails',
      desc: '',
      args: [],
    );
  }

  /// `Clinic ID`
  String get ClinicID {
    return Intl.message(
      'Clinic ID',
      name: 'ClinicID',
      desc: '',
      args: [],
    );
  }

  /// `Delete Clinic`
  String get DeleteClinic {
    return Intl.message(
      'Delete Clinic',
      name: 'DeleteClinic',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Details`
  String get ClinicDetails {
    return Intl.message(
      'Clinic Details',
      name: 'ClinicDetails',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Branches`
  String get ClinicBranches {
    return Intl.message(
      'Clinic Branches',
      name: 'ClinicBranches',
      desc: '',
      args: [],
    );
  }

  /// `Clinic List`
  String get ClinicList {
    return Intl.message(
      'Clinic List',
      name: 'ClinicList',
      desc: '',
      args: [],
    );
  }

  /// `Add Clinic`
  String get AddClinic {
    return Intl.message(
      'Add Clinic',
      name: 'AddClinic',
      desc: '',
      args: [],
    );
  }

  /// `Add Branch`
  String get AddBranch {
    return Intl.message(
      'Add Branch',
      name: 'AddBranch',
      desc: '',
      args: [],
    );
  }

  /// `Delete Selected`
  String get DeleteSelected {
    return Intl.message(
      'Delete Selected',
      name: 'DeleteSelected',
      desc: '',
      args: [],
    );
  }

  /// `Patients`
  String get Patients {
    return Intl.message(
      'Patients',
      name: 'Patients',
      desc: '',
      args: [],
    );
  }

  /// `Patient`
  String get Patient {
    return Intl.message(
      'Patient',
      name: 'Patient',
      desc: '',
      args: [],
    );
  }

  /// `Patients List`
  String get PatientsList {
    return Intl.message(
      'Patients List',
      name: 'PatientsList',
      desc: '',
      args: [],
    );
  }

  /// `Add Patient`
  String get AddPatient {
    return Intl.message(
      'Add Patient',
      name: 'AddPatient',
      desc: '',
      args: [],
    );
  }

  /// `House Head Name`
  String get HouseHeadName {
    return Intl.message(
      'House Head Name',
      name: 'HouseHeadName',
      desc: '',
      args: [],
    );
  }

  /// `Users List`
  String get UsersList {
    return Intl.message(
      'Users List',
      name: 'UsersList',
      desc: '',
      args: [],
    );
  }

  /// `New Patient`
  String get NewPatient {
    return Intl.message(
      'New Patient',
      name: 'NewPatient',
      desc: '',
      args: [],
    );
  }

  /// `Add User`
  String get AddUser {
    return Intl.message(
      'Add User',
      name: 'AddUser',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get CityName {
    return Intl.message(
      'City',
      name: 'CityName',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get CountryName {
    return Intl.message(
      'Country',
      name: 'CountryName',
      desc: '',
      args: [],
    );
  }

  /// `Create Branch`
  String get CreateBranch {
    return Intl.message(
      'Create Branch',
      name: 'CreateBranch',
      desc: '',
      args: [],
    );
  }

  /// `Enable Selected`
  String get EnableSelected {
    return Intl.message(
      'Enable Selected',
      name: 'EnableSelected',
      desc: '',
      args: [],
    );
  }

  /// `Disable Selected`
  String get DisableSelected {
    return Intl.message(
      'Disable Selected',
      name: 'DisableSelected',
      desc: '',
      args: [],
    );
  }

  /// `Session expired, Please login again...`
  String get SessionExpired {
    return Intl.message(
      'Session expired, Please login again...',
      name: 'SessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Delete `
  String get AreYouSureYouWantToDelete {
    return Intl.message(
      'Are You Sure You Want To Delete ',
      name: 'AreYouSureYouWantToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Enable`
  String get AreYouSureYouWantToEnable {
    return Intl.message(
      'Are You Sure You Want To Enable',
      name: 'AreYouSureYouWantToEnable',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want To Disable`
  String get AreYouSureYouWantToDisable {
    return Intl.message(
      'Are You Sure You Want To Disable',
      name: 'AreYouSureYouWantToDisable',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance`
  String get MedicalInsuranceComments {
    return Intl.message(
      'Medical Insurance',
      name: 'MedicalInsuranceComments',
      desc: '',
      args: [],
    );
  }

  /// `Date Of Birth`
  String get DateOfBirth {
    return Intl.message(
      'Date Of Birth',
      name: 'DateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Patiet Medical History`
  String get PatientMedical {
    return Intl.message(
      'Patiet Medical History',
      name: 'PatientMedical',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Company`
  String get MedicalInsuranceName {
    return Intl.message(
      'Insurance Company',
      name: 'MedicalInsuranceName',
      desc: '',
      args: [],
    );
  }

  /// `Dieases`
  String get DieasesType {
    return Intl.message(
      'Dieases',
      name: 'DieasesType',
      desc: '',
      args: [],
    );
  }

  /// `Add Diease`
  String get AddDieasesRecords {
    return Intl.message(
      'Add Diease',
      name: 'AddDieasesRecords',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get ProductName {
    return Intl.message(
      'Product Name',
      name: 'ProductName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter required data`
  String get EnterRequiredData {
    return Intl.message(
      'Please enter required data',
      name: 'EnterRequiredData',
      desc: '',
      args: [],
    );
  }

  /// `General Sales Support`
  String get GeneralSalesSupport {
    return Intl.message(
      'General Sales Support',
      name: 'GeneralSalesSupport',
      desc: '',
      args: [],
    );
  }

  /// `Message sent successfully`
  String get ContactUsMessageSentSuccessfully {
    return Intl.message(
      'Message sent successfully',
      name: 'ContactUsMessageSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Choose Status`
  String get ChooseStatus {
    return Intl.message(
      'Choose Status',
      name: 'ChooseStatus',
      desc: '',
      args: [],
    );
  }

  /// `Choose Doctor`
  String get ChooseDoctor {
    return Intl.message(
      'Choose Doctor',
      name: 'ChooseDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get StartTime {
    return Intl.message(
      'Start Time',
      name: 'StartTime',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get EndTime {
    return Intl.message(
      'End Time',
      name: 'EndTime',
      desc: '',
      args: [],
    );
  }

  /// `Choose Patient`
  String get ChoosePatient {
    return Intl.message(
      'Choose Patient',
      name: 'ChoosePatient',
      desc: '',
      args: [],
    );
  }

  /// `Patient Chart`
  String get PatientChart {
    return Intl.message(
      'Patient Chart',
      name: 'PatientChart',
      desc: '',
      args: [],
    );
  }

  /// `Patient Ledger`
  String get PatientLedger {
    return Intl.message(
      'Patient Ledger',
      name: 'PatientLedger',
      desc: '',
      args: [],
    );
  }

  /// `Daily worked hours for week`
  String get DailyWorkedHours {
    return Intl.message(
      'Daily worked hours for week',
      name: 'DailyWorkedHours',
      desc: '',
      args: [],
    );
  }

  /// `Daily appointments for week`
  String get DailyAppointmentsForWeek {
    return Intl.message(
      'Daily appointments for week',
      name: 'DailyAppointmentsForWeek',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get NoInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'NoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Ledger Type`
  String get LedgerType {
    return Intl.message(
      'Ledger Type',
      name: 'LedgerType',
      desc: '',
      args: [],
    );
  }

  /// `Enable / Disable`
  String get EnableDisable {
    return Intl.message(
      'Enable / Disable',
      name: 'EnableDisable',
      desc: '',
      args: [],
    );
  }

  /// `Insurance No.`
  String get MedicalInsuranceNo {
    return Intl.message(
      'Insurance No.',
      name: 'MedicalInsuranceNo',
      desc: '',
      args: [],
    );
  }

  /// `Procedure Name`
  String get ProcedureName {
    return Intl.message(
      'Procedure Name',
      name: 'ProcedureName',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get DeleteProcedure {
    return Intl.message(
      'Delete',
      name: 'DeleteProcedure',
      desc: '',
      args: [],
    );
  }

  /// `Work Phone`
  String get WorkPhone {
    return Intl.message(
      'Work Phone',
      name: 'WorkPhone',
      desc: '',
      args: [],
    );
  }

  /// `Calendar View`
  String get CalendarView {
    return Intl.message(
      'Calendar View',
      name: 'CalendarView',
      desc: '',
      args: [],
    );
  }

  /// `Off Days Color`
  String get OffColor {
    return Intl.message(
      'Off Days Color',
      name: 'OffColor',
      desc: '',
      args: [],
    );
  }

  /// `Work Days Color`
  String get WorkColor {
    return Intl.message(
      'Work Days Color',
      name: 'WorkColor',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get MedicalInsuranceCompany {
    return Intl.message(
      'Company Name',
      name: 'MedicalInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get MedicalCompanyName {
    return Intl.message(
      'Company Name',
      name: 'MedicalCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Female {
    return Intl.message(
      'Female',
      name: 'Female',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Tolerance Ratio`
  String get ToleranceRatio {
    return Intl.message(
      'Tolerance Ratio',
      name: 'ToleranceRatio',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get DeleteInsuranceCompany {
    return Intl.message(
      'Delete',
      name: 'DeleteInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Add Room`
  String get AddRoom {
    return Intl.message(
      'Add Room',
      name: 'AddRoom',
      desc: '',
      args: [],
    );
  }

  /// `Room Name`
  String get RoomName {
    return Intl.message(
      'Room Name',
      name: 'RoomName',
      desc: '',
      args: [],
    );
  }

  /// `Room Color`
  String get RoomColor {
    return Intl.message(
      'Room Color',
      name: 'RoomColor',
      desc: '',
      args: [],
    );
  }

  /// `Total Expenses`
  String get TotalExpenses {
    return Intl.message(
      'Total Expenses',
      name: 'TotalExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Total Income`
  String get TotalIncome {
    return Intl.message(
      'Total Income',
      name: 'TotalIncome',
      desc: '',
      args: [],
    );
  }

  /// `Profit Margin`
  String get ProfitMargin {
    return Intl.message(
      'Profit Margin',
      name: 'ProfitMargin',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get Type {
    return Intl.message(
      'Type',
      name: 'Type',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Reference ID`
  String get ReferenceID {
    return Intl.message(
      'Reference ID',
      name: 'ReferenceID',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get StartDate {
    return Intl.message(
      'Start Date',
      name: 'StartDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get EndDate {
    return Intl.message(
      'End Date',
      name: 'EndDate',
      desc: '',
      args: [],
    );
  }

  /// `Procedure Payments`
  String get ProcedurePayments {
    return Intl.message(
      'Procedure Payments',
      name: 'ProcedurePayments',
      desc: '',
      args: [],
    );
  }

  /// `Account Type`
  String get RoleID {
    return Intl.message(
      'Account Type',
      name: 'RoleID',
      desc: '',
      args: [],
    );
  }

  /// `Total Debit`
  String get TotalDebit {
    return Intl.message(
      'Total Debit',
      name: 'TotalDebit',
      desc: '',
      args: [],
    );
  }

  /// `Total Credit`
  String get TotalCredit {
    return Intl.message(
      'Total Credit',
      name: 'TotalCredit',
      desc: '',
      args: [],
    );
  }

  /// `Total Fees`
  String get TotalFees {
    return Intl.message(
      'Total Fees',
      name: 'TotalFees',
      desc: '',
      args: [],
    );
  }

  /// `Reference Number`
  String get ReferenceNumber {
    return Intl.message(
      'Reference Number',
      name: 'ReferenceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get CreationDate {
    return Intl.message(
      'Date',
      name: 'CreationDate',
      desc: '',
      args: [],
    );
  }

  /// `Dental Chart Code`
  String get DentalChartCode {
    return Intl.message(
      'Dental Chart Code',
      name: 'DentalChartCode',
      desc: '',
      args: [],
    );
  }

  /// `Tooth Num`
  String get ToothNum {
    return Intl.message(
      'Tooth Num',
      name: 'ToothNum',
      desc: '',
      args: [],
    );
  }

  /// `SMS not available during free trial`
  String get showSmsNotAvailableTrial {
    return Intl.message(
      'SMS not available during free trial',
      name: 'showSmsNotAvailableTrial',
      desc: '',
      args: [],
    );
  }

  /// `No rooms available... Please add one first`
  String get showAddRooms {
    return Intl.message(
      'No rooms available... Please add one first',
      name: 'showAddRooms',
      desc: '',
      args: [],
    );
  }

  /// `Deleted successfully`
  String get DeletedSuccessfully {
    return Intl.message(
      'Deleted successfully',
      name: 'DeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Added successfully`
  String get AddedSuccessfully {
    return Intl.message(
      'Added successfully',
      name: 'AddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Updated successfully`
  String get UpdatedSuccessfully {
    return Intl.message(
      'Updated successfully',
      name: 'UpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Fields required`
  String get FieldsRequired {
    return Intl.message(
      'Fields required',
      name: 'FieldsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Can't delete branch with patients`
  String get CanNotDeleteBranchWithPatients {
    return Intl.message(
      'Can\'t delete branch with patients',
      name: 'CanNotDeleteBranchWithPatients',
      desc: '',
      args: [],
    );
  }

  /// `Can't delete clinic with branches`
  String get CanNotDeleteClinicWithBranches {
    return Intl.message(
      'Can\'t delete clinic with branches',
      name: 'CanNotDeleteClinicWithBranches',
      desc: '',
      args: [],
    );
  }

  /// `Branch mobile already exist`
  String get BranchMobileAlreadyExist {
    return Intl.message(
      'Branch mobile already exist',
      name: 'BranchMobileAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Branch name already exist`
  String get BranchNameAlreadyExist {
    return Intl.message(
      'Branch name already exist',
      name: 'BranchNameAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Add required data`
  String get AddRequiredData {
    return Intl.message(
      'Add required data',
      name: 'AddRequiredData',
      desc: '',
      args: [],
    );
  }

  /// `Clinic name exist`
  String get ClinicNameExist {
    return Intl.message(
      'Clinic name exist',
      name: 'ClinicNameExist',
      desc: '',
      args: [],
    );
  }

  /// `Phone number exist`
  String get PhoneNumberExist {
    return Intl.message(
      'Phone number exist',
      name: 'PhoneNumberExist',
      desc: '',
      args: [],
    );
  }

  /// `Clinic name available`
  String get ClinicNameAvailable {
    return Intl.message(
      'Clinic name available',
      name: 'ClinicNameAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Clinic name not available`
  String get ClinicNameNotAvailable {
    return Intl.message(
      'Clinic name not available',
      name: 'ClinicNameNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Branch name availabe`
  String get BranchNameAvailabe {
    return Intl.message(
      'Branch name availabe',
      name: 'BranchNameAvailabe',
      desc: '',
      args: [],
    );
  }

  /// `Branch name not availabe`
  String get BranchNameNotAvailabe {
    return Intl.message(
      'Branch name not availabe',
      name: 'BranchNameNotAvailabe',
      desc: '',
      args: [],
    );
  }

  /// `Name exist before`
  String get NameExistBefore {
    return Intl.message(
      'Name exist before',
      name: 'NameExistBefore',
      desc: '',
      args: [],
    );
  }

  /// `Can't delete patient with negative balance`
  String get CanNotDeletePatientWithNegativeBalance {
    return Intl.message(
      'Can\'t delete patient with negative balance',
      name: 'CanNotDeletePatientWithNegativeBalance',
      desc: '',
      args: [],
    );
  }

  /// `Patient not found`
  String get PatientNotFound {
    return Intl.message(
      'Patient not found',
      name: 'PatientNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Teeth updated successfully`
  String get TeethUpdatedSuccessfully {
    return Intl.message(
      'Teeth updated successfully',
      name: 'TeethUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Doctor procedures report`
  String get DoctorProceduresRep {
    return Intl.message(
      'Doctor procedures report',
      name: 'DoctorProceduresRep',
      desc: '',
      args: [],
    );
  }

  /// `Doctors list`
  String get DoctorsList {
    return Intl.message(
      'Doctors list',
      name: 'DoctorsList',
      desc: '',
      args: [],
    );
  }

  /// `ID not found`
  String get IDNotFound {
    return Intl.message(
      'ID not found',
      name: 'IDNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Saved successfully`
  String get SavedSuccessfully {
    return Intl.message(
      'Saved successfully',
      name: 'SavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Can't delete procedure`
  String get CanNotDeleteProcedure {
    return Intl.message(
      'Can\'t delete procedure',
      name: 'CanNotDeleteProcedure',
      desc: '',
      args: [],
    );
  }

  /// `Not npdated successfully`
  String get NotUpdatedSuccessfully {
    return Intl.message(
      'Not npdated successfully',
      name: 'NotUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Send successfully`
  String get SendSuccessfully {
    return Intl.message(
      'Send successfully',
      name: 'SendSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Not send message`
  String get NotSendMessage {
    return Intl.message(
      'Not send message',
      name: 'NotSendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Can't add payment because balanceless than credit`
  String get CanNotAddPaymentbecauseBalanceLessThanCredit {
    return Intl.message(
      'Can\'t add payment because balanceless than credit',
      name: 'CanNotAddPaymentbecauseBalanceLessThanCredit',
      desc: '',
      args: [],
    );
  }

  /// `Not saved`
  String get NotSaved {
    return Intl.message(
      'Not saved',
      name: 'NotSaved',
      desc: '',
      args: [],
    );
  }

  /// `Not found`
  String get NotFound {
    return Intl.message(
      'Not found',
      name: 'NotFound',
      desc: '',
      args: [],
    );
  }

  /// `Phone number or username exist`
  String get PhoneNumberOrUserNameExist {
    return Intl.message(
      'Phone number or username exist',
      name: 'PhoneNumberOrUserNameExist',
      desc: '',
      args: [],
    );
  }

  /// `Enter vaild email address`
  String get EnterVaildEmailAddress {
    return Intl.message(
      'Enter vaild email address',
      name: 'EnterVaildEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Username is valid`
  String get UsernameIsValid {
    return Intl.message(
      'Username is valid',
      name: 'UsernameIsValid',
      desc: '',
      args: [],
    );
  }

  /// `Username is not valid`
  String get UsernameIsNotValid {
    return Intl.message(
      'Username is not valid',
      name: 'UsernameIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Valid email`
  String get ValidEmail {
    return Intl.message(
      'Valid email',
      name: 'ValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Not valid email`
  String get NotValidEmail {
    return Intl.message(
      'Not valid email',
      name: 'NotValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Valid mobile`
  String get ValidMobile {
    return Intl.message(
      'Valid mobile',
      name: 'ValidMobile',
      desc: '',
      args: [],
    );
  }

  /// `Not valid mobile`
  String get NotValidMobile {
    return Intl.message(
      'Not valid mobile',
      name: 'NotValidMobile',
      desc: '',
      args: [],
    );
  }

  /// `Changed successfully`
  String get ChangedSuccessfully {
    return Intl.message(
      'Changed successfully',
      name: 'ChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Email not exist`
  String get EmailNotExist {
    return Intl.message(
      'Email not exist',
      name: 'EmailNotExist',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credential`
  String get InvalidCredential {
    return Intl.message(
      'Invalid credential',
      name: 'InvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Fees after discount`
  String get FeesAfterDiscount {
    return Intl.message(
      'Fees after discount',
      name: 'FeesAfterDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Branch not found`
  String get BranchIsNull {
    return Intl.message(
      'Branch not found',
      name: 'BranchIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Last visit`
  String get LastVisit {
    return Intl.message(
      'Last visit',
      name: 'LastVisit',
      desc: '',
      args: [],
    );
  }

  /// `Please select one surface at least`
  String get PleaseSelectOneSurfaceAtLeast {
    return Intl.message(
      'Please select one surface at least',
      name: 'PleaseSelectOneSurfaceAtLeast',
      desc: '',
      args: [],
    );
  }

  /// `No medical records`
  String get NoMedicalRecords {
    return Intl.message(
      'No medical records',
      name: 'NoMedicalRecords',
      desc: '',
      args: [],
    );
  }

  /// `Files`
  String get Files {
    return Intl.message(
      'Files',
      name: 'Files',
      desc: '',
      args: [],
    );
  }

  /// `Start working hours`
  String get StartWorkingHours {
    return Intl.message(
      'Start working hours',
      name: 'StartWorkingHours',
      desc: '',
      args: [],
    );
  }

  /// `End working hours`
  String get EndWorkingHours {
    return Intl.message(
      'End working hours',
      name: 'EndWorkingHours',
      desc: '',
      args: [],
    );
  }

  /// `Working days`
  String get WorkingDays {
    return Intl.message(
      'Working days',
      name: 'WorkingDays',
      desc: '',
      args: [],
    );
  }

  /// `Payment type`
  String get PaymentType {
    return Intl.message(
      'Payment type',
      name: 'PaymentType',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete payment with`
  String get AreYouSureYouWantToDeletePaymentWith {
    return Intl.message(
      'Are you sure you want to delete payment with',
      name: 'AreYouSureYouWantToDeletePaymentWith',
      desc: '',
      args: [],
    );
  }

  /// `Press Esc to enter or exit calendar fullscreen mode`
  String get showFullScreenTooltip {
    return Intl.message(
      'Press Esc to enter or exit calendar fullscreen mode',
      name: 'showFullScreenTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

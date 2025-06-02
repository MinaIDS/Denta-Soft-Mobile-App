class ApiRoutes {
  static const String server_url = "https://dentaapi.ids22.org/";
  static const patientImagePath =
      "https://dentaapi.ids22.org/ContentFiles/Clinics/";
  static const userImagePath =
      "https://dentaapi.ids22.org/ContentFiles/UserImages/";

  static const String login =
      server_url + "api/WithoutAuthorize/ClinicName/Login";
  static const String forgetPassword =
      server_url + "api/WithoutAuthorize/ForgetPassword";
  static const String postSearchPatients =
      server_url + "api/Patient/PostSearchPatients";
  static const String addNewPatient = server_url + 'api/Patient/SavePatient';
  static const String getAppointments =
      server_url + "api/Cleander/GetAppointments";
  static const String saveAppointment =
      server_url + "api/Cleander/SaveAppointment";
  static const String deleteAppointment =
      server_url + "api/Cleander/DeleteAppointment";

  // Rooms
  static const String getRooms = server_url + "api/Lookups/GetRooms";
  // Insurance
  static const String getInsuranceCompanies =
      server_url + "api/Lookups/GetInsuranceCompanies";
  static const String getInsuranceCompany =
      server_url + "api/Lookups/GetInsuranceCompany";
  static const String saveInsuranceCompany =
      server_url + "api/Lookups/SaveInsuranceCompany";
  static const String deleteInsuranceCompany =
      server_url + "api/Lookups/DeleteInsuranceCompany";

  // Treatment
  static const String getTreatments =
      server_url + "api/Procedure/GetTreatmentBranches";

  // Procedures
  static const String getProceduresByBranch =
      server_url + "api/Procedure/GetProceduresByBranch";

  //Diseases
  static const String getDiseases =
      server_url + "api/Lookups/GetLookups?groupName=DiseaseType";
  static const String deleteDieases = server_url + "api/Patient/DeleteDieases";
  static const String addDiease = server_url + "api/Patient/SaveDieases";
  //search Products
  static const String getSearchProducts =
      server_url + "api/Patient/GetProductsSearch";
  static const String saveProductDiease =
      server_url + "api/Patient/SaveProductDieases";
  static const String deletePatientProducts =
      server_url + "api/Patient/DeleteProductDieases";
  //Pateient Details
  static const String getPatientDetials = server_url + "api/Patient/GetPatient";

  // Financial
  static const String getIOComes = server_url + "api/IOCome/GetIOComes";
  static const String saveIOCome = server_url + "api/IOCome/SaveIOCome";
  static const String deleteIOCome = server_url + "api/IOCome/DeleteIOCome";

  // DashBoard
  static const String getDailyWorkedHours =
      server_url + "api/Dashboard/GetDailyWorkedHours";
  static const String getDailyAppointmentAsyncs =
      server_url + "api/Dashboard/GetDailyAppointmentAsyncs";

  // user
  static const String changePassword = server_url + "api/User/ChangePassword";
  static const String updateUser = server_url + "api/User/UpdateUser";
  static const String updateImage = server_url + "api/User/UploadImage";
  static const String getUserData = server_url + "api/User/GetUser?";

  // Users
  static const String getUsersSearch = server_url + "api/User/GetUsersSearch";
  static const String deleteUser = server_url + "api/User/DeleteUser";

  // notes
  static const String getNotes = server_url + "api/Patient/GetNotes";
  static const String saveNotes = server_url + "api/Patient/SaveNotes";

  // notes
  static const String getDetailsPatient = server_url + "api/Patient/GetNotes";
  static const String editDetailsPatient = server_url + "api/Patient/SaveNotes";

  // calender search
  static const String getDoctorsNames = server_url + "api/User/GetDoctorsNames";
  static const String getPatientSearchByName =
      server_url + "api/Patient/GetPatientSearchByName";
  static const String editProfile = server_url + "api/Patient/SavePatient";
  static const String updateAppointmentStatus =
      server_url + "api/Cleander/UpdateAppointmentStatus";
  static const String sendSMSMessageManual =
      server_url + "api/SMSMessage/SendSMSMessageManual";

  static const String getAttachments =
      server_url + "api/Patient/GetAttachments";
  static const String deleteAttachments =
      server_url + "api/Patient/DeleteAttachments";

  static const String uploadImage = server_url + "api/Patient/UploadImage";
  static const String saveAttachments =
      server_url + "api/Patient/SaveAttachments";
  static const String saveDieases = server_url + "api/Patient/SaveDieases";
  static const String saveProductDieases =
      server_url + "api/Patient/SaveProductDieases";

  // treatment

  static const String DeleteTreatmentBranch =
      server_url + "api/Procedure/DeleteTreatmentBranch";
  static const String saveProcedure =
      server_url + "api/Procedure/SaveProcedure";
  static const String getProcedures =
      server_url + "api/Procedure/GetProcedures";
  static const String deleteProcedure =
      server_url + "api/Procedure/DeleteProcedure";
  static const String getSingleProcedure =
      server_url + "api/Procedure/GetProcedure";
}

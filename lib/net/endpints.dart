// urlpatterns = [
//     path('user/list/', views.UserList.as_view()),
//     path('user/<int:pk>/', views.UserDetail.as_view()),
//     path('user/create/', UserRecordView.as_view(), name='users'),
//     path('nurse/list/', views.NurseList.as_view()),
//     path('nurse/create/', views.CreateNurse.as_view()),
//     path('nurse/<int:pk>/', views.NurseDetail.as_view()),
//     path('rate/list/', views.RateList.as_view()),
//     path('rate/create/', views.RateCreate.as_view()),
//     path('rate/<int:pk>/', views.RateDetail.as_view()),
// ]
// ignore_for_file: constant_identifier_names
const String apiKey = 'Token 8668725e75eb3452a18bd4057ed55aea69f1e656';
const String baseUrl = 'https://epic1729.pythonanywhere.com/';
const String e_user = 'api/user/';
const String e_get_nurse_list = 'api/nurse/list/';

/// add id when invoke e_get_nurse_update endpoint.
const String e_get_nurse_update = 'api/nurse/';
const String e_create_nurse = 'api/nurse/create/';

/// add id when invoke e_get_nurse_detail endpoint.
const String e_get_nurse_detail = 'api/nurse/';

const String e_create_rate = 'api/rate/create/';
const String e_get_rate = 'api/rate/list/';

/// add id when invoke e_get_user_detail endpoint.
const String e_get_user_detail = 'api/user/';
const String e_create_user = 'api/user/create';
const String e_get_user_list = 'api/user/list/';

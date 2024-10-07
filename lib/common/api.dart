//Production
// String BASE_URL_USER = 'https://nivaas.homes/api/access-mgmt/';
// String BASE_URL_CUSTOMER = 'https://nivaas.homes/api/customer/';
// String BASE_URL_CORE = 'https://nivaas.homes/api/core/';

//dev
String BASE_URL_USER = 'https://nivaas.solutions/api/access-mgmt/';
String BASE_URL_CUSTOMER = 'https://nivaas.solutions/api/customer/';
String BASE_URL_CORE = 'https://nivaas.solutions/api/core/';

String OTP_TRIGGER = 'nivaas/auth/jtuserotp/trigger';
String SIGN_IN = 'nivaas/auth/signin';
String CURRENT_CUSTOMER = 'nivaas/auth/currentCustomer';
String USER_DETAILS = 'user/userDetails';
String PROFILE_PIC = 'user/upload';
String EDIT_PROFILE = 'user';
String REFRESH_TOKEN = 'nivaas/auth/refreshToken';

String GET_CITY = 'nivaascity/list';

// jtapartment
String GET_APARTMENT = 'jtapartment/nearbyapartments';
String NEW_APARTMENT_ONBOARD = 'jtapartment/save';
String ADD_CO_ADMIN = 'jtapartment/add/co-admin';

// jtflat
String GET_FLATS = 'jtflat/apartment/flats';
String GET_FLATS_OWNERS = 'jtflat/without-owners/flat/list';
String ONBOARD_NEW_FLATS = 'jtflat/bulk/onboard';
String UPDATE_ONBOARDED_FLATS_DETAILS = 'jtflat/apartment';
String GET_FLAT_OWNERS = 'jtflat';
String FLATS_ONBOARDING_WITHOUT_DETAILS = 'jtflat/without-owners/bulk/onboard';

// onboarding
String GET_CUSTOMER_ONBOARD_REQUESTS = 'onboarding/requests';
String GET_POSTALCODES = 'jtpostalcode/list';
String ONBOARD_TENANT = 'onboarding/flat/request';
String APPROVE_TENANT = 'onboarding/approve/flat/related-user';
String ONBOARD_FLAT_OWNER = 'onboarding/flat_owner/request';
String APPROVE_FLAT_OWNER = 'onboarding/approve/falt_owner';
String GET_FLAT_OWNER_DETAILS = 'onboarding/flat/list';

// prepaid meter
String ADD_PREPAIDMETER = 'prepaidmeter/save';
String GET_APARTMENT_PREPAID_METERS = 'prepaidmeter/list';
String UPDATE_PREPAID_METER = 'prepaidmeter/update';

// jtmaintenance
String MAINTAINENCE_SAVE = 'jtmaintanance/save';
String MAINTAINENCE_LAST_UPDATED = 'jtmaintanance';

// prepaid usage
String ADD_CONSUMED_UNITS = 'prepaid-usage/flat/update-consumed';

// society
String USER_SOCIETY_DUES = 'society/dues/apartment';
String ADMIN_SOCIETY_DUES = 'society/dues/list';
String UPDATE_PAID_STATUS = 'society/update';

//apartment
String GET_EXPANCES = 'apartment/debit-history/apartment';
String GET_EXPANCES_BY_ID = 'apartment/debit-history';
String GET_EXPANCES_PDF = 'report/apartment';
String ADD_DEBIT_HISTORY = 'apartment/debit-history';
String DELETE_EXPANCES = 'apartment/debit-history/apartment';
String UPDATE_DEBIT_HISTORY = 'apartment/debit-history';
String ADD_CREDIT_HISTORY = 'apartment/credit-history/save';
String UPDATE_CREDIT_HISTORY = 'apartment/credit-history';
String GET_CREDIT_HISTORY = 'apartment/credit-history/apartment';
String DELETE_CREDIT_HISTORY = 'apartment/credit-history/apartment';

String BALANCE_REPORT_PDF = 'report/balance/apartment';
String GET_NOTIFICATION_DATA = 'jtnotification/user/list';
String POST_NOTICE = 'noticeboard/save';
String GET_NOTICES = 'noticeboard/list';
String GET_CURRENTUSER_APARTMENTS = 'current-apartment/get';
String POST_DEFAULT_APARTMENT = 'current-apartment/set';
String GET_DEFAULT_APARTMENT = 'current-apartment/get';
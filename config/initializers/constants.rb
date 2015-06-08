NOTIFICATION_EMAIL = "notifications@qreoh.com"
INSTAMOJO = {
  'development' => {
    'api_key' => '',
    'auth_token' => '',
    'salt' => '',
    'url' => 'https://www.instamojo.com/qreoh/qreoh-payment/?'
  },
  'production' => {
    'api_key' => '',
    'auth_token' => '',
    'salt' => '',
    'url' => 'https://www.instamojo.com/qreoh/qreoh-payment/?'
  }
}
ZWITCH = {
  'development' => {
    'api_key' => '',
    'api_secret' => '',
    'url' => 'https://www.zwitch.co/sandbox/api/checkout/transactions'
  },
  'production' => {
    'api_key' => '',
    'api_secret' => '',
    'url' => 'https://www.zwitch.co/api/checkout/transactions'
  }
}

PAYPAL = {
  'development' => {
    'email' => '',
    'secret' => '',
    'url' => 'https://www.sandbox.paypal.com/cgi-bin/webscr?',
    'return_url' => 'http://localhost:3000/finalize'
  },
  'production' => {
    'email' => '',
    'secret' => '',
    'url' => 'https://www.paypal.com/cgi-bin/webscr?',
    'return_url' => 'http://www.qreoh.com/finalize'
  }
}

HIPCHAT = {
  'development' => {
    'api_key' => ''
  },
  'production' => {
    'api_key' => ''
  }
}

COUNTRY_CODES = {
  'IN' => 'India',
  'US' => 'United States',
  'AT' => 'Austria',
  'BE' => 'Belgium',
  'BG' => 'Bulgaria',
  'HR' => 'Croatia',
  'CY' => 'Cyprus',
  'CZ' => 'Czech Republic',
  'DK' => 'Denmark',
  'EE' => 'Estonia',
  'FI' => 'Finland',
  'FR' => 'France',
  'DE' => 'Germany',
  'GR' => 'Greece',
  'HU' => 'Hungary',
  'IE' => 'Ireland, Republic of (EIRE)',
  'IT' => 'Italy',
  'LV' => 'Latvia',
  'LT' => 'Lithuania',
  'LU' => 'Luxembourg',
  'MT' => 'Malta',
  'NL' => 'Netherlands',
  'PL' => 'Poland',
  'PT' => 'Portugal',
  'RO' => 'Romania',
  'SK' => 'Slovakia',
  'SI' => 'Slovenia',
  'ES' => 'Spain',
  'SE' => 'Sweden',
  'GB' => 'United Kingdom',
  '--' => 'Rest of the World'
}

CURRENCY = {
  'IN' => 'INR', # India
  'US' => 'USD', # United States
  'AT' => 'EUR', # Austria
  'BE' => 'EUR', # Belgium
  'BG' => 'EUR', # Bulgaria
  'HR' => 'EUR', # Croatia
  'CY' => 'EUR', # Cyprus
  'CZ' => 'EUR', # Czech Republic
  'DK' => 'EUR', # Denmark
  'EE' => 'EUR', # Estonia
  'FI' => 'EUR', # Finland
  'FR' => 'EUR', # France
  'DE' => 'EUR', # Germany
  'GR' => 'EUR', # Greece
  'HU' => 'EUR', # Hungary
  'IE' => 'EUR', # Ireland, Republic of (EIRE)
  'IT' => 'EUR', # Italy
  'LV' => 'EUR', # Latvia
  'LT' => 'EUR', # Lithuania
  'LU' => 'EUR', # Luxembourg
  'MT' => 'EUR', # Malta
  'NL' => 'EUR', # Netherlands
  'PL' => 'EUR', # Poland
  'PT' => 'EUR', # Portugal
  'RO' => 'EUR', # Romania
  'SK' => 'EUR', # Slovakia
  'SI' => 'EUR', # Slovenia
  'ES' => 'EUR', # Spain
  'SE' => 'EUR', # Sweden
  'GB' => 'GBP', # United Kingdom
  '--' => 'USD'  # Rest of the World
}

EXCHANGE_RATES = {
  'INR' => 1,
  'USD' => 60,
  'EUR' => 77,
  'GBP' => 99
}

CURRENCY_SYMBOLS = {
  'INR' => '<i class="fa fa-inr"></i>',
  'USD' => '<i class="fa fa-dollar"></i>',
  'EUR' => '<i class="fa fa-eur"></i>',
  'GBP' => '<i class="fa fa-gbp"></i>'
}
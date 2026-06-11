___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "OpenAI Conversions API",
  "categories": [
    "ADVERTISING",
    "CONVERSIONS"
  ],
  "brand": {
    "id": "brand_digitalanalytix",
    "displayName": "DigitalAnalytix"
  },
  "description": "Server-side Google Tag Manager template for the OpenAI Conversions API (CAPI). Sends conversion events from your server container to OpenAI for improved attribution and measurement.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "pixelId",
    "displayName": "Pixel ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your OpenAI Pixel ID from the Ads Manager conversions tab."
  },
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "API Key",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your OpenAI Conversions API key from the Ads Manager conversions tab."
  },
  {
    "type": "SELECT",
    "name": "eventName",
    "displayName": "Event Name",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "inherit",
        "displayValue": "Inherit from Event Data"
      },
      {
        "value": "page_viewed",
        "displayValue": "Page Viewed"
      },
      {
        "value": "contents_viewed",
        "displayValue": "Contents Viewed"
      },
      {
        "value": "items_added",
        "displayValue": "Items Added"
      },
      {
        "value": "checkout_started",
        "displayValue": "Checkout Started"
      },
      {
        "value": "order_created",
        "displayValue": "Order Created"
      },
      {
        "value": "lead_created",
        "displayValue": "Lead Created"
      },
      {
        "value": "registration_completed",
        "displayValue": "Registration Completed"
      },
      {
        "value": "appointment_scheduled",
        "displayValue": "Appointment Scheduled"
      },
      {
        "value": "subscription_created",
        "displayValue": "Subscription Created"
      },
      {
        "value": "trial_started",
        "displayValue": "Trial Started"
      },
      {
        "value": "custom",
        "displayValue": "Custom Event"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "inherit",
    "help": "Select the event to send. \u003cb\u003eInherit from Event Data\u003c/b\u003e maps GA4 event names automatically."
  },
  {
    "type": "TEXT",
    "name": "customEventName",
    "displayName": "Custom Event Name",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^[a-zA-Z0-9][a-zA-Z0-9_\\-]{0,62}[a-zA-Z0-9]$"
        ]
      }
    ],
    "help": "1-64 characters. Letters, numbers, underscores, dashes.",
    "enablingConditions": [
      {
        "paramName": "eventName",
        "paramValue": "custom",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "actionSource",
    "displayName": "Action Source",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "web",
        "displayValue": "Web"
      },
      {
        "value": "mobile_app",
        "displayValue": "Mobile App"
      },
      {
        "value": "offline",
        "displayValue": "Offline"
      },
      {
        "value": "physical_store",
        "displayValue": "Physical Store"
      },
      {
        "value": "phone_call",
        "displayValue": "Phone Call"
      },
      {
        "value": "email",
        "displayValue": "Email"
      },
      {
        "value": "other",
        "displayValue": "Other"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "web",
    "help": "Where the conversion occurred."
  },
  {
    "type": "GROUP",
    "name": "eventDataGroup",
    "displayName": "Event Data",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "eventId",
        "displayName": "Event ID",
        "simpleValueType": true,
        "help": "Unique event identifier for deduplication between browser pixel and server API. If empty, auto-generated."
      },
      {
        "type": "TEXT",
        "name": "amount",
        "displayName": "Amount",
        "simpleValueType": true,
        "help": "Integer monetary value in the currency\u0027s lowest denomination (e.g. 12999 for $129.99). Leave empty to inherit from event data."
      },
      {
        "type": "TEXT",
        "name": "currency",
        "displayName": "Currency",
        "simpleValueType": true,
        "help": "ISO 4217 currency code. Required when Amount is set. Leave empty to inherit from event data."
      },
      {
        "type": "TEXT",
        "name": "currencyMultiplier",
        "displayName": "Currency Multiplier",
        "simpleValueType": true,
        "defaultValue": "100",
        "help": "Applied to amounts inherited from event data (GA4 sends decimals like 129.99; OpenAI expects 12999). Use \u003cb\u003e100\u003c/b\u003e for USD/EUR/GBP, \u003cb\u003e1\u003c/b\u003e for JPY/KRW. The explicit Amount field above is never multiplied — provide it already in the lowest denomination."
      },
      {
        "type": "TEXT",
        "name": "planId",
        "displayName": "Plan ID",
        "simpleValueType": true,
        "help": "Internal plan identifier for subscription_created and trial_started events.",
        "enablingConditions": [
          {
            "paramName": "eventName",
            "paramValue": "page_viewed",
            "type": "NOT_EQUALS"
          },
          {
            "paramName": "eventName",
            "paramValue": "contents_viewed",
            "type": "NOT_EQUALS"
          },
          {
            "paramName": "eventName",
            "paramValue": "items_added",
            "type": "NOT_EQUALS"
          },
          {
            "paramName": "eventName",
            "paramValue": "checkout_started",
            "type": "NOT_EQUALS"
          },
          {
            "paramName": "eventName",
            "paramValue": "order_created",
            "type": "NOT_EQUALS"
          },
          {
            "paramName": "eventName",
            "paramValue": "lead_created",
            "type": "NOT_EQUALS"
          },
          {
            "paramName": "eventName",
            "paramValue": "registration_completed",
            "type": "NOT_EQUALS"
          },
          {
            "paramName": "eventName",
            "paramValue": "appointment_scheduled",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "contentsVariable",
        "displayName": "Contents",
        "simpleValueType": true,
        "help": "A variable returning an array of content objects. Each object: id, name, content_type, quantity, amount, currency. Leave empty to inherit from event items."
      },
      {
        "type": "TEXT",
        "name": "sourceUrl",
        "displayName": "Source URL",
        "simpleValueType": true,
        "help": "Page URL where the conversion occurred. Required when action source is Web. Auto-populated from page_location if empty."
      },
      {
        "type": "TEXT",
        "name": "oppref",
        "displayName": "Oppref",
        "simpleValueType": true,
        "help": "OpenAI privacy identifier from the landing page URL. Auto-populated from page_location query params if empty."
      },
      {
        "type": "CHECKBOX",
        "name": "optOut",
        "checkboxText": "Opt out of personalization",
        "simpleValueType": true,
        "defaultValue": false
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "userDataGroup",
    "displayName": "User Data",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "autoPopulateIpUa",
        "checkboxText": "Auto-populate IP address and User Agent from request headers",
        "simpleValueType": true,
        "defaultValue": true,
        "help": "Reads IP from X-Forwarded-For / remote address and User-Agent from request headers."
      },
      {
        "type": "TEXT",
        "name": "userEmail",
        "displayName": "Email",
        "simpleValueType": true,
        "help": "Email for identity matching. Will be trimmed, lowercased, and SHA-256 hashed unless already hashed (64-char hex string)."
      },
      {
        "type": "TEXT",
        "name": "userExternalId",
        "displayName": "External ID",
        "simpleValueType": true,
        "help": "Stable customer identifier. Will be SHA-256 hashed unless already hashed."
      },
      {
        "type": "TEXT",
        "name": "userCountry",
        "displayName": "Country",
        "simpleValueType": true,
        "help": "Two-letter ISO 3166-1 country code."
      },
      {
        "type": "TEXT",
        "name": "userCity",
        "displayName": "City",
        "simpleValueType": true,
        "help": "City name, max 128 characters."
      },
      {
        "type": "TEXT",
        "name": "userZipCode",
        "displayName": "Zip Code",
        "simpleValueType": true,
        "help": "Postal/zip code, max 32 characters."
      },
      {
        "type": "TEXT",
        "name": "userIpAddress",
        "displayName": "IP Address (override)",
        "simpleValueType": true,
        "help": "Overrides auto-populated IP address.",
        "enablingConditions": [
          {
            "paramName": "autoPopulateIpUa",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "userUserAgent",
        "displayName": "User Agent (override)",
        "simpleValueType": true,
        "help": "Overrides auto-populated User Agent.",
        "enablingConditions": [
          {
            "paramName": "autoPopulateIpUa",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "advancedGroup",
    "displayName": "Advanced",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "validateOnly",
        "checkboxText": "Validate only (do not save events)",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "Send events in validation mode. Events are checked but not recorded."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const sendHttpRequest = require('sendHttpRequest');
const getEventData = require('getEventData');
const getAllEventData = require('getAllEventData');
const getRequestHeader = require('getRequestHeader');
const getRemoteAddress = require('getRemoteAddress');
const getTimestampMillis = require('getTimestampMillis');
const sha256Sync = require('sha256Sync');
const encodeUriComponent = require('encodeUriComponent');
const parseUrl = require('parseUrl');
const makeString = require('makeString');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const getType = require('getType');
const JSON = require('JSON');
const Math = require('Math');
const log = require('logToConsole');
const generateRandom = require('generateRandom');

const API_BASE = 'https://bzr.openai.com/v1/events';

const GA4_EVENT_MAP = {
  'page_view': { eventName: 'page_viewed', dataType: 'contents' },
  'view_item': { eventName: 'contents_viewed', dataType: 'contents' },
  'view_item_list': { eventName: 'contents_viewed', dataType: 'contents' },
  'add_to_cart': { eventName: 'items_added', dataType: 'contents' },
  'begin_checkout': { eventName: 'checkout_started', dataType: 'contents' },
  'purchase': { eventName: 'order_created', dataType: 'contents' },
  'generate_lead': { eventName: 'lead_created', dataType: 'customer_action' },
  'sign_up': { eventName: 'registration_completed', dataType: 'customer_action' }
};

const CONTENTS_EVENTS = ['page_viewed', 'contents_viewed', 'items_added', 'checkout_started', 'order_created'];
const CUSTOMER_ACTION_EVENTS = ['lead_created', 'registration_completed', 'appointment_scheduled'];
const PLAN_EVENTS = ['subscription_created', 'trial_started'];

const resolvedEvent = resolveEventName();
if (!resolvedEvent) {
  log('OpenAI CAPI: Could not resolve event name');
  data.gtmOnFailure();
  return;
}

const event = buildEvent(resolvedEvent);
const requestBody = { events: [event] };

if (data.validateOnly) {
  requestBody.validate_only = true;
}

const url = API_BASE + '?pid=' + encodeUriComponent(makeString(data.pixelId));

sendHttpRequest(url, {
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + makeString(data.apiKey)
  },
  method: 'POST',
  timeout: 5000
}, JSON.stringify(requestBody)).then(function(response) {
  if (response.statusCode >= 200 && response.statusCode < 300) {
    data.gtmOnSuccess();
  } else {
    log('OpenAI CAPI: HTTP ' + response.statusCode + ' — ' + response.body);
    data.gtmOnFailure();
  }
}, function(reason) {
  log('OpenAI CAPI: Request failed — ' + reason);
  data.gtmOnFailure();
});

function resolveEventName() {
  if (data.eventName !== 'inherit') {
    var dataType;
    if (CONTENTS_EVENTS.indexOf(data.eventName) >= 0) dataType = 'contents';
    else if (CUSTOMER_ACTION_EVENTS.indexOf(data.eventName) >= 0) dataType = 'customer_action';
    else if (PLAN_EVENTS.indexOf(data.eventName) >= 0) dataType = 'plan_enrollment';
    else if (data.eventName === 'custom') dataType = 'custom';
    return { eventName: data.eventName, dataType: dataType };
  }

  var ga4Event = getEventData('event_name');
  if (ga4Event && GA4_EVENT_MAP[ga4Event]) {
    return GA4_EVENT_MAP[ga4Event];
  }

  if (ga4Event) {
    return { eventName: 'custom', dataType: 'custom', customName: ga4Event };
  }

  return null;
}

function buildEvent(resolved) {
  var evt = {};

  evt.id = data.eventId || generateEventId();
  evt.type = resolved.eventName;
  evt.timestamp_ms = getTimestampMillis();
  evt.action_source = data.actionSource || 'web';

  if (resolved.eventName === 'custom') {
    evt.custom_event_name = data.customEventName || resolved.customName || 'unknown';
  }

  evt.data = buildEventData(resolved);

  var sourceUrl = data.sourceUrl || getEventData('page_location');
  if (sourceUrl) {
    evt.source_url = makeString(sourceUrl);
  }

  var oppref = data.oppref || extractOppref(sourceUrl);
  if (oppref) {
    evt.oppref = makeString(oppref);
  }

  if (data.optOut) {
    evt.opt_out = true;
  }

  var user = buildUserData();
  if (user) {
    evt.user = user;
  }

  return evt;
}

function buildEventData(resolved) {
  var eventData = { type: resolved.dataType };

  if (data.amount != null && data.amount !== '') {
    eventData.amount = makeInteger(data.amount);
  } else {
    var value = getEventData('value');
    if (value != null && value !== '') {
      eventData.amount = toLowestDenomination(value);
    }
  }

  var currency = data.currency || getEventData('currency');
  if (currency) {
    eventData.currency = makeString(currency);
  }

  if (data.planId) {
    eventData.plan_id = makeString(data.planId);
  }

  var contents = getContents();
  if (contents && contents.length > 0) {
    eventData.contents = contents;
  }

  return eventData;
}

function getContents() {
  if (data.contentsVariable) {
    var varValue = data.contentsVariable;
    if (getType(varValue) === 'array') {
      return varValue;
    }
    return null;
  }

  var items = getEventData('items');
  if (!items || getType(items) !== 'array' || items.length === 0) return null;

  var eventCurrency = getEventData('currency');
  var contents = [];

  for (var i = 0; i < items.length; i++) {
    var item = items[i];
    var content = {};

    if (item.item_id) content.id = makeString(item.item_id);
    if (item.item_name) content.name = makeString(item.item_name);
    if (item.item_category) content.content_type = makeString(item.item_category);
    if (item.quantity != null) content.quantity = makeInteger(item.quantity);

    if (item.price != null) {
      content.amount = toLowestDenomination(item.price);
    }

    if (item.currency) {
      content.currency = makeString(item.currency);
    } else if (eventCurrency) {
      content.currency = makeString(eventCurrency);
    }

    contents.push(content);
  }

  return contents;
}

function buildUserData() {
  var user = {};
  var hasData = false;

  if (data.userEmail) {
    hasData = true;
    var email = makeString(data.userEmail);
    if (isHashed(email)) {
      user.email_sha256 = email;
    } else {
      user.email_sha256 = sha256Sync(email.trim().toLowerCase(), { outputEncoding: 'hex' });
    }
  }

  if (data.userExternalId) {
    hasData = true;
    var extId = makeString(data.userExternalId);
    if (isHashed(extId)) {
      user.external_id_sha256 = extId;
    } else {
      user.external_id_sha256 = sha256Sync(extId, { outputEncoding: 'hex' });
    }
  }

  if (data.userCountry) {
    hasData = true;
    user.country = makeString(data.userCountry);
  }

  if (data.userCity) {
    hasData = true;
    user.city = makeString(data.userCity).trim().toLowerCase();
  }

  if (data.userZipCode) {
    hasData = true;
    user.zip_code = makeString(data.userZipCode);
  }

  if (data.autoPopulateIpUa) {
    var ip = data.userIpAddress || getRemoteAddress();
    if (ip) {
      user.ip_address = makeString(ip);
      hasData = true;
    }

    var ua = data.userUserAgent || getRequestHeader('User-Agent');
    if (ua) {
      user.user_agent = makeString(ua);
      hasData = true;
    }
  }

  return hasData ? user : null;
}

function extractOppref(url) {
  if (!url) return null;
  var parsed = parseUrl(makeString(url));
  if (parsed && parsed.searchParams && parsed.searchParams.oppref) {
    return parsed.searchParams.oppref;
  }
  return null;
}

function isHashed(value) {
  if (!value || value.length !== 64) return false;
  return testHexChars(value);
}

function testHexChars(str) {
  var hex = '0123456789abcdef';
  for (var i = 0; i < str.length; i++) {
    if (hex.indexOf(str[i]) === -1) return false;
  }
  return true;
}

function toLowestDenomination(value) {
  var multiplier = makeNumber(data.currencyMultiplier);
  if (!multiplier || multiplier !== multiplier) {
    multiplier = 100;
  }
  return makeInteger(Math.round(makeNumber(value) * multiplier));
}

function generateEventId() {
  var ts = makeString(getTimestampMillis());
  var r1 = makeString(generateRandom(100000, 999999));
  var r2 = makeString(generateRandom(100000, 999999));
  return ts + '-' + r1 + '-' + r2;
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "User-Agent"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "X-Forwarded-For"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "remoteAddressAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://bzr.openai.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Sends purchase event to CAPI
  code: |-
    const JSON = require('JSON');

    const mockData = {
      pixelId: 'test-pixel',
      apiKey: 'test-key',
      eventName: 'order_created',
      actionSource: 'web',
      amount: '12999',
      currency: 'USD',
      eventId: 'evt-123',
      autoPopulateIpUa: true,
      validateOnly: false
    };

    let sentUrl, sentOptions, sentBody;
    mock('sendHttpRequest', function(url, options, body) {
      sentUrl = url;
      sentOptions = options;
      sentBody = JSON.parse(body);
      return { then: function(ok) { ok({ statusCode: 200, body: '{}' }); } };
    });

    mock('getEventData', function(key) {
      if (key === 'page_location') return 'https://example.com/checkout?oppref=abc123';
      return undefined;
    });

    mock('getRemoteAddress', function() { return '1.2.3.4'; });
    mock('getRequestHeader', function(h) {
      if (h === 'User-Agent') return 'TestBot/1.0';
      return undefined;
    });
    mock('getTimestampMillis', function() { return 1718100000000; });
    mock('generateRandom', function() { return 123456; });
    mock('parseUrl', function(url) {
      return { searchParams: { oppref: 'abc123' } };
    });

    runCode(mockData);

    assertThat(sentUrl).contains('pid=test-pixel');
    assertThat(sentOptions.headers['Authorization']).isEqualTo('Bearer test-key');
    assertThat(sentBody.events[0].type).isEqualTo('order_created');
    assertThat(sentBody.events[0].data.amount).isEqualTo(12999);
    assertThat(sentBody.events[0].data.currency).isEqualTo('USD');
    assertThat(sentBody.events[0].id).isEqualTo('evt-123');
    assertThat(sentBody.events[0].oppref).isEqualTo('abc123');
    assertThat(sentBody.events[0].user.ip_address).isEqualTo('1.2.3.4');
    assertThat(sentBody.events[0].user.user_agent).isEqualTo('TestBot/1.0');
    assertApi('gtmOnSuccess').wasCalled();
- name: Inherits GA4 event name
  code: |-
    const JSON = require('JSON');

    const mockData = {
      pixelId: 'px-1',
      apiKey: 'key-1',
      eventName: 'inherit',
      actionSource: 'web',
      currencyMultiplier: '100',
      autoPopulateIpUa: false,
      validateOnly: false
    };

    let sentBody;
    mock('sendHttpRequest', function(url, options, body) {
      sentBody = JSON.parse(body);
      return { then: function(ok) { ok({ statusCode: 200, body: '{}' }); } };
    });

    mock('getEventData', function(key) {
      if (key === 'event_name') return 'purchase';
      if (key === 'value') return 129.99;
      if (key === 'currency') return 'USD';
      if (key === 'items') return [{ item_id: 'SKU-1', item_name: 'Widget', price: 64.99, quantity: 2 }];
      return undefined;
    });

    mock('getTimestampMillis', function() { return 1718100000000; });
    mock('generateRandom', function() { return 654321; });
    mock('parseUrl', function() { return { searchParams: {} }; });

    runCode(mockData);

    assertThat(sentBody.events[0].type).isEqualTo('order_created');
    assertThat(sentBody.events[0].data.type).isEqualTo('contents');
    assertThat(sentBody.events[0].data.amount).isEqualTo(12999);
    assertThat(sentBody.events[0].data.contents[0].id).isEqualTo('SKU-1');
    assertThat(sentBody.events[0].data.contents[0].amount).isEqualTo(6499);
- name: Whole-dollar GA4 value is multiplied
  code: |-
    const JSON = require('JSON');

    const mockData = {
      pixelId: 'px-1',
      apiKey: 'key-1',
      eventName: 'inherit',
      actionSource: 'web',
      currencyMultiplier: '100',
      autoPopulateIpUa: false,
      validateOnly: false
    };

    let sentBody;
    mock('sendHttpRequest', function(url, options, body) {
      sentBody = JSON.parse(body);
      return { then: function(ok) { ok({ statusCode: 200, body: '{}' }); } };
    });

    mock('getEventData', function(key) {
      if (key === 'event_name') return 'purchase';
      if (key === 'value') return 150;
      if (key === 'currency') return 'USD';
      return undefined;
    });

    mock('getTimestampMillis', function() { return 1718100000000; });
    mock('generateRandom', function() { return 999999; });
    mock('parseUrl', function() { return { searchParams: {} }; });

    runCode(mockData);

    assertThat(sentBody.events[0].data.amount).isEqualTo(15000);
- name: Hashes email automatically
  code: |-
    const JSON = require('JSON');

    const mockData = {
      pixelId: 'px-1',
      apiKey: 'key-1',
      eventName: 'lead_created',
      actionSource: 'web',
      userEmail: 'Test@Example.com',
      autoPopulateIpUa: false,
      validateOnly: false
    };

    let sentBody;
    mock('sendHttpRequest', function(url, options, body) {
      sentBody = JSON.parse(body);
      return { then: function(ok) { ok({ statusCode: 200, body: '{}' }); } };
    });

    mock('sha256Sync', function(input) {
      return 'hashed_' + input;
    });

    mock('getEventData', function() { return undefined; });
    mock('getTimestampMillis', function() { return 1718100000000; });
    mock('generateRandom', function() { return 111111; });
    mock('parseUrl', function() { return { searchParams: {} }; });

    runCode(mockData);

    assertThat(sentBody.events[0].user.email_sha256).isEqualTo('hashed_test@example.com');
- name: Passes pre-hashed email as-is
  code: |-
    const JSON = require('JSON');

    const hash = 'a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2';

    const mockData = {
      pixelId: 'px-1',
      apiKey: 'key-1',
      eventName: 'lead_created',
      actionSource: 'web',
      userEmail: hash,
      autoPopulateIpUa: false,
      validateOnly: false
    };

    let sentBody;
    mock('sendHttpRequest', function(url, options, body) {
      sentBody = JSON.parse(body);
      return { then: function(ok) { ok({ statusCode: 200, body: '{}' }); } };
    });

    mock('getEventData', function() { return undefined; });
    mock('getTimestampMillis', function() { return 1718100000000; });
    mock('generateRandom', function() { return 222222; });
    mock('parseUrl', function() { return { searchParams: {} }; });

    runCode(mockData);

    assertThat(sentBody.events[0].user.email_sha256).isEqualTo(hash);
- name: Validate-only mode sets flag
  code: |-
    const JSON = require('JSON');

    const mockData = {
      pixelId: 'px-1',
      apiKey: 'key-1',
      eventName: 'page_viewed',
      actionSource: 'web',
      autoPopulateIpUa: false,
      validateOnly: true
    };

    let sentBody;
    mock('sendHttpRequest', function(url, options, body) {
      sentBody = JSON.parse(body);
      return { then: function(ok) { ok({ statusCode: 200, body: '{}' }); } };
    });

    mock('getEventData', function() { return undefined; });
    mock('getTimestampMillis', function() { return 1718100000000; });
    mock('generateRandom', function() { return 333333; });
    mock('parseUrl', function() { return { searchParams: {} }; });

    runCode(mockData);

    assertThat(sentBody.validate_only).isTrue();
- name: Fails on HTTP error
  code: |-
    const JSON = require('JSON');

    const mockData = {
      pixelId: 'px-1',
      apiKey: 'bad-key',
      eventName: 'page_viewed',
      actionSource: 'web',
      autoPopulateIpUa: false,
      validateOnly: false
    };

    mock('sendHttpRequest', function() {
      return { then: function(ok, err) { ok({ statusCode: 401, body: 'Unauthorized' }); } };
    });

    mock('getEventData', function() { return undefined; });
    mock('getTimestampMillis', function() { return 1718100000000; });
    mock('generateRandom', function() { return 444444; });
    mock('parseUrl', function() { return { searchParams: {} }; });

    runCode(mockData);

    assertApi('gtmOnFailure').wasCalled();


___NOTES___

Created on 6/11/2026, 8:39:04 AM



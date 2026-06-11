# OpenAI Conversions API — GTM Server-Side Template

Server-side Google Tag Manager template for the [OpenAI Conversions API (CAPI)](https://developers.openai.com/ads/conversions-api).

## Features

- **Server-side execution** — sends conversion data from your GTM server container
- **GA4 event inheritance** — automatically maps GA4 event names and items to OpenAI format
- **Auto IP/UA** — populates `ip_address` and `user_agent` from request headers
- **SHA-256 auto-hashing** — detects plain vs. pre-hashed emails and external IDs
- **Oppref extraction** — auto-reads `oppref` from page URL query parameters
- **Deduplication** — supports `event_id` for browser + server dedup
- **Validate-only mode** — test events without recording them

## Supported Events

| Event | Type |
|-------|------|
| `page_viewed` | contents |
| `contents_viewed` | contents |
| `items_added` | contents |
| `checkout_started` | contents |
| `order_created` | contents |
| `lead_created` | customer_action |
| `registration_completed` | customer_action |
| `appointment_scheduled` | customer_action |
| `subscription_created` | plan_enrollment |
| `trial_started` | plan_enrollment |
| Custom | custom |

## GA4 Auto-Mapping

When Event Name is set to **Inherit from Event Data**, the tag maps GA4 events automatically:

| GA4 Event | OpenAI Event |
|-----------|-------------|
| `page_view` | `page_viewed` |
| `view_item` / `view_item_list` | `contents_viewed` |
| `add_to_cart` | `items_added` |
| `begin_checkout` | `checkout_started` |
| `purchase` | `order_created` |
| `generate_lead` | `lead_created` |
| `sign_up` | `registration_completed` |

Unmapped GA4 events are sent as OpenAI `custom` events using the GA4 event name.

## Setup

### 1. Prerequisites

- A GTM server-side container
- OpenAI Pixel ID and API Key from the Ads Manager conversions tab

### 2. Create the Tag

1. In your server container, create a new tag using the **OpenAI Conversions API** template
2. Enter your **Pixel ID** and **API Key**
3. Set Event Name to **Inherit from Event Data** (recommended) or select a specific event
4. Configure Action Source (default: Web)

### 3. Deduplication with Browser Pixel

To deduplicate between browser pixel and server API:

1. Generate a unique event ID in the browser
2. Pass it to both the browser pixel (`event_id` option) and the server tag (`Event ID` field)
3. Use the same Pixel ID on both

### 4. User Data

The tag auto-populates IP address and User Agent from request headers. You can:
- Override with explicit values
- Add email, external ID, country, city, zip code for identity matching
- Plain emails are auto-hashed; pre-hashed values (64-char hex) pass through

## Amount Handling

- **Explicit Amount field** — passed as-is. Provide it already in the currency's lowest denomination (e.g., `12999` for $129.99).
- **Inherited from event data** (GA4 `value` and item `price`) — always multiplied by the **Currency Multiplier** (default `100`), since GA4 sends decimal values. Set the multiplier to `1` for zero-decimal currencies (JPY, KRW) or `1000` for three-decimal currencies (BHD, KWD).

## License

Apache 2.0 — see [LICENSE](LICENSE).

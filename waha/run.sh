#!/bin/sh
set -e
if [ -f /data/options.json ]; then
  eval "$(node -e '
    const o = require("/data/options.json");
    const out = [];
    const set = (k, v) => { if (v !== undefined && v !== "") out.push("export " + k + "=" + JSON.stringify(String(v))); };
    set("WAHA_API_KEY", o.api_key);
    set("WHATSAPP_API_KEY", o.api_key);
    set("WAHA_DASHBOARD_USERNAME", o.dashboard_username);
    set("WAHA_DASHBOARD_PASSWORD", o.dashboard_password);
    set("WHATSAPP_SWAGGER_USERNAME", o.dashboard_username);
    set("WHATSAPP_SWAGGER_PASSWORD", o.dashboard_password);
    set("WHATSAPP_DEFAULT_ENGINE", o.engine);
    set("WAHA_LOG_LEVEL", o.log_level);
    set("TZ", o.tz);
    console.log(out.join("\n"));
  ')"
fi
exec /entrypoint.sh

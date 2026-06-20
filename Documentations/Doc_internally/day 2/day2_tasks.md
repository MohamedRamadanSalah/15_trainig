# Day 2 — Tasks · Networking & API Client

**Layer:** Data · **Goal:** A reusable, intercepted Dio client hitting a real API.

## 🧠 Theory (60–90 min)
- [x] HTTP request/response lifecycle, headers, status codes (200/4xx/5xx).
- [x] REST verbs: GET/POST/PUT/PATCH/DELETE — when each is used.
- [x] Auth: JWT vs Bearer token vs refresh token (just the concepts today).

## 🛠️ Build (3–3.5 hr) — `lib/core/network/dio_client.dart`
- [x] Pick a free test API (reqres.in / jsonplaceholder) and set `baseUrl`. *(used `dummyjson.com` — jsonplaceholder was blocked by the network)*
- [x] Configure `BaseOptions`: timeouts, default headers. *(all 3 timeouts: connect/send/receive)*
- [x] Add a **logging interceptor**.
- [x] Add an **auth interceptor** that injects `Authorization: Bearer <token>` (token can be a stub for now).
- [x] Add an **error interceptor** that detects 401 / timeout / connection errors.
- [x] Add basic **retry** on timeout (max 2 retries).
- [x] Make a real GET call from `TaskRemoteDataSource` and print the result.

## 📝 Document — copy `_TEMPLATES/daily_doc_template.md` → `day 2/`
- [x] Interceptor order + why order matters.
- [x] The auth header flow diagram.

## ✅ Definition of Done
- [x] A real API call succeeds and logs. [x] 401/timeout handled. [x] Doc done.

## 🔁 Recall test
- [x] Explain what an interceptor is and give 3 real uses.

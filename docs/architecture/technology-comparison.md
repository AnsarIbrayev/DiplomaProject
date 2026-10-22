# Technology Comparison

| | |
|---|---|
| **Pre-defense item** | 5. Technology comparison |
| **YouTrack task** | [DOA-7](https://yeralytemir.youtrack.cloud/issue/DOA-7) |
| **Version / date** | 1.0, 22 October 2026 |
| **Evidence checked on** | 22 October 2026 (all online sources) |
| **Related documents** | [Project proposal](../proposal/proposal.md), [requirements](../requirements/requirements.md) (DOA-8), [literature review](../research/literature-review.md), [existing system comparison](../research/existing-systems.md), [architecture](architecture.md) |

---

## 1. Purpose and Method

### 1.1 Purpose

This document records the key technical decisions of the project. For each decision it compares the selected technology with two or three reasonable alternatives against the same criteria, states the decision and justifies it with reference to the functional (FR) and non-functional (NFR) requirements and the project constraints (CON). The selected stack is summarized in Section 8 and recorded in [architecture.md](architecture.md).

Six decisions are compared:

| No. | Decision | Alternatives compared |
|---|---|---|
| D1 | Mobile client framework | Flutter, React Native, native Kotlin + Swift |
| D2 | Backend platform | FastAPI (Python), NestJS (TypeScript), Spring Boot (Java), Firebase (backend-as-a-service) |
| D3 | Server-side data storage | PostgreSQL, MongoDB, Cloud Firestore |
| D4 | Client–server interaction style | REST with OpenAPI, GraphQL, gRPC |
| D5 | Recommendation and factor-identification engine | Hard-coded rules, declarative versioned rule base, general-purpose rule engine (Drools), machine-learning model |
| D6 | Wearable data access | On-device platform APIs (Health Connect + HealthKit), commercial aggregator, vendor cloud APIs |

### 1.2 Criteria

The criteria are derived from the requirements (DOA-8) and from the constraints of a three-person diploma project. Each decision uses the subset of criteria that applies to it; within one decision, all alternatives are assessed against the same criteria.

| ID | Criterion | Derived from |
|---|---|---|
| C1 | Android and iOS from one code base | NFR-20 |
| C2 | Access to health data on the device (steps, heart rate) and operation without a wearable | FR-10, FR-11, NFR-21 |
| C3 | Offline-tolerant logging and reliable local notifications | NFR-12, NFR-15, FR-25 |
| C4 | Security and privacy of health data: encryption in transit and at rest, pseudonymization, data minimization, access control | NFR-01 – NFR-05 |
| C5 | Data residency: personal data stored in a database located in Kazakhstan | NFR-06 |
| C6 | Deterministic, explainable and versioned recommendations | FR-23, FR-24, FR-37, NFR-22, NFR-23, NFR-25 |
| C7 | Support for verification and analysis: batch tests on 200 synthetic profiles, automated tests, pseudonymized export | FR-35, FR-38, NFR-24, NFR-26, NFR-27 |
| C8 | Cost and licence: free or open-source only | CON-01 |
| C9 | Fit with team size, skills and timeline | CON-02, CON-03 |
| C10 | Maturity, documentation and reproducible setup | NFR-28 |

### 1.3 Rating scale and evidence rules

| Rating | Meaning |
|---|---|
| **Good** | Meets the criterion without extra work |
| **Partial** | Meets the criterion with extra work, a limitation or an unconfirmed assumption |
| **Weak** | Meets the criterion only with significant extra work or risk |
| **Fails** | Violates a requirement or constraint; the alternative is excluded |

A **Fails** rating on any criterion excludes the alternative regardless of its other ratings. No numerical scores are used, because the ratings are qualitative judgements and weighting them would suggest a precision the evidence does not have.

Every factual statement about a technology cites official documentation, a package registry page, a legal text or a peer-reviewed source. Statements about team skills are marked as assumptions (Section 9) and must be confirmed by the developers concerned.

---

## 2. D1. Mobile Client Framework

**Requirements addressed:** NFR-20, FR-10, FR-11, NFR-21, NFR-12, NFR-15, FR-25, FR-31, CON-01, CON-03.

Cross-platform approaches differ mainly in how the shared code reaches the device: web-based (hybrid) apps run in a WebView, interpreted apps run a JavaScript runtime that drives native interface components, and cross-compiled apps compile a common language into native code [3]. React Native follows the interpreted model; since version 0.76 its New Architecture, which replaces the asynchronous bridge with the JavaScript Interface (JSI), is enabled by default [2]. Flutter apps are compiled to machine code for release, and Flutter draws its own interface controls instead of using the system widgets [1]. Platform-specific APIs are reached through platform channels and plugins [1].

| Criterion | Flutter | React Native | Native (Kotlin + Swift) |
|---|---|---|---|
| C1. One code base | **Good.** One Dart code base for Android and iOS [1] | **Good.** One JavaScript/TypeScript code base [2] | **Fails.** Two separate code bases (NFR-20) |
| C2. Health data access | **Good.** One plugin, `health`, covers Apple Health (iOS 15+) and Health Connect, including steps, heart rate, weight and nutrition; maintained by the Technical University of Denmark (Copenhagen Research Platform); Google Fit support removed in version 11.0.0 [4] | **Partial.** Two separate community libraries: `react-native-health` for HealthKit (iOS only, MIT) [6] and `react-native-health-connect` for Android; the latter cannot run in Expo Go and needs a development build [5] | **Good.** Direct use of the Health Connect and HealthKit SDKs |
| C3. Offline logging and local notifications | **Good.** `drift`, a relational store built on SQLite (MIT) [29]; `flutter_local_notifications` schedules local notifications on Android and iOS [30] | **Partial.** Comparable community libraries exist; not evaluated in detail | **Good.** Platform storage and notification APIs |
| C4. Security of data on the device | **Partial.** Depends on platform keystores reached through plugins | **Partial.** Same dependence on plugins | **Good.** Direct use of platform keystores |
| C8. Cost and licence | **Good.** Free, open source | **Good.** Free, open source | **Good.** Free toolchains |
| C9. Team fit and timeline | **Good** (assumption A1). Flutter was the framework planned in the Midterm proposal; one mobile developer maintains one code base | **Partial.** Requires JavaScript/TypeScript and React; Android and iOS health integration uses two different libraries | **Weak.** One mobile developer would build every screen twice in two languages |
| C10. Maturity and setup | **Good.** Consistent interface on both platforms because Flutter renders its own controls [1] | **Good.** Mature; New Architecture is the default [2] | **Good.** Reference platforms |

**Decision: Flutter.** Native development is excluded by NFR-20. Between the two cross-platform frameworks, Flutter is preferred because a single maintained plugin gives access to both Health Connect and Apple Health with the data types the rule engine needs (FR-10, FR-11) [4], whereas React Native needs two independent community libraries [5], [6]. Flutter was already planned in the Midterm proposal, which keeps the team's preparation work valid (CON-02). Both application modes, intervention and self-monitoring control (FR-31), are built from the same code base by a configuration flag.

**Minimum supported OS versions (NFR-20): Android 9 (API level 28) and iOS 15.** Flutter 3.47 supports Android API levels 24–37 and iOS 15–27 [36]. The binding limits come from health data access: Health Connect requires Android 9 or later with Google Play services [7], and the `health` plugin requires iOS 15 or later [4]. Participants' phones must meet these versions; the check is to be added to the pilot screening (DOA-12).

---

## 3. D2. Backend Platform

**Requirements addressed:** NFR-01 – NFR-06, NFR-14, FR-35, FR-37, FR-38, NFR-26, NFR-27, NFR-28, CON-01 – CON-03.

| Criterion | FastAPI (Python) | NestJS (TypeScript) | Spring Boot (Java) | Firebase (BaaS) |
|---|---|---|---|---|
| C4. Security | **Good.** Request validation through Pydantic models [13]; TLS and authentication through standard libraries | **Good.** Standard Node.js security libraries | **Good.** Mature security module | **Good.** Managed authentication and security rules |
| C5. Data residency | **Good.** Self-hosted; can run on a server in Kazakhstan | **Good.** Self-hosted | **Good.** Self-hosted | **Fails.** The Firestore location list contains no region in Kazakhstan or Central Asia [19] (NFR-06) |
| C6. Rule engine in the same runtime | **Good.** Rule evaluator written in Python (D5) | **Partial.** Rule evaluator in TypeScript; verification and analysis would stay in Python, giving two implementations to keep consistent | **Partial.** Native fit for Drools [28], but the same split with Python analysis | **Weak.** Logic in cloud functions, tied to the vendor platform |
| C7. Verification and analysis | **Good.** One language for the rule engine, the generator of 200 synthetic profiles (FR-38) and the statistical analysis of the pilot planned in Python (proposal, Section 8) | **Partial.** Two languages | **Partial.** Two languages | **Weak.** Tests require the vendor emulator; export through vendor tools |
| C8. Cost and licence | **Good.** Open source | **Good.** MIT licence [14] | **Good.** Open source | **Partial.** Free quota, then usage-based billing; proprietary |
| C9. Team fit and timeline | **Partial** (assumption A2). Short code; OpenAPI documentation and client code generation are produced automatically [13] | **Partial** (assumption A2) | **Weak.** More configuration and boilerplate for a one-person backend | **Good.** Least backend code |
| C10. Maturity and setup | **Good.** Built on the OpenAPI and JSON Schema standards; interactive documentation (Swagger UI, ReDoc) included [13] | **Good.** Framework for scalable Node.js server applications [14] | **Good.** Stand-alone, production-grade applications [15] | **Good.** Fully managed |

**Decision: FastAPI (Python).** Firebase is excluded because its database cannot be located in Kazakhstan (NFR-06) [19]. A managed PostgreSQL service such as Supabase was also considered; on the free plan, projects with low activity over seven days are paused [21], which conflicts with availability during the pilot (NFR-14), and self-hosting it would remove its main advantage. Among the self-hosted frameworks, FastAPI is selected because the rule engine, the verification suite on 200 synthetic profiles (FR-38, NFR-24) and the pilot analysis can share one language and one set of data models, so the rules that are verified are exactly the rules that run in production. Its automatic OpenAPI description [13] is used to generate the Dart client for the mobile app (D4). If the backend developer's main experience proves to be in TypeScript (assumption A2), NestJS is the fallback, with the rule engine and verification suite kept in Python as a separate service.

---

## 4. D3. Server-Side Data Storage

**Requirements addressed:** NFR-01 – NFR-03, NFR-06, NFR-13, FR-32, FR-35, FR-37, NFR-27, CON-01.

The data are relational by nature: users, study arms, profiles, food and weight logs, step and heart-rate samples, rule versions, generated recommendations and engagement events, linked by user and time. The pseudonymized export (FR-35, NFR-27) joins these tables.

| Criterion | PostgreSQL | MongoDB | Cloud Firestore |
|---|---|---|---|
| C3. Offline support | **Partial.** Server-side only; offline logging handled on the device (SQLite through `drift`) [29] | **Partial.** Server-side only | **Good.** Offline persistence enabled by default on Android and Apple platforms [20] |
| C4. Security | **Good.** TLS for connections, column-level encryption with `pgcrypto`, and file-system or block-level storage encryption [16]; identity and study data can be separated into different schemas with different roles (NFR-03, NFR-05) | **Good.** TLS and encryption options | **Good.** Managed encryption |
| C5. Data residency | **Good.** Self-hosted in Kazakhstan | **Good.** Self-hosted | **Fails.** No location in Kazakhstan or Central Asia [19] |
| C7. Analysis and export | **Good.** SQL joins over users, logs and events; JSON types available for flexible fields such as rule inputs [17] | **Partial.** Document model suits event logs; joins for the export are more complex | **Weak.** Limited server-side querying; export through vendor tools |
| C8. Cost and licence | **Good.** Open source | **Partial.** Community Server released on or after 16 October 2018 is under the Server Side Public License, which the OSI has not approved [18] | **Partial.** Proprietary, usage-based billing |
| C10. Maturity and setup | **Good.** Version 18 is the current release [16] | **Good** | **Good** |

**Decision: PostgreSQL**, self-hosted on a server located in Kazakhstan. Firestore is excluded by NFR-06 [19]. PostgreSQL is preferred to MongoDB because the data and the export are relational, because it offers encryption options at every level the requirements name [16] and because its licence is open source, whereas MongoDB's SSPL is not OSI-approved [18]. Offline tolerance (NFR-12) is provided on the device by a local SQLite store that queues records until synchronization.

---

## 5. D4. Client–Server Interaction Style

**Requirements addressed:** NFR-01, NFR-09, NFR-26, NFR-28, FR-35.

| Criterion | REST with OpenAPI | GraphQL | gRPC |
|---|---|---|---|
| C4. Security | **Good.** HTTPS; standard authentication headers | **Good.** HTTPS; needs query depth and cost limits | **Good.** TLS |
| C7. Testing and export | **Good.** Each endpoint is tested independently; the export (FR-35) is a plain file download | **Partial.** Tests target one endpoint with many query shapes | **Partial.** Binary payloads need dedicated tools to inspect |
| C9. Team fit and timeline | **Good.** FastAPI produces the OpenAPI description automatically and it can be used for client code generation [13], [25] | **Partial.** Extra schema and resolver layer; its main benefit, client-defined queries over many data sources, matters little for one first-party client with fixed screens | **Partial.** Protocol Buffers toolchain on both sides; browsers cannot call gRPC services directly and need a proxy [27], which complicates a later web export page for researchers |
| C10. Maturity and setup | **Good.** Architectural style defined by Fielding [24]; OpenAPI 3.1 specification [25] | **Good.** Specification maintained, latest edition September 2025 [26] | **Good.** Mature |

**Decision: REST with an OpenAPI description.** It is the simplest style that satisfies the requirements, it is generated by the selected backend framework [13], and it keeps every endpoint testable in CI (NFR-26). The expected data volumes of a 60-participant pilot (NFR-11) do not require the efficiency of gRPC, and a single client with known screens does not need the query flexibility of GraphQL.

---

## 6. D5. Recommendation and Factor-Identification Engine

**Requirements addressed:** FR-13 – FR-24, FR-37, FR-38, NFR-10, NFR-22 – NFR-25.

This decision also settles whether a machine-learning (ML) model is part of the system, a question left open by the literature review (Sections 3.4 and 4).

The alternatives are:

- **A. Hard-coded rules:** conditions written directly in the service code.
- **B. Declarative, versioned rule base:** every rule is a data record under version control (identifier, version, inputs, condition, output, hard constraint, evidence source), executed by a small deterministic evaluator in Python, followed by a hard-constraint check of the whole plan.
- **C. General-purpose rule engine:** Drools, which matches incoming facts to the conditions of rules written in DRL and runs on the Java platform [28].
- **D. ML model:** a supervised model trained on an open data set that predicts the obesity level and ranks or generates recommendations.

| Criterion | A. Hard-coded rules | B. Declarative rule base | C. Drools | D. ML model |
|---|---|---|---|---|
| C6. Determinism, explanation, versioning | **Partial.** Deterministic; each explanation and version must be maintained by hand in the code | **Good.** Each output carries the rule identifier and version that produced it (FR-23, FR-37, NFR-23) | **Good.** Deterministic; rule names usable for explanations | **Fails.** Outputs cannot be traced to a guideline rule (NFR-25); opaque generation produced energy, macronutrient and calcium errors in nutrition menus [34] |
| C7. Verification on 200 synthetic profiles | **Good.** Unit-testable | **Good.** Rules, generator and constraint checks in one language (D2) | **Partial.** Requires a separate Java service and cross-language tests | **Weak.** No local labelled data before the pilot; the most used open data set has 2,111 records from Colombia, Peru and Mexico, 77% of them generated synthetically [33]; ML performance depends on the data set and task [32] |
| C8. Cost and licence | **Good** | **Good** | **Good.** Open source | **Good** |
| C9. Team fit and timeline | **Good** | **Good.** Small evaluator; rules can be reviewed by the analyst without reading service code | **Weak.** New rule language and runtime for a three-person team | **Weak.** Data collection is impossible before ethics approval (CON-04) |
| C10. Maturity and evidence | **Good** | **Good.** Rule-based, component-scored advice improved diet quality in the eNutri trial [31] | **Good.** Mature engine [28] | **Partial.** Health recommender systems mostly use hybrid algorithms, but about half are evaluated only by algorithm metrics [35] |

**Decision: B, a declarative, versioned rule base executed by a Python evaluator inside the backend.** It meets every requirement on explanation and traceability (FR-23, FR-37, NFR-22, NFR-23) and allows the same rules to be verified on 200 synthetic profiles before the pilot (FR-38, NFR-24). Factor identification is part of the same engine: for each user, the evaluator scores the modifiable factors defined in the proposal (Section 2.3) against guideline targets and ranks the largest deviations, following the eNutri approach of targeting each user's lowest-scoring components [31].

**ML decision: no ML model in the application.** Alternative D is excluded by NFR-25 and by the absence of local data [32], [33]. The `ml/` directory of the repository is used for the synthetic-profile generator, the constraint verification of the rule engine (SQ1) and the statistical analysis of the pilot. An explainable model trained on local pilot data is listed as future work.

---

## 7. D6. Wearable Data Access

**Requirements addressed:** FR-10, FR-11, NFR-04, NFR-06, NFR-21, CON-01.

Google Fit is not an option for a new project: developers cannot sign up for the Google Fit APIs since 1 May 2024, the APIs are supported until the end of 2026, and Health Connect is the named replacement [8].

| Criterion | A. Health Connect + HealthKit (on device) | B. Commercial aggregator (e.g. Terra) | C. Vendor cloud APIs (e.g. Fitbit, Garmin) |
|---|---|---|---|
| C2. Device coverage and operation without a wearable | **Good.** Any wearable that writes to Health Connect or Apple Health; phone steps work without a wearable. Health Connect requires Android 9 or later with Google Play services and is part of the system from Android 14 [7]; HealthKit is the central repository for health data on iPhone and Apple Watch [9] | **Good.** Many brands through one API | **Weak.** One integration per vendor. The Fitbit Web API is turned off on 30 October 2026 and replaced by the Google Health API [11]; Garmin business access requires an application to its developer program [12] |
| C4. Privacy and data minimization | **Good.** The user grants permission per data type [9]; data go from the phone only to the project server | **Weak.** Health data pass through a third-party cloud (NFR-04) | **Partial.** Data pass through each vendor's cloud |
| C5. Data residency | **Good.** No intermediate cloud | **Fails.** An extra processor outside the project's control stores personal data (NFR-06) | **Partial.** Vendor clouds outside Kazakhstan |
| C8. Cost and licence | **Good.** Free; `health` plugin is open source [4] | **Fails.** Paid plans from USD 499 per month; no free plan [10] (CON-01) | **Partial.** Free tiers, subject to approval |
| C9. Team fit and timeline | **Good.** One Flutter plugin for both platforms [4] | **Good.** One API | **Weak.** Separate OAuth flows and migrations |

**Decision: A, on-device access through Health Connect and HealthKit, using the `health` Flutter plugin.** It is the only alternative that is free, keeps health data between the phone and the project's own server, and works with or without a wearable (NFR-21). Aggregators are excluded by cost and data residency [10], and vendor cloud APIs are unstable for a project that ends in 2027 [11].

---

## 8. Selected Stack

| Layer | Selected technology | Decision |
|---|---|---|
| Mobile client | Flutter (Dart), one code base; minimum Android 9 (API 28) and iOS 15 | D1 |
| On-device storage | SQLite through `drift`, used as an offline queue | D1, D3 |
| Local notifications | `flutter_local_notifications` | D1 |
| Wearable and phone data | Health Connect (Android) and HealthKit (iOS) through the `health` plugin | D6 |
| Backend | FastAPI (Python) | D2 |
| API | REST, OpenAPI description generated by FastAPI, Dart client generated from it | D4 |
| Database | PostgreSQL, self-hosted on a server in Kazakhstan | D3 |
| Recommendation and factor-identification engine | Declarative, versioned rule base with a Python evaluator and hard-constraint checker | D5 |
| Verification and analysis (`ml/`) | Python: synthetic-profile generator, constraint checks (SQ1), pilot statistics | D5 |

Two supporting choices follow from the decisions and are not compared separately:

- **Notifications.** Activity prompts (FR-25) are shown as local notifications that the app schedules on the device from thresholds computed by the backend, so no third-party push SDK is required for the prototype (NFR-04). Because iOS keeps only the 64 most recently scheduled notifications [30], the app schedules a rolling window of prompts and refreshes it on each synchronization. Whether background step checks are frequent enough on iOS to trigger a prompt when activity falls below the threshold is tested in the prototype; remote push through the platform services is the fallback if NFR-15 is not met.
- **Deployment.** The backend and database run as containers on one server located in Kazakhstan (NFR-06). The hosting option (a university server or a local provider) is to be agreed with the supervisor.

---

## 9. Assumptions and Risks

| ID | Assumption or risk | Affects | Mitigation |
|---|---|---|---|
| A1 | The mobile developer (Temirbulatov Yeraly) has or can quickly gain Flutter experience. | D1 | To confirm. Flutter was already planned in the Midterm proposal. |
| A2 | The backend developer (Kadirbay Bibarys) is comfortable with Python. | D2 | To confirm. Fallback: NestJS backend with the rule engine as a separate Python service. |
| A3 | A server located in Kazakhstan is available for the pilot. | D2, D3, NFR-06 | Ask the supervisor about a university server; otherwise a local hosting provider. |
| R1 | Localization rules are being revised. The Law on Personal Data and Their Protection requires storage in Kazakhstan [22]; a draft decree would relax this for most data categories [23]. | NFR-06 | Design for local storage now; the decision holds even if the rule is relaxed. |
| R2 | The `health` plugin is maintained by a research group and may lag behind platform changes. | D6 | Pin the plugin version; fall back to platform channels for a missing data type [1]. |
| R3 | Building and testing the iOS app requires a Mac with Xcode and an Apple developer account for HealthKit on a physical device. | D1, D6 | Confirm access to a Mac early; develop on Android first. |
| R4 | The ML decision may be revisited after the pilot. | D5 | Rule base and data model allow an explainable auxiliary model to be added later without changing the recommendation path. |

---

## 10. Use in the Thesis

The decisions in Sections 2–7 are summarized in Chapter 3 (System Design), and the selected stack in Section 8 forms the basis of the component diagram (pre-defense item 7). The ML decision (Section 6) is cited in the literature review discussion of data-driven factor identification.

---

## References

[1] Flutter, "Flutter architectural overview," Flutter documentation. [Online]. Available: https://docs.flutter.dev/resources/architectural-overview (accessed Oct. 22, 2026).

[2] Meta Platforms, Inc., "About the New Architecture," React Native documentation. [Online]. Available: https://reactnative.dev/architecture/landing-page (accessed Oct. 22, 2026).

[3] A. Biørn-Hansen, T.-M. Grønli, and G. Ghinea, "A survey and taxonomy of core concepts and research challenges in cross-platform mobile development," *ACM Computing Surveys*, 2018. [Online]. Available: https://bura.brunel.ac.uk/handle/2438/16569 (accessed Oct. 22, 2026).

[4] Copenhagen Research Platform, Technical University of Denmark, "health," version 13.3.2, pub.dev. [Online]. Available: https://pub.dev/documentation/health/latest/ (accessed Oct. 22, 2026).

[5] "react-native-health-connect," version 3.5.3, npm. [Online]. Available: https://unpkg.com/react-native-health-connect@3.5.3/README.md (accessed Oct. 22, 2026).

[6] Agency Enterprise, "react-native-health," GitHub. [Online]. Available: https://github.com/agencyenterprise/react-native-health (accessed Oct. 22, 2026).

[7] Google, "Health Connect availability," Android Developers. [Online]. Available: https://developer.android.com/health-and-fitness/guides/health-connect/plan/availability (accessed Oct. 22, 2026).

[8] Google, "Google Fit migration FAQ," Android Developers. [Online]. Available: https://developer.android.com/health-and-fitness/health-connect/migration/fit/faq (accessed Oct. 22, 2026).

[9] Apple Inc., "HealthKit," Apple Developer Documentation. [Online]. Available: https://developer.apple.com/documentation/healthkit (accessed Oct. 22, 2026).

[10] Terra, "Pricing." [Online]. Available: https://tryterra.co/pricing (accessed Oct. 22, 2026).

[11] Google, "Google Health API release notes," Google for Developers. [Online]. Available: https://developers.google.com/health/release-notes (accessed Oct. 22, 2026).

[12] Garmin Ltd., "Garmin Connect Developer Program overview." [Online]. Available: https://developer.garmin.com/gc-developer-program/overview (accessed Oct. 22, 2026).

[13] FastAPI, "Features," FastAPI documentation. [Online]. Available: https://fastapi.tiangolo.com/features/ (accessed Oct. 22, 2026).

[14] NestJS, "Introduction," NestJS documentation. [Online]. Available: https://docs.nestjs.com/ (accessed Oct. 22, 2026).

[15] VMware Tanzu, "Spring Boot," spring.io. [Online]. Available: https://spring.io/projects/spring-boot (accessed Oct. 22, 2026).

[16] The PostgreSQL Global Development Group, "Encryption options," PostgreSQL 18 documentation. [Online]. Available: https://www.postgresql.org/docs/current/encryption-options.html (accessed Oct. 22, 2026).

[17] The PostgreSQL Global Development Group, "JSON types," PostgreSQL 18 documentation. [Online]. Available: https://www.postgresql.org/docs/current/datatype-json.html (accessed Oct. 22, 2026).

[18] MongoDB, Inc., "Server Side Public License FAQ." [Online]. Available: https://www.mongodb.com/licensing/server-side-public-license/faq (accessed Oct. 22, 2026).

[19] Google, "Cloud Firestore locations," Firebase documentation. [Online]. Available: https://firebase.google.com/docs/firestore/locations (accessed Oct. 22, 2026).

[20] Google, "Access data offline," Firebase documentation. [Online]. Available: https://firebase.google.com/docs/firestore/manage-data/enable-offline (accessed Oct. 22, 2026).

[21] Supabase, "Project pausing," Supabase documentation. [Online]. Available: https://supabase.com/docs/guides/platform/project-pausing (accessed Oct. 22, 2026).

[22] Republic of Kazakhstan, *Law on Personal Data and Their Protection*, No. 94-V, May 21, 2013, Art. 12. [Online]. Available: https://adilet.zan.kz/rus/docs/Z1300000094 (accessed Oct. 22, 2026).

[23] American Chamber of Commerce in Kazakhstan, "Data localization issue brief," May 15, 2026. [Online]. Available: https://amcham.kz/wp-content/uploads/2026/05/2026-05-15_AmCham_DataLocalization_Issue-Brief_ENG_v5.pdf (accessed Oct. 22, 2026).

[24] R. T. Fielding, "Architectural styles and the design of network-based software architectures," Ph.D. dissertation, Univ. of California, Irvine, CA, USA, 2000.

[25] OpenAPI Initiative, "OpenAPI Specification v3.1.0," 2021. [Online]. Available: https://spec.openapis.org/oas/v3.1.0 (accessed Oct. 22, 2026).

[26] GraphQL Foundation, "GraphQL specification," September 2025 edition. [Online]. Available: https://spec.graphql.org/ (accessed Oct. 22, 2026).

[27] J. Brandhorst, "The state of gRPC in the browser," gRPC blog, Jan. 8, 2019. [Online]. Available: https://grpc.io/blog/state-of-grpc-web/ (accessed Oct. 22, 2026).

[28] Apache KIE, "Drools rule engine," Drools documentation, version 10.1. [Online]. Available: https://kie.apache.org/docs/10.1.x/drools/drools/rule-engine/index.html (accessed Oct. 22, 2026).

[29] S. Binder, "drift," version 2.35.2, pub.dev. [Online]. Available: https://pub.dev/packages/drift (accessed Oct. 22, 2026).

[30] "flutter_local_notifications," version 22.3.2, pub.dev. [Online]. Available: https://pub.dev/packages/flutter_local_notifications (accessed Oct. 22, 2026).

[31] R. Zenun Franco, R. Fallaize, M. Weech, F. Hwang, and J. A. Lovegrove, "Effectiveness of web-based personalized nutrition advice for adults using the eNutri web app: Evidence from the EatWellUK randomized controlled trial," *Journal of Medical Internet Research*, vol. 24, Art. no. e29088, 2022, doi: 10.2196/29088.

[32] R. An, J. Shen, and Y. Xiao, "Applications of artificial intelligence to obesity research: Scoping review of methodologies," *Journal of Medical Internet Research*, vol. 24, no. 12, Art. no. e40589, 2022, doi: 10.2196/40589.

[33] F. Mendoza Palechor and A. de la Hoz Manotas, "Dataset for estimation of obesity levels based on eating habits and physical condition in individuals from Colombia, Peru and Mexico," *Data in Brief*, vol. 25, Art. no. 104344, 2019, doi: 10.1016/j.dib.2019.104344.

[34] H. M. Bayram, Z. M. Çelik, and H. K. Barcın Güzeldere, "Can artificial intelligence (AI) chatbot tools be used effectively for nutritional management in obesity?," *Nutrition and Health*, vol. 31, pp. 1825–1834, 2025, doi: 10.1177/02601060251329070.

[35] R. De Croon, L. Van Houdt, N. N. Htun, G. Štiglic, V. Vanden Abeele, and K. Verbert, "Health recommender systems: Systematic review," *Journal of Medical Internet Research*, vol. 23, no. 6, Art. no. e18035, 2021, doi: 10.2196/18035.

[36] Flutter, "Supported deployment platforms," Flutter documentation, Flutter 3.47. [Online]. Available: https://docs.flutter.dev/reference/supported-platforms (accessed Oct. 22, 2026).

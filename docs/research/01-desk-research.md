# 1. Desk Research: Analysis of Available Data

| | |
|---|---|
| **Pre-defense item** | 2. Evidence of relevance |
| **YouTrack task** | [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4) |
| **Evidence type** | Analysis of available data (secondary sources) |
| **Status** | Complete; all figures checked against the cited source on 22 October 2026 |

This document summarizes published data that show the scale of the problem the project addresses. It answers the question *"Is excess weight a relevant problem globally, in Kazakhstan and in Astana?"* It does **not** answer whether target users need the proposed system or how they would use it; those questions are tested by the user interviews (see [02-assumptions-register.md](02-assumptions-register.md)).

---

## 1.1 Global burden of overweight and obesity

| Indicator | Value | Source |
|---|---|---|
| Adults (18+) living with overweight, 2024 | 2.6 billion (45% of adults), up from 25% in 1990 | WHO [1] |
| Adults living with obesity, 2024 | 940 million (16% of adults) | WHO [1] |
| Trend in adult obesity | More than doubled since 1990 | WHO [1] |
| Children and adolescents aged 5–19 with overweight, 2024 | 400 million, including 170 million with obesity | WHO [1] |
| Deaths attributed to higher-than-optimal BMI, 2023 | 3.7 million, mainly from cardiovascular disease, diabetes and cancers | WHO [1] |
| Projected economic cost without action | US$3 trillion per year by 2030; more than US$18 trillion by 2060 | WHO [1] |
| People of all ages living with obesity, 2022 | More than 1 billion; adults: about 880 million (504 million women, 374 million men) | NCD-RisC [2] |
| Change in adult obesity prevalence, 1990–2022 | Women: 8.8% → 18.5%; men: 4.8% → 14.0% | NCD-RisC [2] |
| Adults (25+) with overweight or obesity, 2021 | 2.11 billion (1.00 billion men, 1.11 billion women) | GBD 2021 [3] |
| Forecast for 2050 | 3.80 billion adults with overweight or obesity (95% UI 3.39–4.04), if historical trends continue | GBD 2021 [3] |
| Adult obesity in the super-region "Central Europe, Eastern Europe and Central Asia", 1990–2021 | Men: about 12.6% → 24.1%; women: about 22.5% → 36.5% | GBD 2021 [3] |

**Interpretation.** Excess weight affects close to half of the world's adult population, is still rising, and is projected to keep rising [1]–[3]. In the GBD super-region that includes Kazakhstan, adult obesity roughly doubled in men and rose by about 14 percentage points in women between 1990 and 2021 [3].

---

## 1.2 Kazakhstan

| Indicator | Value | Population and year | Source |
|---|---|---|---|
| Adult obesity (BMI ≥ 30 kg/m²), modelled estimate | Combined 21.80%; men 21.37%; women 22.19% | Adults; NCD-RisC estimates, World Obesity table dated 2024 | World Obesity Federation, based on NCD-RisC [4] |
| Overweight (BMI 25.0–29.9 kg/m²) | About 29.5–30% in both urban and rural residents | Nationwide WHO STEPS survey, n = 6,720, age 18–69, Oct 2021–May 2022 | Nursultanova *et al.* [5] |
| Insufficient physical activity | 19.7% of adults did not meet WHO recommendations | Same national sample (n = 6,720, all 17 regions) | Ibrayeva *et al.* [6] |
| Hypertension | 16.0% (95% CI 15.1–16.8) | Same national sample | Zhukov *et al.* [7] |
| Class II obesity (BMI 35.0–39.9 kg/m²) | Rural 6.1% vs urban 3.6% | Same national sample | Zhukov *et al.* [7] |
| Overweight or obesity in children aged 6–9 | 21% | WHO COSI national survey, 2020 | WHO Europe [8] |

The national STEPS sample in [5]–[7] is the same survey (October 2021–May 2022, sample drawn from the national frame of the Bureau of National Statistics) reported in three separate articles; the figures are therefore consistent with each other but are not three independent samples.

**Interpretation.** About one in five adults in Kazakhstan is estimated to live with obesity [4], above the WHO global figure of 16% [1] (the two estimates use different methods and reference years, so the comparison is indicative only), and close to a further third of surveyed adults have overweight [5]. One in five adults does not reach the WHO physical activity recommendation [6]. Excess weight starts early: one in five children aged 6–9 has overweight or obesity [8].

---

## 1.3 Astana region

| Indicator | Value | Population and year | Source |
|---|---|---|---|
| Overweight | 37% | Adults aged 50–74, Astana city and Akmola region, n = 977, Nov 2012–Mar 2015 | Zhumadilova *et al.* [9] |
| Obesity | 43.9% (95% CI 40.8–47.0) | Same sample | Zhumadilova *et al.* [9] |
| Central obesity | 72% | Same sample | Zhumadilova *et al.* [9] |

**Limitation.** These data are from older adults and were collected in 2012–2015. They show that the problem is pronounced in the Astana region, but they cannot be used as a current estimate for the project's target group (adults aged 18–60). No recent published estimate for working-age adults in Astana was found; the interviews and, later, the pilot study partly compensate for this gap.

---

## 1.4 Available open data on obesity factors

The UCI Machine Learning Repository dataset *"Estimation of obesity levels based on eating habits and physical condition"* [10], [11] is the most widely used open dataset that links lifestyle factors to weight category.

| Property | Value |
|---|---|
| Records / attributes | 2,111 records, 17 attributes (including family history of overweight, frequent high-calorie food, vegetable consumption, number of main meals, snacking, smoking, water intake, calorie monitoring, physical activity frequency, screen time, alcohol, transport) |
| Target | Seven weight classes from "Insufficient Weight" to "Obesity Type III" |
| Population | Individuals from Mexico, Peru and Colombia |
| Data origin | 23% collected through a web survey; **77% generated synthetically** with the SMOTE filter in Weka |
| Licence | CC BY 4.0 |

**Relevance for the project.** The dataset shows which modifiable factors are commonly measured in obesity-factor studies and can be used to prototype and test the factor-identification component. It is **not** evidence about users in Kazakhstan: the population is Latin American and most records are synthetic. Any model or rule tuned on it must be validated on local data. This is one of the reasons the project collects primary evidence from local users.

---

## 1.5 What desk research verifies and what it does not

| Statement | Status after desk research |
|---|---|
| Overweight and obesity are a large and growing global problem. | **Verified** [1]–[3] |
| Obesity is common among adults in Kazakhstan (about one in five). | **Verified** (modelled estimate) [4] |
| Overweight is common among adults in Kazakhstan (about 30%). | **Verified** (national survey) [5] |
| A substantial share of adults in Kazakhstan is insufficiently active. | **Verified** (19.7%) [6] |
| Obesity is highly prevalent in the Astana region. | **Partially verified**: older adults only, data from 2012–2015 [9] |
| Adults with overweight in Astana want a mobile tool for weight management. | **Not verified**: tested in interviews (assumptions A1–A12) |
| Existing apps do not meet local users' needs (for example, local foods). | **Not verified**: tested in interviews (A5) |
| Users will accept rule-based, explained recommendations that combine nutrition and activity. | **Not verified**: tested in interviews (A3, A4) |
| Open obesity-factor data represent users in Kazakhstan. | **Refuted**: the main open dataset is Latin American and 77% synthetic [10], [11] |

---

## References

[1] World Health Organization, "Obesity and overweight," Fact sheet, updated Oct. 7, 2026. [Online]. Available: https://www.who.int/news-room/fact-sheets/detail/obesity-and-overweight (accessed Oct. 22, 2026).

[2] NCD Risk Factor Collaboration (NCD-RisC), "Worldwide trends in underweight and obesity from 1990 to 2022: A pooled analysis of 3663 population-representative studies with 222 million children, adolescents, and adults," *The Lancet*, vol. 403, no. 10431, pp. 1027–1050, 2024, doi: 10.1016/S0140-6736(23)02750-2.

[3] GBD 2021 Adult BMI Collaborators, "Global, regional, and national prevalence of adult overweight and obesity, 1990–2021, with forecasts to 2050: A forecasting study for the Global Burden of Disease Study 2021," *The Lancet*, vol. 405, no. 10481, pp. 813–838, 2025, doi: 10.1016/S0140-6736(25)00355-1.

[4] World Obesity Federation, "Ranking (% obesity by country), adults," Global Obesity Observatory, based on NCD-RisC estimates. [Online]. Available: https://data.worldobesity.org/tables/ranking-obesity-by-country-adults-1.pdf (accessed Oct. 22, 2026).

[5] L. Nursultanova *et al.*, "Prevalence of chronic kidney disease in Kazakhstan: Evidence from a national cross-sectional study," *Scientific Reports*, vol. 13, Art. no. 14710, 2023, doi: 10.1038/s41598-023-42031-2.

[6] A. Ibrayeva, M. Shoranov, T. Muminov, Y. Ismoldayev, S. Tanabayeva, and I. Fakhradiyev, "Physical activity levels in Kazakhstan: A cross-sectional nationwide study on demographic, socioeconomic, and regional factors," *Medicina*, vol. 61, no. 11, Art. no. 1913, 2025, doi: 10.3390/medicina61111913.

[7] Y. Zhukov *et al.*, "Socio-demographic, behavioral, and biological risk factors of hypertension in Kazakhstan: Results of a national study," *Population Health Metrics*, vol. 24, Art. no. 10, 2026, doi: 10.1186/s12963-026-00454-9.

[8] WHO Regional Office for Europe, "New WHO data on childhood obesity in Kazakhstan: Higher physical activity levels but more screen time," News release, Apr. 16, 2022. [Online]. Available: https://www.who.int/europe/news/item/16-04-2022-new-who-data-on-childhood-obesity-in-kazakhstan--higher-physical-activity-levels-but-more-screen-time (accessed Oct. 22, 2026).

[9] A. Zhumadilova *et al.*, "Socioeconomic inequalities in obesity among older adults in the Astana region of Kazakhstan: Evidence of a reversed socioeconomic gradient," *Frontiers in Public Health*, vol. 14, Art. no. 1895120, 2026, doi: 10.3389/fpubh.2026.1895120.

[10] F. Mendoza Palechor and A. de la Hoz Manotas, "Dataset for estimation of obesity levels based on eating habits and physical condition in individuals from Colombia, Peru and Mexico," *Data in Brief*, vol. 25, Art. no. 104344, 2019, doi: 10.1016/j.dib.2019.104344.

[11] F. Mendoza Palechor and A. de la Hoz Manotas, "Estimation of obesity levels based on eating habits and physical condition," UCI Machine Learning Repository, 2019, doi: 10.24432/C5H31Z.

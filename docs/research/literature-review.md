# Literature Review

| | |
|---|---|
| **Project** | Development of a Mobile Recommender System for Identifying Obesity Factors and Personalized Weight Management |
| **Document type** | Pre-defense item 3: literature review with a structured analysis table |
| **YouTrack task** | [DOA-5](https://yeralytemir.youtrack.cloud/issue/DOA-5) |
| **Version / date** | 1.0 draft for supervisor review, 22 October 2026 |
| **Based on** | Revised literature review of the Midterm Research Proposal (Research Methods and Tools, October 2026), extended with sources on health recommender systems and data-driven identification of obesity factors |

---

## Summary

The reviewed literature shows that mobile weight-management interventions work, but their benefit is small and depends heavily on the comparator. Multimodal apps produce about 2.6–2.9 kg of additional weight loss, mostly against passive controls; against active self-monitoring, automated tailored feedback has not improved weight loss [1], [2], [3], [4]. Personalized interventions usually target one behavior at a time, nutrition-personalization trials lasted only 6–12 weeks, and engagement is defined inconsistently [5], [6], [7], [8]. AI models were more accurate than conventional statistics in most comparisons, but their performance depends on the data set, and a widely used open data set is largely synthetic and not drawn from Central Asia [9], [10]. Opaque generative tools can produce nutritionally unsafe plans [11].

The project therefore takes four positions from the literature: (1) recommendations are produced by transparent, guideline-constrained rules with a visible rule trace; (2) nutrition and physical activity are personalized jointly; (3) engagement is defined in advance and measured from logs; (4) the added value of decision support is tested against an active, same-app self-monitoring control. The corpus contains **27 sources, all peer-reviewed journal publications**; 25 of them (93%) were published in 2021–2026.

---

## 1. Scope and Search Method

### 1.1 Review questions

| ID | Question |
|---|---|
| RQ-L1 | Which modifiable factors are associated with obesity, and why does weight management need personalization? |
| RQ-L2 | How effective are mobile and digital weight-management interventions, and against which comparators? |
| RQ-L3 | How do personalization mechanisms affect engagement and behavior, and how is engagement measured? |
| RQ-L4 | Which recommender and data-driven approaches are used to identify obesity factors and generate health recommendations, and what are their limitations? |
| RQ-L5 | What should nutrition and physical activity recommendations contain to be safe and evidence-based? |

### 1.2 Sources and selection criteria

The core corpus is the DOI-checked reference list of the Midterm Research Proposal (20 sources). It was searched mainly in Google Scholar and Scopus with combinations of the terms "obesity", "overweight", "mobile health", "decision support", "personalized nutrition", "physical activity" and "engagement". For this review, PubMed Central and publisher pages were searched additionally with the terms "health recommender system", "recommender systems healthcare", "artificial intelligence obesity" and "just-in-time adaptive intervention", to cover RQ-L4. Three sources verified in the project's desk research (pre-defense item 2) were added: two for RQ-L1 and the open data set for RQ-L4.

| Criterion | Rule |
|---|---|
| Publication type | Peer-reviewed journal articles: original studies, systematic and scoping reviews, meta-analyses, position statements, data articles |
| Population or topic | Adults with overweight or obesity, digital weight-management tools, health recommender systems, data-driven obesity research |
| Language | English |
| Period | 2021–2026 for the core body; older works only when they are foundational (see 1.3) |
| Excluded | Conference papers, books, preprints, sources whose bibliographic record does not match their DOI, unverified figures from earlier course assignments |
| Verification | Every source was checked against its DOI record (Midterm sources by the Midterm authors; desk-research sources in pre-defense item 2; added sources on 22 October 2026 against Crossref and the publisher or PubMed Central page) |

### 1.3 Corpus composition

| Type | Count | Sources |
|---|---|---|
| Original studies (RCTs, pilot, single-arm, observational, cross-sectional, content analysis) | 11 | [3], [4], [6], [7], [8], [11], [12], [13], [14], [15], [16] |
| Systematic reviews and meta-analyses | 4 | [1], [2], [17], [18] |
| Narrative, scoping and bibliometric reviews | 8 | [5], [9], [19], [20], [21], [22], [23], [24] |
| Pooled population analysis | 1 | [25] |
| Position statement (clinical guidance) | 1 | [26] |
| Conceptual framework | 1 | [27] |
| Data article (open data set) | 1 | [10] |
| **Total** | **27** | 25 published in 2021–2026 |

**Foundational works older than five years.** Nahum-Shani *et al.* (2018) [27] is retained because it defines the components of just-in-time adaptive interventions (decision points, tailoring variables, decision rules, intervention options, proximal and distal outcomes), which the project uses to structure its prompt and recommendation rules. Mendoza Palechor and de la Hoz Manotas (2019) [10] is retained because it describes a widely used open data set linking eating habits and physical condition to obesity level, which the project may use only for prototyping and testing.

---

## 2. Structured Analysis Table of Publications

Sources are grouped by the review question they mainly answer. "Use in this project" links each source to the project objectives (O1–O4) and the sub-question SQ1 defined in the [project proposal](../proposal/proposal.md).

### 2.1 Obesity factors and the need for personalization (RQ-L1)

| Source | Year | Type, design and sample | Key finding | Limitation | Use in this project |
|---|---|---|---|---|---|
| NCD-RisC [25] | 2024 | Pooled analysis of 3,663 population-representative studies, 222 million participants | Worldwide trends in underweight and obesity from 1990 to 2022; more than one billion people were living with obesity in 2022 | Population-level estimates; no individual-level drivers | Problem relevance (introduction) |
| Ahmed and Mohammed [19] | 2025 | Narrative review | Prevalence roughly tripled since 1975; drivers are genetic, behavioral, environmental and socioeconomic; projected cost of US$4.32 trillion per year | Narrative, not systematic | Defines the factor groups; justifies limiting the system to modifiable behavioral factors |
| Wang *et al.* [12] | 2023 | Cross-sectional, 31,568 US adults | High perceived walkability: OR 1.48 for sufficient physical activity and OR 0.76 for obesity | Cross-sectional, self-reported, US setting | Environment shapes activity; activity targets must start from the user's own baseline |
| Curran *et al.* [17] | 2023 | Systematic review of correlates of activity and sedentary behavior in adults with overweight or obesity | Self-efficacy, intrinsic motivation, enjoyment and social support are correlates of physical activity | Correlational evidence | Content of activity recommendations and prompts (O1) |
| Ibrayeva *et al.* [13] | 2025 | Nationwide cross-sectional study, Kazakhstan | 19.7% of adults do not reach the WHO physical activity recommendation | Self-reported activity | Local context: insufficient activity is a relevant factor in Kazakhstan |
| Hassapidou *et al.* (EASO) [26] | 2023 | Position statement on medical nutrition therapy | Person-centered, flexible therapy within a multidisciplinary team; several dietary patterns accepted; waist circumference is an indispensable measure; scarce evidence on maintenance and harms | Clinical guidance, not a trial | Main guideline source for nutrition rules (O1); exclusion of users needing medical care; waist circumference as outcome (O4) |

### 2.2 Effectiveness of digital weight management (RQ-L2)

| Source | Year | Type, design and sample | Key finding | Limitation | Use in this project |
|---|---|---|---|---|---|
| Lee and Park [1] | 2026 | Systematic review and meta-analysis of 19 RCTs | Small effect of stand-alone digital interventions (SMD 0.26, moderate certainty); diet-only programs: no significant anthropometric effect; control type is the only significant moderator, wait-list controls give the largest effects | Heterogeneous interventions and outcomes | Justifies an active, same-app control arm (O3, O4) |
| Bodner *et al.* [2] | 2026 | Systematic review and meta-analysis of app-based multimodal interventions | Multimodal apps (diet, activity, psychosocial content): about 2.61 kg pooled weight loss with high heterogeneity; SMD 0.50 | High heterogeneity | Supports a multimodal design; basis of the sample-size reasoning |
| Zhang *et al.* [20] | 2026 | Bibliometric analysis of 2,633 publications | Research is shifting from passive observation to active intervention; effects tend to fade after 3–6 months, with high attrition; short follow-up and inconsistent outcomes | Bibliometric, no effect sizes | Need for predefined outcomes and a follow-up of at least 12 weeks |
| Burke *et al.* (SMARTER) [4] | 2022 | RCT, n = 502, 12 months | Tailored daily feedback vs self-monitoring only: −2.12% vs −2.39% weight (P = .68); better calorie-goal adherence; users who opened more messages lost more weight | Feedback on self-monitoring only; recommendations not personalized | Key evidence that self-monitoring is a strong comparator; motivates personalized recommendations rather than generic feedback |
| Gemesi *et al.* [3] | 2024 | RCT, n = 168, 12 weeks | Multimodal app vs wait-list: 2.9 kg more weight loss; time spent in the app associated with weight reduction | Wait-list control; short; industry-funded | Effect estimates against a passive control; app usage as engagement measure |
| Pagoto *et al.* [14] | 2023 | Single-arm trial, n = 153, 6 months | Commercial program: −5.05% weight; 51% lost ≥ 5%; 86.3% retained | No control group; human support (virtual workshops, one-to-one check-ins) | Shows that human coaching confounds app effects; the project excludes human coaching; multiple imputation for missing data |

### 2.3 Personalization mechanisms and engagement (RQ-L3)

| Source | Year | Type, design and sample | Key finding | Limitation | Use in this project |
|---|---|---|---|---|---|
| Vasiloglou *et al.* [5] | 2026 | Scoping review of 59 nutrition-app studies | Personalization featured in 32% of studies; only 31% defined engagement explicitly; 29% measured retention | Nutrition apps only | Engagement metrics defined in advance from app logs (O3) |
| Nahum-Shani *et al.* [27] | 2018 | Conceptual framework (foundational) | Defines JITAI components: decision points, intervention options, tailoring variables, decision rules, proximal and distal outcomes; notes that many JITAIs were built with little empirical evidence or theory | Framework, no effect data | Structure of the rule engine and prompt logic (O1, O2) |
| Ikegaya *et al.* [6] | 2025 | Randomized pilot, n = 28, 2 weeks, university students | Prompts with personalized thresholds: about 115 more steps in the hour after a prompt | No weekly change; students; very short | Prompt thresholds derived from each user's baseline week (O2) |
| Yoshimura *et al.* [15] | 2022 | RCT, n = 109, 32 weeks, employees | Step-count app: +65 steps per wear-hour vs −9 in control; equal weight loss (about 2.2 kg) | Activity only; employees | Activity alone is not enough; activity must be combined with nutrition (O1) |
| Jospe *et al.* [16] | 2026 | Retrospective observational study of users of a continuous glucose monitoring app (Vively) | Food logging fell from 63.2% of days during sensor wear to 2.4% after sensor removal | Observational; commercial users | Passive sensing supports but does not sustain engagement; recommendations and prompts are needed in addition to wearable data |

### 2.4 Health recommender systems and data-driven identification of obesity factors (RQ-L4)

| Source | Year | Type, design and sample | Key finding | Limitation | Use in this project |
|---|---|---|---|---|---|
| De Croon *et al.* [18] | 2021 | Systematic review (PRISMA) of 73 health recommender systems for laypersons | Recommended items fall into lifestyle, nutrition, general health information and specific conditions; most systems use hybrid algorithms; about half of the studies evaluated only the algorithm; five reporting guidelines proposed (target user, what is recommended and how, data set, algorithm, evaluation protocol) | Review up to its search date; heterogeneous evaluation | Reporting frame for the system description; evaluation with users, not only algorithm metrics (O2–O4) |
| Tran *et al.* [22] | 2021 | State-of-the-art review of recommender systems in healthcare | Classifies systems by scenario (food, drug, health status prediction, healthcare services, professionals) and by approach; lists open research issues | Not systematic | Positions the project as a food and activity recommender for laypersons |
| An *et al.* [9] | 2022 | Scoping review of 46 studies applying ML and deep learning to obesity | AI models were more accurate than conventional statistics in 18 of 22 comparisons; results among AI models were mixed and depended on the data set and task; trends: multimodal models, synthetic data, human-in-the-loop | Two databases; rule-based approaches excluded | Data-driven factor models need local validation; motivates an explainable, rule-based core (decision on any ML component in pre-defense item 5) |
| Mendoza Palechor and de la Hoz Manotas [10] | 2019 | Data article: 2,111 records, 17 attributes on eating habits and physical condition, seven weight classes (foundational) | Widely used open data set linking lifestyle factors to obesity level | 77% of records generated synthetically (SMOTE); population from Mexico, Peru and Colombia | List of measurable modifiable factors; test data for prototyping only, not for claims about local users |
| Liu *et al.* [21] | 2025 | Narrative review of precision medicine and digital health in weight management | Nutrition is central to personalized weight management; precision nutrition based on genomic or microbiome data faces cost and accessibility barriers | Narrative review | Justifies personalization from low-cost behavioral data (smartphone, optional wearable) |
| Bayram *et al.* [11] | 2025 | Content analysis of menus generated by an AI chatbot (ChatGPT) for one simulated woman with obesity | Menus contained less energy than requested, unbalanced macronutrients and insufficient calcium | One simulated profile | Opaque generation is excluded; hard constraints on energy, macronutrients and calcium; guideline-comparison method adapted for SQ1 |

### 2.5 Content of nutrition and activity recommendations (RQ-L5)

| Source | Year | Type, design and sample | Key finding | Limitation | Use in this project |
|---|---|---|---|---|---|
| Zenun Franco *et al.* (eNutri) [7] | 2022 | RCT, n = 364, 12 weeks, web app | Automated rule-based advice targeting each user's three lowest-scoring diet-quality components raised the diet-quality score by 3.5 points; BMI unchanged | Mostly normal-weight participants; 35.4% attrition | Direct model for rule-based factor identification: rank the user's weakest components and target them first (O1) |
| de Jong *et al.* [8] | 2026 | Three-arm remote RCT, n = 180, 6 weeks | Personalized energy and macronutrient advice: −1.0 kg; −2.5 kg only with food boxes; personalized advice alone did not make the diet easier to follow | Diet only; very short | Personalized targets need practical support (meal suggestions) (O1, O2) |
| Oppert *et al.* [23] | 2023 | Review of physical activity and exercise in obesity | Aerobic training adds about 2–3 kg of weight loss; resistance training preserves lean mass | Review | Activity rules: aerobic activity plus two resistance sessions per week (O1) |
| De Roos *et al.* [24] | 2026 | Review of physical activity and cardiometabolic risk in overweight and obesity | Exercise improves blood pressure, visceral fat and fitness even when weight loss stays below 5%; low-intensity training at 30–39% of heart-rate reserve reduced BMI and waist circumference | Review | Start at low heart-rate-reserve zones; report outcomes beyond weight (steps, waist) (O1, O4) |

---

## 3. Critical Synthesis

### 3.1 Obesity factors and the case for personalization

Obesity is a large and growing problem: more than one billion people were living with obesity in 2022 [25], and its drivers are genetic, behavioral, environmental and socioeconomic [19]. These drivers act differently in different people. The built environment, for example, changes the odds of sufficient physical activity and of obesity [12], and psychological correlates such as self-efficacy, intrinsic motivation, enjoyment and social support are associated with activity in adults with overweight or obesity [17]. In Kazakhstan, about one in five adults does not reach the WHO activity recommendation [13]. Clinical guidance follows the same logic: EASO recommends person-centered, flexible nutrition therapy and accepts several dietary patterns rather than one diet [26].

**Implication.** Of the factor groups above, only behavioral factors (diet, physical activity, sedentary behavior) can be measured by a smartphone and changed without medical supervision. The project therefore defines "obesity factors" as modifiable lifestyle factors and leaves genetic, clinical and socioeconomic factors out of scope.

### 3.2 Effectiveness of digital weight management

The evidence for digital weight management is consistent in direction but weak in size. A meta-analysis of 19 RCTs found a small effect (SMD 0.26) and no significant anthropometric effect for diet-only programs [1]. Multimodal apps that combine diet, activity and psychosocial content perform better, at about 2.61 kg of pooled weight loss, but with high heterogeneity [2]. The comparator explains much of this spread. Control type was the only significant moderator, and wait-list controls produced the largest effects [1]. A self-guided multimodal app produced 2.9 kg more weight loss than a wait-list over 12 weeks [3], whereas in the 12-month SMARTER trial tailored feedback did not improve weight loss over self-monitoring alone (−2.12% vs −2.39%, P = .68) [4].

Two further problems weaken the evidence. First, strong single-arm results often include human support: a commercial program reached −5.05% at six months but added virtual workshops and one-to-one check-ins and had no control group [14]. Second, follow-up is short and outcomes are inconsistent across trials [20].

**Critical assessment.** The added value of *automated* personalization over plain self-monitoring is not established. SMARTER is the strongest test, but its intervention gave feedback on what users had logged rather than personalized recommendations of what to do next [4]. A fair test of a recommender therefore needs an active control that uses the same application without the recommendations.

### 3.3 Personalization mechanisms and engagement

Engagement is the expected mechanism through which personalization works: in SMARTER, users who opened more feedback messages lost more weight [4], and time spent in the app was associated with weight reduction [3]. Yet engagement is poorly standardized. Among 59 nutrition-app studies, personalization featured in 32%, only 31% defined engagement explicitly and 29% measured retention [5].

Adaptive activity features show short-lived or narrow effects. Prompts with personalized thresholds increased steps in the hour after a prompt but did not change weekly activity [6]. A 32-week step-count app raised steps per wear-hour but did not produce more weight loss than the control [15]. Passive sensing helps only while it lasts: in a continuous glucose monitoring app, food logging fell from 63.2% of days during sensor wear to 2.4% after removal [16]. The JITAI framework explains why such systems are hard to build well: an adaptive intervention needs explicit decision points, tailoring variables and decision rules, and many existing JITAIs were designed with little empirical or theoretical basis [27].

**Critical assessment.** Single-behavior adaptive features change the targeted behavior locally but do not reliably change weight. Personalization should therefore cover nutrition and activity together, and engagement must be defined before the study, so that the mechanism can be measured rather than assumed.

### 3.4 Health recommender systems and data-driven identification of obesity factors

Health recommender systems for laypersons recommend lifestyle, nutrition, general health information and condition-specific content, and most use hybrid algorithms [18]. Reviews classify healthcare recommenders by scenario, food recommendation being one of the main ones, and by recommendation approach [22]. The field is described as slowly maturing: about half of the reviewed systems were evaluated only by algorithm metrics, without users [18].

For the identification of obesity factors, data-driven models are increasingly used. In a scoping review of 46 studies, ML and deep-learning models were more accurate than conventional statistics in 18 of 22 comparisons, but comparisons among AI models gave mixed results that depended on the data set and task [9]. A widely used open data set for such models contains 2,111 records from Mexico, Peru and Colombia, and 77% of them were generated synthetically [10]. High-cost precision approaches based on genomic or microbiome data face accessibility barriers [21]. Opaque generation is also risky: menus produced by an AI chatbot for a simulated woman with obesity contained less energy than requested, unbalanced macronutrients and insufficient calcium [11].

A transparent alternative exists. The eNutri system scored each user's diet-quality components and automatically targeted the three lowest-scoring ones; this rule-based advice improved diet quality by 3.5 points [7].

**Critical assessment.** Data-driven prediction answers *who* is likely to have obesity, but a user who wants to manage weight needs to know *which of their own behaviors* deviate most from guidance and what to do about each. Rule-based scoring against guidelines answers that question, can be explained to the user and can be verified. Prediction models trained on non-local, largely synthetic data cannot support claims about users in Kazakhstan. Whether an auxiliary ML component is added is a technology decision taken in pre-defense item 5; any such component would have to be explainable and validated on local data.

### 3.5 Content of nutrition and activity recommendations

For nutrition, EASO supports several dietary patterns, treats waist circumference as an indispensable measure and notes scarce evidence on weight maintenance and harms [26]. Personalized energy and macronutrient targets alone yielded only 1.0 kg of weight loss in six weeks, rising to 2.5 kg only when food boxes were added, and personalized advice did not make the diet easier to follow [8]. Targets therefore need practical support, such as meal suggestions. Nutrient quality matters as well as energy, as the calcium and macronutrient errors of generated menus show [11].

For physical activity, aerobic training adds about 2–3 kg of weight loss and resistance training preserves lean mass [23]. Exercise also improves blood pressure, visceral fat and fitness when weight loss stays below 5%, and low-intensity training at 30–39% of heart-rate reserve has reduced BMI and waist circumference [24].

**Critical assessment.** Recommendations should cover both behaviors, check nutrient quality as well as energy, start at achievable intensities and be verifiable against explicit constraints.

---

## 4. Comparison of Approaches

The table summarizes the approaches found in the literature and the decision the project takes for each. A comparison of concrete commercial applications against a fixed set of criteria is given separately in [existing-systems.md](existing-systems.md) (pre-defense item 4).

| Approach | Evidence | Strengths | Limitations | Decision for this project |
|---|---|---|---|---|
| Self-monitoring only (food, weight, steps) | Strong active comparator; tailored feedback did not beat it [4] | Simple; proven baseline | No guidance on what to change | Used as the **control arm** (same app, tracking only) |
| Tailored feedback on logged behavior | No added weight loss over self-monitoring; better calorie-goal adherence [4] | Low cost, automated | Reacts to the past; does not recommend next actions | Extended into forward-looking recommendations |
| Multimodal app with human coaching | −5.05% at 6 months, no control [14] | High retention | Human support confounds the app's effect; costly | Human coaching **out of scope** |
| Multimodal self-guided app | 2.61 kg pooled [2]; 2.9 kg vs wait-list [3] | Combines diet, activity, psychosocial content | Mostly tested against passive controls | Multimodal content adopted; tested against an active control |
| Rule-based nutrition personalization | +3.5 diet-quality points [7]; −1.0 kg in 6 weeks [8] | Transparent, verifiable, guideline-based | Diet only; short trials | **Core approach**, extended to physical activity |
| Adaptive activity prompts (JITAI) | +115 steps in the next hour, no weekly change [6]; framework [27] | Context-sensitive | Short-lived, single behavior | Baseline-derived prompt thresholds combined with nutrition rules |
| Passive sensing (wearables, CGM) | Logging fell from 63.2% to 2.4% of days after sensor removal [16] | Low user effort | Does not sustain engagement alone | Optional wearable input, not the main driver |
| ML / AI prediction of obesity status | More accurate than statistics in 18/22 comparisons; data-dependent [9]; synthetic, non-local data [10] | Captures complex patterns | Needs large local data; harder to explain | Not used to generate recommendations; possible auxiliary use decided in item 5 |
| Generative AI (chatbots) | Energy, macronutrient and calcium errors [11] | Flexible, conversational | Opaque; can contradict guidelines | **Excluded** |
| Precision nutrition (genomic, microbiome) | Cost and accessibility barriers [21] | Biological detail | Expensive; needs laboratory data | **Excluded** |

---

## 5. Research Gap

Three findings converge.

1. **Unproven added value of automated personalization.** Digital interventions help mainly against passive controls; against active self-monitoring, tailored feedback did not improve weight loss [1], [3], [4].
2. **One behavior at a time.** Nutrition personalization has been tested only in trials lasting 6–12 weeks [7], [8], and activity-only apps increased steps without extra weight loss [6], [15].
3. **Opaque and poorly evaluated recommendations.** Engagement is rarely defined consistently [5], about half of health recommender systems are evaluated without users [18], opaque nutrition advice can contradict guidelines [11], and data-driven factor models depend on data that are largely synthetic and non-local [9], [10].

**Gap.** There is a lack of controlled evidence on whether a stand-alone mobile recommender system that identifies each user's deviating modifiable lifestyle factors and jointly personalizes nutrition and physical activity through transparent, guideline-constrained rules improves engagement and weight-related outcomes over at least 12 weeks, compared with self-monitoring alone. None of the nine original studies of digital tools in this corpus was conducted in Central Asia, which adds a contextual gap.

---

## 6. Limitations the Project Takes into Account

Each limitation found in the literature is turned into a design decision. The decisions become requirements in pre-defense item 6 (DOA-8) and are checked in the evaluation plan (DOA-12).

| ID | Limitation in the literature | Source | How the project addresses it | Objective |
|---|---|---|---|---|
| L1 | Effects are inflated by wait-list controls | [1], [3] | Active control: the same app with tracking only, no recommendations or prompts | O3, O4 |
| L2 | Tailored feedback alone did not beat self-monitoring | [4] | Forward-looking recommendations with weekly target updates, not only feedback on past logs | O1, O2 |
| L3 | Personalization of one behavior at a time | [6], [7], [8], [15] | One rule base for nutrition and physical activity | O1 |
| L4 | Opaque recommendations can violate nutritional guidance | [11] | Every recommendation shows the rule that produced it; hard constraints on energy, macronutrients, calcium and intensity | O1, SQ1 |
| L5 | Recommenders are often evaluated only by algorithm metrics | [18] | Two-level evaluation: constraint verification on 200 synthetic profiles (SQ1) and a 12-week pilot with users (O3, O4) | O2–O4 |
| L6 | Engagement is rarely defined or measured | [5] | Active days, retention and prompt response defined in advance and computed from time-stamped logs | O3 |
| L7 | Human coaching confounds app effects | [14] | No human coaching in either arm | O3, O4 |
| L8 | Short follow-up; effects fade after 3–6 months | [6], [8], [20] | 12-week pilot; long-term maintenance stated as out of scope | O3, O4 |
| L9 | Adaptive prompts have short-lived effects | [6], [27] | Prompt thresholds from the user's baseline week, step targets raised gradually, prompts combined with nutrition rules | O1, O2 |
| L10 | Passive sensing does not sustain engagement | [16] | Wearable data are optional input; recommendations and prompts drive engagement | O2 |
| L11 | Personalized targets alone are hard to follow | [8] | Meal suggestions from a local food database | O2 |
| L12 | Energy-only optimization ignores nutrient quality and activity benefits | [11], [23], [24] | Diet-quality and calcium flags; aerobic plus two resistance sessions; outcomes include waist circumference and steps | O1, O4 |
| L13 | Data-driven factor models depend on data set; open data are synthetic and non-local | [9], [10] | Factor identification by guideline-based scoring (eNutri approach [7]); open data used only for prototyping and testing | O1 |
| L14 | Precision nutrition is costly and hard to access | [21] | Only smartphone data and an optional wearable | O2 |
| L15 | Unsupervised use is unsafe for people who need medical care | [26] | Eligibility screening (BMI, diagnoses, PAR-Q+); referral to clinical care; low starting intensity [24] | O1, O2 |
| L16 | No studies from Central Asia | Corpus | Pilot in Astana; local foods in the food database | O2–O4 |

---

## 7. Limitations of This Review

- The review is narrative and thematic, not a full systematic review; there was no second independent screener and no formal risk-of-bias assessment.
- Only English-language journal articles were included; Russian- and Kazakh-language literature was not searched.
- The summaries of the 20 Midterm sources follow the DOI-checked Midterm text; the four added sources (De Croon *et al.*, Tran *et al.*, An *et al.*, Nahum-Shani *et al.*) were checked against their DOI records and abstracts on 22 October 2026; the three desk-research sources were verified in pre-defense item 2.
- Several key sources are 2026 publications; their findings have not yet been replicated.

---

## References

[1] S.-A. Lee and J.-H. Park, "Effects of stand-alone digital lifestyle interventions on weight-related outcomes in adults with overweight or obesity: Systematic review and meta-analysis of randomized controlled trials," *Journal of Medical Internet Research*, vol. 28, Art. no. e81070, 2026, doi: 10.2196/81070.

[2] E. Bodner, A. Gentz, K. Wiencke, N. Mehl, and H. Schlögl, "Effectiveness of mobile application-based multimodal behavioral interventions on weight loss in obesity: A systematic review and meta-analysis," *Obesity Reviews*, Art. no. e70221, 2026, doi: 10.1111/obr.70221.

[3] K. Gemesi *et al.*, "Efficacy of an app-based multimodal lifestyle intervention on body weight in persons with obesity: Results from a randomized controlled trial," *International Journal of Obesity*, vol. 48, pp. 118–126, 2024, doi: 10.1038/s41366-023-01415-0.

[4] L. E. Burke *et al.*, "The effect of tailored, daily, smartphone feedback to lifestyle self-monitoring on weight loss at 12 months: The SMARTER randomized clinical trial," *Journal of Medical Internet Research*, vol. 24, no. 7, Art. no. e38243, 2022, doi: 10.2196/38243.

[5] M. F. Vasiloglou *et al.*, "Key features of engagement strategies in nutrition apps for adults: Scoping review," *JMIR mHealth and uHealth*, vol. 14, Art. no. e82276, 2026, doi: 10.2196/82276.

[6] M. Ikegaya, J. C. Foo, T. Murata, K. Oshima, and J. Kim, "Using personalized intervention criteria in a mobile just-in-time adaptive intervention for increasing physical activity in university students: Pilot study," *JMIR Human Factors*, vol. 12, Art. no. e66750, 2025, doi: 10.2196/66750.

[7] R. Zenun Franco, R. Fallaize, M. Weech, F. Hwang, and J. A. Lovegrove, "Effectiveness of web-based personalized nutrition advice for adults using the eNutri web app: Evidence from the EatWellUK randomized controlled trial," *Journal of Medical Internet Research*, vol. 24, Art. no. e29088, 2022, doi: 10.2196/29088.

[8] J. C. B. C. de Jong *et al.*, "A real-life digital intervention for personalized nutrition in adults with overweight or obesity: Remote randomized controlled trial," *Journal of Medical Internet Research*, vol. 28, Art. no. e73367, 2026, doi: 10.2196/73367.

[9] R. An, J. Shen, and Y. Xiao, "Applications of artificial intelligence to obesity research: Scoping review of methodologies," *Journal of Medical Internet Research*, vol. 24, no. 12, Art. no. e40589, 2022, doi: 10.2196/40589.

[10] F. Mendoza Palechor and A. de la Hoz Manotas, "Dataset for estimation of obesity levels based on eating habits and physical condition in individuals from Colombia, Peru and Mexico," *Data in Brief*, vol. 25, Art. no. 104344, 2019, doi: 10.1016/j.dib.2019.104344.

[11] H. M. Bayram, Z. M. Çelik, and H. K. Barcın Güzeldere, "Can artificial intelligence (AI) chatbot tools be used effectively for nutritional management in obesity?," *Nutrition and Health*, vol. 31, pp. 1825–1834, 2025, doi: 10.1177/02601060251329070.

[12] M. L. Wang, M.-R. Narcisse, and P. A. McElfish, "Higher walkability associated with increased physical activity and reduced obesity among United States adults," *Obesity*, vol. 31, pp. 553–564, 2023, doi: 10.1002/oby.23634.

[13] A. Ibrayeva, M. Shoranov, T. Muminov, Y. Ismoldayev, S. Tanabayeva, and I. Fakhradiyev, "Physical activity levels in Kazakhstan: A cross-sectional nationwide study on demographic, socioeconomic, and regional factors," *Medicina*, vol. 61, no. 11, Art. no. 1913, 2025, doi: 10.3390/medicina61111913.

[14] S. Pagoto *et al.*, "An evaluation of a personalized multicomponent commercial digital weight management program: Single-arm behavioral trial," *Journal of Medical Internet Research*, vol. 25, Art. no. e44955, 2023, doi: 10.2196/44955.

[15] E. Yoshimura *et al.*, "Long-term effects of the use of a step count-specific smartphone app on physical activity and weight loss: Randomized controlled clinical trial," *JMIR mHealth and uHealth*, vol. 10, Art. no. e35628, 2022, doi: 10.2196/35628.

[16] M. R. Jospe, K. M. Richardson, and S. M. Schembre, "Continuous glucose monitoring for personalized nutrition in real-world Vively app users: Retrospective observational study," *JMIR Human Factors*, vol. 13, Art. no. e80734, 2026, doi: 10.2196/80734.

[17] F. Curran *et al.*, "Correlates of physical activity and sedentary behavior in adults living with overweight and obesity: A systematic review," *Obesity Reviews*, vol. 24, Art. no. e13615, 2023, doi: 10.1111/obr.13615.

[18] R. De Croon, L. Van Houdt, N. N. Htun, G. Štiglic, V. Vanden Abeele, and K. Verbert, "Health recommender systems: Systematic review," *Journal of Medical Internet Research*, vol. 23, no. 6, Art. no. e18035, 2021, doi: 10.2196/18035.

[19] S. K. Ahmed and R. A. Mohammed, "Obesity: Prevalence, causes, consequences, management, preventive strategies and future research directions," *Metabolism Open*, vol. 27, Art. no. 100375, 2025, doi: 10.1016/j.metop.2025.100375.

[20] Q. Zhang *et al.*, "Digital health technologies in obesity: Trajectory, emerging hotspots, and future perspectives," *Frontiers in Medicine*, vol. 13, Art. no. 1875769, 2026, doi: 10.3389/fmed.2026.1875769.

[21] X. Liu, M. Xu, H. Wang, and L. Zhu, "Integrating precision medicine and digital health in personalized weight management: The central role of nutrition," *Nutrients*, vol. 17, Art. no. 2695, 2025, doi: 10.3390/nu17162695.

[22] T. N. T. Tran, A. Felfernig, C. Trattner, and A. Holzinger, "Recommender systems in the healthcare domain: State-of-the-art and research issues," *Journal of Intelligent Information Systems*, vol. 57, no. 1, pp. 171–201, 2021, doi: 10.1007/s10844-020-00633-6.

[23] J.-M. Oppert, C. Ciangura, and A. Bellicha, "Physical activity and exercise for weight loss and maintenance in people living with obesity," *Reviews in Endocrine and Metabolic Disorders*, vol. 24, pp. 937–949, 2023, doi: 10.1007/s11154-023-09805-5.

[24] B. M. De Roos *et al.*, "Beyond weight loss: The value of physical activity and exercise for improving cardiometabolic risk factors in individuals with overweight and obesity," *Netherlands Heart Journal*, vol. 34, pp. 330–340, 2026, doi: 10.1007/s12471-026-02076-0.

[25] NCD Risk Factor Collaboration (NCD-RisC), "Worldwide trends in underweight and obesity from 1990 to 2022: A pooled analysis of 3663 population-representative studies with 222 million children, adolescents, and adults," *The Lancet*, vol. 403, no. 10431, pp. 1027–1050, 2024, doi: 10.1016/S0140-6736(23)02750-2.

[26] M. Hassapidou *et al.*, "European Association for the Study of Obesity position statement on medical nutrition therapy for the management of overweight and obesity in adults developed in collaboration with the European Federation of the Associations of Dietitians," *Obesity Facts*, vol. 16, no. 1, pp. 11–28, 2023, doi: 10.1159/000528083.

[27] I. Nahum-Shani, S. N. Smith, B. J. Spring, L. M. Collins, K. Witkiewitz, A. Tewari, and S. A. Murphy, "Just-in-time adaptive interventions (JITAIs) in mobile health: Key components and design principles for ongoing health behavior support," *Annals of Behavioral Medicine*, vol. 52, no. 6, pp. 446–462, 2018, doi: 10.1007/s12160-016-9830-8.

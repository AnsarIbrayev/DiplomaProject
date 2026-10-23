# Comparison of Existing Systems
## 1 Selection of systems and criteria

To assess the current state of mobile health (mHealth) solutions for weight management and obesity factor analysis, four representative systems were selected. Together they cover the main product types on the market: calorie logging, behavioral coaching, and wearable-based monitoring.

| System | Type | Main focus |
|---|---|---|
| MyFitnessPal | Calorie and macronutrient logger | Large food database, nutrition tracking |
| Noom | Behavioral change program | Curriculum-based coaching with psychological techniques |
| Yazio | Nutrition and fasting tracker | Diet customization, meal plans, intermittent fasting |
| Fitbit / Apple Health | Wearable-integrated monitoring | Biometric and activity tracking |

Fitbit and Apple Health are treated as one category because they play the same role: passive collection of biometric data through wearables and health APIs.

Eight criteria were defined, each tied to a capability needed to identify obesity factors and personalize weight management:

| ID | Criterion | What it evaluates |
|---|---|---|
| C1 | Multi-factor analysis | Whether non-dietary factors (stress, sleep quality, sedentary habits, hydration) are analyzed alongside nutrition |
| C2 | Root-cause risk identification | Whether individual obesity triggers are algorithmically isolated (e.g., stress-induced eating, sleep-debt weight stagnation) |
| C3 | Recommendation mechanism | Type of guidance: static fixed goals, rule-based, or adaptive ML-based |
| C4 | Context-aware micro-coaching | Whether timely, context-sensitive suggestions are pushed based on the user's current state |
| C5 | Data logging friction | User effort required to log daily metrics |
| C6 | Behavioral and habit formation | Use of psychological techniques for long-term adherence |
| C7 | Multi-sensor / wearable integration | Automatic synchronization with wearables and health APIs |
| C8 | Algorithmic transparency | Whether users get clear explanations of why a recommendation was made |

## 2 Comparison matrix

| Criterion | MyFitnessPal | Noom | Yazio | Fitbit / Apple Health | Proposed solution |
|---|---|---|---|---|---|
| C1. Multi-factor analysis | Low (nutrition-focused) | Medium (behavior + diet) | Low (diet-focused) | High (biometrics + sleep) | High (integrated multi-vector) |
| C2. Root-cause risk identification | None | Low (manual self-reflection) | None | Low (trend correlation only) | High (automated factor engine) |
| C3. Recommendation mechanism | Static (calorie/macro targets) | Rule-based (articles, traffic-light diet) | Static (recipes, meal plans) | Rule-based (activity goals) | Personalized and adaptive (hybrid ML) |
| C4. Context-aware micro-coaching | None | Low (scheduled lessons) | None | Low (generic nudges) | High (trigger-driven prompts) |
| C5. Logging friction | High (manual search/weighing) | High (manual food + mood log) | High (manual logging) | Low (automated sensor sync) | Medium-low (smart, low-friction logging) |
| C6. Behavioral change integration | Low | High (CBT-based lessons) | Medium | Medium (gamification) | High (micro-habit loops) |
| C7. Multi-sensor integration | Medium | Low | Low | High | High (wearable sync + manual logs) |
| C8. Algorithmic transparency | Low | Low | Low | Low | High (explainable factor dashboard) |

*Ratings for existing systems are based on [official app descriptions / store listings / hands-on testing, dates]. The "Proposed solution" column shows design targets, not measured results; they will be validated in the testing stage.*

## 3 Analysis of capabilities and limitations

**MyFitnessPal and Yazio (calorie and nutrition loggers).** Both offer extensive food databases, barcode scanning, and macronutrient tracking. Their main limitation is that they treat weight management as an energy balance (energy in minus energy out) and give little support for the other drivers of obesity. Clinical nutrition literature shows that weight outcomes also depend on non-caloric factors such as chronic stress and sleep deprivation [cite]. Manual logging creates a high burden, and mHealth research reports high abandonment rates because of logging fatigue [cite source and exact figure].

**Noom (behavioral psychology app).** Noom's strength is its psychological framework based on cognitive behavioral techniques, with a traffic-light food classification and human coaching. It is effective for building short-term awareness. Its limitations are reliance on manual coaching and manually entered data, and the absence of an automated mechanism that correlates biometric data from wearables with lifestyle logs to estimate each person's main risk factors.

**Fitbit / Apple Health (biometric and activity trackers).** These platforms achieve high compliance through passive, automated collection of steps, heart rate variability, and sleep stages. They are strong at data aggregation but weak at decision support: they report observations such as "you slept 5 hours" without turning them into personalized recommendations aimed at obesity prevention.

## 4 Justification of the proposed solution

The comparison shows a gap that none of the analyzed systems fills: **no system combines multi-factor obesity analysis (C1, C2), adaptive and explainable recommendations (C3, C8), and low-friction data collection (C5, C7).** Specifically:

1. **From passive logging to active analytics.** Existing solutions leave the user to interpret their own data. The proposed system introduces an automated obesity factor identification engine that correlates diet, sleep, stress, and activity inputs to pinpoint a person's primary drivers.
2. **Contextual and explainable recommendations.** Instead of static calorie limits, the system produces tailored micro-actions. For example, it can suggest a stress-reduction technique when poor sleep and elevated stress precede overeating episodes. Each recommendation comes with an explanation of why it was generated.
3. **Reduced user effort.** Combining wearable data with short qualitative check-ins lowers the input burden while keeping the data rich enough for analysis.


---
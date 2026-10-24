# Online Survey of Potential Users (S4)

| | |
|---|---|
| **YouTrack task** | [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4) |
| **Purpose** | Collect quick, anonymous evidence from potential users in Astana to test assumptions A1–A12 ([02-assumptions-register.md](../02-assumptions-register.md)) |
| **Tool** | Google Forms, one form with a Russian and a Kazakh version of each question |
| **Duration for a respondent** | About 3 minutes |
| **Status** | Ready to publish; **no responses collected yet** |

## 1. Setting up the form

1. Create a new Google Form named «Опрос: приложение для управления весом / Салмақты басқаруға арналған қосымша».
2. In **Settings → Responses**, set *Collect email addresses* to **Do not collect** and turn **off** *Limit to 1 response* (it requires sign-in). The form must not collect names, e-mails or phone numbers.
3. Copy each question below. Put the Russian text first and the Kazakh text on the next line of the same question. Use the answer type shown.
4. Make the consent question and Q1 required; everything else optional.
5. Add a section break after Q1: if the answer to Q1 is "Under 18" or "Over 60", go to the end of the form ("Submit form").
6. Share the link in AITU chats and with personal contacts, using the message in Section 4.

## 2. Questions

The ID column links each question to the assumption it tests.

### Introduction (form description)

> **RU:** Мы студенты Astana IT University и разрабатываем мобильное приложение, которое помогает взрослым управлять весом с помощью персональных рекомендаций по питанию и активности. Опрос анонимный и займёт около 3 минут. Мы не спрашиваем имя, контакты и точный вес. Результаты используются только в обобщённом виде в дипломной работе.
>
> **KK:** Біз Astana IT University студенттеріміз. Ересектерге тамақтану мен белсенділік бойынша жеке ұсыныстар арқылы салмағын басқаруға көмектесетін мобильді қосымша әзірлеп жатырмыз. Сауалнама анонимді, шамамен 3 минут алады. Біз атыңызды, байланыс деректеріңізді және нақты салмағыңызды сұрамаймыз. Нәтижелер дипломдық жұмыста тек жинақталған түрде қолданылады.

| ID | Question (RU / KK) | Answer type and options (RU / KK) | Tests |
|---|---|---|---|
| C | Я прочитал(а) описание и согласен(на) участвовать в анонимном опросе. / Сипаттаманы оқыдым және анонимді сауалнамаға қатысуға келісемін. | Checkbox, required: Да, согласен(на) / Иә, келісемін | Consent |
| Q1 | Ваш возраст / Жасыңыз | Single choice, required: Младше 18 / 18-ден кіші · 18–24 · 25–34 · 35–44 · 45–60 · Старше 60 / 60-тан жоғары | Eligibility |
| Q2 | Вы сейчас стараетесь снизить вес или не набрать лишний? / Қазір салмағыңызды азайтуға немесе артық салмақ қоспауға тырысасыз ба? | Single choice: Да, снизить / Иә, азайтуға · Да, не набрать / Иә, қоспауға · Нет / Жоқ | A1 |
| Q3 | Пользовались ли вы приложениями для веса, питания или активности (например, подсчёт калорий, шагомер)? / Салмақ, тамақтану немесе белсенділік үшін қосымшаларды (мысалы, калория санау, қадам санағыш) қолданып көрдіңіз бе? | Single choice: Никогда / Ешқашан · Пользовался(ась), но бросил(а) / Қолдандым, бірақ тастап кеттім · Пользуюсь сейчас / Қазір қолданамын | A1, A2 |
| Q4 | Если бросили: сколько времени вы пользовались приложением? / Егер тастап кетсеңіз: қосымшаны қанша уақыт қолдандыңыз? | Single choice: Меньше недели / Бір аптадан аз · 1–4 недели / 1–4 апта · 1–3 месяца / 1–3 ай · Больше 3 месяцев / 3 айдан көп | A2 |
| Q5 | Если бросили: почему? (можно несколько) / Егер тастап кетсеңіз: неліктен? (бірнешеуін таңдауға болады) | Checkboxes: Долго вносить еду / Тамақты енгізу ұзақ · Нет местных блюд / Жергілікті тағамдар жоқ · Советы слишком общие / Кеңестер тым жалпы · Пропала мотивация / Мотивация жоғалды · Слишком много уведомлений / Хабарламалар тым көп · Платно / Ақылы · Беспокоился(ась) о данных / Деректерім үшін алаңдадым · Другое / Басқа | A2, A5, A8, A10 |
| Q6 | Что, по-вашему, сильнее всего влияет на ваш вес? (до 3 вариантов) / Сіздің ойыңызша, салмағыңызға не көбірек әсер етеді? (3 нұсқаға дейін) | Checkboxes: Большие порции / Үлкен порциялар · Сладкое и сладкие напитки / Тәтті тағамдар мен тәтті сусындар · Поздние приёмы пищи / Кеш тамақтану · Мало движения / Қозғалыстың аздығы · Недосып / Ұйқының жетіспеуі · Стресс / Стресс · Рабочий или учебный график / Жұмыс немесе оқу кестесі · Застолья и праздники / Той-томалақ пен мерекелер · Другое / Басқа | A6 |
| Q7 | Как вам удобнее получать советы по питанию и активности? / Тамақтану мен белсенділік бойынша кеңестерді қалай алған ыңғайлы? | Single choice: В одном приложении / Бір қосымшада · В разных приложениях / Әртүрлі қосымшаларда · Не важно / Маңызды емес | A3 |
| Q8 | Насколько для вас важно, чтобы приложение объясняло, почему даёт каждый совет? / Қосымша әр кеңесті неліктен беретінін түсіндіруі сіз үшін қаншалықты маңызды? | Linear scale 1–5: 1 = совсем не важно / мүлдем маңызды емес; 5 = очень важно / өте маңызды | A4 |
| Q9 | Какая цель по шагам вам ближе? / Қадам бойынша қай мақсат сізге жақынырақ? | Single choice: Фиксированная, например 10 000 шагов в день / Белгіленген, мысалы күніне 10 000 қадам · Постепенная: немного больше, чем на прошлой неделе / Біртіндеп: өткен аптадан сәл көбірек · Цели по шагам не нужны / Қадам бойынша мақсат керек емес · Не знаю / Білмеймін | A7 |
| Q10 | Сколько напоминаний в день от такого приложения для вас нормально? / Мұндай қосымшадан күніне қанша еске салу сізге қалыпты? | Single choice: Ни одного / Бірде-бір · 1–3 в удобное мне время / Маған ыңғайлы уақытта 1–3 · Больше 3 / 3-тен көп | A8 |
| Q11 | Какими данными вы готовы делиться с приложением? (можно несколько) / Қосымшамен қандай деректермен бөлісуге дайынсыз? (бірнешеуін таңдауға болады) | Checkboxes: Что я ем / Не жейтінім · Вес раз в неделю / Аптасына бір рет салмақ · Обхват талии / Бел шеңбері · Шаги с телефона / Телефоннан қадамдар · Пульс с часов или браслета / Сағаттан не білезіктен тамыр соғысы · Ничем / Ешқандай | A9, A11 |
| Q12 | Есть ли у вас фитнес-браслет или смарт-часы? / Сізде фитнес-білезік немесе смарт-сағат бар ма? | Single choice: Нет / Жоқ · Браслет / Білезік · Смарт-часы / Смарт-сағат | A9 |
| Q13 | Насколько вас беспокоит, где хранятся данные о вашем весе и здоровье? / Салмағыңыз бен денсаулығыңыз туралы деректердің қай жерде сақталатыны сізді қаншалықты алаңдатады? | Linear scale 1–5: 1 = не беспокоит / алаңдатпайды; 5 = очень беспокоит / қатты алаңдатады | A10 |
| Q14 | Перед советами приложение задаёт несколько вопросов о здоровье и иногда советует обратиться к врачу. Как вы к этому относитесь? / Кеңес бермес бұрын қосымша денсаулық туралы бірнеше сұрақ қояды және кейде дәрігерге баруға кеңес береді. Бұған қалай қарайсыз? | Single choice: Положительно / Оң · Нейтрально / Бейтарап · Отрицательно / Теріс | A12 |
| Q15 | Что сделало бы такое приложение полезным лично для вас? (необязательно) / Мұндай қосымшаны сіз үшін не пайдалы етер еді? (міндетті емес) | Paragraph | Open |

The Kazakh text should be proofread by a native speaker in the team before the form is published.

## 3. Analysis rule (fixed before data collection)

- Only eligible respondents (Q1 = 18–60) are counted. Report **n** for every question, because optional questions may have fewer answers.
- An assumption is **supported by the survey** when at least 60% of eligible respondents who answered choose the options that agree with it, **contradicted** when 40% or fewer do, and **inconclusive** in between. With fewer than 10 eligible respondents, every result is reported as *inconclusive (n too small)*.
- Agreeing options: A1 = Q2 "lose" or "keep" and Q3 not "never"; A2 = Q3 "used and stopped" (with Q4 and Q5 describing when and why); A3 = Q7 "one app"; A4 = Q8 4 or 5; A5 = Q5 "no local dishes" among those who stopped; A7 = Q9 "gradual"; A8 = Q10 "1–3"; A9 = Q11 "steps" (wearable share from Q12 is reported, not tested); A10 = Q13 4 or 5; A11 = Q11 "weight" and "waist"; A12 = Q14 "positive" or "neutral".
- A6 is descriptive: report the share for each factor.
- Survey answers are self-reported statements of preference. They count as weaker evidence than past behaviour described in interviews; the register records both.
- Only aggregated counts go into the repository ([results.md](results.md)). The raw response sheet stays in the team's Google account.

## 4. Message for sharing the link

> **RU:** Привет! Мы делаем дипломный проект в AITU, мобильное приложение для управления весом. Помогите, пожалуйста, ответить на анонимный опрос (3 минуты, без имени и контактов): [ссылка]. Если вам 18–60 и вы хоть раз думали о своём весе, ваш ответ очень поможет. Спасибо!
>
> **KK:** Сәлем! Біз AITU-да дипломдық жоба жасап жатырмыз, салмақты басқаруға арналған мобильді қосымша. Анонимді сауалнамаға жауап беріп көмектесіңізші (3 минут, атыңыз бен байланыс деректерісіз): [сілтеме]. Егер жасыңыз 18–60 аралығында болса және өз салмағыңыз туралы бір рет болса да ойласаңыз, жауабыңыз көп көмектеседі. Рахмет!

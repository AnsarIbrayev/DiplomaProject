# 3. Recruitment and Informed Consent

| | |
|---|---|
| **YouTrack task** | [DOA-4](https://yeralytemir.youtrack.cloud/issue/DOA-4) |
| **Interview lead** | Ibrayev Ansar |
| **Target** | 4 user interviews + 1 expert interview (minimum 3 in total) |

Participant-facing texts are given in English and Russian. If a participant prefers Kazakh, the interviewer translates the consent text orally and notes this in the interview record.

## 3.1 Who to recruit

**Users (3–4 interviews).** Selection mirrors the project's primary user group (see `docs/proposal/proposal.md`, Section 3):

- age 18–60;
- has overweight or obesity by their own assessment, or is currently trying to lose weight or prevent weight gain;
- uses a smartphone (Android or iOS);
- does **not** have diagnosed diabetes or cardiovascular disease, is not pregnant and is not taking weight-loss medication.

Aim for variety rather than a uniform group: at least one man and one woman; at least one participant over 30; at least one who has used a weight or calorie app and at least one who has not. Avoid interviewing team members, and limit close friends to one, because they tend to give agreeable answers.

**Expert (1 interview, recommended).** A dietitian, endocrinologist, general practitioner or certified fitness trainer working in Astana. An expert interview helps test the safety and scope assumptions (E1–E4) that users cannot judge.

**Where to recruit.** AITU student and staff chats, gym or fitness-club chats, Telegram and Instagram contacts, the university medical point (for an expert).

## 3.2 Screening questions (ask before scheduling)

| # | Question | Include if |
|---|---|---|
| S1 | How old are you? | 18–60 |
| S2 | Are you currently trying to lose weight or keep it from increasing? | Yes |
| S3 | Optional: which range is your BMI in? (*the interviewer can calculate it with the participant; only the range is written down*) | 25.0–29.9 or 30.0–34.9 preferred; "do not know" is acceptable |
| S4 | Do you have diagnosed diabetes or heart disease, are you pregnant, or are you taking medication for weight loss? | No |
| S5 | Do you use an Android or iOS smartphone? | Yes |

Record only the answers needed for the participant table (age band, sex, BMI band, app experience). Do not record exact weight, names or contact details in the repository.

## 3.3 Recruitment message

### English

> Hello! We are a team of software engineering students at Astana IT University. For our diploma project we are designing a mobile app that helps adults manage their weight with personalised nutrition and activity advice.
>
> We are looking for people aged 18–60 who are trying to lose weight or keep it from increasing, for a 30–40 minute conversation (online or in person). We will ask about your experience: what helped, what did not, and which apps you have tried. There are no right or wrong answers, and we will not ask for your exact weight.
>
> Participation is voluntary and anonymous: your name will not appear in any document. If you are interested, please reply to this message and we will agree on a convenient time.
>
> Thank you!
> Ansar Ibrayev, Astana IT University

### Russian

> Здравствуйте! Мы команда студентов Astana IT University (School of Software Engineering). В рамках дипломного проекта мы разрабатываем мобильное приложение, которое помогает взрослым управлять весом с помощью персональных рекомендаций по питанию и физической активности.
>
> Ищем людей 18–60 лет, которые сейчас стараются снизить вес или не набрать лишний, для беседы на 30–40 минут (онлайн или лично). Мы спросим о вашем опыте: что помогало, что не помогало, какими приложениями вы пользовались. Правильных и неправильных ответов нет, точный вес мы не спрашиваем.
>
> Участие добровольное и анонимное: ваше имя не появится ни в одном документе. Если вам интересно, ответьте на это сообщение, и мы договоримся об удобном времени.
>
> Спасибо!
> Ансар Ибраев, Astana IT University

### Message to an expert (Russian)

> Здравствуйте, [имя и отчество]! Меня зовут Ансар Ибраев, я студент Astana IT University. Наша команда разрабатывает дипломный проект: мобильную рекомендательную систему для взрослых с избыточной массой тела и ожирением I степени (ИМТ 25,0–34,9), которая даёт рекомендации по питанию и физической активности на основе клинических рекомендаций и не заменяет врача.
>
> Нам очень важно мнение специалиста о том, какие рекомендации безопасно давать без наблюдения врача, и кого приложение должно направлять к специалисту. Могли бы вы уделить 30 минут для короткого интервью (онлайн или лично) в удобное для вас время? Ваше имя будет упомянуто в работе только с вашего согласия.
>
> С уважением, Ансар Ибраев

## 3.4 Informed consent

Read the consent text to the participant at the start of the interview (or send it in advance for online interviews) and record the answer to each question. Signed or written consent is kept by the interviewer **outside the repository**; the repository only records "consent obtained: yes" and the date.

### English

> **Interview for the diploma project "Development of a Mobile Recommender System for Identifying Obesity Factors and Personalized Weight Management", Astana IT University.**
>
> **Purpose.** We want to understand how adults try to manage their weight, which difficulties they face and what they expect from a mobile application. Your answers will help us define the requirements for the app.
>
> **What happens.** The conversation takes 30–40 minutes. You can skip any question and stop at any time without giving a reason.
>
> **Data.** We will take written notes. We will make an audio recording only if you agree; the recording is used only to check the notes and is deleted after the notes are checked, no later than [date]. Your name and contact details will not appear in any document. In the diploma work and the project repository you will appear as a code (for example, "P2") with only your age range, sex and general experience. We will not ask for your exact weight or medical diagnoses.
>
> **Risks and benefits.** There are no known risks. Some questions concern weight and habits; you can skip any question that feels uncomfortable. There is no direct benefit to you, but your experience will help us design a more useful application. This interview is not medical advice.
>
> **Contact.** Ansar Ibrayev, [university e-mail]. Supervisor: Kashkimbayeva Nurzhamal Meirkulovna, Astana IT University.
>
> 1. Do you agree to take part in this interview? **Yes / No**
> 2. Do you agree to an audio recording? **Yes / No**
> 3. May we use anonymised quotations from your answers in the diploma work? **Yes / No**

### Russian

> **Интервью для дипломного проекта «Разработка мобильной рекомендательной системы для выявления факторов ожирения и персонализированного управления весом», Astana IT University.**
>
> **Цель.** Мы хотим понять, как взрослые пытаются управлять своим весом, с какими трудностями сталкиваются и чего ожидают от мобильного приложения. Ваши ответы помогут нам сформулировать требования к приложению.
>
> **Как проходит беседа.** Разговор занимает 30–40 минут. Вы можете пропустить любой вопрос и прекратить беседу в любой момент без объяснения причин.
>
> **Данные.** Мы ведём письменные заметки. Аудиозапись делаем только с вашего согласия; она нужна только для проверки заметок и удаляется после проверки, не позднее [дата]. Ваше имя и контакты не появятся ни в одном документе. В дипломной работе и репозитории проекта вы будете обозначены кодом (например, «P2») с указанием только возрастного диапазона, пола и общего опыта. Мы не спрашиваем точный вес и медицинские диагнозы.
>
> **Риски и польза.** Известных рисков нет. Некоторые вопросы касаются веса и привычек; любой неудобный вопрос можно пропустить. Прямой пользы для вас нет, но ваш опыт поможет сделать приложение полезнее. Это интервью не является медицинской консультацией.
>
> **Контакты.** Ансар Ибраев, [университетская почта]. Научный руководитель: Кашкимбаева Нуржамал Мейркуловна, Astana IT University.
>
> 1. Вы согласны участвовать в интервью? **Да / Нет**
> 2. Вы согласны на аудиозапись? **Да / Нет**
> 3. Можно ли использовать ваши анонимные цитаты в дипломной работе? **Да / Нет**

## 3.5 Ethics note

The Midterm Research Proposal states that no study data will be collected before AITU ethics approval. These interviews are requirements-gathering conversations, not the pilot study: they collect no measurements, no exact weight and no diagnoses, and they are anonymised. Before the first interview, confirm with the supervisor that this is acceptable without a formal ethics application, and record the answer in `docs/meetings/`.

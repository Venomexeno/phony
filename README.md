# phony

واجهة Flutter لعرض ومقارنة موبايلات — مبنية فوق API موجود (عملت له **fork**) علشان أستخدمه محليًا وأطوّر الواجهة.

---

## ملخص سريع

المشروع بيوفر واجهة تقدر تشوف بيها:

* Top 10 موبايلات حسب عدد الضغطات.
* Top 10 موبايلات حسب عدد الفانز.
* وسم لو في خصم/عرض على جهاز.
* صفحة تفاصيل لكل موبايل بالمواصفات.
* إضافة موبايل للمفضلة ومقارنة بين جهازين.
* بحث سريع وتصفيح حسب البراند.
* دعم Dark Mode.

الـ API اللي المشروع بيعتمد عليه موجود هنا (عملتله fork):
`https://github.com/Venomexeno/gsmarena-api-again`

Preview / demo داخل الريبو: `https://github.com/Venomexeno/phony` (فيه فيديو توضيحي).
[شوف الفيديو](https://github.com/Venomexeno/phony/tree/main/assets/videos/demo.mp4)

---

## متطلبات أساسية

* Flutter SDK مثبت (نسخة معقولة وحديثة).
* Node.js و npm (لو هتشغّل الـ API محليًا).
* على ويندوز: هنحتاج الـ IP المحلي (`ipconfig`) لو عايز تشغّل كل حاجة على نفس الجهاز.

---

## التشغيل محليًا (خطوات بسيطة)

1. **استنساخ المشروعين**

```bash
# استنسخ واجهة phony
git clone https://github.com/Venomexeno/phony.git

# استنسخ الـ API (fork)
git clone https://github.com/Venomexeno/gsmarena-api-again.git
```

2. **تشغيل الـ API محليًا**

```bash
cd gsmarena-api-again
npm install
npm start
# المفروض السيرفر يشتغل على بورت زي 3000
```

> لو السيرفر اشتغل على جهازك المحلي وعايز توصلله من تطبيق Flutter على نفس الشبكة، خد الـ IP من `ipconfig` (مثلاً: `192.168.1.10`) واستخدمه في إعدادات التطبيق (شوف خطوة .env).

3. **إعداد ملف .env.development في مشروع phony**
   انشئ ملف `.env.development` في جذر مشروع phony وحط فيه الرابط للـ API مثال:

```
baseUrl=http://192.168.1.10:3000
```

استبدل `192.168.1.10:3000` بالـ IP والبورت اللي شغّال عليهم الـ API عندك.

4. **تشغيل الـ App (تطبيق Flutter)**

```bash
cd phony
flutter pub get

# لتشغيل على جهاز Android متصل
flutter run -d <device-id>
```

bash
cd phony
flutter pub get

# لتشغيل على المتصفح (web)

flutter run -d chrome

# أو لتشغيل على جهاز Android متصل

flutter run -d <device-id>

````

---

## ملاحظات مهمة

* **CORS / Network**: لو بتواجه مشاكل في الوصول للـ API من المتصفح، اتأكد إن الـ API معرف CORS أو بتشغّل المتصفح مع صلاحيات مناسبة.
* **IP محلي**: لو بتشغّل كل حاجة على نفس الجهاز واستخدمت `localhost` وواجهت مشاكل، جرب وضع الـ IP المحلي بدل `localhost` في `.env.development`.
* **التعليقات في الكود**: حطيت تعليقات في أماكن مفيدة بس بشكل خفيف علشان تبقى واضحة ومش متعبة للعين.

## لو عايز تساهم

* افتح Issue لو لقيت bug أو اقتراح feature.
* لو عايز تعمل PR: اعمل فرع جديد واحتفظ بالتغيير واضح في commit message.
* أي ⭐ على الريبو يساعد — شكرًا مقدّمًا 🙏

# AudioScanner

Akustická mapa místnosti z mikrofonu telefonu. Pustíš z beden testovací signál,
projdeš s telefonem místnost, ARKit sleduje, kde stojíš, a v každém bodě se
změří spektrum. Výsledek je půdorysná heatmapa: kde basy duní, kde mizí, kam dát
bedny a kam posluchače.

**Není to náhrada REW s kalibrovaným mikrofonem.** Je to relativní nástroj —
rozdíly mezi místy v jedné místnosti. Absolutní SPL z nekalibrovaného telefonu
neexistuje a appka ho nikde netvrdí.

Plán, ze kterého to vzniklo: [`ROOMSCAN_PLAN.md`](ROOMSCAN_PLAN.md).
Co chybí proti REW a Dirac Live a v jakém pořadí to dotáhnout:
[`ROOMSCAN_PLAN_2.md`](ROOMSCAN_PLAN_2.md).

## Co telefon neumí, a co z toho plyne pro návrh

Tahle omezení nejsou poznámky pod čarou, jsou to důvody, proč je kód postavený,
jak je:

| Omezení | Důsledek v kódu |
|---|---|
| Jeden mikrofon → **žádná lokalizace zdroje** | Ukládá se jen pozice telefonu, nikdy orientace jako směr zvuku. 3D vzniká výhradně z pohybu a AR trackingu. |
| Mikrofon není kalibrovaný | Všechno je v dBFS relativně k referenčnímu bodu. `calibrationOffsetDb` se ukládá, ale nikdy se nevpisuje do naměřených dat. |
| iOS umí signál potichu upravit (AGC, potlačení šumu, echo cancellation) | Nativní vrstva hlásí zpátky, co systém **skutečně** povolil. Měření přes AGC není horší měření, je to měření AGC — a appka to říká nahlas. |
| Bluetooth mikrofon = komprese + latence | Detekováno a varováno. |
| Dolní hrana sweepu určuje, jak dlouho impuls zvoní | Odraz blíž než vyzvánění se oddělit **nedá**; `firstReflectionIndex` radši vrátí `null`, než aby označil sidelobe za stěnu. |
| Okno gatingu délky T neuvidí nic pod ~1/T | `gatedResponseValidAbove` to vyčísluje a píše se to i do hlavičky FRD. |

## Stav podle fází

| Fáze | Stav |
|---|---|
| **1 — SPL metr + RTA** | Hotovo. Nativní capture s `.measurement` mode, FFT 8192 / Hann, 31 třetinooktávových pásem 20 Hz–20 kHz, energetické průměrování, export WAV (růžový šum, log sweep, L/R zvlášť). |
| **2 — AR body** | Hotovo. ARKit world tracking, počátek klepnutím, „změřit tady" s 3s průměrováním, průběžný režim po 0,5 m, půdorysná IDW heatmapa s posuvníkem pásem. |
| **3 — Impulzní odezva** | Hotovo. Farinova dekonvoluce log sweepem, přímý zvuk, první odraz, gating s nastavitelným oknem, graf frekvenční odezvy (gated i s místností) s vyhlazováním 1/3–1/24 oktávy, graf impulzu a ETC, RT60 (EDT/T20/T30) a C50/C80 po oktávách, Schroederova křivka, spektrogram, zkreslení HD2/HD3. |
| **4 — Výstupy** | Hotovo až na 3D. FRD per bod, FRD z gated odezvy se skutečnou fází, JSON session, `.ir` soubory s impulzy, doporučení nejrovnějšího místa, srovnání libovolných dvou bodů i napříč session. **3D mrak bodů není** — plán sám píše, že výška málokdy přidá informaci, tak jsem zůstal u 2D. |
| **5 — Návrh konfigurace** | Hotovo. LiDAR geometrie přes RoomPlan, módy místnosti modální sumací, softwarový „subwoofer crawl", body prvních odrazů zrcadlením, kontrola úhlů proti Dolby, generátor nastavení pro Integra DRX-8.4 včetně jeho 15 EQ pásem. |
| **6 — Dotažení proti REW a Dirac** | Hotovo podle [`ROOMSCAN_PLAN_2.md`](ROOMSCAN_PLAN_2.md). Měření per kanál sweepem, EQ z průměru bodů kolem posluchače s vahou podle rozptylu, model filtru přijímače a náhled před/cíl/po s ověřením druhým měřením, editor cílové křivky, kalibrační soubor mikrofonu a SPL offset, peak hold a stopy v RTA. |

### Co vědomě chybí

- **Přehrávání signálu z telefonu.** `ExcitationSignal.phonePinkNoise` v modelu
  je, přehrávač ne. Reproduktor telefonu končí kolem 500 Hz, tedy nad každým
  módem, který by stálo za to hledat — export WAV do pořádné soustavy je jediná
  cesta, která dává smysl.
- **Fáze ve FRD z pásmových dat.** Píše se tam nula, a to záměrně:
  třetinooktávový průměr žádnou fázi nemá a vymyšlená by v VituixCADu skončila
  jako podklad pro výhybku.
- **RoomPlan na Androidu neexistuje.** Android místo něj boxuje vertikální
  roviny z ARCore — vidí stěny, na které se kamera koukala, málokdy rohy,
  nikdy za nábytkem. Na pojmenování módu to stačí, na body odrazů ne, a
  geometrie to o sobě nese jako `GeometrySource.arPlanes`.
- **Fázová korekce, parametrický EQ, více subwooferů.** Integra bere jen
  vzdálenost po centimetru a 15 grafických pásem; cokoli navíc chce externí
  DSP a druhý měřicí kanál. FRD export do REW je správná dělba.

## Architektura

```
lib/
├── audio/audio_capture.dart    platform channel → raw PCM (Swift)
├── ar/ar_tracking.dart         platform channel → pozice z ARKitu
├── dsp/
│   ├── spectrum.dart           FFT, Hann, kompenzace zisku okna, dBFS, peak hold
│   ├── octave_bands.dart       ISO 266, 31 pásem, součet energie do pásem, průměr pro přenosy
│   ├── impulse_response.dart   dekonvoluce, gating, komplexní spektrum, RT60, clarity, ETC
│   ├── smoothing.dart          zlomkooktávové vyhlazování, energeticky na log ose
│   ├── band_filter.dart        oktávová filtrace impulzu, EDT/T20/T30/C50 po pásmech
│   ├── graphic_eq.dart         model 15 pásem přijímače (peaking, Q = 2), odchylka od cíle
│   ├── distortion.dart         HD2/HD3 ze záporného času Farinovy dekonvoluce
│   └── spectrogram.dart        STFT impulzu
├── signal/
│   ├── log_sweep.dart          Farina: sweep + inverzní filtr
│   ├── pink_noise.dart         Kellettův šestipólový filtr
│   └── wav.dart                RIFF zápis, mono/stereo, 16bit/float32
├── model/                      Vec3, Measurement (+ kanál, souhrn impulzu), Session (+ cíl, kalibrace)
├── model/mic_calibration.dart  parser UMIK/REW souborů, log interpolace
├── analysis/
│   ├── heatmap.dart            IDW interpolace, nejrovnější místo
│   ├── spatial_average.dart    průměr a rozptyl bodů kolem posluchače
│   ├── response_analysis.dart  gated + celá odezva jednou per (impulz, okno)
│   └── decay_analysis.dart     doznívání po pásmech jednou per impulz
├── room/
│   ├── room_capture.dart       platform channel → RoomPlan (LiDAR)
│   ├── room_geometry.dart      kvádrový fit, Schroeder, poměry stran
│   ├── room_modes.dart         vlastní frekvence + modální sumace
│   ├── placement.dart          hledání místa pro sub a pro posluchače, SBIR, odrazy
│   ├── speaker_layout.dart     Dolby úhly, symetrie párů
│   ├── speaker_model.dart      schopnosti repro → dělicí kmitočty
│   └── design_report.dart      spojení geometrie a měření do nálezů
├── export/frd.dart             FRD pro REW / VituixCAD
├── export/avr_config.dart      nastavení přijímače včetně EQ presetů
├── store/session_store.dart    JSON na disk, atomický zápis, float32 sidecary impulzů
└── ui/                         RTA · sken · mapa · odezva · srovnání · návrh · signály

ios/Runner/
├── AudioCapture.swift          AVAudioSession .measurement, AVAudioEngine tap
├── ARTracker.swift             ARWorldTracking bez rendereru
└── RoomScanner.swift           RoomPlan — parametrické stěny, ne mesh

android/app/src/main/kotlin/com/ol1n/audio_scanner/
├── AudioCapture.kt             AudioRecord UNPROCESSED s detekcí + fallback
├── ArTracker.kt                ARCore v offscreen EGL kontextu; pozice + roviny
└── MainActivity.kt             registrace kanálů, runtime permissions
```

Backend žádný. Všechno zůstává v telefonu.

### Proč zrovna takhle

- **Vlastní platform channels místo pluginu.** Žádný Flutter audio plugin nedává
  raw PCM s vypnutým zpracováním a zároveň AR pozici. Swift vrstvy jsou tenké a
  vlastní.
- **DSP v Dartu.** `fftea`, začátek podle plánu. Pokud RTA přestane stíhat, je
  FFT jediné místo, které se stěhuje přes `dart:ffi` — zbytek je čistá aritmetika
  nad `Float64List`.
- **ARKit bez `ARSCNView`.** Chce se jen pozice; vynechaný renderer šetří baterii
  i teplotu na několikaminutové chůzi.
- **ARCore v 1×1 pbufferu.** Na Androidu se `Session.update()` bez GL textury
  pro kameru odmítne rozjet, tak dostane neviditelný EGL kontext, do kterého
  nikdy nic nekreslí. Jedna session obsluhuje oba kanály — pozici i roviny.
- **`UNPROCESSED` není zaručený.** iOS `.measurement` mode prostě je; Android
  ho jen *nabízí* tam, kde ho výrobce implementoval, a
  `PROPERTY_SUPPORT_AUDIO_SOURCE_UNPROCESSED` je jediný poctivý způsob, jak se
  to dozvědět. Kde chybí, jede `VOICE_RECOGNITION` a Dart dostane
  `processingDisabled: false` — appka pak varuje, nemlčí.
- **JSON místo SQLite.** Session je pár set bodů, zapisuje se celá naráz a ten
  soubor je přesně to, co se má dát sdílet. Databáze by přidala migrace schématu
  a nic nevrátila.
- **IDW místo krigingu.** Prochází přesně naměřenými body a degraduje poctivě:
  kde se nechodilo, plocha zplacatí místo aby si vymyslela strukturu. Buňka dál
  než `maxDistance` od měření zůstane **prázdná**, ne modrá.

## Geometrie + měření

Měření samo o sobě řekne *co* je v posluchačském místě špatně, ale ne proč — a
nerozliší mód od interference se stěnou od repro, který je prostě malý.
Geometrie všechny tři předpoví a neví o žádném z nich. Teprve dohromady
pojmenují příčinu, a příčina je rozdíl mezi „uber 6 dB na 63 Hz" a „posuň
pohovku o 40 cm".

Co z toho vzniká:

- **Módy místnosti** z rozměrů, modální sumací s tlumením podle změřeného RT60.
  Bez tlumení je každý mód nekonečně ostrý a předpověď je nesmysl.
- **Místo pro subwoofer** — softwarový „subwoofer crawl". Skutečný crawl
  funguje díky akustické reciprocitě (zdroj a přijímač jdou prohodit beze
  změny přenosu); táž reciprocita dělá legitimním prohledat sto pozic za
  vteřinu místo deseti po kolenou. Ověřeno testem.
- **Místo pro pohovku** — totéž obráceně. Nulu vyekvalizovat nejde, není co
  zvedat.
- **Body prvních odrazů** zrcadlením přes stěny. S LiDARem to přestává být
  „drž zrcátko a ať kamarád chodí" a stává se souřadnicí.
- **SBIR** — propad na c/(4·d) od nejbližší plochy. Nejčastější díra v horním
  basu, kterou ekvalizér nespraví: boost do zádrhele jen pošle víc výkonu do
  toho, co ruší.
- **Úhly proti Dolby** — a hlavně symetrie párů. Distance a level trim srovnají
  asymetrický pár v jednom bodě a v tabulce to vypadá perfektně, ale každý
  repro pořád vidí jinou stěnu jinak daleko.

Výstup je list nastavení pro Integra DRX-8.4: vzdálenosti, dělicí kmitočty,
hladiny a EQ preset v jeho vlastních patnácti pásmech. EQ se řídí dvěma
pravidly — **řezat volně, zvedat sotva**, a nesahat nad Schroederovu frekvenci,
protože nad ní jednobodové měření popisuje ten bod, ne místnost.

## Jak měřit

1. Signál pusť **z počítače do beden**, ne z telefonu. V záložce Signály si
   vyexportuj `sweep_*.wav` (pro L a R zvlášť, jinak se obě bedny sečtou).
2. Hlasitost nastav tak, aby analyzátor ukazoval kolem −20 dBFS. Přebuzení
   vypadá v impulzní odezvě jako odraz.
3. Odpoj Bluetooth sluchátka.
4. Postav se na místo posluchače, spusť sledování a klepni na „Tady je počátek".
5. Telefon drž svisle na natažené ruce, mikrofonem k bednám. Naplocho si ho
   stíníš tělem.
6. Choď a měř. Průběžný režim ukládá bod každých 0,5 m.
7. Pro EQ a hlasitosti se vrať na místo posluchače a v záložce Návrh změř
   každý kanál sweepem (soubor pro daný kanál je v Signálech). Po zadání EQ
   do přijímače změř kanál znovu s přepínačem „po EQ" — rozdíl proti
   předpovědi je jediná zpětná vazba o skutečném filtru přijímače.

## Ověření

`flutter test` — 124 testů, všechny procházejí. Co reálně ověřují:

- **Spektrum:** sinus na plné výchylce čte 0 dBFS (ne −6 dB, které by dal
  nekompenzovaný Hann); 1 kHz tón padne do pásma 1 kHz a o dvě pásma vedle je
  přes 40 dB níž; půlení amplitudy = −6,02 dB.
- **Průměrování** sčítá energii, ne decibely (0 dB a −20 dB dá −2,99 dB, ne −10).
- **Dekonvoluce:** sweep se svým inverzním filtrem spadne na index 0; přes 90 %
  energie leží do 2 ms od peaku; zpožděná a ztlumená nahrávka dá impuls přesně
  na tom zpoždění a s tou amplitudou; dvoucestná nahrávka vrátí oba příchody.
- **RT60:** na syntetickém doznívání se známým časem sedí do 0,1 s, T20 a T30 se
  shodnou.
- **IDW** prochází naměřenými body a nechává neproměřené místo prázdné.
- **FRD** píše 31 řádků, respektuje kalibrační offset, rozbaluje fázi.
- **Store** přežije poškozený soubor bez ztráty ostatních session.
- **Módy:** první axiální mód vychází přesně na c/2L, druhý na dvojnásobku.
- **Modální sumace je reciproká** — prohození zdroje a přijímače nezmění
  odpověď. Kdyby tohle selhalo, je celé hledání místa pro subwoofer k ničemu.
- **SBIR** trefí propad na c/(4·d), **odrazy** u souměrného repro padnou přesně
  doprostřed, a delší RT60 měřitelně zhorší rozptyl.
- **Dělicí kmitočty** nikdy nevrátí hodnotu, která na přijímači nejde nastavit,
  Atmos moduly nikdy nedostanou míň než 100 Hz a nic nepřekročí 120 Hz.
- **EQ** řeže hrb, ale nehoní nulu, drží krok a rozsah přijímače a nesahá nad
  Schroederovu frekvenci. Pásmo, které se mezi místy kolem posluchače liší o
  víc než 6 dB, dostane jen poloviční korekci.
- **Dekonvoluce plochého řetězce je plochá** v 1 dB přes 100 Hz–6,4 kHz a
  fáze po odstranění zpoždění je nulová do 1°. Tenhle test chyběl a schovával
  obrácenou obálku inverzního filtru (viz níže).
- **Model filtru přijímače:** jedno pásmo +3 dB čte +3 ve středu a nic dvě
  oktávy vedle; všechna pásma +3 dB dají vlnění pod 1 dB, což fixuje Q.
- **Doznívání po pásmech:** syntetický signál s RT 0,8 s v basech a 0,3 s
  výš vrátí obě hodnoty do 0,1 s; EDT se na ideálním doznívání rovná T20;
  C50 vychází 3 dB pro odraz s polovinou energie po 60 ms.
- **Zkreslení:** řetězec y = x + 0,1·x² dá HD2 −32 dB (±3) a HD3 pod −50 dB,
  harmonická leží přesně L·ln 2 před přímým zvukem.
- **Kalibrace:** parser čte UMIK i REW formát včetně hlaviček, interpoluje na
  log ose, korekce nikdy nemění uložený bod a FRD hlavička říká, co bylo použito.
- **Párování s kanály:** bod s id `p1` a kanálem `frontLeft` dostane EQ, bod
  bez kanálu ne. Regresní test na chybu, kvůli které se EQ v appce nikdy
  nespočítal.

### Chyby nalezené a opravené při dotažení

- **Obrácená obálka inverzního filtru.** `LogSweep.inverseFilter` měl
  `exp(−t/L)` místo `exp(+t/L)`, takže odezva plochého řetězce měla sklon
  −12 dB/oktávu a impulz se rozmazal do basů. Testy to nezachytily, protože
  `fftea.convolution` vrací jen prvních max(n) vzorků a při nulovém zpoždění
  vyšel impulz dlouhý jeden vzorek. Dekonvoluce teď dělá plnou lineární
  konvoluci.
- **Návrh pároval měření s kanály přes id.** Skenování generuje `p1`, `p2`, a
  tak se EQ a level trim v reálné appce nikdy nespočítaly. Měření teď nese
  `channel`.

`flutter build ios --no-codesign` prochází — nativní Swift se přeloží a slinkuje.
`flutter build apk` (debug i release) prochází — Kotlin s ARCore 1.56 taky.

**Na skutečném zařízení netestováno.** Akceptační testy z plánu (stojaté vlnění
při chůzi od bedny, rozptyl < 1 dB při trojím měření téhož bodu, návrat na bod
přes AR do 10 cm, shoda FRD s UMIKem do ±5 dB) vyžadují iPhone, bedny a UMIK.
Dokud neproběhnou, je ověřená matematika, ne měření.

## Build

```bash
flutter pub get
flutter test
flutter build ios          # potřebuje podepisování pro nasazení na zařízení
flutter build apk          # release, podepsaný debug klíčem — na sideload stačí
```

iOS: minimum 14.5 (kvůli `setPrefersNoInterruptionsFromSystemAlerts`), ARKit
vyžaduje A9 a novější, RoomPlan LiDAR (iPhone 12 Pro / iPad Pro 2020+).

Android: minSdk 24 (ARCore). ARCore je v manifestu `optional` — bez něj se
appka nainstaluje a funguje analyzátor, odezva i signály, jen chůze po
místnosti ne. Release APK je podepsaný debug klíčem; pro Play Store je potřeba
vlastní keystore.

## Reference

- A. Farina, *Simultaneous measurement of impulse response and distortion with a
  swept-sine technique*, AES 108 (2000) — základ dekonvoluce.
- M. R. Schroeder, *New method of measuring reverberation time*, JASA 37 (1965)
  — zpětná integrace pro RT60.
- ISO 266 — třetinooktávová pásma.
- REW (Room EQ Wizard) — referenční metodika měření místností.

## Licence

MIT, viz [LICENSE](LICENSE).

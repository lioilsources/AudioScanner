# AudioScanner

Akustická mapa místnosti z mikrofonu telefonu. Pustíš z beden testovací signál,
projdeš s telefonem místnost, ARKit sleduje, kde stojíš, a v každém bodě se
změří spektrum. Výsledek je půdorysná heatmapa: kde basy duní, kde mizí, kam dát
bedny a kam posluchače.

**Není to náhrada REW s kalibrovaným mikrofonem.** Je to relativní nástroj —
rozdíly mezi místy v jedné místnosti. Absolutní SPL z nekalibrovaného telefonu
neexistuje a appka ho nikde netvrdí.

Plán, ze kterého to vzniklo: [`ROOMSCAN_PLAN.md`](ROOMSCAN_PLAN.md).

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
| **3 — Impulzní odezva** | Hotovo. Farinova dekonvoluce log sweepem, přímý zvuk, první odraz, gating, RT60 (T20/T30, Schroeder), Schroederova křivka. |
| **4 — Výstupy** | Částečně. FRD per bod i z gated odezvy, JSON session, doporučení nejrovnějšího místa. **3D mrak bodů není** — plán sám píše, že výška málokdy přidá informaci, tak jsem zůstal u 2D. |
| **5 — Návrh konfigurace** | Hotovo. LiDAR geometrie přes RoomPlan, módy místnosti modální sumací, softwarový „subwoofer crawl", body prvních odrazů zrcadlením, kontrola úhlů proti Dolby, generátor nastavení pro Integra DRX-8.4 včetně jeho 15 EQ pásem. |

### Co vědomě chybí

- **Přehrávání signálu z telefonu.** `ExcitationSignal.phonePinkNoise` v modelu
  je, přehrávač ne. Reproduktor telefonu končí kolem 500 Hz, tedy nad každým
  módem, který by stálo za to hledat — export WAV do pořádné soustavy je jediná
  cesta, která dává smysl.
- **Fáze ve FRD z pásmových dat.** Píše se tam nula, a to záměrně:
  třetinooktávový průměr žádnou fázi nemá a vymyšlená by v VituixCADu skončila
  jako podklad pro výhybku.
- **Android.** Plán říká iOS first, projekt je scaffoldnutý jen pro iOS. Dart
  vrstva je platformně neutrální; chybí protějšek `AudioCapture.swift`
  (`AudioSource.UNPROCESSED`) a `ARTracker.swift` (ARCore).
- **Srovnání L vs R v appce.** Export sweepu zvlášť do každého kanálu je hotový,
  porovnávací pohled ne.

## Architektura

```
lib/
├── audio/audio_capture.dart    platform channel → raw PCM (Swift)
├── ar/ar_tracking.dart         platform channel → pozice z ARKitu
├── dsp/
│   ├── spectrum.dart           FFT, Hann, kompenzace zisku okna, dBFS
│   ├── octave_bands.dart       ISO 266, 31 pásem, součet energie do pásem
│   └── impulse_response.dart   dekonvoluce, gating, RT60, odrazy
├── signal/
│   ├── log_sweep.dart          Farina: sweep + inverzní filtr
│   ├── pink_noise.dart         Kellettův šestipólový filtr
│   └── wav.dart                RIFF zápis, mono/stereo, 16bit/float32
├── model/                      Vec3, Measurement, Session
├── analysis/heatmap.dart       IDW interpolace, nejrovnější místo
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
├── store/session_store.dart    JSON na disk, atomický zápis
└── ui/                         RTA · sken · mapa · odezva · signály

ios/Runner/
├── AudioCapture.swift          AVAudioSession .measurement, AVAudioEngine tap
├── ARTracker.swift             ARWorldTracking bez rendereru
└── RoomScanner.swift           RoomPlan — parametrické stěny, ne mesh
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

## Ověření

`flutter test` — 74 testů, všechny procházejí. Co reálně ověřují:

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
  Schroederovu frekvenci.

`flutter build ios --no-codesign` prochází — nativní Swift se přeloží a slinkuje.

**Na skutečném zařízení netestováno.** Akceptační testy z plánu (stojaté vlnění
při chůzi od bedny, rozptyl < 1 dB při trojím měření téhož bodu, návrat na bod
přes AR do 10 cm, shoda FRD s UMIKem do ±5 dB) vyžadují iPhone, bedny a UMIK.
Dokud neproběhnou, je ověřená matematika, ne měření.

## Build

```bash
flutter pub get
flutter test
flutter build ios          # potřebuje podepisování pro nasazení na zařízení
```

Minimum iOS 14.5 (kvůli `setPrefersNoInterruptionsFromSystemAlerts`), ARKit
vyžaduje A9 a novější.

## Reference

- A. Farina, *Simultaneous measurement of impulse response and distortion with a
  swept-sine technique*, AES 108 (2000) — základ dekonvoluce.
- M. R. Schroeder, *New method of measuring reverberation time*, JASA 37 (1965)
  — zpětná integrace pro RT60.
- ISO 266 — třetinooktávová pásma.
- REW (Room EQ Wizard) — referenční metodika měření místností.

## Licence

MIT, viz [LICENSE](LICENSE).
